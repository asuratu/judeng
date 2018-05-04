<?php
namespace app\home\controller;
use think\Request;
class Member extends Common
{
    public function doLogin()
    {
        if($this->request->isPost())
        {
            $data=input('post.');
            if($data['mobile']==''||$data['password']=='')
            {
               ajaxReturn(array('code'=>0,'info'=>'账号或密码为空','data'=>[]));
            }

        }
    }
    public function doRegist()
    {
        if($this->request->isPost())
        {
            $data=input('post.');
            print_r($data);
            if($data['mobile']==''||$data['password']=='')
            {
               ajaxReturn(array('code'=>0,'info'=>'手机号或密码为空','data'=>[]));
            }

            $data['reg_date']=time();
            $data['reg_ip']=Request::instance()->ip();
            $data['guid']=randCode(8,2);
            $data['city_name']=$data['city_name'];
            $data['password']=md5(md5($data['password']).$data['guid']);

        }
    }


    //获取短信验证码
    public function getsms()
    {
        session_start();
        $timer = 300;
        $data['mobile']='13474352590';
        $randcode=randCode(6,1);
        session('tokencode', ['code' => $randcode, 'expired_at' => time() + $timer]);
        $body=sprintf(config('body'),$randcode);
        $status=sendSMS($data['mobile'],$body);
        if($status)
        {
            setcookie('timer',$timer,time()+$timer,'/');
            $_SESSION["token"]['mobile']=$data['mobile'];
            ajaxReturn(array('code'=>1,'info'=>'短信发送成功'));
        }else
        {
            ajaxReturn(array('code'=>0,'info'=>'短信发送失败'));
        }
    }
}
