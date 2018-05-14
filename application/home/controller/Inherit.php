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
            //判断是否已加入 TODO 未完成

            //判断是否特色方剂 TODO 未完成

            //查询医生职称
            if ($inheritDetail['title_id']) {
                $inheritDetail['title_str'] = db('title')->where('title_id','in',$inheritDetail['title_id'])->field("`title_name`")->select();
            } else {
                $inheritDetail['title_str'] = '';
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[$inheritDetail]));
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

            if($data['inherit_id']=='')
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
            foreach ($stateArr as $key => $val) {
                $stateArr[$key]['list_pic'] = config('url') . $stateArr[$key]['list_pic'];
                $stateArr[$key]['url'] = config('url') . '/inherit/video.html?id=' . $val['video_id'];
            }
            ajaxReturn(array('code'=>0, 'info'=>'ok!','data'=>['content'=>$stateArr, 'totalNum'=>$totalNum]));
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

            if($data['inherit_id']=='')
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
            foreach ($stateArr as $key => $val) {
                $stateArr[$key]['list_pic'] = config('url') . $stateArr[$key]['list_pic'];
                $stateArr[$key]['url'] = config('url') . '/inherit/article?id=' . $val['article_id'];
            }
            ajaxReturn(array('code'=>0, 'info'=>'ok!','data'=>['content'=>$stateArr, 'totalNum'=>$totalNum]));
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
     * @Title: checkTaboo
     * @Description: TODO 根据地区查询药房药态列表
     */
    public function getDrugRelationList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['area_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //获取药态数组
            $map['`is_display`'] = 1;
            $stateArr = db('drug_state')->where($map)->field("`state_id`,`state_name`,`make`,`weight`,`taking`,`instructions`, `pic`")->order("`sort` DESC")->select();

            foreach ($stateArr as $key => $val) {
                //查询该药态下的药方
                $temp['d.`is_display`'] = 1;
                $temp['p.`area_id`'] = $data['area_id'];
                $temp['p.`is_display`'] = 1;
                $temp['d.`state_id`'] = $val['state_id'];
                $houseArr = db('drug_relation')->alias('d')
                    ->join(['jd_prescription'=>'p'], 'd.prescription_id = p.prescription_id' , 'inner')
                    ->join(['jd_drug_state'=>'ds'], 'd.state_id = ds.state_id' , 'inner')
                    ->where($temp)
                    ->field("d.`relation_id`, d.`prescription_id`, d.`state_id`, d.`describe`, p.`prescription_name`, p.`area_name`")
                    ->order("d.`sort` DESC")
                    ->select();
                $stateArr[$key]['content'] = $houseArr;
                $stateArr[$key]['pic'] = config('url').$val['pic'];
            }

            ajaxReturn(array('code'=>0, 'info'=>'ok!','data'=>$stateArr));
        }
    }

    /**
     * @Title: getTempDetail
     * @Description: TODO 获取药方模板详情/新建进入空白模板
     */
    public function getTempDetail() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            //temp_id 0为新建 1修改
            if($data['temp_id']=='' || $data['state_id']=='' || $data['area_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //查询药态信息
            $stateMap['`state_id`'] = $data['state_id'];
            $stateMap['`is_display`'] = 1;
            $tempInfo = db('drug_state')->where($stateMap)->field("`state_id`,`state_name`,`make`,`weight`,`taking`,`instructions`,`pic`")->find();
            $tempInfo['pic'] = config('url').$tempInfo['pic'];
            if ($data['temp_id'] == 0) {
                //新建模板
                $tempInfo['head_title'] = '新建'.$tempInfo['state_name'].'模板';
                $tempInfo['temp_name'] = '';
                //查询该药态该地区下的第一个药房
                $houseMap['d.`is_display`'] = 1;
                $houseMap['p.`area_id`'] = $data['area_id'];
                $houseMap['p.`is_display`'] = 1;
                $houseMap['d.`state_id`'] = $data['state_id'];
                $houseArr = db('drug_relation')->alias('d')
                    ->join(['jd_prescription'=>'p'], 'd.prescription_id = p.prescription_id' , 'inner')
                    ->join(['jd_drug_state'=>'ds'], 'd.state_id = ds.state_id' , 'inner')
                    ->where($houseMap)
                    ->field("d.`relation_id`, d.`prescription_id`, d.`state_id`, d.`describe`, p.`prescription_name`, p.`area_name`")
                    ->order("d.`sort` DESC")
                    ->select();

                if (count($houseArr) > 0) {
                    $tempInfo['state_house_name'] = $tempInfo['state_name'].'.'.$houseArr[0]['area_name'].'-'.$houseArr[0]['prescription_name'];
                    $tempInfo['relation_id'] = $houseArr[0]['relation_id'];
                    $tempInfo['left_num'] = count($houseArr)-1;
                    $tempInfo['price'] = 0;
                    $tempInfo['drug_str'] = '';
                    $tempInfo['is_taboo'] = 0;
                    $tempInfo['dose'] = 0;
                    $tempInfo['taboo_content'] = '';

                    ajaxReturn(array('code'=>1,'info'=>'ok~!','data'=>[$tempInfo]));
                } else {
                    ajaxReturn(array('code'=>0,'info'=>'该药态该地区暂无药房~!','data'=>[]));
                }
            } else {
                //修改模板
                //查询模板信息
                $tempMap['temp_id'] = $data['temp_id'];
                $drugtempInfo = db('temp')->where($tempMap)->field("make,weight,taking,instructions,temp_name,relation_id,price,drug_str,is_taboo,taboo_content,dose")->find();
                //敏感数据处理
                $drugtempInfo['drug_str'] = base64_encode($drugtempInfo['drug_str']);
                $drugtempInfo['taboo_content'] = $drugtempInfo['taboo_content'] ? base64_encode($drugtempInfo['taboo_content']) : '';
                $drugtempInfo['head_title'] = '修改'.$tempInfo['state_name'].'模板';
                $drugtempInfo['pic'] = $tempInfo['pic'];
                $drugtempInfo['state_name'] = $tempInfo['state_name'];
                $drugtempInfo['state_id'] = $tempInfo['state_id'];

                //药房信息
                $houseMap['d.`is_display`'] = 1;
                $houseMap['p.`area_id`'] = $data['area_id'];
                $houseMap['p.`is_display`'] = 1;
                $houseMap['d.`state_id`'] = $data['state_id'];
                $houseAllArr = db('drug_relation')->alias('d')
                    ->join(['jd_prescription'=>'p'], 'd.prescription_id = p.prescription_id' , 'inner')
                    ->join(['jd_drug_state'=>'ds'], 'd.state_id = ds.state_id' , 'inner')
                    ->where($houseMap)
                    ->field("d.`relation_id`, d.`prescription_id`, d.`state_id`, d.`describe`, p.`prescription_name`, p.`area_name`")
                    ->count();
                $houseMap['d.`relation_id`'] = $drugtempInfo['relation_id'];
                $houseArr = db('drug_relation')->alias('d')
                    ->join(['jd_prescription'=>'p'], 'd.prescription_id = p.prescription_id' , 'inner')
                    ->join(['jd_drug_state'=>'ds'], 'd.state_id = ds.state_id' , 'inner')
                    ->where($houseMap)
                    ->field("d.`relation_id`, d.`prescription_id`, d.`state_id`, d.`describe`, p.`prescription_name`, p.`area_name`")
                    ->order("d.`sort` DESC")
                    ->find();
                if (!$houseArr) {
                    ajaxReturn(array('code'=>0,'info'=>'该药态该药房暂不可用~!','data'=>[]));
                }
                $drugtempInfo['state_house_name'] = $tempInfo['state_name'].'.'.$houseArr['area_name'].'-'.$houseArr['prescription_name'];
                $drugtempInfo['left_num'] = $houseAllArr - 1;

                ajaxReturn(array('code'=>1,'info'=>'ok~!','data'=>[$drugtempInfo]));
            }
        }
    }


    /**
     * @Title: addTemp
     * @Description: TODO 医生新增药方模板
     */
    public function addTemp() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['member_id']=='' || $data['temp_name'] == '' || $data['drug_str'] == '' || $data['instructions'] == '')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //对于当前医生模板名不能重复
            $tempMap['member_id'] = $data['member_id'];
            $tempMap['temp_name'] = str_replace(__ROOT__,'',$data['temp_name']);
            $tempCount = db('temp')->where($tempMap)->count();
            if ($tempCount > 0) {
                ajaxReturn(array('code'=>0,'info'=>'该名称的模板已存在!','data'=>[]));
            }

            $tempMap['relation_id'] = $data['relation_id'];
            $tempMap['state_id'] = $data['state_id'];
            $tempMap['dose'] = intval($data['dose']);
            $tempMap['type'] = 0;//0个人模板 1经典模板(管理员创建)
            $tempMap['drug_str'] = base64_decode($data['drug_str']);
            $tempMap['make'] = str_replace(__ROOT__,'',$data['make']);
            $tempMap['weight'] = str_replace(__ROOT__,'',$data['weight']);
            $tempMap['taking'] = str_replace(__ROOT__,'',$data['taking']);
            $tempMap['instructions'] = $data['instructions'];
            $tempMap['add_date'] = time();
            $tempMap['release_date'] = time();

