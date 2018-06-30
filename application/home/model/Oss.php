<?php
namespace app\home\model;

use think\Model;

class Oss extends Model
{
    /**
     * @Title: upPic
     * @Description: TODO 上传图片阿里云OSS-支持多图
     */
    public function upPic($dir){
        //oss上传
        $bucketName = config('OSS_TEST_BUCKET');
        require_once(ROOT_PATH . 'extend/OSS/OssClient.php');
        $ossClient = new \OSS\OssClient(config('OSS_ACCESS_ID'), config('OSS_ACCESS_KEY'), config('OSS_ENDPOINT'), false);
        $web=config('OSS_WEB_SITE');
        $arr = array();
        foreach ($_FILES as $key => $val) {
            $rs=$this->ossUpPic($val,$dir,$ossClient,$bucketName,$web,0);
            if($rs['code']==1){
                //图片
                $img = $rs['msg'];
                $arr[$key] = $img;
                //如返回里面有缩略图：
                $thumb=$rs['thumb'];
            }else{
                ajaxReturn(array('code' => 0, 'info' => '图片有误：'.$rs['msg']));
            }
        }
        return json_encode($arr);
    }

    //oss上传
    /*
     *$fFiles:文件域
     *$n：上传的路径目录
     *$ossClient
     *$bucketName
     *$web:oss访问地址
     *$isThumb:是否缩略图
     */
    public function ossUpPic($fFiles,$n,$ossClient,$bucketName,$web,$isThumb=0){
        $fType=$fFiles['type'];
        $back=array(
            'code'=>0,
            'msg'=>'',
        );
        if(!in_array($fType, config('oss_exts'))){
            $back['msg']='文件格式不正确';
            return $back;
            exit;
        }
        $fSize=$fFiles['size'];
        if($fSize>config('oss_maxSize')){
            $back['msg']='文件超过了1M';
            return $back;
            exit;
        }

        $fname=$fFiles['name'];
        $ext=substr($fname,stripos($fname,'.'));

        $fup_n=$fFiles['tmp_name'];
        $file_n=time().'_'.rand(100,999);
        $object = $n."/".$file_n.$ext;//目标文件名
        if (is_null($ossClient)) exit(1);
        $ossClient->uploadFile($bucketName, $object, $fup_n);
        if($isThumb==1){
            // 图片缩放，参考https://help.aliyun.com/document_detail/44688.html?spm=5176.doc32174.6.481.RScf0S
            $back['thumb']= $web.'/'.$object."?x-oss-process=image/resize,h_300,w_300";
        }
        $back['code']=1;
        $back['msg']=$web.'/'.$object;
        return $back;
        exit;
    }

    /**
     * @Title: upPic
     * @Description: TODO 上传图片阿里云OSS-支持多图
     */
    public function upPicFile($dir, $files, $name){
        //oss上传
        $bucketName = config('OSS_TEST_BUCKET');
        require_once(ROOT_PATH . 'extend/OSS/OssClient.php');
        $ossClient = new \OSS\OssClient(config('OSS_ACCESS_ID'), config('OSS_ACCESS_KEY'), config('OSS_ENDPOINT'), false);
        $web=config('OSS_WEB_SITE');
        $rs=$this->ossUpPicAdmin($files, $name,$dir,$ossClient,$bucketName,$web,0);
        if($rs['code']==1){
            //图片
            $img = $rs['msg'];
            $arr = $img;
        }else{
            $arr = '';
        }
        return $arr;
    }

    //oss上传
    /*
     *$fFiles:文件域
     *$n：上传的路径目录
     *$ossClient
     *$bucketName
     *$web:oss访问地址
     *$isThumb:是否缩略图
     */
    public function ossUpPicAdmin($fFiles,$name,$n,$ossClient,$bucketName,$web,$isThumb=0){


        $fname=$name;
        $ext=substr($fname,stripos($fname,'.'));

        $fup_n=$fFiles;
        $file_n=time().'_'.rand(100,999);
        $object = $n."/".$file_n.$ext;//目标文件名
        if (is_null($ossClient)) exit(1);
        $ossClient->uploadFile($bucketName, $object, $fup_n);
        if($isThumb==1){
            // 图片缩放，参考https://help.aliyun.com/document_detail/44688.html?spm=5176.doc32174.6.481.RScf0S
            $back['thumb']= $web.'/'.$object."?x-oss-process=image/resize,h_300,w_300";
        }
        $back['code']=1;
        $back['msg']=$web.'/'.$object;
        return $back;
    }
}