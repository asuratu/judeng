<?php
namespace app\home\controller;
use think\Request;
use think\Db;
class Inherit extends Common
{

    /**
     * @Title: getInheritDetail
     * @Description: TODO 获取传承的详细信息
     */
    public function getInheritDetail() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['inherit_id']=='' || $data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            //获取传承的详细信息
            $map['i.`is_display`'] = 1;
            $map['i.`inherit_id`'] = $data['inherit_id'];
            $inheritDetail = db('inherit')->alias('i')
                ->join(['jd_doctor'=>'d'], 'i.member_id = d.member_id' , 'inner')
                ->where($map)
                ->field("i.*, d.title_id, d.member_name")
                ->find();
            //处理图片路径
            $inheritDetail['banner'] = config('url').$inheritDetail['banner'];
            //处理简介的H5
            $inheritDetail['culture'] = config('url').'/inherit/detail?id='.$data['inherit_id'];
            //判断是否加入过该传承
            $exist = db('inherit_doctor')->where("(`member_id` = {$data['member_id']} OR `parent_id` = {$data['member_id']}) AND `is_checked` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
            if ($exist > 0) {
                $used = 1;
            } else {
                $used = 0;
            }

            //判断是否特色方剂
            $specialNum = db('special')->where("`is_display` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
            if ($specialNum > 0) {
                $useSpecial = 1;
            } else {
                $useSpecial = 0;
            }

            //查询医生职称
            if ($inheritDetail['title_id']) {
                $inheritDetail['title_str'] = db('title')->where('title_id','in',$inheritDetail['title_id'])->field("`title_name`")->select();
            } else {
                $inheritDetail['title_str'] = '';
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>['content'=>$inheritDetail, 'used'=>$used, 'useSpecial'=>$useSpecial]));
        }
    }


    /**
     * @Title: getInheritVideo
     * @Description: TODO 查询传承视频列表(分页)
     */
    public function getInheritVideo() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['inherit_id']=='' || $data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $data['page'] = $data['page'] ? intval($data['page']) : 1;
            $data['pageSize'] = $data['pageSize'] ? intval($data['pageSize']) : 5;
            $start = ($data['page']-1)*$data['pageSize'];

            $map['`is_display`'] = 1;
            $map['`inherit_id`'] = $data['inherit_id'];
            $stateArr = db('video')->where($map)->field("video_id, title, list_pic, intro, release_date")->limit($start,$data['pageSize'])->order("`sort` DESC")->select();
            $totalNum = db('video')->where($map)->field("inherit_id")->order("`sort` DESC")->count();
            //判断是否加入过该传承
            $exist = db('inherit_doctor')->where("(`member_id` = {$data['member_id']} OR `parent_id` = {$data['member_id']}) AND `is_checked` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
            if ($exist > 0) {
                $used = 1;
            } else {
                $used = 0;
            }
            foreach ($stateArr as $key => $val) {
                $stateArr[$key]['list_pic'] = config('url') . $stateArr[$key]['list_pic'];
                $stateArr[$key]['url'] = config('url') . '/inherit/video.html?id=' . $val['video_id'];
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>['content'=>$stateArr, 'totalNum'=>$totalNum, 'used'=>$used]));
        }
    }

    /**
     * @Title: getInheritArticle
     * @Description: TODO 查询传承文献列表页(分页)
     */
    public function getInheritArticle() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['inherit_id']=='' || $data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $data['page'] = $data['page'] ? intval($data['page']) : 1;
            $data['pageSize'] = $data['pageSize'] ? intval($data['pageSize']) : 5;
            $start = ($data['page']-1)*$data['pageSize'];

            $map['`is_display`'] = 1;
            $map['`inherit_id`'] = $data['inherit_id'];

            $stateArr = db('article')->where($map)->field("article_id, title, list_pic, intro, release_date")->limit($start,$data['pageSize'])->order("`sort` DESC")->select();
            $totalNum = db('article')->where($map)->field("inherit_id")->order("`sort` DESC")->count();

            //判断是否加入过该传承
            $exist = db('inherit_doctor')->where("(`member_id` = {$data['member_id']} OR `parent_id` = {$data['member_id']}) AND `is_checked` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
//            var_dump(db('inherit_doctor')->getLastSql());die;
            if ($exist > 0) {
                $used = 1;
            } else {
                $used = 0;
            }
            foreach ($stateArr as $key => $val) {
                $stateArr[$key]['list_pic'] = config('url') . $stateArr[$key]['list_pic'];
                $stateArr[$key]['url'] = config('url') . '/inherit/article?id=' . $val['article_id'];
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>['content'=>$stateArr, 'totalNum'=>$totalNum, 'used'=>$used]));
        }
    }

    /**
     * @Title: video
     * @Description: TODO 传承视频详情页(H5)
     */
    public function video() {
        $map['`is_display`'] = 1;
        $map['`video_id`'] = $_GET['id'];
        $videoDetail = db('video')->where($map)->field("*")->find();
        $videoDetail['release_date'] = date('Y-m-d H:i', $videoDetail['release_date']);
        $this->assign('info',$videoDetail);
        return $this->fetch();
    }

    /**
     * @Title: detail
     * @Description: TODO 传承详情里的简介(H5)
     * @return mixed
     * @author TUGE
     * @date
     */
    public function detail() {
        $map['`is_display`'] = 1;
        $map['`inherit_id`'] = $_GET['id'];
        $inheritDetail = db('inherit')->where($map)->field("culture")->find();
        $this->assign('info',$inheritDetail);
        return $this->fetch();
    }

    /**
     * @Title: effect
     * @Description: TODO 传承方剂详情里的方解(H5)
     * @return mixed
     * @author TUGE
     * @date
     */
    public function effect() {
        $map['`is_display`'] = 1;
        $map['`special_id`'] = $_GET['id'];
        $effectDetail = db('special')->where($map)->field("effect")->find();
        $effectDetail['effect'] = outputToText($effectDetail['effect']);
        $this->assign('info',$effectDetail);
        return $this->fetch();
    }

    /**
     * @Title: article
     * @Description: TODO 传承文章详情页(H5)
     */
    public function article() {
        $map['`is_display`'] = 1;
        $map['`article_id`'] = $_GET['id'];
        $articleDetail = db('article')->where($map)->field("*")->find();
        $articleDetail['release_date'] = date('Y-m-d H:i', $articleDetail['release_date']);
        $this->assign('info',$articleDetail);
        return $this->fetch();
    }

    /**
     * @Title: getInheritDrugDetail
     * @Description: TODO 查看特色方剂详情
     */
    public function getInheritDrugDetail() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['special_id']=='' || $data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //查询特色方剂详情
            $specialMap['`is_display`'] = 1;
            $specialMap['`special_id`'] = $data['special_id'];
            $specialArr = db('special')->where($specialMap)->field("*")->find();
            //处理简介的H5
            $specialArr['effect'] = config('url').'/inherit/effect?id='.$data['special_id'];
            //处理药方
            $contentArr = array();
            foreach (json_decode($specialArr['content']) as $key1=>$val1) {
                array_push($contentArr, $val1[1]);
            }
            $specialArr['content'] = base64_encode(json_encode($contentArr));

            $data['inherit_id'] = $specialArr['inherit_id'];
            //判断是否加入过该传承
            $exist = db('inherit_doctor')->where("(`member_id` = {$data['member_id']} OR `parent_id` = {$data['member_id']}) AND `is_checked` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
            if ($exist <= 0) {
                ajaxReturn(array('code'=>0, 'info'=>'请先加入该传承!','data'=>[]));
            }

            //获取传承的详细信息
            $map['i.`is_display`'] = 1;
            $map['i.`inherit_id`'] = $data['inherit_id'];
            $inheritDetail = db('inherit')->alias('i')
                ->join(['jd_doctor'=>'d'], 'i.member_id = d.member_id' , 'inner')
                ->where($map)
                ->field("i.inherit_id, i.inherit_name, d.title_id, d.member_name")
                ->find();
            //查询医生职称
            if ($inheritDetail['title_id']) {
                $inheritDetail['title_str'] = db('title')->where('title_id','in',$inheritDetail['title_id'])->field("`title_name`")->select();
            } else {
                $inheritDetail['title_str'] = '';
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>['inherit'=>$inheritDetail, 'content'=>$specialArr]));
        }
    }


    /**
     * @Title: getInheritDrugList
     * @Description: TODO 传承特色方剂列表(分页)
     */
    public function getInheritDrugList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['inherit_id']=='' || $data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //获取传承的详细信息
            $map['i.`is_display`'] = 1;
            $map['i.`inherit_id`'] = $data['inherit_id'];
            $inheritDetail = db('inherit')->alias('i')
                ->join(['jd_doctor'=>'d'], 'i.member_id = d.member_id' , 'inner')
                ->where($map)
                ->field("i.inherit_id, i.inherit_name, i.service_str, i.banner, i.intro, d.title_id, d.member_name")
                ->find();
            //处理图片路径
            $inheritDetail['banner'] = config('url').$inheritDetail['banner'];
            //查询医生职称
            if ($inheritDetail['title_id']) {
                $inheritDetail['title_str'] = db('title')->where('title_id','in',$inheritDetail['title_id'])->field("`title_name`")->select();
            } else {
                $inheritDetail['title_str'] = '';
            }

            //判断是否加入过该传承
            $exist = db('inherit_doctor')->where("(`member_id` = {$data['member_id']} OR `parent_id` = {$data['member_id']}) AND `is_checked` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
            if ($exist > 0) {
                $used = 1;
            } else {
                $used = 0;
            }

            //查询特色方剂列表
            $data['page'] = $data['page'] ? intval($data['page']) : 1;
            $data['pageSize'] = $data['pageSize'] ? intval($data['pageSize']) : 5;
            $start = ($data['page']-1)*$data['pageSize'];

            $specialMap['`is_display`'] = 1;
            $specialMap['`inherit_id`'] = $data['inherit_id'];
            $specialArr = db('special')->where($specialMap)->field("special_id, special_name, content, service_str")->limit($start,$data['pageSize'])->order("`sort` DESC")->select();
            $totalNum = db('special')->where($specialMap)->field("special_id")->order("`sort` DESC")->count();
            foreach ($specialArr as $key => $val) {
                $contentArr = array();
                foreach (json_decode($val['content']) as $key1=>$val1) {
                    array_push($contentArr, $val1[1]);
                }
                $specialArr[$key]['content'] = base64_encode(json_encode($contentArr));
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>['inherit'=>$inheritDetail, 'content'=>$specialArr, 'totalNum'=>$totalNum, 'used'=>$used]));
        }
    }

    /**
     * @Title: testPic
     * @Description: TODO 测试OSS
     */
    public function testPic() {
        //保存图片数据流
        $_fileExt = strrchr(strtolower($_FILES['file']['name']), '.');
        $_tempFileName = date('Ymd,h,i,s') . randCode(6, 1) . $_fileExt;

        $result = Model('User')->aliSaveFile(json_encode($_FILES['file']), 'uploads/code/', $_tempFileName, 'true');
    }

    public function saveUrlImg($img, $saveName, $isBase64 = false, $width = 0, $height = 0) {

        $_path = ROOT_PATH . 'uploads/pics/l/' . $saveName;
        if ($isBase64 == true) {

            $oss_sdk_service = new \Vendors\Ali\ALIOSS();

            // $response2 = $oss_sdk_service->upload_file_by_content(ALI_BUCKET,$saveName , array('content' => base64_decode($img), 'length' => '60000'));
            $this->aliSaveFile(base64_decode($img), 'pics/l/', $saveName, true);

            return;
        } else {
            // TODO 这里上传 微信 qq 用户的URL头像,需要裁剪!!
            $this->aliSaveFile($img, 'pics/l/', $saveName, false, true);
            return;
        }
    }























    public function testPic1() {
        //保存图片数据流
        foreach ($_FILES as $key => $val) {
            $file = request()->file($key);
            $path = OSS_PATH . 'uploads/paper/';
            $result = $file->move($path);
            var_dump($result);die;
            $upPaperInfo[$key] = '/uploads/paper/' . $result->getSaveName();
            $upPaperInfo['release_date'] = time();
        }
        var_dump($result);die;
    }

    public function upPic(){
        //oss上传
        $bucketName = config('OSS_TEST_BUCKET');
        require_once(ROOT_PATH . 'extend/OSS/OssClient.php');
        $ossClient = new \OSS\OssClient(config('OSS_ACCESS_ID'), config('OSS_ACCESS_KEY'), config('OSS_ENDPOINT'), false);
        $web=config('OSS_WEB_SITE');
        //图片
        $fFiles=$_FILES['pic_1'];
        $rs=ossUpPic($fFiles,'uploads',$ossClient,$bucketName,$web,0);

        if($rs['code']==1){
            //图片
            $img = $rs['msg'];
            return $img;
            //如返回里面有缩略图：
            $thumb=$rs['thumb'];
        }else{
            $this->error('图片有误：'.$rs['msg']);
            return;
        }
    }

    /**
     *   阿里云OSS 上传文件
     * @param type $fileName  待上传文件名 [或文件 base64, 或url]
     * @param type $savePath  => pics/l , pics/s ,
     * @param type $saveName  保存的文件名
     * @param type $filePath  待上传文件所在目录
     * @return type
     */
    public function aliSaveFile() {
        /**
         * 通过http body上传文件,适用于直接写入内容的上传，比较小的文件
         * 调用方法如下：
         * $upload_file_by_content = $oss_sdk_service->upload_file_by_content($bucket,$object,$upload_file_options);
         * 其中的$bucket,$object以及$upload_file_options为必选参数，$upload_file_options必须为数组，且key必须为规定的值，否则会上传失败,
         * $object是文件名称，如果上传的文件不是直接位于bucket下，而是位于某一子目录下，则$object = 'dir_name/dir_name/file_name'
         * 其中的content 为文件的内容，$length为文件的大小
         * $upload_file_options = array(
         *    'content' => $content,
         *    'length' => $length,
         * );
         */
        /**
         * 加载sdk包以及错误代码包
         */
        require_once(ROOT_PATH . 'extend/Ali/sdk.class.php');
//实例化OSS Service
        $oss_sdk_service = new \ALIOSS();

//设置是否打开curl调试模式,该模式主要是为了方便调试使用，可以设置TRUE|FALSE
        $oss_sdk_service->set_debug_mode(FALSE);
        $bucket = 'xiaojd1';
        $_fileExt = strrchr(strtolower($_FILES['file']['name']), '.');
//        $object = date('Ymd,h,i,s') . randCode(6, 1) . $_fileExt;
//        $content = '';
//
//        $upload_file_options = array(
//            'content' => $_FILES['file'],
//            'length' => strlen($content),
//        );
        $object = 'oss-file-name-'.time().'.txt';
        $content = '';
        for($i = 0;$i<= 100;$i++){
            $content .= $i."\n";
        }
        $upload_file_options = array(
            'content' => $content,
            'length' => strlen($content),
        );

        $upload_file_by_content = $oss_sdk_service->upload_file_by_content($bucket,$object,$upload_file_options);
        print_r($upload_file_by_content);die();

    }




}