//            $arr = array(array(17, '制川乌', 4, 'g'), array(315, '熟附片', 30, 'g'), array(485, '法半夏', 94, 'g'));
//            var_dump(base64_encode(json_encode($arr)));die;

            //计算价格
            $drugSumPrice = 0;//价格
            $lessCountArr = array();//超量
            $otherNameArr = array();//别名
            foreach (json_decode($tempMap['drug_str']) as $key => $val) {
                $drugDetailMap['Is_user'] = 1;
                $drugDetailMap['drug_id'] = $val[0];

                $list=db('drug')->where($drugDetailMap)->field("`drug_id`,`drug_name`,`Drug_unit`,`price`,`num`, `other_name`")->find();
                array_push($otherNameArr, $list['other_name']);
                if (!$list) {
                    ajaxReturn(array('code'=>0,'info'=>'药材['.$val[1].']在该药房已下架!','data'=>[]));
                }
                $list['total_price'] = $val[2]*$list['price'];
                $drugSumPrice += $list['total_price'];
                if ($val[2] > $list['num'] - config('lessCount') ) {
                    array_push($lessCountArr, $val[1]);
                }
            }
            $tempMap['price'] = $drugSumPrice;
            //计算库存
            if (count($lessCountArr) > 0) {
                ajaxReturn(array('code'=>0,'info'=>'药材['.implode(',', $lessCountArr).']在该药房库存不足!','data'=>[]));
            }
            //查询配药禁忌
            $tabooArr = array();
            foreach ($otherNameArr as $val) {
                $tabooArr2 = array();
                $temp['name'] = $val;
                $temp['type'] = 1;//可以防止反复添加
                $target = db('drug_record')->where($temp)->field("*")->find();
                if ($target) {
                    array_push($tabooArr2, $val);
                    $contrastTemp['key'] = $target['key'];
                    $contrastTemp['type'] = abs($target['type']-1);
                    $contrastList = db('drug_record')->where($contrastTemp)->field("*")->select();
                    foreach ($contrastList as $val2) {
                        if (in_array($val2['name'], $otherNameArr)) {
                            array_push($tabooArr2, $val2['name']);
                        }
                    }
                    array_push($tabooArr, $tabooArr2);
                }
            }
            if (count($tabooArr) > 0) {
                $tempMap['is_taboo'] = 1;
                $tempMap['taboo_content'] = json_encode($tabooArr);
            } else {
                $tempMap['is_taboo'] = 0;
                $tempMap['taboo_content'] = '';
            }

            $_identify = db('temp')->insert($tempMap);
            if ($_identify) {
                ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'系统繁忙!','data'=>[]));
            }
        }
    }

    /**
     * @Title: getTempDrugList
     * @Description: TODO 查看药材明细
     */
    public function getTempDrugList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
