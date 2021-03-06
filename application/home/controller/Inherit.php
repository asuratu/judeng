<?php
namespace app\home\controller;
use think\Controller;
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
                ->field("i.*, d.title_id, d.member_name, d.true_name, d.mobile")
                ->find();
            //处理图片路径
            $inheritDetail['true_name'] = !empty($inheritDetail['true_name']) ? $inheritDetail['true_name'] : (!empty($inheritDetail['member_name']) ? $inheritDetail['member_name'] : $inheritDetail['mobile']);
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
                $stateArr[$key]['list_pic'] = $stateArr[$key]['list_pic'];
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
//            $stateArr = db('article')->where($map)->field("article_id, title, list_pic, intro, release_date")->order("`sort` DESC")->select();
            $totalNum = db('article')->where($map)->field("inherit_id")->order("`sort` DESC")->count();

            //判断是否加入过该传承
            $exist = db('inherit_doctor')->where("(`member_id` = {$data['member_id']} OR `parent_id` = {$data['member_id']}) AND `is_checked` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
            if ($exist > 0) {
                $used = 1;
            } else {
                $used = 0;
            }
            foreach ($stateArr as $key => $val) {
                $stateArr[$key]['list_pic'] = $stateArr[$key]['list_pic'];
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
        $videoDetail['substance'] = htmlspecialchars_decode($videoDetail['substance']);
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
        $culture = htmlspecialchars_decode($inheritDetail['culture']);
        $this->assign('info',$culture);
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
        $articleDetail['substance'] = htmlspecialchars_decode($articleDetail['substance']);
        $articleDetail['release_date'] = date('Y-m-d H:i', $articleDetail['release_date']);
        $this->assign('info',$articleDetail);
        return $this->fetch();
    }

    /**
     * @Title: ad
     * @Description: TODO 首页公告
     * @return mixed
     * @author TUGE
     * @date
     */
    public function ad() {
        $map['`article_id`'] = $_GET['id'];
        switch ($_GET['id']) {
            case 1:
                $temp = 'inherit/ad1';
                break;
            case 2:
                $temp = 'inherit/ad2';
                break;
            default:
                $temp = 'inherit/ad3';
                break;
        }
        return $this->fetch($temp);
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
            if (empty($specialArr)) {
                ajaxReturn(array('code'=>0,'info'=>'该特色方剂不存在!','data'=>[]));
            }
            //处理简介的H5
            $specialArr['effect'] = config('url').'/inherit/effect?id='.$data['special_id'];
            //处理药方
            $contentArr = array();
            foreach (json_decode($specialArr['content']) as $key1=>$val1) {
                array_push($contentArr, $val1[1]);
            }
            $specialArr['content'] = base64_encode(json_encode($contentArr, JSON_UNESCAPED_UNICODE));
            $data['inherit_id'] = $specialArr['inherit_id'];
            //判断是否加入过该传承
            $exist = db('inherit_doctor')->where("(`member_id` = {$data['member_id']} OR `parent_id` = {$data['member_id']}) AND `is_checked` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
            if ($exist <= 0) {
                ajaxReturn(array('code'=>0, 'info'=>'请先加入该传承!','data'=>[]));
            }

//            //获取传承的详细信息
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
                $inheritDetail['title_str'] = array();
            }

            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>array('inherit'=>$inheritDetail, 'content'=>$specialArr)));
        }
    }

    public function androidInheritDrugDetail() {
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
            if (empty($specialArr)) {
                ajaxReturn(array('code'=>0,'info'=>'该特色方剂不存在!','data'=>[]));
            }
            //处理简介的H5
            $specialArr['effect'] = config('url').'/inherit/effect?id='.$data['special_id'];
            //处理药方
            $contentArr = array();
            foreach (json_decode($specialArr['content']) as $key1=>$val1) {
                array_push($contentArr, $val1[1]);
            }
            $specialArr['content'] = base64_encode(json_encode($contentArr, JSON_UNESCAPED_UNICODE));
            $data['inherit_id'] = $specialArr['inherit_id'];
            //判断是否加入过该传承
            $exist = db('inherit_doctor')->where("(`member_id` = {$data['member_id']} OR `parent_id` = {$data['member_id']}) AND `is_checked` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
            if ($exist <= 0) {
                ajaxReturn(array('code'=>0, 'info'=>'请先加入该传承!','data'=>[]));
            }

//            //获取传承的详细信息
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
                $inheritDetail['title_str'] = array();
            }

            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>[['inherit'=>$inheritDetail, 'content'=>$specialArr]]));
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
            $inheritDetail['banner'] = $inheritDetail['banner'];
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
     * @Title: getInheritDoctorList
     * @Description: TODO 传承医生列表
     */
    public function getInheritDoctorList() {
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

            //判断是否加入过该传承
            $exist = db('inherit_sdoctor')->where("(`member_id` = {$data['member_id']} OR `parent_id` = {$data['member_id']}) AND `is_checked` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
            if ($exist <= 0) {
                ajaxReturn(array('code'=>0, 'info'=>'请先加入该传承!','data'=>[]));
            }

            //获取传承的详细信息
            $map['i.`is_display`'] = 1;
            $map['i.`inherit_id`'] = $data['inherit_id'];
            $inheritDetail = db('inherit')->alias('i')
                ->join(['jd_doctor'=>'d'], 'i.member_id = d.member_id' , 'inner')
                ->where($map)
                ->field("i.inherit_id, i.inherit_name, i.studio_intro, i.studio_address, i.studio_tel, d.member_id, d.member_name, d.face_photo")
                ->find();

            //查询工作室列表
            $studioList = db('inherit_sdoctor')->alias('id')
                ->join(['jd_doctor'=>'d'], 'id.member_id = d.member_id' , 'inner')
                ->where("id.`is_checked` = 1 AND id.`inherit_id` = {$data['inherit_id']} AND id.parent_id = {$inheritDetail['member_id']}")
                ->field("id.inherit_id, id.parent_id, d.member_id, d.member_name, d.face_photo")
                ->select();

            foreach ($studioList as $key=>$val) {
                //查询每个医生的信息
                $doctorInfo = db('doctor')->where("member_id = {$val['member_id']}")
                    ->field('member_id, inherit, member_name, face_photo, goodat_id, recom, is_clinic, hospital_id, hospital_repart_str, school_str, inherit, title_str, concealment_number')
                    ->find();

                //是否显示流派
                if ($doctorInfo['inherit'] && $doctorInfo['school_str']) {
                    $doctorInfo['school_str'] = db('school')
                        ->where("school_id IN('{$doctorInfo['school_str']}') AND is_display = 1")
                        ->field('school_name')
                        ->select();
//                    var_dump($doctorInfo['school_str']);die;

                } else {
                    $doctorInfo['school_str'] = array();
                }
                // 查询擅长
                $doctorInfo['goodat_id'] = Controller('Doctor')->goodsId($doctorInfo['goodat_id']);
                //第一医疗机构
                $hospital = db('hospital')->where("hospital_id = {$doctorInfo['hospital_id']}")
                    ->field('hospital_name')
                    ->find();
                $doctorInfo['hospital_name'] = $hospital['hospital_name'];
                //第一科室
                if ($doctorInfo['hospital_repart_str']) {
                    $keshiArr = db('hospital_repart')->alias('hr')
                        ->join(['jd_department'=>'d'], 'd.department_id = hr.department_id' , 'inner')
                        ->where("hr.hospital_repart_id IN({$doctorInfo['hospital_repart_str']}) AND hr.is_show = 1")
                        ->field("d.department_name")
                        ->select();
                } else {
                    $keshiArr = array();
                }

                $doctorInfo['department_name'] = $keshiArr[0] ?: ['department_name'=>''];
                //是否有自建特色方剂
                $existGoods = db('self_goods')
                    ->where("member_id = {$doctorInfo['member_id']} AND content != '' AND is_checked = 2 ")
                    ->field('self_goods_id')
                    ->count();
                $existGoods > 0 ? $doctorInfo['has_self_goods'] = 1 : $doctorInfo['has_self_goods'] = 0;
                //好评数和付款数
                $inheritDocInfo = db('inherit_sdoctor')->alias('id')
                    ->join(['jd_doctor'=>'d'], 'id.member_id = d.member_id' , 'inner')
                    ->where("id.`is_checked` = 1 AND id.`inherit_id` = {$data['inherit_id']} AND id.member_id = {$doctorInfo['member_id']}")
                    ->field("id.pay_num, id.proud, id.use_drug")
                    ->find  ();
                $doctorInfo['pay_num'] = $inheritDocInfo['pay_num'];
                $doctorInfo['proud'] = $inheritDocInfo['proud'];
                //使用过的特色方剂
                $doctorInfo['use_drug'] = $inheritDocInfo['use_drug'];
                //查找该医生的方剂
                $doctorInfo['selfGoodsList'] = db('self_goods')
                    ->where("member_id = {$doctorInfo['member_id']} AND is_checked = 2 ")
                    ->field("self_goods_name")
                    ->select();
                $studioList[$key]['content'] = $doctorInfo;
            }

            $firstList = $studioList;
            //若当前不是传承人还应查工作站
            
            if ($data['member_id'] != $doctorInfo['member_id']) {
                //工作站信息
                $studioList = db('inherit_sdoctor')->alias('id')
                    ->join(['jd_doctor'=>'d'], 'id.member_id = d.member_id' , 'inner')
                    ->where("id.`is_checked` = 1 AND id.`inherit_id` = {$data['inherit_id']} AND id.parent_id = {$data['member_id']}")
                    ->field("id.inherit_id, id.parent_id, d.member_id, d.member_name, d.face_photo")
                    ->select();
                foreach ($studioList as $key=>$val) {
                    //查询每个医生的信息
                    $doctorInfo = db('doctor')->where("member_id = {$val['member_id']}")
                        ->field('member_id, inherit, member_name, face_photo, goodat_id, recom, is_clinic, hospital_id, hospital_repart_str, school_str, inherit, title_str, concealment_number')
                        ->find();

                    //是否显示流派
                    if ($doctorInfo['inherit'] && $doctorInfo['school_str']) {
                        $doctorInfo['school_str'] = db('school')
                            ->where("school_id IN({$doctorInfo['school_str']}) AND is_display = 1")
                            ->field('school_name')
                            ->select();
                    } else {
                        $doctorInfo['school_str'] = array();
                    }

                    //第一医疗机构
                    $hospital = db('hospital')->where("hospital_id = {$doctorInfo['hospital_id']}")
                        ->field('hospital_name')
                        ->find();
                    $doctorInfo['hospital_name'] = $hospital['hospital_name'];
                    //第一科室
                    if ($doctorInfo['hospital_repart_str']) {
                        $keshiArr = db('hospital_repart')->alias('hr')
                            ->join(['jd_department'=>'d'], 'd.department_id = hr.department_id' , 'inner')
                            ->where("hr.hospital_repart_id IN({$doctorInfo['hospital_repart_str']}) AND hr.is_show = 1")
                            ->field("d.department_name")
                            ->select();
                    } else {
                        $keshiArr = array();
                    }

                    $doctorInfo['department_name'] = $keshiArr[0] ?: ['department_name'=>''];
                    // 查询擅长
                    $doctorInfo['goodat_id'] = Controller('Doctor')->goodsId($doctorInfo['goodat_id']);
                    //是否有自建特色方剂
                    $existGoods = db('self_goods')
                        ->where("member_id = {$doctorInfo['member_id']} AND content != '' AND is_checked = 2")
                        ->field('self_goods_id')
                        ->count();
                    $existGoods > 0 ? $doctorInfo['has_self_goods'] = 1 : $doctorInfo['has_self_goods'] = 0;
                    //好评数和付款数
                    $inheritDocInfo = db('inherit_sdoctor')->alias('id')
                        ->join(['jd_doctor'=>'d'], 'id.member_id = d.member_id' , 'inner')
                        ->where("id.`is_checked` = 1 AND id.`inherit_id` = {$data['inherit_id']} AND id.member_id = {$doctorInfo['member_id']}")
                        ->field("id.pay_num, id.proud, id.use_drug")
                        ->find  ();
                    $doctorInfo['pay_num'] = $inheritDocInfo['pay_num'];
                    $doctorInfo['proud'] = $inheritDocInfo['proud'];
                    //使用过的特色方剂
                    $doctorInfo['use_drug'] = $inheritDocInfo['use_drug'];
                    //查找该医生的方剂
                    $doctorInfo['selfGoodsList'] = db('self_goods')
                        ->where("member_id = {$doctorInfo['member_id']} AND is_checked = 2")
                        ->field("self_goods_name")
                        ->select();
                    $studioList[$key]['content'] = $doctorInfo;
                }
                $workStation = $studioList;
            } else {
                $workStation = array();
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>[['inheritDetail'=>$inheritDetail, 'firstList'=>$firstList, 'workStation'=>$workStation]]));
        }
    }


    /**
     * @Title: allInheritList
     * @Description: TODO 传承列表
     */
    public function allInheritList() {
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

            //查询已加入的传承
            $existDetail = db('inherit_doctor')->alias('id')
                ->join(['jd_inherit'=>'i'], 'id.inherit_id = i.inherit_id' , 'inner')
                ->join(['jd_doctor'=>'d'], 'id.parent_id = d.member_id' , 'inner')
                ->where("(id.member_id = {$data['member_id']}) AND id.is_checked = 1")
                ->field("i.inherit_id, i.inherit_name, i.service_str, i.banner, i.is_recommend, i.school_id, i.intro, d.member_id, d.member_name, d.title_str")
                ->order('id.add_date DESC')
                ->select();

            //查询特色方剂
            foreach ($existDetail as $key => $val) {
                $existDetail[$key]['drugList']= db('special')->where("is_display = 1 AND inherit_id = {$val['inherit_id']}")
                    ->field("special_name")
                    ->order('sort DESC')
                    ->select();
                $existDetail[$key]['school_name']= db('school')->where("is_display = 1 AND school_id = {$val['school_id']}")
                    ->field("school_name")
                    ->order('sort DESC')
                    ->find();
                $existDetail[$key]['school_name'] = $existDetail[$key]['school_name']['school_name'] ?: '';
                if (count($existDetail[$key]['drugList']) > 0) {
                    $existDetail[$key]['has_drugList'] = 1;
                } else {
                    $existDetail[$key]['has_drugList'] = 0;
                }
                $existDetail[$key]['is_applied'] = 1;
            }

            //未加入的传承(所有的传承减去已加入的传承)
            $arr2 = array_map('reset',$existDetail);
            $indexStr = implode(',', $arr2);

            if ($indexStr) {
                $where = "i.inherit_id NOT IN({$indexStr})";
            } else {
                $where = "1 = 1";
            }
            $unExistDetail = db('inherit')->alias('i')
                ->join(['jd_doctor'=>'d'], 'i.member_id = d.member_id' , 'inner')
                ->where("i.is_display = 1 AND ".$where)
                ->field("i.inherit_id, i.inherit_name, i.service_str, i.banner, i.is_recommend, i.intro, i.school_id, d.member_id, d.member_name, d.title_str")
                ->order('i.sort DESC')
                ->select();

            $listArr = array();
            foreach ($unExistDetail as $key=>$val) {
                if (!isset($listArr[$val['inherit_id']])) {
                    $listArr[$val['inherit_id']] = $val;
                }
                $listArr[$val['inherit_id']]['drugList']= db('special')->where("is_display = 1 AND inherit_id = {$val['inherit_id']}")
                    ->field("special_name")
                    ->order('sort DESC')
                    ->select();
                $listArr[$val['inherit_id']]['school_name']= db('school')->where("is_display = 1 AND school_id = {$val['school_id']}")
                    ->field("school_name")
                    ->order('sort DESC')
                    ->find();
                $listArr[$val['inherit_id']]['school_name'] = $listArr[$val['inherit_id']]['school_name']['school_name'] ?: '';
                if (count($listArr[$val['inherit_id']]['drugList']) > 0) {
                    $listArr[$val['inherit_id']]['has_drugList'] = 1;
                } else {
                    $listArr[$val['inherit_id']]['has_drugList'] = 0;
                }
                //检查是否提交过申请
                $listArr[$val['inherit_id']]['is_applied']= db('inherit_doctor')->where("is_checked != 1 AND member_id = {$data['member_id']} AND inherit_id = {$val['inherit_id']}")
                    ->field("inherit_doctor_id")
                    ->count();
                $listArr[$val['inherit_id']]['is_applied'] = $listArr[$val['inherit_id']]['is_applied'] > 0 ? $listArr[$val['inherit_id']]['is_applied'] : 0;
            }

            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>['yes'=>$existDetail, 'no'=>array_values($listArr)]));
        }
    }


    public function applyInherit() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['member_id']=='' || $data['inherit_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //检查是否已加入该传承
            $existDetail = db('inherit_doctor')
                ->where("member_id = {$data['member_id']} AND inherit_id = {$data['inherit_id']} AND is_checked IN(0, 1)")
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
            $insertData['member_id'] = $data['member_id'];
            $insertData['reason'] = $data['reason'] ?: '';
            $insertData['add_date'] = time();

            //生成邀请加入传承的二维码
            $insertData['img_url'] =  config('url') . createPic(config('url').'/member/inviteInherit?memberId='.$data['member_id'].'&inheritId='.$data['inherit_id']);

            $identify = db('inherit_doctor')->insertGetId($insertData);
            $identify2 = db('inherit_sdoctor')->insertGetId($insertData);

            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>[]));
        }
    }

    public function examine() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['doctor_id']=='' || $data['inherit_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //检查是否是传承人
            $existDetail = db('inherit')
                ->where("member_id = {$data['doctor_id']} AND inherit_id = {$data['inherit_id']} AND is_display = 1")
                ->field('inherit_id')
                ->count();

            if (!$existDetail) {
                ajaxReturn(array('code'=>0, 'info'=>'只有传承人才能进行该操作!','data'=>[]));
            }

            //查询待审核列表
            $unExamineList = db('inherit_doctor')->alias('id')
                ->join(['jd_inherit'=>'i'], 'id.inherit_id = i.inherit_id' , 'inner')
                ->join(['jd_doctor'=>'d'], 'id.member_id = d.member_id' , 'inner')
                ->where("id.parent_id = {$data['doctor_id']} AND id.is_checked = 0 AND id.inherit_id = {$data['inherit_id']}")
                ->field("id.`inherit_doctor_id`, d.`portrait`, d.`member_id`, d.`member_name`, d.`true_name`, d.`is_clinic`, d.`hospital_id`, d.`title_id`, id.`reason`, d.`is_fans`, d.`is_service`, d.`is_comment`")
                ->order('id.add_date DESC')
                ->select();

            //查询已通过审核列表
            $examineList = db('inherit_doctor')->alias('id')
                ->join(['jd_inherit'=>'i'], 'id.inherit_id = i.inherit_id' , 'inner')
                ->join(['jd_doctor'=>'d'], 'id.member_id = d.member_id' , 'inner')
                ->where("id.parent_id = {$data['doctor_id']} AND id.is_checked = 1 AND id.inherit_id = {$data['inherit_id']}")
                ->field("id.`inherit_doctor_id`, d.`portrait`, d.`member_id`, d.`member_name`, d.`true_name`, d.`is_clinic`, d.`hospital_id`, d.`title_id`, id.`reason`, d.`is_fans`, d.`is_service`, d.`is_comment`")
                ->order('id.add_date DESC')
                ->select();

            foreach ($unExamineList as $key=>$value) {
                //查询医院和职称
                $hospitalResult = db('hospital')
                    ->where("hospital_id = {$value['hospital_id']}")
                    ->field("hospital_name")
                    ->find();
                $unExamineList[$key]['hospital_name'] = $hospitalResult['hospital_name'];

                $hospitalResult = db('title')
                    ->where("title_id = {$value['title_id']}")
                    ->field("title_name")
                    ->find();
                $unExamineList[$key]['title_name'] = $hospitalResult['title_name'];

                //是否有服务包标识
                $existGoods = db('self_goods')
                    ->where("member_id = {$value['member_id']} AND content != '' AND is_checked = 2 AND end_date > ".time())
                    ->field('self_goods_id')
                    ->count();
                $existGoods > 0 ? $unExamineList[$key]['has_self_goods'] = 1 : $unExamineList[$key]['has_self_goods'] = 0;

                //粉丝数
                $unExamineList[$key]['patient'] = Db::table('jd_doctor_member s, jd_member m')
                    ->where("s.doctor_id = {$value['member_id']} and s.`member_id` = m.`member_id`")
                    ->count();

                //服务人次
                $unExamineList[$key]['prescriptions'] = Db::table('jd_order o, jd_order_prescription op')
                    ->where("o.`order_id` = op.`order_id` and op.`prescription_type` = 0 and o.order_type = 3 and o.doctor_id = {$value['member_id']}")
                    ->count();

                //评论数
                $unExamineList[$key]['comment'] = Db::table('jd_service_evaluation s, jd_member m')
                    ->where("s.is_show = 1 and s.doctor_id = {$value['member_id']} and s.`member_id` = m.`member_id`")
                    ->count();
            }

            foreach ($examineList as $key=>$value) {
                //查询医院和职称
                $hospitalResult = db('hospital')
                    ->where("hospital_id = {$value['hospital_id']}")
                    ->field("hospital_name")
                    ->find();
                $examineList[$key]['hospital_name'] = $hospitalResult['hospital_name'];

                $hospitalResult = db('title')
                    ->where("title_id = {$value['title_id']}")
                    ->field("title_name")
                    ->find();
                $examineList[$key]['title_name'] = $hospitalResult['title_name'];

                //是否有服务包标识
                $existGoods = db('self_goods')
                    ->where("member_id = {$value['member_id']} AND content != '' AND is_checked = 2 AND end_date > ".time())
                    ->field('self_goods_id')
                    ->count();
                $existGoods > 0 ? $examineList[$key]['has_self_goods'] = 1 : $examineList[$key]['has_self_goods'] = 0;

                //粉丝数
                $examineList[$key]['patient'] = Db::table('jd_doctor_member s, jd_member m')
                    ->where("s.doctor_id = {$value['member_id']} and s.`member_id` = m.`member_id`")
                    ->count();

                //服务人次
                $examineList[$key]['prescriptions'] = Db::table('jd_order o, jd_order_prescription op')
                    ->where("o.`order_id` = op.`order_id` and op.`prescription_type` = 0 and o.order_type = 3 and o.doctor_id = {$value['member_id']}")
                    ->count();

                //评论数
                $examineList[$key]['comment'] = Db::table('jd_service_evaluation s, jd_member m')
                    ->where("s.is_show = 1 and s.doctor_id = {$value['member_id']} and s.`member_id` = m.`member_id`")
                    ->count();
            }

            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>['unExamineList'=>$unExamineList, 'examineList'=>$examineList]));
        }
    }

    //传承审核通过
    public function adopt() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['doctor_id']=='' || $data['inherit_doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //检查是否有该申请
            $existDetail = db('inherit_doctor')
                ->where("member_id = {$data['doctor_id']} AND inherit_doctor_id = {$data['inherit_doctor_id']} AND is_checked = 0")
                ->field('inherit_doctor_id')
                ->count();

            if (!$existDetail) {
                ajaxReturn(array('code'=>0, 'info'=>'您还未申请加入该传承!','data'=>[]));
            }

            $map['member_id'] = $data['doctor_id'];
            $map['inherit_doctor_id'] = $data['inherit_doctor_id'];
            $temp['operate_date'] = time();
            $temp['is_checked'] = 1;

            $result = db('inherit_doctor')->where($map)->update($temp);

            if ($result) {
                //短信和微信通知, 未完成

                ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>[]));
            } else {
                ajaxReturn(array('code'=>0, 'info'=>'服务器繁忙, 请稍后再试!','data'=>[]));
            }
        }
    }

    //将医生移出传承
    public function remove() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['doctor_id']=='' || $data['inherit_doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //检查是否有该申请
            $existDetail = db('inherit_doctor')
                ->where("member_id = {$data['doctor_id']} AND inherit_doctor_id = {$data['inherit_doctor_id']} AND is_checked = 1")
                ->field('inherit_doctor_id')
                ->count();

            if (!$existDetail) {
                ajaxReturn(array('code'=>0, 'info'=>'您还未申请加入该传承!','data'=>[]));
            }

            $map['member_id'] = $data['doctor_id'];
            $map['inherit_doctor_id'] = $data['inherit_doctor_id'];
            $temp['operate_date'] = time();
            $temp['is_checked'] = 1;

            $result = db('inherit_doctor')->where($map)->update($temp);

            if ($result) {
                //短信和微信通知, 未完成

                ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>[]));
            } else {
                ajaxReturn(array('code'=>0, 'info'=>'服务器繁忙, 请稍后再试!','data'=>[]));
            }
        }
    }


    /**
     * @Title: upPic
     * @Description: TODO 测试阿里云OSS
     */
    public function upPic(){
        //oss上传
        $bucketName = config('OSS_TEST_BUCKET');
        require_once(ROOT_PATH . 'extend/OSS/OssClient.php');
        $ossClient = new \OSS\OssClient(config('OSS_ACCESS_ID'), config('OSS_ACCESS_KEY'), config('OSS_ENDPOINT'), false);
        $web=config('OSS_WEB_SITE');
        //图片
        $fFiles=$_FILES['pic_1'];
        $rs=ossUpPic($fFiles,'uploads/paper',$ossClient,$bucketName,$web,0);

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

}