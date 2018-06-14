<?php
namespace app\home\controller;
use think\Request;
class His extends Common
{

    /**
     * @Title: updateDrugList
     * @Description: TODO 同步His药品库(注: 每天凌晨1点更新)
     */
    public function updateDrugList() {
        set_time_limit (0);
        //东院
//        $url = 'http://192.168.20.31/tktservice/tkt_service.asmx/TKT_YP_Z_SELECT_ALL';
        //西院
        $url = 'http://27.115.75.166:19982/webwest/tkt_service.asmx/TKT_YP_Z_SELECT_ALL';
        $_info = curlGet($url);
        $xml=new \SimpleXMLElement($_info);
        $array = json_decode(json_encode($xml),true);

        $listArr = array();
        foreach ($array['string'] as $key => $val) {
            $listArr[intval($key/13)][] = $val;
        }

//        $data=db('drug')->group('his_drug_id')->Distinct(true)->field('his_drug_id')->select();

        foreach ($listArr as $key2 => $val2) {
                //若该药房的药品id已存在就更新, 否则插入
                $temp['drug_name'] = $val2[0];
                $temp['his_drug_id'] = $val2[1];
                $temp1['his_drug_id'] = $val2[1];

                $temp['manufacturer'] = $val2[6] ?: '';
                $temp['pos_code'] = $val2[2];
                $temp['goods_code'] = $val2[3];
                $temp['k_name'] = $val2[4];
                $temp['Drug_spec'] = $val2[5];
                $temp['Drug_unit'] = $val2[7];
                $temp['Is_user'] = intval($val2[8]) ?: 0;
                $temp['price'] = floatval($val2[9]) ?: 0;
                $temp['num'] = floatval($val2[10]) ?: 0;
                $temp['money'] = floatval($val2[11]) ?: 0;
                $temp['date'] = $val2[12] ?: time();
                $temp['release_date'] = time();

                if (db('drug')->where($temp1)->count() > 0) {
                    //更新
                    $temp1['prescription_id'] = 1;
                    db('drug')->where($temp1)->update($temp);
                } else {
                    //插入
                    $temp['prescription_id'] = 1;
                    $temp['add_date'] = time();
                    db('drug')->insert($temp);
                }
        }
        ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
    }

    /**
     * @Title: getInfo
     * @Description: TODO 拉取患者信息
     */
    public function getInfo() {
        set_time_limit (0);
        //西院
        $mobileUrl = 'http://27.115.75.166:19982/webwest/tkt_service.asmx/TKT_YP_SELECT_USERINFO_tel';
        $nameUrl = 'http://27.115.75.166:19982/webwest/tkt_service.asmx/TKT_YP_SELECT_USERINFO';
        //遍历未同步过信息的患者
        $userList = db('member')
            ->where("card = '' AND mobile != ''")
            ->select();
        foreach ($userList as $val) {
            //优先手机号查找用户信息
            $_info = curlPost2($mobileUrl, array('Content-type:application/x-www-form-urlencoded'), array('tel'=>$val['mobile']));
            $xml=new \SimpleXMLElement($_info);
            $array = json_decode(json_encode($xml),true);
            if (isset($array['string']) && count($array['string']) > 0) {
                $userInfo = $array['string'];
                //更新患者信息
                $userInfo[0] ? $temp['true_name'] = $userInfo[0] : '';
                $userInfo[1] ? $temp['card'] = $userInfo[1] : '';
                $temp['birthday'] = date('Y-m-d', strtotime($userInfo[2]));
                $temp['sex'] = $userInfo[3] == 1 ? 0 : 1;
                $userInfo[4] ? $temp['id_card'] = $userInfo[4] : '';
                $temp['mobile'] = $userInfo[5];
                db('member')->where("mobile = {$temp['mobile']}")->update($temp);
            } else {
                //其次真实姓名查找用户信息
                $_info = curlPost2($nameUrl, array('Content-type:application/x-www-form-urlencoded'), array('name'=>$val['true_name']));
                $xml=new \SimpleXMLElement($_info);
                $array = json_decode(json_encode($xml),true);
                if (isset($array['string']) && count($array['string']) > 0) {
                    $listArr = array();
                    foreach ($array['string'] as $key => $val2) {
                        $listArr[intval($key / 10)][] = $val2;
                    }
                    foreach ($listArr as $val1) {
                        //若身份证匹配上了则更新用户信息
                        if ($val1[4] == $val['id_card']) {
                            $val1[0] ? $temp['true_name'] = $val1[0] : '';
                            $val1[1] ? $temp['card'] = $val1[1] : '';
                            $temp['birthday'] = date('Y-m-d', strtotime($val1[2]));
                            $temp['sex'] = $val1[3] == 1 ? 0 : 1;
                            $val1[4] ? $temp['id_card'] = $val1[4] : '';
                            db('member')->where("member_id = {$val['member_id']}")->update($temp);
                        }
                    }
                }
            }
        }
        ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
    }


