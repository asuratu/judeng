<?php
namespace app\home\controller;
use think\Request;
use think\Db;
class Selfdrug extends Common
{

    /**
     * @Title: addSelfDrug
     * @Description: TODO 创建/修改调制服务包
     */
    public function addSelfDrug() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['self_goods_name']=='' || $data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            if ($data['self_goods_id'] > 0) {
                $goodsMap['self_goods_id'] = $data['self_goods_id'];
                $goodsInfo = db('self_goods')->where("self_goods_id = {$data['self_goods_id']} AND is_checked IN(2,3)")->field("*")->find();
                if (!$goodsInfo) {
                    ajaxReturn(array('code'=>0,'info'=>'该调制包不存在或不可修改!','data'=>[]));
                }
            }

            //查询当前医生信息
            $doctorMap['member_id'] = $data['member_id'];
            $doctorInfo = db('doctor')->where($doctorMap)->field("*")->find();

            //计算初诊和复诊的总价格
            $wenzhenPrice = $doctorInfo['first_price']*($data['on_line']/5)+$doctorInfo['consultation_price']*$data['referral'];

            //计算价格
            $drugSumPrice = 0;//价格
            $lessCountArr = array();//超量
            $otherNameArr = array();//别名
            $alertArr = array();//是否下架

            $data['prescription_id'] = 1;//默认从1药房发药
            if (count(json_decode(base64_decode($data['content']))) > 0) {
                foreach (json_decode(base64_decode($data['content'])) as $key => $val) {
                    $drugDetailMap['Is_user'] = 1;

                    //TODO 此处不能用drug_id来定位药材, 应该用药房id和药品统一名(别名)
                    $drugDetailMap['prescription_id'] = $data['prescription_id'];
                    $drugDetailMap['nick_name'] = $val[1];

                    $list=db('drug')->where($drugDetailMap)->field("`drug_id`,`nick_name`,`Drug_unit`,`price`,`num`, `other_name`")->find();
                    array_push($otherNameArr, $list['other_name']);
                    if (!$list) {
                        array_push($alertArr, $val[1]);
                    }
                    $list['total_price'] = $val[2]*$list['price'];
                    $drugSumPrice += $list['total_price'];
                    if ($val[2] > $list['num'] - config('lessCount') ) {
                        array_push($lessCountArr, $val[1]);
                    }
                }
            }


            if (count($alertArr) > 0) {
                ajaxReturn(array('code'=>0,'info'=>'药材['.implode(',', $alertArr).']在该药房已下架!','data'=>[]));
            }

            //单剂价格
            $orderPrescriptionInsert['one_price'] = $drugSumPrice;
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
                        $tempArr = $tabooArr2;
                        if (in_array($val2['name'], $otherNameArr)) {
                            array_push($tempArr, $val2['name']);
                            array_push($tabooArr, $tempArr);
                        }
                    }
                }
            }
            if (count($tabooArr) > 0 && count($tabooArr[0]) > 1) {
                $orderPrescriptionInsert['is_taboo'] = 1;
                $orderPrescriptionInsert['taboo_content'] = json_encode($tabooArr);
            } else {
                $orderPrescriptionInsert['is_taboo'] = 0;
                $orderPrescriptionInsert['taboo_content'] = '';
            }

            //数据插入
            $orderPrescriptionInsert['content'] = base64_decode($data['content']);
            $orderPrescriptionInsert['inherit_drug'] = $data['inherit_drug'] ? base64_decode($data['inherit_drug']) : '';
            $orderPrescriptionInsert['self_goods_name'] = $data['self_goods_name'];
            $orderPrescriptionInsert['member_id'] = $data['member_id'];
            $orderPrescriptionInsert['self_goods_sn'] = '' . date('Ymd') . mt_rand(100000,999999);
            $orderPrescriptionInsert['special_id'] = $data['special_id'];
            $orderPrescriptionInsert['inherit_id'] = $data['inherit_id'];
            $orderPrescriptionInsert['on_line'] = $data['on_line'];
            $orderPrescriptionInsert['referral'] = $data['referral'];
//            $orderPrescriptionInsert['love'] = $data['love'];
            $orderPrescriptionInsert['add_date'] = time();
            $orderPrescriptionInsert['release_date'] = time();
            $orderPrescriptionInsert['is_checked'] = 1;
            $orderPrescriptionInsert['end_date'] = time()+31536000;

            $data['service_price'] = 0;
//            var_dump($data['service_price']);die;
//            var_dump($data['service_price']);
//            var_dump($data['see_price']);
//            var_dump($wenzhenPrice);
//            var_dump($orderPrescriptionInsert['one_price']*$data['dose']);
            //计算总价
            $orderPrescriptionInsert['price'] = $orderPrescriptionInsert['one_price']*$data['dose'] + $data['service_price']+$data['see_price']+$wenzhenPrice;
