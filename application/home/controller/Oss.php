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
    }

}