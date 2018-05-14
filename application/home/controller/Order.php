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
            if($data['doctor_id']=='' || $data['patient_id']=='' || $data['area_id']=='')
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
                    ->field("d.`relation_id`, d.`prescription_id`, d.`state_id`, d.`describe`, p.`prescription_name`, p.`area_name`, ds.`state_name`, ds.`make`, ds.`taking`, ds.`instructions`, ds.`weight`, ds.`pic`")
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
                    ->field("d.`relation_id`, d.`prescription_id`, d.`state_id`, d.`describe`, p.`prescription_name`, p.`area_name`, ds.`state_name`, ds.`make`, ds.`taking`, ds.`instructions`, ds.`weight`, ds.`pic`")
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
                $mainInfo['patient_id'] = 0;
                $mainInfo['patient_name'] = '';
                $mainInfo['mobile'] = '';
                $mainInfo['sex'] = 0;
                $mainInfo['age'] = 0;
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
                $mainInfo['age'] = getAge($patientInfo['birthday']);
            }
            ajaxReturn(array('code'=>1,'info'=>'ok~!','data'=>[$mainInfo]));
        }
    }

    /**
     * @Title: addPrescriptionOrder
     * @Description: TODO 提交在线开方/手机号开方
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

                if($data['doctor_id']=='' || $data['patient_id']=='' || $data['type']=='')
                {
                    ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
                }

                //只有在线开方能计算价格
                if ($data['type'] == 0) {
                    //计算价格
                    $drugSumPrice = 0;//价格
                    $lessCountArr = array();//超量
                    $otherNameArr = array();//别名
                    foreach (json_decode(base64_decode($data['drug_str'])) as $key => $val) {
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
                    $orderPrescriptionInsert['price'] = $drugSumPrice;
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
                    //保存图片数据流
                    foreach ($_FILES as $key => $val) {
                        $file = request()->file($key);
                        $path = ROOT_PATH . 'uploads/prescription/';
                        $result = $file->move($path);
                        $orderPrescriptionInsert[$key] = '/uploads/prescription/' . $result->getSaveName();
                    }
                }



                if ($data['patient_id'] == 0) {
                    //手机号开方
                    //手机号匹配患者
                    $mobileMap['mobile'] = $data['mobile'];
                    $patientInfo = db('member')->where($mobileMap)->field("*")->find();
                    //若未注册则注册新的患者账号
                    if (!$patientInfo) {
                        $patientInsert['member_name'] = $data['patient_name'];
                        $patientInsert['mobile'] = $data['mobile'];
                        $patientInsert['sex'] = $data['sex'];
                        $patientInsert['reg_date'] = time();
                        $patientInsert['release_date'] = time();
                        $patientInsert['is_type'] = 1;
                        $patientInsert['guid']=randCode(8,2);
                        $patientInsert['password']=md5(md5(substr($patientInsert['mobile'],-6)).$data['guid']);
                        /**
                         * 此处根据年龄计算生日会不准确
                         */
                        $patientInsert['birthday'] = date('Y')-$data['age'];
                        $patientInsert['birthday'] .= '-00-00';
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


                $orderPrescriptionInsert['patient_name'] = $data['patient_name'];
                $orderPrescriptionInsert['patient_mobile'] = $data['mobile'];
                $orderPrescriptionInsert['patient_sex'] = $data['sex'];
                $orderPrescriptionInsert['patient_age'] = $data['age'];
                $orderPrescriptionInsert['dialectical'] = $data['dialectical'];
                $orderPrescriptionInsert['prescription_status'] = $data['prescription_status'];
                $orderPrescriptionInsert['drug_str'] = base64_decode($data['drug_str']);
                $orderPrescriptionInsert['dose'] = $data['dose'];
                $orderPrescriptionInsert['state_id'] = $data['state_id'];
                $orderPrescriptionInsert['relation_id'] = $data['relation_id'];
                $orderPrescriptionInsert['make'] = $data['make'];
                $orderPrescriptionInsert['weight'] = $data['weight'];
                $orderPrescriptionInsert['taking'] = $data['taking'];
                $orderPrescriptionInsert['instructions'] = $data['instructions'];
                $orderPrescriptionInsert['service_price'] = $data['service_price'];
                $orderPrescriptionInsert['see_price'] = $data['see_price'];
                if ($data['type'] == 0) {
                    $orderPrescriptionInsert['total_price'] = $orderPrescriptionInsert['see_price']+$orderPrescriptionInsert['service_price']+$orderPrescriptionInsert['price']*$orderPrescriptionInsert['dose'];
                    //在线开方则会更新订单价格
                    $updateOrderTemp['product_amount'] = $orderPrescriptionInsert['total_price'];
                    $updateOrderTemp['pay_amount'] = $orderPrescriptionInsert['total_price'];
                    $updateOrderMap['order_id'] = $orderPrescriptionInsert['order_id'];
                   $updateOrderPrice = db('order')->where($updateOrderMap)->update($updateOrderTemp);
                } else {
                    $orderPrescriptionInsert['total_price'] = 0;
                    $updateOrderPrice = 1;
                }

                $orderPrescriptionInsert['add_date'] = time();
                $orderPrescriptionInsert['is_checked'] = 1;


                //生成该订单对应的药方信息
                if ($data['type'] == 0) {
                    //在线开方
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
                    $orderPrescriptionInsert['prescription_type'] = 1;
                } else {
                    ajaxReturn(array('code'=>0,'info'=>'开方类型不正确!','data'=>[]));
                }

                $_identityPrescription = db('order_prescription')->insertGetId($orderPrescriptionInsert);

                if ($_identityPrescription && $orderPrescriptionInsert['order_id'] && $updateOrderPrice && $_identify) {
                    Db::commit();
                    ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[]));
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

}