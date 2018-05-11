<?php

namespace app\service;

use app\tools\Auxi;

if (!defined('IN_PX')) {
    exit;
}

class WeiXin2Impl implements WeiXin2 {

    const VERSION = '1.2.0';

    private function __Inject($db, $cache, $session) {

    }

//    public $appid = 'wx8a5032de8015af6d';
//    private $_appsecret = '709b5a073d351770aaba19ef0c574fbf';

    public $appid = 'wx15fd1420bf788a27';
    private $_appsecret = '3438b06cb74c93ef6b2928c06401cef8';
    //测试号appID
    public $cookieExpire = 20;


}
