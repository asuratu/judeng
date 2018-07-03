<?php
namespace app\home\controller;
use think\Request;
use think\Db;

class Member extends Common
{
    /**
     * @Title: dologin
     * @Description: TODO 医生账号密码登录(只允许一台设备在线)
     */
    public function dologin()
    {
        if($this->request->isPost()) {
            @session_start();
            $ticket=session_id();
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['mobile']==''||$data['password']==''|| $data['device_tokens']=='' || $data['is_system']=='')
            {
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            if(!preg_match("/^1\d{10}$/",$data['mobile']))
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

                    $info['ticket']=$ticket;
                    unset($info['password'],$info['guid']);
                    $temp['login_ip']=Request::instance()->ip();
                    $temp['login_time']=time();

                    //更新设备号和在线状态, 以及设备系统, only_token
                    $temp['is_system'] = $data['is_system'];
                    $temp['device_tokens'] = $data['device_tokens'];
                    $temp['login_state'] = 1;
                    $temp['is_login'] = 1;
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

                    $con = Model('Setting')->findAdmin();
                    $info['version_number'] = $con['version_number'];
                    $info['service_hot'] = $con['service_hot'];

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

    /**
     * @Title: relogin
     * @Description: TODO 注册即可登录
     */
    public function relogin()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if(!preg_match("/^1\d{10}$/",$data['mobile']))
            {
                ajaxReturn(array('code' =>0, 'info' => '手机号码格式不正确！','data'=>[]));
            }
            $map['mobile']=$data['mobile'];
            $info=db('doctor')->where($map)->field("member_id,member_sn,member_name,mobile,password,guid, true_name, is_clinic, is_certified, login_state, device_tokens, is_status")->find();
//            var_dump(db('doctor')->getLastSql());die;

            if(!empty($info))
            {
                //是否被冻结
                if ($info['is_status'] == 1) {
                    ajaxReturn(array('code'=>0,'info'=>'该账号被冻结！','data'=>[]));
                }

                $pwd=md5(md5($data['password']).$info['guid']);
                if($pwd==$info['password'])
                {

                    $temp['login_ip']=Request::instance()->ip();
                    $temp['login_time']=time();

                    //更新设备号和在线状态, 以及设备系统, only_token
                    $temp['is_system'] = $data['is_system'];
                    $temp['device_tokens'] = $data['device_tokens'];
                    $temp['login_state'] = 1;
                    $temp['is_login'] = 1;
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

                    $con = Model('Setting')->findAdmin();
                    $info['version_number'] = $con['version_number'];
                    $info['service_hot'] = $con['service_hot'];

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

    /**
     * @Title: doSmsLogin
     * @Description: TODO 短信登录
     */
    public function doSmsLogin()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['mobile']==''||$data['smscode']==''|| $data['device_tokens']=='' || $data['is_system']=='')
            {
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            if(!preg_match("/^1\d{10}$/",$data['mobile']))
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
            if (!empty($token)&&$token['expired_at']<time() )
            {
                ajaxReturn(array('code'=>0, 'info'=>'短信验证码超时！','data'=>[]));
            }
            //清除验证码
            $_SESSION['tokencode']= null;


            $map['mobile']=$data['mobile'];
            $info=db('doctor')->where($map)->field("member_id,member_sn,member_name,mobile,password,guid, true_name, is_clinic, is_certified, login_state, device_tokens, is_status")->find();
            if(!empty($info))
            {
                //是否被冻结
                if ($info['is_status'] == 1) {
                    ajaxReturn(array('code'=>0,'info'=>'该账号被冻结！','data'=>[]));
                }

                    unset($info['password'],$info['guid']);
                    $temp['login_ip']=Request::instance()->ip();
                    $temp['login_time']=time();

                    //更新设备号和在线状态, 以及设备系统
                    $temp['is_system'] = $data['is_system'];
                    $temp['device_tokens'] = $data['device_tokens'];
                    $temp['login_state'] = 1;
                    $temp['is_login'] = 1;
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

                $con = Model('Setting')->findAdmin();
                $info['version_number'] = $con['version_number'];
                $info['service_hot'] = $con['service_hot'];

                    ajaxReturn(array('code' =>1, 'info' => '登录成功','data'=>[$info]));

            }else
            {
                ajaxReturn(array('code'=>0,'info'=>'手机号码不存在！','data'=>[]));
            }

        }
    }

    /**
     * @Title: loginJoinInherit
     * @Description: TODO 登录申请加入传承
     */
    public function loginJoinInherit()
    {
        if($this->request->isPost()) {

            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['mobile']==''||$data['smscode']==''|| $data['inherit_id']=='')
            {
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            if(!preg_match("/^1\d{10}$/",$data['mobile']))
            {
                ajaxReturn(array('code' =>0, 'info' => '手机号码格式不正确！','data'=>[]));
            }
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            tglog('验证短信');
            tglog(json_encode($data));
            tglog('验证短信');
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
            //清除验证码
            $_SESSION['tokencode']= null;

            $map['mobile']=$data['mobile'];
            $info=db('doctor')->where($map)->field("member_id,member_sn,member_name,mobile,password,guid, true_name, is_clinic, is_certified, login_state, device_tokens, is_status")->find();
            if(!empty($info))
            {
                //是否被冻结
                if ($info['is_status'] == 1) {
                    ajaxReturn(array('code'=>0,'info'=>'该账号被冻结！','data'=>[]));
                }

                //检查是否已加入该传承
                $existDetail = db('inherit_doctor')
                    ->where("member_id = {$info['member_id']} AND inherit_id = {$data['inherit_id']} AND is_checked IN(0, 1)")
                    ->field('inherit_doctor_id')
                    ->count();
                if ($existDetail) {
                    ajaxReturn(array('code'=>0, 'info'=>'您已申请过该传承!','data'=>[]));
                }

                //查询传承信息
                $inheritInfo = db('inherit')
                    ->where("inherit_id = {$data['inherit_id']} AND is_display = 1")
                    ->field('member_id')
                    ->find();

                if (empty($inheritInfo)) {
                    ajaxReturn(array('code'=>0, 'info'=>'该传承已下架!','data'=>[]));
                }

                //提交申请
                $insertData['parent_id'] = $inheritInfo['member_id'];
                $insertData['inherit_id'] = $data['inherit_id'];
                $insertData['member_id'] = $info['member_id'];
                $insertData['reason'] = '医生邀请加入传承';
                $insertData['add_date'] = time();

                //生成邀请加入传承的二维码
                $insertData['img_url'] =  config('url') . createPic(config('url').'/member/inviteInherit?memberId='.$info['member_id'].'&inheritId='.$data['inherit_id']);

                $identify = db('inherit_doctor')->insertGetId($insertData);

                ajaxReturn(array('code' =>1, 'info' => '提交成功','data'=>[$identify]));

            }else
            {
                ajaxReturn(array('code'=>0,'info'=>'手机号码不存在！','data'=>[]));
            }

        }
    }

    /**
     * @Title: forgetPsd
     * @Description: TODO 忘记密码
     */
    public function forgetPsd()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['mobile']==''||$data['smscode']==''|| $data['password']=='' || $data['newPassword']=='')
            {
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            if(!preg_match("/^1\d{10}$/",$data['mobile']))
            {
                ajaxReturn(array('code' =>0, 'info' => '手机号码格式不正确！','data'=>[]));
            }
            if($data['password'] != $data['newPassword'])
            {
                ajaxReturn(array('code' =>0, 'info' => '两次输入的密码不一致！','data'=>[]));
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
            //清除验证码
            $_SESSION['tokencode']= null;


            $map['mobile']=$data['mobile'];
            $info=db('doctor')->where($map)->field("member_id,member_sn,member_name,mobile,password,guid, true_name, is_clinic, is_certified, login_state, device_tokens, is_status")->find();
            if(!empty($info))
            {
                //是否被冻结
                if ($info['is_status'] == 1) {
                    ajaxReturn(array('code'=>0,'info'=>'该账号被冻结！','data'=>[]));
                }
                    unset($info['password']);

                    //更新密码
                    $temp['password'] = md5(md5($data['password']).$info['guid']);
                    $temp['release_date'] = time();
                    db('doctor')->where($map)->update($temp);
                    ajaxReturn(array('code' =>1, 'info' => '修改成功','data'=>[]));

            }else
            {
                ajaxReturn(array('code'=>0,'info'=>'手机号码不存在！','data'=>[]));
            }

        }
    }

    /**
     * @Title: updatePsd
     * @Description: TODO 修改密码
     */
    public function updatePsd()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['mobile']==''||$data['smscode']==''|| $data['newPassword']=='')
            {
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            if(!preg_match("/^1\d{10}$/",$data['mobile']))
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
            //清除验证码
            $_SESSION['tokencode']= null;


            $map['mobile']=$data['mobile'];
            $info=db('doctor')->where($map)->field("member_id,member_sn,member_name,mobile,password,guid, true_name, is_clinic, is_certified, login_state, device_tokens, is_status")->find();
            if(!empty($info))
            {
                //是否被冻结
                if ($info['is_status'] == 1) {
                    ajaxReturn(array('code'=>0,'info'=>'该账号被冻结！','data'=>[]));
                }
                    unset($info['password']);

                    //更新密码
                    $temp['password'] = md5(md5($data['newPassword']).$info['guid']);
                    $temp['release_date'] = time();
                    db('doctor')->where($map)->update($temp);
                    ajaxReturn(array('code' =>1, 'info' => '修改成功','data'=>[]));

            }else
            {
                ajaxReturn(array('code'=>0,'info'=>'手机号码不存在！','data'=>[]));
            }

        }
    }

    /**
     * @Title: updateBankCard
     * @Description: TODO 医生添加/修改银行卡信息
     */
    public function updateBankCard()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['member_id']==''|| $data['bank_id']=='' || $data['deposit_name']=='' || $data['deposit_number']=='' || $data['opening_bank']=='' || $data['bank_mobile']=='' || $data['deposit_id'] == '')
            {
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if ($data['deposit_id'] > 0) {
                //修改
                $info=db('deposit')
                    ->where("deposit_id = {$data['deposit_id']} AND member_id = {$data['member_id']}")
                    ->count();
                if ($info <= 0) {
                    ajaxReturn(array('code' =>0, 'info' => '该银行卡不存在','data'=>[]));
                }
                $updateInfo = array(
                    'bank_id'=>$data['bank_id'],
                    'deposit_name'=>$data['deposit_name'] ?: '',
                    'deposit_number'=>$data['deposit_number'] ?: '',
                    'opening_bank'=>$data['opening_bank'] ?: '',
                    'mobile'=>$data['bank_mobile'] ?: '',
                    'add_date'=>time(),
                );
                $updateTarget = array('deposit_id'=>$data['deposit_id']);
                db('deposit')->where($updateTarget)->update($updateInfo);
                ajaxReturn(array('code' =>1, 'info' => '修改成功','data'=>[]));
            } else {
                //添加
                $info=db('deposit')
                    ->where("member_id = {$data['member_id']}")
                    ->count();
                if ($info > 0) {
                    ajaxReturn(array('code' =>0, 'info' => '你已经添加过银行卡','data'=>[]));
                }
                $insertInfo = array(
                    'bank_id'=>$data['bank_id'],
                    'deposit_name'=>$data['deposit_name'] ?: '',
                    'member_id'=>$data['member_id'] ?: 0,
                    'deposit_number'=>$data['deposit_number'] ?: '',
                    'opening_bank'=>$data['opening_bank'] ?: '',
                    'mobile'=>$data['bank_mobile'] ?: '',
                    'add_date'=>time(),
                );
                db('deposit')->insert($insertInfo);
                ajaxReturn(array('code' =>1, 'info' => '添加成功','data'=>[]));
            }
        }
    }

    /**
     * @Title: doregist
     * @Description: TODO 医生注册
     */
    public function doregist()
    {
        if($this->request->isPost()) {
        try {
            Db::startTrans();
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
            //清除验证码
            $_SESSION['tokencode']= null;

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
            $_oldPwd['password'] = $data['password'];
            $data['password']=md5(md5($data['password']).$data['guid']);

            //生成医生邀请医生的二维码图片路径
            $registUrl = config('url').'/member/webRegist?id='.$data['invite'];
            $data['to_doctor_url'] = createPic($registUrl);
            $invite_code = $data['invite_code'];
            unset($data['invite_code']);
            $_identify = db('doctor')->insertGetId($data);

            if($_identify) {
                $diagnosis_set = array();
                $diagnosis_set['member_id'] = $_identify;
                $diagnosis_set['add_date'] = time();
                $diagnosis_set['operate_date'] = $diagnosis_set['add_date'];
                $diagnosis_set['release_date'] = $diagnosis_set['add_date'];
                db('diagnosis_set')->insert($diagnosis_set);
                unset($_SESSION['tokencode']);

                //填写了邀请码
                if ($invite_code) {
                    $temp['member_id'] = $_identify;
                    $temp['invite'] = $invite_code;
                    $temp['add_date'] = time();
                    db('invite_record')->insert($temp);
                }

                //注册环信用户
                import('Easemob', EXTEND_PATH);

                $options['client_id'] = config('client_id');
                $options['client_secret'] = config('client_secret');
                $options['org_name'] = config('org_name');
                $options['app_name'] = config('app_name');

                $h=new \Easemob($options);
                $h->createUser($data['member_sn'],"123456");

                //注册即可登录
                $map['mobile']=$data['mobile'];
                $temp['login_ip']=Request::instance()->ip();
                $temp['login_time']=time();

                //更新设备号和在线状态, 以及设备系统, only_token
                $temp['is_system'] = $data['is_system'];
                $temp['device_tokens'] = $data['device_tokens'];
                $temp['login_state'] = 1;
                $temp['is_login'] = 1;
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

                $con = Model('Setting')->findAdmin();
                $info['version_number'] = $con['version_number'];
                $info['service_hot'] = $con['service_hot'];

                //查找用户信息
                $newInfo = db('doctor')
                    ->where($map)
                    ->field("member_id,member_sn,member_name,mobile,password,guid, true_name, is_clinic, is_certified, login_state, device_tokens, is_status")
                    ->find();
                $info = array_merge($info, $newInfo);
                Db::commit();
                ajaxReturn(array('code' =>1, 'info' => '注册成功','data'=>[$info]));
            } else {
                Db::rollback();
                ajaxReturn(array('code' => 0, 'info' => '注册失败','data'=>[]));
            }
        } catch (\Exception $e) {
        Db::rollback();
        return false;
            }
        }
    }

    /**
     * @Title: invite
     * @Description: TODO 医生邀请患者的二维码(H5)
     * @return mixed
     * @author TUGE
     * @date
     */
    public function attention() {
        $map['doctor_id'] = $_GET['doctorId'];
        //获取二维码
        $result = curlPost(config('url').'/wx/getQrcode', $map);
//        $result = curlPost('http://localhost:7037/wx/getQrcode', $map);
        if ($result && json_decode($result, true)['code'] == 1) {
            $information['url'] = json_decode($result, true)['data'][0];
        } else {
            return 404;
        }
        //获取医生信息
        $doctorInfo = json_decode(curlPost(config('url').'/member/getDoctorInfo', array('member_id'=>$_GET['doctorId'])), true);
        if ($doctorInfo && $doctorInfo['code'] == 1) {
            $information['face_photo'] = $doctorInfo['data'][0]['face_photo'];
            $information['true_name'] = $doctorInfo['data'][0]['true_name'];
            $information['has_self_goods'] = $doctorInfo['data'][0]['has_self_goods'];
            $information['is_clinic'] = $doctorInfo['data'][0]['is_clinic'];
            $information['recom'] = $doctorInfo['data'][0]['recom'];
            $information['title_str'] = explode(',',$doctorInfo['data'][0]['title_str']);
        } else {
            return 404;
        }
        $this->assign('info',$information);
        return $this->fetch('doctor/attention');
    }

    /**
     * @Title: inviteDoctors
     * @Description: TODO 医生邀请医生入驻的二维码(H5)
     * @return int|mixed
     * @author TUGE
     * @date
     */
    public function inviteDoctors() {
        $map['doctor_id'] = $_GET['doctorId'];
        //获取医生信息
        $doctorInfo = json_decode(curlPost(config('url').'/member/getDoctorInfo', array('member_id'=>$_GET['doctorId'])), true);
        if ($doctorInfo && $doctorInfo['code'] == 1) {
            $information['to_doctor_url'] = $doctorInfo['data'][0]['to_doctor_url'];
            $information['true_name'] = $doctorInfo['data'][0]['true_name'];
            $information['invite'] = $doctorInfo['data'][0]['invite'];
        } else {
            return 404;
        }
        $this->assign('info',$information);
        return $this->fetch('doctor/inviteDoctors');
    }




    /**
     * @Title: delteHxUser
     * @Description: TODO 删除环信用户
     * @return bool|mixed
     * @author TUGE
     * @date
     */
    public function delteHxUser()
    {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['username']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'请输入环信用户名','data'=>[]));
            }
            //删除环信用户
            import('Easemob', EXTEND_PATH);
            $options['client_id'] = config('client_id');
            $options['client_secret'] = config('client_secret');
            $options['org_name'] = config('org_name');
            $options['app_name'] = config('app_name');
            $h=new \Easemob($options);
            $result = $h->deleteUser($data['username']);
            if ($result['action'] == 'delete') {
                ajaxReturn(array('code' => 1, 'info' => '删除成功','data'=>[]));
            } else {
                ajaxReturn(array('code' => 0, 'info' => '操作失败','data'=>[]));
            }
        }
    }

    public function webRegist()
    {
        //查询地区
        $map['is_display'] = 1;
        $areaList=db('area')->where($map)->field("`area_id`,`name`")->order("`sort` DESC")->select();
        //查询医院
        $hospitalList=db('hospital')->where($map)->field("`hospital_id`,`hospital_name`, area_id")->order("`sort` DESC")->select();

        $this->assign("area", $areaList);
        $this->assign("hospital", $hospitalList);
        $this->assign("code", $_GET['id']);
        return  $this->fetch('/doctor/regist');
    }

    public function plan()
    {
       $orderId = intval($_GET['id']);
       //订单信息,判断是否是待支付
        $orderDetail = db('order')
            ->where("order_id = {$orderId} AND pay_status = 0 AND order_status = 0")
            ->field("`order_id`, `doctor_id`")
            ->find();
        if (empty($orderDetail)) {
            return '该订单已支付!';
        }

        //生成二维码
        $urlData['order_id'] = $orderDetail['order_id'];
        $url = curlPost(config('url').'/wx/getDrugQrcode', $urlData);

        if (json_decode($url, true)['code'] != 1) {
            return 404;
        }
        $result = json_decode($url, true)['data'][0];

        //医生信息
        $doctorInfo = db('doctor')
            ->where("member_id = {$orderDetail['doctor_id']}")
            ->field("`member_name`")
            ->find();

        $this->assign("imgUrl", $result);
        $this->assign("doctorName", $doctorInfo['member_name']);
        return  $this->fetch('/doctor/plan');
    }

    public function inviteInherit()
    {
        //查询医生信息
        $docInfo=db('doctor')
            ->where("member_id = {$_GET['memberId']}")
            ->field("`face_photo`,`true_name`, `member_id`, `invite`")
            ->find();

        //查询传承信息
        $inheritInfo=db('inherit')
            ->where("inherit_id = {$_GET['inheritId']}")
            ->field("`inherit_name`,`inherit_id`")
            ->find();

        $this->assign("info", $docInfo);
        $this->assign("inherit", $inheritInfo);
        return  $this->fetch('/doctor/doctorLogin');
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
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $map['member_id'] = $data['member_id'];
            $uinfo = db('doctor')->where($map)->alias('d')
                ->join(['jd_title'=>'t'], 'd.title_id = t.title_id' , 'left')
                ->join(['jd_area'=>'a'], 'd.area_id = a.area_id' , 'left')
                ->join(['jd_hospital'=>'h'], 'd.hospital_id = h.hospital_id' , 'left')
                ->field("d.*, t.title_name, a.name, h.hospital_name")
                ->find();
            $uinfo['birthday'] = date('Y-m-d', $uinfo['birthday']);
            $uinfo['to_doctor_url'] = config('url').$uinfo['to_doctor_url'];

            //微信分享的链接
            //http://localhost:7037/member/inviteDoctors?doctorId=170
            $uinfo['shareUrl'] = config('url').'/member/inviteDoctors?doctorId='.$data['member_id'];

            unset($uinfo['password']);
            unset($uinfo['guid']);
            unset($uinfo['reg_date']);
            unset($uinfo['release_date']);
            unset($uinfo['reg_ip']);
            unset($uinfo['login_ip']);
            unset($uinfo['login_time']);
            unset($uinfo['aid']);
            unset($uinfo['operate_date']);

            $doctor['certified'] = $this->view->setting['aryCertified'][$uinfo['is_certified']];

            // 开方数
            $uinfo['prescriptions'] = Db::table('jd_order o, jd_order_prescription op')
                ->where("o.`order_id` = op.`order_id` and op.`prescription_type` = 0 and o.order_type = 3 and o.doctor_id = {$data['member_id']}")
                ->count();
            // 患者数
            $uinfo['patient'] = Db::table('jd_doctor_member s, jd_member m')
                ->where("s.doctor_id = {$data['member_id']} and s.`member_id` = m.`member_id`")
                ->count();

            // 评论数
            $uinfo['comment'] = Db::table('jd_service_evaluation s, jd_member m')
                ->where("s.is_show = 1 and s.doctor_id = {$data['member_id']} and s.`member_id` = m.`member_id`")
                ->count();
            $con = Model('Setting')->findAdmin();
            $uinfo['disturb_start'] = $uinfo['disturb_start'] + strtotime('1995-00-00');
            $uinfo['disturb_end'] = $uinfo['disturb_end'] + strtotime('1995-00-00');
            $uinfo['disturb_start'] = date('H:i', $uinfo['disturb_start']);
            $uinfo['disturb_end'] = date('H:i', $uinfo['disturb_end']);
            $uinfo['version_number'] = $con['version_number'];
            $uinfo['service_hot'] = $con['service_hot'];

            $list=db('ad')->where("type_id = 0 and is_display = 1")->field("`ad_title`,`ad_img`,`ad_url`,`add_date`")->order("`ad_sort` ASC")->select();
            $order = array();
            foreach ($list as $key => $val) {
                array_push($order, $val);
                $order[$key]['ad_img'] = $val['ad_img'];
                $order[$key]['add_date'] = date('Y-m-d H:i', $val['add_date']);
            }
            $uinfo['ad'] = $order;

            //是否有特色方剂 -- 特色标识
            $existGoods = db('self_goods')
                ->where("member_id = {$data['member_id']} AND content != '' AND is_checked = 2 AND end_date > ".time())
                ->field('self_goods_id')
                ->count();
            $existGoods > 0 ? $uinfo['has_self_goods'] = 1 : $uinfo['has_self_goods'] = 0;

            //查询科室
            if ($uinfo['hospital_repart_str']) {
                $uinfo['department_arr'] = db('hospital_repart')->alias('hr')
                    ->join(['jd_department'=>'d'], 'd.department_id = hr.department_id' , 'inner')
                    ->where("hr.hospital_repart_id IN({$uinfo['hospital_repart_str']}) AND d.is_show = 1")
                    ->field("d.department_name")
                    ->select();
            } else {
                $uinfo['department_arr'] = array();
            }

            //查询银行卡
            $bankInfo = db('deposit')->alias('d')
                ->join(['jd_bank'=>'b'], 'd.bank_id = b.bank_id' , 'inner')
                ->where("d.member_id = {$data['member_id']}")
                ->field("d.bank_id, d.deposit_name, d.deposit_number, d.opening_bank, d.mobile, b.bank_name, d.mobile as bank_mobile, d.deposit_id")
                ->find();

            if (!empty($uinfo)) {
                //是否被冻结
                if ($uinfo['is_status'] == 1) {
                    ajaxReturn(array('code'=>0,'info'=>'该账号被冻结！','data'=>[]));
                }
                if (!$bankInfo) {
                    $bankInfo = array(
                        'bank_id'=>0,
                        'deposit_id'=>0,
                        'deposit_name'=>'',
                        'deposit_number'=>'',
                        'opening_bank'=>'',
                        'bank_name'=>'',
                        'bank_mobile'=>'',
                    );
                }
                $uinfo = array_merge($uinfo, $bankInfo);
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
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
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
     * @Description: TODO 获取短信验证码 60秒内只能获取一次验证码 有效时间是300秒
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
            $timer = 60; //发送验证码间隔时间
            $expiredTimer = 300; //验证码的有效期
            if($data['type']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            if(!preg_match("/^1\d{10}$/", $mobile))
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
                        ajaxReturn(array('code' =>0, 'info' => '该手机号已注册过账号请直接登录！','data'=>[]));
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
//            $body = sprintf(config('body'), $randcode);

            $status = sendAliSMS($mobile, array('code'=>$randcode.''), 0);
            if ($status) {
                $_SESSION['tokencode']= ['code' => $randcode, 'expired_at' => time() + $expiredTimer,'mobile'=>$mobile];
                ajaxReturn(array('code' => 1, 'info' => '短信发送成功','data'=>array($randcode)));
            } else {
                ajaxReturn(array('code' => 0, 'info' => '短信发送失败','data'=>[]));
            }
        }else
        {
            ajaxReturn(array('code' => 0, 'info' => '非法请求','data'=>[]));
        }
    }

    /**
     * @Title: test
     * @Description: TODO 测试环信
     */
    public function test()
    {
        import('Easemob', EXTEND_PATH);

        $options['client_id'] = config('client_id');
        $options['client_secret'] = config('client_secret');
        $options['org_name'] = config('org_name');
        $options['app_name'] = config('app_name');

        $h=new \Easemob($options);
        $result = $h->isOnline("tkt5af1b51289f9b");
    }




}