//            $arr = array(array(17, '制川乌', 4), array(315, '熟附片', 30), array(485, '法半夏', 94));
////            var_dump(base64_encode(json_encode($arr)));die;
//
//            $str = 'W1sxNywiXHU1MjM2XHU1ZGRkXHU0ZTRjIiw0XSxbMzE1LCJcdTcxOWZcdTk2NDRcdTcyNDciLDMwXSxbNDg1LCJcdTZjZDVcdTUzNGFcdTU5MGYiLDk0XV0=';

            if($data['drug_str'] == '')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $drugMap['drug_arr'] = json_decode(base64_decode($data['drug_str']), true);
            $drugMap['prescription_id'] = $data['prescription_id'];

            //查询药材详细信息
            $drugDetailArrSon = array();
            $drugSumPrice = 0;
            foreach ($drugMap['drug_arr'] as $key => $val) {
                $drugDetailMap['Is_user'] = 1;
                $drugDetailMap['drug_id'] = $val[0];

                $list=db('drug')->where($drugDetailMap)->field("`drug_id`,`drug_name`,`Drug_unit`,`price`,`num`, `other_name`")->find();
                $list['count'] = $val[2];
                $list['total_price'] = $val[2]*$list['price'];
                array_push($drugDetailArrSon, $list);
                $drugSumPrice += $list['total_price'];
            }
            $drugDetailArr['drugList'] = $drugDetailArrSon;
            $drugDetailArr['drugCount'] = count($drugDetailArrSon);
            $drugDetailArr['drugSumPrice'] = $drugSumPrice;

            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[base64_encode(json_encode($drugDetailArr))]));
        }
    }

    /**
     * @Title: editTemp
     * @Description: TODO 医生编辑药方模板
     */
    public function editTemp() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['temp_id']=='' || $data['member_id']=='' || $data['temp_name'] == '' || $data['drug_str'] == '' || $data['instructions'] == '')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //对于当前医生模板名不能重复
            $tempMap['member_id'] = $data['member_id'];
            $tempMap['temp_name'] = str_replace(__ROOT__,'',$data['temp_name']);
            $tempCount = db('temp')->where($tempMap)->count();
            if ($tempCount > 1) {
                ajaxReturn(array('code'=>0,'info'=>'该名称的模板已存在!','data'=>[]));
            }

            $updateMap['temp_id'] = $data['temp_id'];
            $updateMap['member_id'] = $data['member_id'];
            $tempCount = db('temp')->where($updateMap)->count();
            if ($tempCount == 0) {
                ajaxReturn(array('code'=>0,'info'=>'该模板已被删除!','data'=>[]));
            }

            $tempMap['relation_id'] = $data['relation_id'];
            $tempMap['state_id'] = $data['state_id'];
            $tempMap['dose'] = intval($data['dose']);
            $tempMap['type'] = 0;//0个人模板 1经典模板(管理员创建)
            $tempMap['drug_str'] = base64_decode($data['drug_str']);
            $tempMap['make'] = str_replace(__ROOT__,'',$data['make']);
            $tempMap['weight'] = str_replace(__ROOT__,'',$data['weight']);
            $tempMap['taking'] = str_replace(__ROOT__,'',$data['taking']);
            $tempMap['instructions'] = $data['instructions'];
            $tempMap['release_date'] = time();

