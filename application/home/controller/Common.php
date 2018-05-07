<?php
namespace app\home\controller;
use think\Controller;
use think\Db;
use think\Session;
use think\Verify;
use think\Request;
class Common extends Controller
{
    public function _initialize()
    {
        $settingConfig = include APP_PATH . 'settingConfig.php';
        $this->assign("setting", $settingConfig);
    }

    public function countToken($token)
    {
        $map['only_token'] = $token;
        $map['is_status'] = 0;
        $num = db('doctor')->where($map)->count();
        var_dump($num);die;
    }
}