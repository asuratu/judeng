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
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            if(!preg_match("/^1[3|4|5|7|8|][0-9]{1}[0-9]{8}$/",$data['mobile']))
            {
                ajaxReturn(array('code' =>0, 'info' => '手机号码格式不正确！','data'=>[]));
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
                    ajaxReturn(array('code'=>0,'info'=>'该账号被冻结！','data'=>[]));
                }

                $pwd=md5(md5($data['password']).$info['guid']);
                if($pwd==$info['password'])
                {
                    //若当前账号已有其他设备在线, 则前者会被挤掉
//                    if ($info['login_state'] == 1) {
//                        if ($info['device_tokens'] != $data['device_tokens']) {
//                            // TODO 如何让该设备下线??  友盟推送
//
//                            var_dump('让前一台设备下线');die;
//
//
//                        }
//                    }
                    $info['ticket']=$ticket;
                    unset($info['password'],$info['guid']);
                    $temp['login_ip']=Request::instance()->ip();
                    $temp['login_time']=time();

                    //更新设备号和在线状态, 以及设备系统, only_token
                    $temp['is_system'] = $data['is_system'];
                    $temp['device_tokens'] = $data['device_tokens'];
                    $temp['login_state'] = 1;
                    $temp['only_token'] = time().randCode(6,-1);
                    $info['only_token'] = $temp['only_token'];

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

                    ajaxReturn(array('code' =>1, 'info' => '登录成功','data'=>[$info]));
                }else
                {
                    ajaxReturn(array('code'=>0,'info'=>'密码不正确！','data'=>[]));
                }
            }else
            {
                ajaxReturn(array('code'=>0,'info'=>'手机号码不存在！','data'=>[]));
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
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            if(!preg_match("/^1[3|4|5|7|8|][0-9]{1}[0-9]{8}$/",$data['mobile']))
            {
                ajaxReturn(array('code' =>0, 'info' => '手机号码格式不正确！','data'=>[]));
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
                ajaxReturn(array('code'=>0,'info'=>'请先获取短信验证码！','data'=>[]));
            }
            if($token['code']!=$data['smscode'])
            {
                ajaxReturn(array('code'=>0, 'info'=>'短信验证码不正确！','data'=>[]));
            }
            if (!empty($token)&&$token['expired_at']<time() )
            {
                ajaxReturn(array('code'=>0, 'info'=>'短信验证码超时！','data'=>[]));
            }


            $map['mobile']=$data['mobile'];
            $info=db('doctor')->where($map)->field("member_id,member_sn,member_name,mobile,password,guid, true_name, is_clinic, is_certified, login_state, device_tokens, is_status")->find();
            if(!empty($info))
            {
                //是否被冻结
                if ($info['is_status'] == 1) {
                    ajaxReturn(array('code'=>0,'info'=>'该账号被冻结！','data'=>[]));
                }
                    //若当前账号已有其他设备在线, 则前者会被挤掉
//                    if ($info['login_state'] == 1) {
//                        if ($info['device_tokens'] != $data['device_tokens']) {
//                            // TODO 如何让该设备下线??   友盟推送??
//
//                            var_dump(333);die;
//
//
//                        }
//                    }
                    $info['ticket']=$ticket;
                    unset($info['password'],$info['guid']);
                    $temp['login_ip']=Request::instance()->ip();
                    $temp['login_time']=time();

                    //更新设备号和在线状态, 以及设备系统
                    $temp['is_system'] = $data['is_system'];
                    $temp['device_tokens'] = $data['device_tokens'];
                    $temp['login_state'] = 1;
                    $temp['only_token'] = time().randCode(6,-1);
                    $info['only_token'] = $temp['only_token'];

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
                    ajaxReturn(array('code' =>1, 'info' => '登录成功','data'=>[$info]));

            }else
            {
                ajaxReturn(array('code'=>0,'info'=>'手机号码不存在！','data'=>[]));
            }

        }
    }

    /**
     * @Title: doregist
     * @Description: TODO 医生注册
     */
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
            if($data['mobile']==''||$data['password']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'手机号或密码为空','data'=>[]));
            }
            if($data['area_id']=='' || $data['hospital_id']=='' || $data['true_name']=='' || $data['smscode']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $mobile=$data['mobile'];
            session_id(md5($mobile));
            session_start();
            $token = $_SESSION['tokencode'];

            if(empty($token))
            {
                ajaxReturn(array('code'=>0,'info'=>'请先获取短信验证码！','data'=>[]));
            }
            if($token['code']!=$data['smscode'])
            {
                ajaxReturn(array('code'=>0, 'info'=>'短信验证码不正确！','data'=>[]));
            }
            if (!empty($token)&&$token['expired_at']<time() )
            {
                ajaxReturn(array('code'=>0, 'info'=>'短信验证码超时！','data'=>[]));
            }

            $map['mobile']=$mobile;
            $countMobile = db('doctor')->where($map)->count();

            if($countMobile>0)
            {
                ajaxReturn(array('code' =>0, 'info' => '手机号码已绑定！','data'=>[]));
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
            $data['to_doctor_url'] = createPic('https://www.baidu.com');
            $invite_code = $data['invite_code'];
            unset($data['invite_code']);
            $_identify = db('doctor')->insertGetId($data);
            if($_identify)
            {
                unset($_SESSION['tokencode']);

                //填写了邀请码
                if ($invite_code) {
                    $temp['member_id'] = $_identify;
                    $temp['invite'] = $invite_code;
                    $temp['add_date'] = time();
                    db('invite_record')->insert($temp);
                }
                ajaxReturn(array('code' => 1, 'info' => '注册成功','data'=>[]));
            }else
            {
                ajaxReturn(array('code' => 1, 'info' => '注册失败','data'=>[]));
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


    /**
     * @Title: getDoctorInfo
     * @Description: TODO 获取医生详细信息
     */
    public function getDoctorInfo()
    {
        if($this->request->isPost())
        {
            $data=input('post.');
            if($data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            $map['member_id'] = $data['member_id'];
            $uinfo = db('doctor')->where($map)->alias('d')
                ->join(['jd_title'=>'t'], 'd.title_id = t.title_id' , 'left')
                ->join(['jd_area'=>'a'], 'd.area_id = a.area_id' , 'left')
                ->join(['jd_hospital'=>'h'], 'd.hospital_id = h.hospital_id' , 'left')
                ->field("d.*, t.title_name, a.name, h.hospital_name")
                ->find();
            unset($uinfo['password']);
            unset($uinfo['guid']);
            unset($uinfo['reg_date']);
            unset($uinfo['release_date']);
            unset($uinfo['reg_ip']);
            unset($uinfo['login_ip']);
            unset($uinfo['login_time']);
            unset($uinfo['aid']);
            unset($uinfo['operate_date']);


            if (!empty($uinfo)) {
                //是否被冻结
                if ($uinfo['is_status'] == 1) {
                    ajaxReturn(array('code'=>0,'info'=>'该账号被冻结！','data'=>[]));
                }
                ajaxReturn(array('code' => 1, 'info'=>'ok', 'data'=>[$uinfo]));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'该用户不存在！','data'=>[]));
            }

        }

    }


    /**
     * @Title: dropOut
     * @Description: TODO 医生退出登录
     */
    public function dropOut()
    {
        if($this->request->isPost())
        {
            $data=input('post.');
            if($data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            $map['member_id'] = $data['member_id'];
            $temp['release_date'] = time();
            $temp['login_state'] = 0;

            db('doctor')->where($map)->update($temp);

            ajaxReturn(array('code' => 1, 'info'=>'ok', 'data'=>[]));
        }

    }


    /**
     * @Title: getsms
     * @Description: TODO 获取短信验证码
     */
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
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            if(!preg_match("/^1[3|4|5|7|8|][0-9]{1}[0-9]{8}$/", $mobile))
            {
                ajaxReturn(array('code' =>0, 'info' => '手机号码格式不正确！','data'=>[]));
            }
            session_id(md5($mobile));
            session_start();
            $token = $_SESSION['tokencode'];
            if (!empty($token)&&$token['expired_at']>time() )
            {
                ajaxReturn(array('code'=>0, 'info'=>$timer.'秒内仅能获取一次验证码,请稍后重试','data'=>[]));
            }
            $randcode = randCode(6, 1);



            switch ($data['type']) {
                //注册发送验证码
                case 1:
                    $count=db('doctor')->where($map)->count();
                    if($count>0)
                    {
                        ajaxReturn(array('code' =>0, 'info' => '手机号码已绑定！','data'=>[]));
                    }
                    break;
                //快速登录发送验证码
                case 2:
                    $count=db('doctor')->where($map)->count();
                    if($count == 0)
                    {
                        ajaxReturn(array('code' =>0, 'info' => '该手机号暂未注册！','data'=>[]));
                    }
                    break;
            }
            $body = sprintf(config('body'), $randcode);
            $status = sendSMS($mobile, $body);
            if ($status) {
                $_SESSION['tokencode']= ['code' => $randcode, 'expired_at' => time() + $timer,'mobile'=>$mobile];
                ajaxReturn(array('code' => 1, 'info' => '短信发送成功','data'=>array($randcode)));
            } else {
                ajaxReturn(array('code' => 0, 'info' => '短信发送失败','data'=>[]));
            }
        }else
        {
            ajaxReturn(array('code' => 0, 'info' => '非法请求','data'=>[]));
        }
    }




}