//            $arr = array(array(17, '制川乌', 4, 'g'), array(315, '熟附片', 30, 'g'), array(485, '法半夏', 94, 'g'));
//            var_dump(base64_encode(json_encode($arr)));die;

            //计算价格
            $drugSumPrice = 0;//价格
            $lessCountArr = array();//超量
            $otherNameArr = array();//别名
            foreach (json_decode($tempMap['drug_str']) as $key => $val) {
                $drugDetailMap['Is_user'] = 1;
                $drugDetailMap['drug_id'] = $val[0];

                $list=db('drug')->where($drugDetailMap)->field("`drug_id`,`drug_name`,`Drug_unit`,`price`,`num`, `other_name`")->find();
                array_push($otherNameArr, $list['other_name']);
                if (!$list) {
                    ajaxReturn(array('code'=>0,'info'=>'药材['.$val[1].']在该药房已下架!','data'=>[]));
                }
                $list['total_price'] = $val[2]*$list['price'];
                $drugSumPrice += $list['total_price'];
                if ($val[2] > $list['num'] - config('lessCount') ) {
                    array_push($lessCountArr, $val[1]);
                }
            }
            $tempMap['price'] = $drugSumPrice;
            //计算库存
            if (count($lessCountArr) > 0) {
                ajaxReturn(array('code'=>0,'info'=>'药材['.implode(',', $lessCountArr).']在该药房库存不足!','data'=>[]));
            }
            //查询配药禁忌
            $tabooArr = array();
            foreach ($otherNameArr as $val) {
                $tabooArr2 = array();
                $temp['name'] = $val;
                $temp['type'] = 1;//可以防止反复添加
                $target = db('drug_record')->where($temp)->field("*")->find();
                if ($target) {
                    array_push($tabooArr2, $val);
                    $contrastTemp['key'] = $target['key'];
                    $contrastTemp['type'] = abs($target['type']-1);
                    $contrastList = db('drug_record')->where($contrastTemp)->field("*")->select();
                    foreach ($contrastList as $val2) {
                        if (in_array($val2['name'], $otherNameArr)) {
                            array_push($tabooArr2, $val2['name']);
                        }
                    }
                    array_push($tabooArr, $tabooArr2);
                }
            }
            if (count($tabooArr) > 0) {
                $tempMap['is_taboo'] = 1;
                $tempMap['taboo_content'] = json_encode($tabooArr);
            } else {
                $tempMap['is_taboo'] = 0;
                $tempMap['taboo_content'] = '';
            }

            $_identify = db('temp')->where($updateMap)->update($tempMap);
            if ($_identify) {
                ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'系统繁忙!','data'=>[]));
            }
        }
    }

    /**
     * @Title: getSelfTempList
     * @Description: TODO 医生查看自建药方模板列表/不分页
     */
    public function getSelfTempList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['member_id']=='' || $data['state_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //获取模板数组
            $map['member_id'] = $data['member_id'];
            $map['state_id'] = $data['state_id'];
            $stateArr = db('temp')->where($map)->field("`temp_id`,`temp_name`,`type`,`relation_id`,`drug_str`, `state_id`, `release_date`")->order("`release_date` DESC")->select();
            foreach ($stateArr as $key=>$val) {
                $stateArr[$key]['drug_str'] = base64_encode($val['drug_str']);
            }

            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>$stateArr));
        }
    }

    /**
     * @Title: getAllTempList
     * @Description: TODO 医生查看自建药方模板,传承方剂,经典方列表/不分页
     */
    public function getAllTempList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['member_id']=='' || $data['state_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //获取自建的非经典模板数组
            $map['member_id'] = $data['member_id'];
            $map['state_id'] = $data['state_id'];
            $map['type'] = 0;
            $stateArr = db('temp')->where($map)->field("`temp_id`,`temp_name`,`type`,`relation_id`,`drug_str`, `state_id`, `release_date`")->order("`release_date` DESC")->select();
            foreach ($stateArr as $key=>$val) {
                $stateArr[$key]['drug_str'] = base64_encode($val['drug_str']);
            }

            //获取经典模板数组
            $map1['state_id'] = $data['state_id'];
            $map1['type'] = 1;
            $classicArr = db('temp')->where($map1)->field("`temp_id`,`temp_name`,`type`,`relation_id`,`drug_str`, `state_id`, `release_date`")->order("`release_date` DESC")->select();
            foreach ($classicArr as $key=>$val) {
                $classicArr[$key]['drug_str'] = base64_encode($val['drug_str']);
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>array_merge($stateArr, $classicArr)));
        }
    }

}