<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/11/18 0018
 * Time: 下午 14:29
 */
namespace app\service;

//use App\Service\Impl\type;

interface WeiXin2
{

    public function messageTemplate($type, $post = array());

}