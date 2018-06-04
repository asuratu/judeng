<?php
namespace app\home\controller;
use think\Request;
use think\Db;
class Order extends Common
{

    /**
     * @Title: getTempDetail
     * @Description: TODO 进入在线开方
     */
    public function toOnlineorder() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['doctor_id']=='' || $data['patient_id']=='' || $data['area_id']=='' || $data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }


            //查询医生的上次开方的药房药态
            $lastMap['o.`doctor_id`'] = $data['doctor_id'];
            $lastMap['o.`order_type`'] = 3;
            $lastOrder = db('order_prescription')->alias('op')
                ->join(['jd_order'=>'o'], 'o.order_id = op.order_id' , 'inner')
                ->where($lastMap)
                ->field("op.`relation_id`, op.`state_id`")
                ->order("op.`add_date` DESC")
                ->find();
            //处理药房药态信息
            if ($lastOrder) {
                //存在历史方, 则使用最新历史方的药房药态
                $houseMap['d.`is_display`'] = 1;
                $houseMap['p.`area_id`'] = $data['area_id'];
                $houseMap['p.`is_display`'] = 1;
                //该药态该地区药房数量
                $houseMap['d.`state_id`'] = $lastOrder['state_id'];
                $leftNum = db('drug_relation')->alias('d')
                    ->join(['jd_prescription'=>'p'], 'd.prescription_id = p.prescription_id' , 'inner')
                    ->where($houseMap)
                    ->field("d.`relation_id`")
                    ->count();
                $houseMap['d.`relation_id`'] = $lastOrder['relation_id'];
                $houseAllArr = db('drug_relation')->alias('d')
                    ->join(['jd_prescription'=>'p'], 'd.prescription_id = p.prescription_id' , 'inner')
                    ->join(['jd_drug_state'=>'ds'], 'd.state_id = ds.state_id' , 'inner')
                    ->where($houseMap)
                    ->field("d.`relation_id`, d.`prescription_id`, d.`state_id`, d.`describe`, p.`prescription_name`, p.`prescription_id`, p.`area_name`, ds.`state_name`, ds.`make`, ds.`taking`, ds.`instructions`, ds.`weight`, ds.`pic`")
                    ->order('d.`relation_id` DESC')
                    ->find();
            } else {
                //没有历史开方
                $houseMap['d.`is_display`'] = 1;
                $houseMap['p.`area_id`'] = $data['area_id'];
                $houseMap['p.`is_display`'] = 1;
                //默认第一个药房药态
                $houseAllArr = db('drug_relation')->alias('d')
                    ->join(['jd_prescription'=>'p'], 'd.prescription_id = p.prescription_id' , 'inner')
                    ->join(['jd_drug_state'=>'ds'], 'd.state_id = ds.state_id' , 'inner')
                    ->where($houseMap)
                    ->field("d.`relation_id`, d.`prescription_id`, d.`state_id`, d.`describe`, p.`prescription_name`, p.`prescription_id`, p.`area_name`, ds.`state_name`, ds.`make`, ds.`taking`, ds.`instructions`, ds.`weight`, ds.`pic`")
                    ->order('d.`relation_id` DESC')
                    ->find();
                $houseMap['d.`state_id`'] = $houseAllArr['state_id'];
                //该药态该地区药房数量
                $leftNum = db('drug_relation')->alias('d')
                    ->join(['jd_prescription'=>'p'], 'd.prescription_id = p.prescription_id' , 'inner')
                    ->where($houseMap)
                    ->field("d.`relation_id`")
                    ->count();
            }
            $houseAllArr['pic'] = config('url') . $houseAllArr['pic'];

            $mainInfo['state_id'] = $houseAllArr['state_id'];
            $mainInfo['prescription_id'] = $houseAllArr['prescription_id'];
            $mainInfo['area_id'] = $data['area_id'];
            $mainInfo['relation_id'] = $houseAllArr['relation_id'];
            $mainInfo['make'] = $houseAllArr['make'];
            $mainInfo['taking'] = $houseAllArr['taking'];
            $mainInfo['weight'] = $houseAllArr['weight'];
            $mainInfo['instructions'] = $houseAllArr['instructions'];
            $mainInfo['pic'] = $houseAllArr['pic'];
            $mainInfo['state_house_name'] = $houseAllArr['state_name'].'.'.$houseAllArr['area_name'].'-'.$houseAllArr['prescription_name'];
            $mainInfo['left_num'] = $leftNum-1;


            if ($data['patient_id']==0) {
                //手机号开方, 新建时创建患者信息
                //查询该手机号是否已经注册患者, 拉取信息
                $mobPatientInfo = db('member')
                    ->where("mobile = {$data['mobile']}")
                    ->field("*")
                    ->find();

                if (empty($mobPatientInfo)) {
                    $mainInfo['patient_id'] = 0;
                    $mainInfo['patient_name'] = '';
                    $mainInfo['mobile'] = '';
                    $mainInfo['sex'] = 0;
                    $mainInfo['age'] = 0;
                } else {
                    $mainInfo['patient_id'] = $mobPatientInfo['member_id'];
                    $mainInfo['patient_name'] = $mobPatientInfo['member_name'];
                    $mainInfo['mobile'] = $data['mobile'];
                    $mainInfo['sex'] = $mobPatientInfo['sex'];
                    $mainInfo['age'] = $mobPatientInfo['age'];
                }
            } else {
                //在线开方, 先查询患者信息
                $patientMap['member_id'] = $data['patient_id'];
                $patientInfo = db('member')
                    ->where($patientMap)
                    ->field("*")
                    ->find();
                $mainInfo['patient_id'] = $patientInfo['member_id'];
                $mainInfo['patient_name'] = $patientInfo['member_name'];
                $mainInfo['mobile'] = $patientInfo['mobile'];
                $mainInfo['sex'] = $patientInfo['sex'];
                //计算年龄
//                $mainInfo['age'] = getAge($patientInfo['birthday']);
                $mainInfo['age'] = $patientInfo['age'] ?: 0;
            }
            ajaxReturn(array('code'=>1,'info'=>'ok~!','data'=>[$mainInfo]));
        }
    }

    /**
     * @Title: addPrescriptionOrder
     * @Description: TODO 提交在线开方/手机号开方 (注: 插入医患记录未完成)
     * @return bool
     * @author TUGE
     * @date
     */
    public function addPrescriptionOrder() {
        if($this->request->isPost())
        {
            try{
                Db::startTrans();
                $data=input('post.');
                $res=checkSign($data);
                if($res['code']==0)
                {
                    ajaxReturn($res);
                }

                if($data['doctor_id']=='' || $data['patient_id']=='' || $data['type']=='' || $data['prescription_id']=='')
                {
                    Db::rollback();
                    ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
                }



                //查询当前医生信息
                $doctorMap['member_id'] = $data['doctor_id'];
                $doctorInfo = db('doctor')->where($doctorMap)->field("`member_name`")->find();
                //查询患者信息
                $mobileMap['mobile'] = $data['mobile'];
                $patientInfo = db('member')->where($mobileMap)->field("*")->find();

                //只有在线开方能计算价格
                if ($data['type'] == 0) {
                    if (json_decode(base64_decode($data['drug_str'])) == null) {
                        Db::rollback();
                        ajaxReturn(array('code'=>0,'info'=>'药品参数不符合规范!','data'=>[]));
                    }
                    //计算价格
                    $drugSumPrice = 0;//价格
                    $lessCountArr = array();//超量
                    $otherNameArr = array();//别名
                    $alertArr = array();//是否下架
                    foreach (json_decode(base64_decode($data['drug_str'])) as $key => $val) {
                        $drugDetailMap['Is_user'] = 1;

                        //TODO 此处不能用drug_id来定位药材, 应该用药房id和药品统一名(别名)
                        $drugDetailMap['prescription_id'] = $data['prescription_id'];
                        $drugDetailMap['nick_name'] = $val[1];

                        $list=db('drug')->where($drugDetailMap)->field("`drug_id`,`nick_name`,`Drug_unit`,`price`,`num`, `other_name`")->find();
                        array_push($otherNameArr, $list['other_name']);
                        if (!$list) {
                            array_push($alertArr, $val[1]);
                        } else {
                            //药材扣减库存
                            $_drugUpdate['num'] = $list['num'] - $val[2];
                            $_drugUpdate['release_date'] = time();
                            db('drug')->where($drugDetailMap)->update($_drugUpdate);
                        }
                        $list['total_price'] = $val[2]*$list['price'];
                        $drugSumPrice += $list['total_price'];
                        if ($val[2] > $list['num'] - config('lessCount') ) {
                            array_push($lessCountArr, $val[1]);
                        }

                    }

                    if (count($alertArr) > 0) {
                        Db::rollback();
                        ajaxReturn(array('code'=>0,'info'=>'药材['.implode(',', $alertArr).']在该药房已下架!','data'=>[]));
                    }

                    $orderPrescriptionInsert['price'] = $drugSumPrice;
                    //计算库存
                    if (count($lessCountArr) > 0) {
                        Db::rollback();
                        ajaxReturn(array('code'=>0,'info'=>'药材['.implode(',', $lessCountArr).']在该药房库存不足!','data'=>[]));
                    }
                    //查询配药禁忌
                    $tabooArr = array();
                    foreach ($otherNameArr as $val) {
                        $tabooArr2 = array();
                        $temp['name'] = $val;
                        $temp['type'] = 1;//可以防止反复添
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


                    $orderPrescriptionInsert['prescription_src'] = '';
                } else{
                    //拍照开方
                    $orderPrescriptionInsert['is_taboo'] = 0;
                    $orderPrescriptionInsert['price'] = 0;
                    $orderPrescriptionInsert['taboo_content'] = '';

                    //保存图片数据流 - OSS
                    if ($_FILES) {
                        $upOss = json_decode(Model('Oss')->upPic('uploads/prescription'), true);
                        $orderPrescriptionInsert['prescription_src'] = $upOss['prescription_src'];
                    }
                }

                if ($data['patient_id'] == 0 && $data['type'] == 0) {
                    //手机号开方
                    //手机号匹配患者
                    //若未注册则注册新的患者账号
                    if (!$patientInfo) {
                        $patientInsert['member_name'] = $data['patient_name'] ?: '';
                        $patientInsert['mobile'] = $data['mobile'] ?: '';
                        $patientInsert['sex'] = $data['sex'] ?: 0;
                        $patientInsert['reg_date'] = time();
                        $patientInsert['release_date'] = time();
                        $patientInsert['is_type'] = 1;
                        $patientInsert['guid']=randCode(8,2);
                        $patientInsert['password']=md5(md5(substr($patientInsert['mobile'],-6)).$data['guid']);
                        /**
                         * 此处根据年龄计算生日会不准确
                         */
//                        $patientInsert['birthday'] = date('Y')-$data['age'];
//                        $patientInsert['birthday'] .= '-00-00';
                        $patientInsert['age'] = ($data['age'] ?: '');
                        $data['patient_id'] = db('member')->insertGetId($patientInsert);
                    } else {
                        $data['patient_id'] = $patientInfo['member_id'];
                    }
                }
                //生成新订单
                $newOrder['order_sn'] = createOrderCode();
                if ($data['type'] == 0) {
                    $newOrder['order_status'] = 0;//待支付
                } else {
                    $newOrder['order_status'] = 8;//药方审核后生效
                }
                $newOrder['order_type'] = 3;
                $newOrder['doctor_id'] = $data['doctor_id'];
                $newOrder['patient_id'] = $data['patient_id'];
                $newOrder['product_amount'] = 0;
                $newOrder['product_number'] = 1;
                $newOrder['pay_amount'] = 0;
                $newOrder['see_date'] = time();
                $newOrder['order_date'] = time();
                $newOrder['end_date'] = time()+86400;//过期时间,超过24小时过期
                $orderPrescriptionInsert['order_id'] = db('order')->insertGetId($newOrder);


                $orderPrescriptionInsert['patient_name'] = $data['patient_name'] ?: '';
                $orderPrescriptionInsert['patient_mobile'] = $data['mobile'] ?: '';
                $orderPrescriptionInsert['patient_sex'] = $data['sex'] ?: 0;
                $orderPrescriptionInsert['patient_age'] = $data['age'] ?: '';
                $orderPrescriptionInsert['dialectical'] = $data['dialectical'] ?: '';
                $orderPrescriptionInsert['prescription_status'] = $data['prescription_status'];
                $orderPrescriptionInsert['drug_str'] = $data['drug_str'] ? base64_decode($data['drug_str']) : '';
                $orderPrescriptionInsert['dose'] = $data['dose'] ?: 0;
                $orderPrescriptionInsert['state_id'] = $data['state_id'] ?: 0;
                $orderPrescriptionInsert['relation_id'] = $data['relation_id'] ?: 0;
                $orderPrescriptionInsert['make'] = $data['make'] ?: '';
                $orderPrescriptionInsert['weight'] = $data['weight'] ?: '';
                $orderPrescriptionInsert['taking'] = $data['taking'] ?: '';
                $orderPrescriptionInsert['instructions'] = $data['instructions'] ?: '';
                $orderPrescriptionInsert['service_price'] = $data['service_price'] ?: 0;
                $orderPrescriptionInsert['see_price'] = $data['see_price'] ?: 0;
                if ($data['type'] == 0) {
                    $orderPrescriptionInsert['total_price'] = $orderPrescriptionInsert['see_price']+$orderPrescriptionInsert['service_price']+$orderPrescriptionInsert['price']*$orderPrescriptionInsert['dose'];
                    //在线开方则会更新订单价格
                    $updateOrderTemp['product_amount'] = $orderPrescriptionInsert['price'];
                    $updateOrderTemp['product_number'] = $orderPrescriptionInsert['dose'];
                    $updateOrderTemp['pay_amount'] = $orderPrescriptionInsert['total_price'];
                    $updateOrderMap['order_id'] = $orderPrescriptionInsert['order_id'];
                   $updateOrderPrice = db('order')->where($updateOrderMap)->update($updateOrderTemp);
                   //推送消息模板到服务号,提醒支付

                    $sendHair = array();
//                    var_dump($doctorInfo);die;
                    $sendHair['doctor_name'] = $doctorInfo['member_name'];
                    $sendHair['hospital'] = '小橘灯中医';
                    $sendHair['member_name'] = $orderPrescriptionInsert['patient_name'];
                    $sendHair['prescription'] = $data['type'] == 1 ? '手机号开方':'在线开方';
                    $sendHair['remark'] = '点击这里查看订单详情';
//                    $sendHair['url'] = 'http://wechat.bohetanglao.com/home/center/detail/ordersn/20180513983599.html';
                    $sendHair['url'] = 'http://wechat.bohetanglao.com/home/center/detail/ordersn/'.$newOrder['order_sn'].'.html';
                    $sendHair['first'] = '来自' . $sendHair['doctor_name'] . '医生的开方订单';
                    $sendHair['openid'] = $patientInfo['openid'];

                    Model('Weixin')->messageTemplate(6, $sendHair);
                } else {
                    $orderPrescriptionInsert['total_price'] = 0;
                    $updateOrderPrice = 1;
                }

                $orderPrescriptionInsert['add_date'] = time();
                $orderPrescriptionInsert['is_checked'] = 1;


                //生成该订单对应的药方信息
                if ($data['type'] == 0) {
                    //在线开方
                    //新增一条医生与患者的关联记录
                    // 第一个参数用户ID， 第二个参数医生ID， 第三个是具体服务类型名称
                    Model('Number')->doctorMember($data['patient_id'], $data['doctor_id'], '在线开方');

                    $orderPrescriptionInsert['prescription_type'] = 0;
                    //是否同时作为模板
                    if ($data['to_temp'] == 1) {
                        //判断是否重名
                        $tempMap['member_id'] = $data['doctor_id'];
                        $tempMap['temp_name'] = str_replace(__ROOT__,'',$data['temp_name']);
                        $tempCount = db('temp')->where($tempMap)->count();
                        if ($tempCount > 0) {
                            Db::rollback();
                            ajaxReturn(array('code'=>0,'info'=>'您已创建过该名称的模板!','data'=>[]));
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
                        $tempMap['price'] = $orderPrescriptionInsert['price'];
                        $tempMap['is_taboo'] = $orderPrescriptionInsert['is_taboo'];
                        $tempMap['taboo_content'] = $orderPrescriptionInsert['taboo_content'];
                        $_identify = db('temp')->insert($tempMap);
                    } else {
                        $_identify = 1;
                    }
                } elseif ($data['type'] == 1) {
                    //拍照开方
                    //新增一条医生与患者的关联记录
                    $orderPrescriptionInsert['prescription_type'] = 1;
                    $_identify = 1;
                } else {
                    Db::rollback();
                    ajaxReturn(array('code'=>0,'info'=>'开方类型不正确!','data'=>[]));
                }
                $_identityPrescription = db('order_prescription')->insert($orderPrescriptionInsert);

                if ($_identityPrescription && $orderPrescriptionInsert['order_id'] && $updateOrderPrice && $_identify) {
                    Db::commit();
                    ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[['order_id'=>$orderPrescriptionInsert['order_id'], 'type'=>$data['type']]]));
                } else {
                    Db::rollback();
                    ajaxReturn(array('code'=>0, 'info'=>'系统繁忙, 稍后再试!','data'=>[]));
                }
            } catch (Exception $e) {
                Db::rollback();
                return false;
            }


        }
    }

    /**
     * @Title: checkDrugNum
     * @Description: TODO 实时核实库存接口
     * @return bool
     * @author TUGE
     * @date
     */
    public function checkDrugNum() {
//        var_dump(json_decode(base64_decode('WyJcdTVkZGRcdTRlNGMiLCJcdTVkZGRcdTRlNGMiLCJcdTk2NDRcdTViNTAiLCJcdTUzNGFcdTU5MGYiXQ==')));die;

//        $arr = array(array(383, '芒硝', 2, 'g'),array(117, '三棱', 2, '袋'),array(496, '桂枝', 2, '袋'));
//        'W1szODMsIlx1ODI5Mlx1Nzg1ZCIsMiwiZyJdLFsxMTcsIlx1NGUwOVx1NjhmMSIsMiwiXHU4ODhiIl0sWzQ5NiwiXHU2ODQyXHU2NzlkIiwyLCJcdTg4OGIiXV0=';
//        var_dump(base64_encode(json_encode($arr)));die;
        if($this->request->isPost())
        {
            try{
                Db::startTrans();
                $data=input('post.');
                $res=checkSign($data);
                if($res['code']==0)
                {
                    ajaxReturn($res);
                }

                if($data['drug_str']=='' || $data['prescription_id']=='')
                {
                    ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
                }

                //只有在线开方能计算价格
                    //计算价格
                    $drugSumPrice = 0;//价格
                    $lessCountArr = array();//超量
                    $otherNameArr = array();//别名
                    $alertArr = array();//是否下架
//                    var_dump(json_decode(base64_decode($data['drug_str'])));die;
                    foreach (json_decode(base64_decode($data['drug_str'])) as $key => $val) {
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

//                $otherNameArr = array('芒硝', '三棱', '桂枝');
//                $otherNameArr = array('川乌', '附子', '半夏');
                    //查询配药禁忌
                    $tabooArr = array();
                    foreach ($otherNameArr as $val) {
                        $tabooArr2 = array();
                        $temp['name'] = $val;
                        $temp['type'] = 1;//可以防止反复添
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
                        $orderPrescriptionInsert['taboo_content'] = ($tabooArr);
                    } else {
                        $orderPrescriptionInsert['is_taboo'] = 0;
                        $orderPrescriptionInsert['taboo_content'] = '';
                    }

                Db::commit();
                ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[['is_taboo'=>$orderPrescriptionInsert['is_taboo'], 'taboo_content'=>$orderPrescriptionInsert['taboo_content'], 'lessCountArr'=>$lessCountArr, 'alertArr'=>$alertArr, 'price'=>$drugSumPrice]]));

            } catch (Exception $e) {
                Db::rollback();
                return false;
            }

        }
    }

    /**
     * @Title: addWenZhen
     * @Description: TODO 患者发起图文问诊或复诊
     * @return bool
     * @author TUGE
     * @date
     */
    public function addWenZhen() {
        if($this->request->isPost())
        {
            try{
                Db::startTrans();
                $data=input('post.');
                $res=checkSign($data);
                if($res['code']==0)
                {
                    ajaxReturn($res);
                }

                if($data['type']=='' || $data['order_id']=='' || $data['patient_id']=='' || $data['doctor_id']=='')
                {
                    ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
                }

                //查询订单信息
                $orderDetail = db('order')
                    ->where("order_id = {$data['order_id']} AND pay_status = 1 AND order_status = 1 AND patient_id = {$data['patient_id']}")
                    ->field("*")
                    ->find();
                if (!$orderDetail) {
                    ajaxReturn(array('code'=>0,'info'=>'请先购买图文问诊或复诊!','data'=>[]));
                }

                switch ($orderDetail['order_type']) {
                    case 0:
                        //图文问诊(24小时失效)
                        $tuwen = db('wenzhen')
                            ->where("order_id = {$data['order_id']} AND patient_id = {$data['patient_id']}")
                            ->field("*")
                            ->find();
                        if ($tuwen) {
                            if ($tuwen['end_time'] < time()) {
                                //定时任务改变图文问诊状态
                                ajaxReturn(array('code'=>0,'info'=>'本次图文问诊已结束!','data'=>[]));
                            }
                        } else {
                            //新增记录
                            $insertData['type'] = 0;
                            $insertData['order_id'] = $data['order_id'];
                            $insertData['start_time'] = time();
                            $insertData['end_time'] = $insertData['start_time'] + 86400;
                            $insertData['add_date'] = $insertData['start_time'];
                            $insertData['release_date'] = $insertData['start_time'];
                            $insertData['patient_id'] = $data['patient_id'];
                            $insertData['doctor_id'] = $data['doctor_id'];


                        }

                        break;
                    case 1:

                        break;
                    case 4:

                        break;
                    default:
                        ajaxReturn(array('code'=>0,'info'=>'订单类型不正确!','data'=>[]));
                        break;
                }



                var_dump($orderDetail);die;

                //判断是不是服务包id
                if (1) {

                } elseif ("不是调制服务包") {

                }

                Db::commit();
                ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[]));
            } catch (Exception $e) {
                Db::rollback();
                return false;
            }

        }
    }







}