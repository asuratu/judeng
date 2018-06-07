<?php
namespace app\home\controller;
use think\Request;
use think\Db;
class Oss extends Common
{

    /**
     * @Title: upPic
     * @Description: TODO 上传图片阿里云OSS-支持多图
     */
    public function upPic(){
        //保存图片数据流 - OSS
        //$upPaperInfo 数组

        $upPaperInfo = json_decode(Model('Oss')->upPic('uploads/paper'), true);
        ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[$upPaperInfo]));
    }

    /**
     * @Title: upPic
     * @Description: TODO 上传图片阿里云OSS-支持多图
     */
    public function upPicAdmin(){
        header("Access-Control-Allow-Origin:*");
        /*星号表示所有的域都可以接受，*/
        header("Access-Control-Allow-Methods:GET,POST");
        //保存图片数据流 - OSS
        //$upPaperInfo 数组
        $upPaperInfo = Model('Oss')->upPicFile($_GET['dir'], $_GET['files'], $_GET['name']);
        return $upPaperInfo;
    }


}