    /**
     * @Title: getOrder
     * @Description: TODO 拉取患者历史处方+
     */
    public function getOrder() {
        set_time_limit (0);
        //西院
        $listUrl = 'http://27.115.75.166:19982/webwest/tkt_service.asmx/TKT_YP_SELECT_USERINFO_CF';
        $orderUrl = 'http://27.115.75.166:19982/webwest/tkt_service.asmx/TKT_YP_SELECT_USERINFO_CF_MX';
        $seeUrl = 'http://27.115.75.166:19982/webwest/tkt_service.asmx/TKT_YP_SELECT_USERINFO_RECORD';
        //遍历有就诊卡号的患者
        $userList = db('member')
            ->where("card != ''")
            ->select();
        foreach ($userList as $val) {
            //获取处方列表
            $_info = curlPost2($listUrl, array('Content-type:application/x-www-form-urlencoded'), array('outpatno'=>$val['card']));
            $xml=new \SimpleXMLElement($_info);
            $array = json_decode(json_encode($xml),true);

            //获取就诊信息列表
            $_info2 = curlPost2($seeUrl, array('Content-type:application/x-www-form-urlencoded'), array('outpatno'=>$val['card']));
            $xml2=new \SimpleXMLElement($_info2);
            $array2= json_decode(json_encode($xml2),true);

            $listArr9 = array();
            if (isset($array2['string']) && count($array2['string']) > 0) {
                foreach ($array2['string'] as $key => $val2) {
                    $listArr9[intval($key / 7)][] = $val2;
                }
            }


            if (isset($array['string']) && count($array['string']) > 0) {
                    $listArr = array();
                    foreach ($array['string'] as $key => $val2) {
                        $listArr[intval($key / 9)][] = $val2;
                    }
                    foreach ($listArr as $_key => $val1) {
                        //获取处方详情
                        $_info1 = curlPost2($orderUrl, array('Content-type:application/x-www-form-urlencoded'), array('advid'=>$val1[0]));
                        $xml1=new \SimpleXMLElement($_info1);
                        $array1 = json_decode(json_encode($xml1),true);
                        if (isset($array1['string']) && count($array1['string']) > 0) {
                            $listArr1 = array();
                            foreach ($array1['string'] as $key3 => $val3) {
                                $listArr1[intval($key3 / 8)][] = $val3;
                            }
                            $drugArr = array();
                            foreach ($listArr1 as $val4) {
                                $drugArrEach = array();
                                $code = str_replace(' ', '', $val4[2]);
                                $drugDetail = db('drug')
                                    ->where("goods_code = '{$code}' AND prescription_id = 1")
                                    ->find();
                                $drugArrEach[0] = $drugDetail['drug_id'];
                                $drugArrEach[1] = $drugDetail['nick_name'];
                                $drugArrEach[2] = $val4['6'];
                                $drugArrEach[3] = $drugDetail['Drug_unit'];
                                array_push($drugArr, $drugArrEach);
                            }
                            //组装药品json, 添加历史订单
                            $drug_str = json_encode($drugArr);
                            $insertOrder['order_sn'] = createOrderCode();
                            $insertOrder['pay_status'] = 1;
                            $insertOrder['pay_type'] = 0;
                            $insertOrder['order_type'] = 5;
                            $insertOrder['order_status'] = 4;
                            $insertOrder['doctor_id'] = 0;
                            $insertOrder['patient_id'] = $val['member_id'];
                            $insertOrder['product_amount'] = 0;
                            $insertOrder['product_number'] = 0;
                            $insertOrder['pay_amount'] = 0;
                            $insertOrder['see_date'] = strtotime($val1[8]);
                            $insertOrder['order_date'] = strtotime($val1[8]);
                            $insertOrder['pay_date'] = strtotime($val1[8]);
                            $insertOrder['complete_date'] = strtotime($val1[8]);
                            $_result = db('order')->insertGetId($insertOrder);

                            //添加历史处方单详情
                            if ($_result) {
                                $historyData['order_id'] = $_result;
                                $historyData['prescription_type'] = 2;
                                $historyData['doctor_name'] = $val1[6];
                                $historyData['patient_mobile'] = $val['mobile'];
                                $historyData['patient_name'] = $val1[2];
                                $historyData['patient_sex'] = $val['sex'];
                                $historyData['patient_age'] = 0;
                                $historyData['drug_str'] = $drug_str;
                                $historyData['dose'] = 1;
                                $historyData['is_checked'] = 2;
                                $historyData['add_date'] = strtotime($val1[8]);
                                $historyData['taking'] = ($val1[7]);
                                $historyData['dialectical'] = $listArr9[$_key][5] ?: '';
                                $_orderResult = db('order_prescription')->insertGetId($historyData);
                            }

                        }

                    }
                }
        }
        ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
    }


}