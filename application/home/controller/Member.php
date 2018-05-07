<?php
namespace app\home\controller;
use think\Request;
class Member extends Common
{
    /**
     * @Title: dologin
     * @Description: TODO 医生账号密码登录(只允许一台设备在线)
     */
    public function dologin()
    {
        if($this->request->isPost()) {
            session_start();
            $ticket=session_id();
            $data=input('post.');
            if($data['mobile']==''||$data['password']==''|| $data['device_tokens']=='' || $data['is_system']=='')
            {
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[], 'flag'=>1));
            }
            if(!preg_match("/^1[3|4|5|7|8|][0-9]{1}[0-9]{8}$/",$data['mobile']))
            {
                ajaxReturn(array('code' =>0, 'info' => '手机号码格式不正确！','data'=>[], 'flag'=>1));
            }
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            $map['mobile']=$data['mobile'];
            $info=db('doctor')->where($map)->field("member_id,member_sn,member_name,mobile,password,guid, true_name, is_clinic, is_certified, login_state, device_tokens, is_status")->find();
            if(!empty($info))
            {
                //是否被冻结
                if ($info['is_status'] == 1) {
                    ajaxReturn(array('code'=>0,'info'=>'该账号被冻结！','data'=>[], 'flag'=>1));
                }

                $pwd=md5(md5($data['password']).$info['guid']);
                if($pwd==$info['password'])
                {
                    //若当前账号已有其他设备在线, 则前者会被挤掉
                    if ($info['login_state'] == 1) {
                        if ($info['device_tokens'] != $data['device_tokens']) {
                            // TODO 如何让该设备下线??  友盟推送

                            var_dump('让前一台设备下线');die;


                        }
                    }

                    $info['ticket']=$ticket;
                    unset($info['password'],$info['guid']);
                    $temp['login_ip']=Request::instance()->ip();
                    $temp['login_time']=time();

                    //更新设备号和在线状态, 以及设备系统, only_token
                    $temp['is_system'] = $data['is_system'];
                    $temp['device_tokens'] = $data['device_tokens'];
                    $temp['login_state'] = 1;
                    $temp['only_token'] = time().randCode(6,-1);

                    db('doctor')->where($map)->update($temp);

                    //获取环信token
                    import('Easemob', EXTEND_PATH);

                    $options['client_id'] = config('client_id');
                    $options['client_secret'] = config('client_secret');
                    $options['org_name'] = config('org_name');
                    $options['app_name'] = config('app_name');

                    $h=new \Easemob($options);
                    $info['token'] = $h->getToken();
                    $_SESSION['uinfo']=$info;

                    $_flag = 1;
                    ajaxReturn(array('code' =>1, 'info' => '登录成功','data'=>[$info], 'flag'=>$_flag));
                }else
                {
                    ajaxReturn(array('code'=>0,'info'=>'密码不正确！','data'=>[], 'flag'=>1));
                }

            }else
            {
                ajaxReturn(array('code'=>0,'info'=>'手机号码不存在！','data'=>[], 'flag'=>1));
            }

        }
    }

    public function doSmsLogin()
    {
        if($this->request->isPost()) {
            session_start();
            $ticket=session_id();
            $data=input('post.');
            if($data['mobile']==''||$data['smscode']==''|| $data['device_tokens']=='' || $data['is_system']=='')
            {
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[], 'flag'=>1));
            }
            if(!preg_match("/^1[3|4|5|7|8|][0-9]{1}[0-9]{8}$/",$data['mobile']))
            {
                ajaxReturn(array('code' =>0, 'info' => '手机号码格式不正确！','data'=>[], 'flag'=>1));
            }
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            //验证短信
            $mobile=$data['mobile'];
            session_id(md5($mobile));
            session_start();
            $token = $_SESSION['tokencode'];

            if(empty($token))
            {
                ajaxReturn(array('code'=>0,'info'=>'请先获取短信验证码！','data'=>[], 'flag'=>1));
            }
            if($token['code']!=$data['smscode'])
            {
                ajaxReturn(array('code'=>0, 'info'=>'短信验证码不正确！','data'=>[], 'flag'=>1));
            }
            if (!empty($token)&&$token['expired_at']<time() )
            {
                ajaxReturn(array('code'=>0, 'info'=>'短信验证码超时！','data'=>[], 'flag'=>1));
            }


            $map['mobile']=$data['mobile'];
            $info=db('doctor')->where($map)->field("member_id,member_sn,member_name,mobile,password,guid, true_name, is_clinic, is_certified, login_state, device_tokens, is_status")->find();
            if(!empty($info))
            {
                //是否被冻结
                if ($info['is_status'] == 1) {
                    ajaxReturn(array('code'=>0,'info'=>'该账号被冻结！','data'=>[], 'flag'=>1));
                }


                    //若当前账号已有其他设备在线, 则前者会被挤掉
                    if ($info['login_state'] == 1) {
                        if ($info['device_tokens'] != $data['device_tokens']) {
                            // TODO 如何让该设备下线??   友盟推送??

                            var_dump(333);die;


                        }
                    }

                    $info['ticket']=$ticket;
                    unset($info['password'],$info['guid']);
                    $temp['login_ip']=Request::instance()->ip();
                    $temp['login_time']=time();

                    //更新设备号和在线状态, 以及设备系统
                    $temp['is_system'] = $data['is_system'];
                    $temp['device_tokens'] = $data['device_tokens'];
                    $temp['login_state'] = 1;
                    db('doctor')->where($map)->update($temp);
                    $_SESSION['uinfo']=$info;
                    ajaxReturn(array('code' =>1, 'info' => '登录成功','data'=>[$info]));

            }else
            {
                ajaxReturn(array('code'=>0,'info'=>'手机号码不存在！','data'=>[], 'flag'=>1));
            }

        }
    }

    public function doregist()
    {
        if($this->request->isPost())
        {

            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            //                    $_flag =  $this->countToken($data['only_token']);
            $_flag = 1;

            if($data['mobile']==''||$data['password']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'手机号或密码为空','data'=>[], 'flag'=>1));
            }
            if($data['area_id']=='' || $data['hospital_id']=='' || $data['true_name']=='' || $data['smscode']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[], 'flag'=>1));
            }
            $mobile=$data['mobile'];
            session_id(md5($mobile));
            session_start();
            $token = $_SESSION['tokencode'];

            if(empty($token))
            {
                ajaxReturn(array('code'=>0,'info'=>'请先获取短信验证码！','data'=>[], 'flag'=>1));
            }
            if($token['code']!=$data['smscode'])
            {
                ajaxReturn(array('code'=>0, 'info'=>'短信验证码不正确！','data'=>[], 'flag'=>1));
            }
            if (!empty($token)&&$token['expired_at']<time() )
            {
                ajaxReturn(array('code'=>0, 'info'=>'短信验证码超时！','data'=>[], 'flag'=>1));
            }

            $map['mobile']=$mobile;
            $countMobile = db('doctor')->where($map)->count();

            if($countMobile>0)
            {
                ajaxReturn(array('code' =>0, 'info' => '手机号码已绑定！','data'=>[], 'flag'=>1));
            }

            //查询当前最大邀请码
            $maxInvite = db('doctor')->max('invite');

            unset($data['smscode'],$data['_time'],$data['sign']);
            $data['invite'] = $maxInvite + 1;
            $data['member_sn']=uniqid("tkt");
            $data['reg_date']=time();

            //localhost访问ip为0.0.0.0
            $data['reg_ip'] = Request::instance()->ip();
            $data['guid']=randCode(8,2);
            $data['password']=md5(md5($data['password']).$data['guid']);

            //生成医生邀请医生的二维码图片路径
            $data['to_doctor_url'] = 'https://www.baidu.com';


            if(db('doctor')->insert($data))
            {
                unset($_SESSION['tokencode']);
                //



                //填写了邀请码



                //没填写邀请码






                ajaxReturn(array('code' => 1, 'info' => '注册成功','data'=>[], 'flag'=>1));
            }else
            {
                ajaxReturn(array('code' => 1, 'info' => '注册失败','data'=>[], 'flag'=>1));
            }

        }
    }

    /**
     +-------------------------------------------------------------
     * 获取医生信息
     +-------------------------------------------------------------
     */
    public function getuinfo()
    {
        if($this->request->isGet())
        {
            $data=input('get.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            session_id($data['ticket']);
            session_start();
            $uinfo=$_SESSION['uinfo'];
            ajaxReturn(array('code' => 1, 'data'=>$uinfo));
        }

    }
    //获取短信验证码
    public function getsms()
    {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            $mobile=$data['mobile'];
            $map['mobile']=$mobile;
            $timer = 300;

            if($data['type']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[], 'flag'=>1));
            }
            if(!preg_match("/^1[3|4|5|7|8|][0-9]{1}[0-9]{8}$/", $mobile))
            {
                ajaxReturn(array('code' =>0, 'info' => '手机号码格式不正确！','data'=>[], 'flag'=>1));
            }
            session_id(md5($mobile));
            session_start();
            $token = $_SESSION['tokencode'];
            if (!empty($token)&&$token['expired_at']>time() )
            {
                ajaxReturn(array('code'=>0, 'info'=>$timer.'秒内仅能获取一次验证码,请稍后重试','data'=>[], 'flag'=>1));
            }
            $randcode = randCode(6, 1);



            switch ($data['type']) {
                //注册发送验证码
                case 1:
                    $count=db('doctor')->where($map)->count();
                    if($count>0)
                    {
                        ajaxReturn(array('code' =>0, 'info' => '手机号码已绑定！','data'=>[], 'flag'=>1));
                    }
                    break;
                //快速登录发送验证码
                case 2:
                    $count=db('doctor')->where($map)->count();
                    if($count == 0)
                    {
                        ajaxReturn(array('code' =>0, 'info' => '该手机号暂未注册！','data'=>[], 'flag'=>1));
                    }
                    break;
            }
            $body = sprintf(config('body'), $randcode);
            $status = sendSMS($mobile, $body);
            if ($status) {
                $_SESSION['tokencode']= ['code' => $randcode, 'expired_at' => time() + $timer,'mobile'=>$mobile];
                ajaxReturn(array('code' => 1, 'info' => '短信发送成功','data'=>array($randcode)));
            } else {
                ajaxReturn(array('code' => 0, 'info' => '短信发送失败','data'=>[], 'flag'=>1));
            }
        }else
        {
            ajaxReturn(array('code' => 0, 'info' => '非法请求','data'=>[], 'flag'=>1));
        }
    }
}