//            var_dump($orderPrescriptionInsert['price']);die;

            $orderPrescriptionInsert['scope'] = $data['scope'];
            $orderPrescriptionInsert['advantage'] = $data['advantage'];
            $orderPrescriptionInsert['description'] = $data['description'];
            $orderPrescriptionInsert['precautions'] = $data['precautions'];
            $orderPrescriptionInsert['service_price'] = $data['service_price'];
            $orderPrescriptionInsert['see_price'] = $data['see_price'];
            $orderPrescriptionInsert['prescription_status'] = $data['prescription_status'];
            $orderPrescriptionInsert['dose'] = $data['dose'];
            $orderPrescriptionInsert['taking'] = $data['taking'];
            $orderPrescriptionInsert['inherit_drug'] = $data['inherit_drug'];

            if ($data['self_goods_id'] > 0) {
                $_identity = db('self_goods')->where("self_goods_id = {$data['self_goods_id']}")->update($orderPrescriptionInsert);
            } else {
                $_identity = db('self_goods')->insertGetId($orderPrescriptionInsert);
            }
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
        }
    }

    /**
     * @Title: getInheritAndDrug
     * @Description: TODO 获取传承方剂联动列表
     */
    public function getInheritAndDrug() {
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

            $existDetail = db('inherit_doctor')->alias('id')
                ->join(['jd_inherit'=>'i'], 'id.inherit_id = i.inherit_id' , 'inner')
                ->where("(id.member_id = {$data['member_id']}) AND id.is_checked = 1")
                ->field("id.inherit_id, i.inherit_name")
                ->order('id.add_date DESC')
                ->select();
            //查询特色方剂
            foreach ($existDetail as $key => $val) {
                $existDetail[$key]['drugList']= db('special')->where("is_display = 1 AND inherit_id = {$val['inherit_id']}")
                    ->field("special_name, special_id, content")
                    ->order('sort DESC')
                    ->select();
                foreach ($existDetail[$key]['drugList'] as $key1=>$val1) {
                    $existDetail[$key]['drugList'][$key1]['content'] = base64_encode($val1['content']);
                }
            }
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$existDetail));
        }
    }


    /**
     * @Title: getSelfGoodsDetail
     * @Description: TODO 查看调制服务包详情
     */
    public function getSelfGoodsDetail() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['self_goods_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //查询服务包详细信息
            $goodsInfo = db('self_goods')
                ->alias('sg')
                ->join(['jd_doctor'=>'d'], 'd.member_id = sg.member_id' , 'inner')
                ->where("sg.self_goods_id = {$data['self_goods_id']}")
                ->field("sg.*, d.true_name, d.title_str")
                ->find();


            //是否显示方剂标识
            if ($goodsInfo['content'] != '') {
                $goodsInfo['content'] = base64_encode($goodsInfo['content']);
                $goodsInfo['has_self_drug'] = 1;
            } else {
                $goodsInfo['has_self_drug'] = 0;
            }

            //是否显示传承标识
            if ($goodsInfo['special_id'] &&  $goodsInfo['inherit_id']) {
                $goodsInfo['has_inherit'] = 1;
            } else {
                $goodsInfo['has_inherit'] = 0;
            }
            ajaxReturn(array('code'=>1,'info'=>'ok!','data'=>[$goodsInfo]));
        }
    }


    /**
     * @Title: getSelfGoodsList
     * @Description: TODO 查看调制服务包列表(分页)
     */
    public function getSelfGoodsList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['member_id']=='' || $data['type']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $data['page'] = $data['page'] ? intval($data['page']) : 1;
            $data['pageSize'] = $data['pageSize'] ? intval($data['pageSize']) : 5;
            $start = ($data['page']-1)*$data['pageSize'];

            switch ($data['type']) {
                case 0://审核通过
                    $data['is_checked'] = 2;
                    break;
                case 1://审核中
                    $data['is_checked'] = 1;
                    break;
                default://未通过
                    $data['is_checked'] = 3;
                    break;
            }

            //查询服务包详细信息
            $goodsInfo = db('self_goods')
                ->alias('sg')
                ->join(['jd_doctor'=>'d'], 'd.member_id = sg.member_id' , 'inner')
                ->join(['jd_special'=>'s'], 's.special_id = sg.special_id' , 'left')
                ->where("sg.member_id = {$data['member_id']} AND sg.is_checked = {$data['is_checked']}")
                ->field("sg.special_id, sg.content, sg.inherit_id, sg.self_goods_id, sg.self_goods_name, sg.to_top, sg.advantage, sg.add_date, sg.price, sg.scope, s.special_name, d.true_name, d.title_str")
                ->limit($start,$data['pageSize'])
                ->order("sg.add_date DESC")
                ->select();

            foreach ($goodsInfo as $key => $val) {
                //是否显示方剂标识
                if ($goodsInfo[$key]['content'] != '') {
                    $goodsInfo[$key]['has_self_drug'] = 1;
                } else {
                    $goodsInfo[$key]['has_self_drug'] = 0;
                }
                //处理null
                if ($goodsInfo[$key]['special_name'] == null) {
                    $goodsInfo[$key]['special_name'] = '';
                }


                //是否显示传承标识
                if ($goodsInfo[$key]['special_id'] &&  $goodsInfo[$key]['inherit_id']) {
                    $goodsInfo[$key]['has_inherit'] = 1;
                } else {
                    $goodsInfo[$key]['has_inherit'] = 0;
                }
            }


            ajaxReturn(array('code'=>1,'info'=>'ok!','data'=>$goodsInfo));
        }
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



}