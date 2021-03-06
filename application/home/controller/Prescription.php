<?php
namespace app\home\controller;
use think\Request;
use think\Db;

class Prescription extends Common
{

    /**
     * @Title: getPrescriptionTypeList
     * @Description: TODO 获取药方模板类型(药态)列表
     */
    public function getPrescriptionTypeList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            //获取药方模板类型数组
            $map['is_display'] = 1;
            $list=db('drug_state')->where($map)->field("`state_id`,`state_name`")->order("`sort` DESC")->select();

            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>$list));
        }
    }

    /**
     * @Title: getSimilarDrug
     * @Description: TODO  根据首字母简拼查找药材信息
     */
    public function getSimilarDrug() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['str']=='' || (string)$data['prescription_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $date['str'] = strtoupper($data['str']);
            //根据字符串模糊查找药材信息
            $where = "Is_user = 1 and FIND_IN_SET({$data['type_id']}, state_id) and keywords like '%{$date['str']}%'";
            $list=db('drug')->where($where)->field("`drug_id`,`nick_name`,`Drug_unit`,`price`,`num`, `other_name`")->order("`add_date` ASC")->select();
            if (count($list) > 0) {
                ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>$list));
            } else {
                ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[]));
            }
        }
    }

    /**
     * @Title: checkTaboo
     * @Description: TODO 查询配伍禁忌
     */
    public function checkTaboo() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
//            var_dump(base64_encode(json_encode(['川乌', '川乌', '附子', '半夏'])));die;
            //$data['tabooStr']为所选药材组成json字符串
            if($data['tabooStr']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $drugArr = json_decode(base64_decode($data['tabooStr']));
            $drugArr = array_unique($drugArr);
            $tabooArr = array();
            foreach ($drugArr as $val) {
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
                        if (in_array($val2['name'], $drugArr)) {
                            array_push($tempArr, $val2['name']);
                            array_push($tabooArr, $tempArr);
                        }
                    }
                }
            }
            if (count($tabooArr) > 0 && count($tabooArr[0]) > 1) {
                ajaxReturn(array('code'=>0, 'info'=>'存在配伍禁忌!','data'=>$tabooArr));
            } else {
                ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[]));
            }
        }
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
            $stateArr = db('drug_state')->where($map)->field("`state_id`,`state_name`,`make`,`weight`,`taking`,`instructions`, `pic`,`common`,`everyday`,`everytime`,`subtitle`,`type_id`")->order("`sort` DESC")->select();
            foreach ($stateArr as $key => $val) {
                //查询该药态下的药方
                $temp['p.`area_id`'] = $data['area_id'];
                $temp['p.`is_display`'] = 1;
                $temp['p.`state_id`'] = $val['state_id'];
                $houseArr = db('drug_state')->alias('ds')
                    ->join(['jd_prescription'=>'p'], 'ds.state_id = p.state_id' , 'inner')
                    ->where($temp)
                    ->field("p.`state_id`, p.`describe`, p.`prescription_name`, p.`area_name`")
                    ->order("p.`sort` DESC")
                    ->select();

                $stateArr[$key]['content'] = $houseArr;
                $arr1 = $houseArr[0];
                $arr1['prescription_name'] = '上海泰坤堂中医医院';
                $arr2 = $houseArr[0];
                $arr2['prescription_name'] = '杭州钱塘医疗门诊部';
                $arr3 = $houseArr[0];
                $arr3['prescription_name'] = '泰坤堂大药房';
                $arr4 = $houseArr[0];
                $arr4['prescription_name'] = '华润三九颗粒药房';
                array_push($stateArr[$key]['content'], $arr1);
                array_push($stateArr[$key]['content'], $arr2);
                array_push($stateArr[$key]['content'], $arr3);
                array_push($stateArr[$key]['content'], $arr4);
                $stateArr[$key]['pic'] = $val['pic'];
            }

            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>$stateArr));
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
            if($data['temp_id']=='' || $data['state_id']=='' || $data['area_id']=='' || $data['type']==''|| $data['special_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //查询药态信息
            $stateMap['`state_id`'] = $data['state_id'];
            $stateMap['`is_display`'] = 1;
            $tempInfo = db('drug_state')->where($stateMap)->field("`state_id`,`state_name`,`make`,`weight`,`taking`,`instructions`,`pic`,`common`,`everyday`,`everytime`,`subtitle`,`type_id`")->find();

            //优先判断是不是选特色方剂
            if ($data['type'] == 1) {
//                $tempInfo['head_title'] = '查看特色方剂-'.$tempInfo['state_name'].'模板';
                $tempInfo['temp_name'] = '';
                //查询该药态该地区下的第一个药房
                $temp['p.`area_id`'] = $data['area_id'];
                $temp['p.`is_display`'] = 1;
                $temp['p.`state_id`'] = $data['state_id'];
                $houseArr = db('drug_state')->alias('ds')
                    ->join(['jd_prescription'=>'p'], 'ds.state_id = p.state_id' , 'inner')
                    ->where($temp)
                    ->field("p.`state_id`, p.`describe`, p.`prescription_id`, p.`prescription_name`, p.`area_name`")
                    ->order("p.`sort` DESC")
                    ->select();

                if (count($houseArr) > 0) {
                    $tempInfo['state_house_name'] = $tempInfo['state_name'].'.'.$houseArr[0]['area_name'].'-'.$houseArr[0]['prescription_name'];
                    $tempInfo['prescription_id'] = $houseArr[0]['prescription_id'];
//                    $tempInfo['left_num'] = count($houseArr)-1;
                    $tempInfo['left_num'] = 4;
                    //查询药材明细
                    $specialInfo = db('special')
                        ->where("special_id = {$data['special_id']} AND is_display = 1")
                        ->field("special_id, special_name, content")
                        ->find();
                    if (empty($specialInfo)) {
                        ajaxReturn(array('code'=>0,'info'=>'该特色方剂不存在~!','data'=>[]));
                    }
                    $tempInfo['drug_str'] = base64_encode($specialInfo['content']);
                    $tempInfo['special_content'] = base64_encode($specialInfo['content']);
                    $tempInfo['special_id'] = $specialInfo['special_id'] ?: 0;
                    $tempInfo['head_title'] = $specialInfo['special_name'];

                        //计算价格
                    $drugSumPrice = 0;//价格
                    $lessCountArr = array();//超量
                    $otherNameArr = array();//别名
                    $alertArr = array();//是否下架
                    foreach (json_decode($specialInfo['content']) as $key => $val) {
                        $drugDetailMap['Is_user'] = 1;

                        //TODO 此处不能用drug_id来定位药材, 应该用药房id和药品统一名(别名)
                        $drugDetailMap['prescription_id'] = $tempInfo['prescription_id'];
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
                    $tempInfo['price'] = round($drugSumPrice, 2);
                    $tempInfo['dose'] = 0;
                    $tempInfo['type'] = 1;

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
                        $tempInfo['is_taboo'] = 1;
                        $tempInfo['taboo_content'] = json_encode($tabooArr);
                    } else {
                        $tempInfo['is_taboo'] = 0;
                        $tempInfo['taboo_content'] = '';
                    }
                    ajaxReturn(array('code'=>1,'info'=>'ok~!','data'=>[$tempInfo]));
                } else {
                    ajaxReturn(array('code'=>0,'info'=>'该药态该地区暂无药房~!','data'=>[]));
                }
            } else {
                if ($data['temp_id'] == 0) {
                    //新建模板
                    $tempInfo['head_title'] = '新建'.$tempInfo['state_name'].'模板';
                    $tempInfo['temp_name'] = '';
                    //查询该药态该地区下的第一个药房
                    $temp['p.`area_id`'] = $data['area_id'];
                    $temp['p.`is_display`'] = 1;
                    $temp['p.`state_id`'] = $data['state_id'];
                    $houseArr = db('drug_state')->alias('ds')
                        ->join(['jd_prescription'=>'p'], 'ds.state_id = p.state_id' , 'inner')
                        ->where($temp)
                        ->field("p.`state_id`, p.`describe`, p.`prescription_id`, p.`prescription_name`, p.`area_name`")
                        ->order("p.`sort` DESC")
                        ->select();

                    if (count($houseArr) > 0) {
                        $tempInfo['state_house_name'] = $tempInfo['state_name'].'.'.$houseArr[0]['area_name'].'-'.$houseArr[0]['prescription_name'];
                        $tempInfo['prescription_id'] = $houseArr[0]['prescription_id'];
//                        $tempInfo['left_num'] = count($houseArr)-1;
                        $tempInfo['left_num'] = 4;
                        $tempInfo['price'] = 0;
                        $tempInfo['drug_str'] = '';
                        $tempInfo['special_content'] = '';
                        $tempInfo['special_id'] = 0;
                        $tempInfo['is_taboo'] = 0;
                        $tempInfo['dose'] = 0;
                        $tempInfo['type'] = 0;
                        $tempInfo['taboo_content'] = '';

                        ajaxReturn(array('code'=>1,'info'=>'ok~!','data'=>[$tempInfo]));
                    } else {
                        ajaxReturn(array('code'=>0,'info'=>'该药态该地区暂无药房~!','data'=>[]));
                    }
                } else {
                    //修改模板
                    //查询模板信息
                    $tempMap['temp_id'] = $data['temp_id'];
                    $drugtempInfo = db('temp')->where($tempMap)->field("make,weight,taking,instructions,temp_name,type,price,drug_str,is_taboo,taboo_content,dose,special_id,special_content")->find();

                    //敏感数据处理
                    $drugtempInfo['drug_str'] = base64_encode($drugtempInfo['drug_str']);
                    $drugtempInfo['taboo_content'] = $drugtempInfo['taboo_content'] ? base64_encode($drugtempInfo['taboo_content']) : '';
//                    $drugtempInfo['head_title'] = '修改'.$tempInfo['state_name'].'模板';
                    $drugtempInfo['head_title'] = $drugtempInfo['temp_name'];
                    $drugtempInfo['pic'] = $tempInfo['pic'];
                    $drugtempInfo['state_name'] = $tempInfo['state_name'];
                    $drugtempInfo['state_id'] = $tempInfo['state_id'] ?: 0;

                    //药房信息
                    $houseMap['p.`area_id`'] = $data['area_id'];
                    $houseMap['p.`is_display`'] = 1;
                    $houseMap['p.`state_id`'] = $data['state_id'];
                    $houseArr = db('drug_state')->alias('ds')
                        ->join(['jd_prescription'=>'p'], 'ds.state_id = p.state_id' , 'inner')
                        ->where($houseMap)
                        ->field("p.`state_id`, p.`describe`, p.`prescription_name`, p.`prescription_id`, p.`area_name`")
                        ->order("ds.`sort` DESC")
                        ->find();

                    if (!$houseArr) {
                        ajaxReturn(array('code'=>0,'info'=>'该药态该药房暂不可用~!','data'=>[]));
                    }
                    $drugtempInfo['state_house_name'] = $tempInfo['state_name'].'.'.$houseArr['area_name'].'-'.$houseArr['prescription_name'];
//                    $drugtempInfo['left_num'] = $houseAllArr - 1;
                    $drugtempInfo['left_num'] = 4;
                    $drugtempInfo['prescription_id'] = $houseArr['prescription_id'];
                    $drugtempInfo['special_content'] = base64_encode($drugtempInfo['special_content']);
                    ajaxReturn(array('code'=>1,'info'=>'ok~!','data'=>[$drugtempInfo]));
                }
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

            if($data['member_id']=='' || $data['temp_name'] == '' || $data['drug_str'] == '' || $data['instructions'] == '' || $data['special_id']=='')
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

            $tempMap['state_id'] = $data['state_id'];
            $tempMap['prescription_id'] = $data['prescription_id'];
            $tempMap['dose'] = intval($data['dose']);
            $tempMap['type'] = 0;//0个人模板
            $tempMap['drug_str'] = base64_decode($data['drug_str']);
            $tempMap['make'] = str_replace(__ROOT__,'',$data['make']);
            $tempMap['weight'] = str_replace(__ROOT__,'',$data['weight']);
            $tempMap['taking'] = str_replace(__ROOT__,'',$data['taking']);
            $tempMap['instructions'] = $data['instructions'];
            $tempMap['add_date'] = time();
            $tempMap['release_date'] = time();

            $tempMap['special_id'] = $data['special_id'] ?: 0;
            //查询有没有特色方剂使用
            if ($data['special_id']) {
                $list=db('special')
                ->where("special_id = {$data['special_id']}")
                ->field("`content`")
                ->find();
                $tempMap['special_content'] = $list['content'];
            } else {
                $tempMap['special_content'] = '';
            }

//            $arr = array(array(17, '制川乌', 4, 'g'), array(315, '熟附片', 30, 'g'), array(485, '法半夏', 94, 'g'));
//            var_dump(base64_encode(json_encode($arr)));die;

            //计算价格
            $drugSumPrice = 0;//价格
            $lessCountArr = array();//超量
            $otherNameArr = array();//别名
            $alertArr = array();//是否下架
            foreach (json_decode($tempMap['drug_str']) as $key => $val) {
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
            if (count($alertArr) > 0) {
                ajaxReturn(array('code'=>0,'info'=>'药材['.implode(',', $alertArr).']在该药房已下架!','data'=>[]));
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

            if($data['drug_str'] == '' || (string)$data['prescription_id'] == '')
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
                $drugDetailMap['nick_name'] = $val[1];
                $drugDetailMap['prescription_id'] = $data['prescription_id'];

                $list=db('drug')->where($drugDetailMap)->field("`drug_id`,`nick_name`,`Drug_unit`,`price`,`num`, `other_name`")->find();
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

            if($data['temp_id']=='' || $data['member_id']=='' || $data['temp_name'] == '' || $data['drug_str'] == '' || $data['instructions'] == '' || (string)$data['prescription_id'] == '')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //添加时, 对于当前医生模板名不能重复
            if ($data['temp_id'] == 0) {
                $tempMap['member_id'] = $data['member_id'];
                $tempMap['temp_name'] = str_replace(__ROOT__, '', $data['temp_name']);
                $tempCount = db('temp')->where($tempMap)->count();
                if ($tempCount > 1) {
                    ajaxReturn(array('code' => 0, 'info' => '该名称的模板已存在!', 'data' => []));
                }
            }

            $updateMap['temp_id'] = $data['temp_id'];
            $updateMap['member_id'] = $data['member_id'];
            $tempCount = db('temp')->where($updateMap)->count();
            if ($tempCount == 0) {
                ajaxReturn(array('code'=>0,'info'=>'该模板已被删除!','data'=>[]));
            }

            $tempMap['state_id'] = $data['state_id'];
            $tempMap['prescription_id'] = $data['prescription_id'];
            $tempMap['dose'] = intval($data['dose']);
            $tempMap['type'] = 0;//0个人模板 1经典模板(管理员创建)
            $tempMap['drug_str'] = base64_decode($data['drug_str']);
            $tempMap['make'] = str_replace(__ROOT__,'',$data['make']);
            $tempMap['weight'] = str_replace(__ROOT__,'',$data['weight']);
            $tempMap['taking'] = str_replace(__ROOT__,'',$data['taking']);
            $tempMap['instructions'] = $data['instructions'];
            $tempMap['release_date'] = time();

            $tempMap['special_id'] = $data['special_id'] ?: 0;
            //查询有没有特色方剂使用
            if ($data['special_id']) {
                $list=db('special')
                    ->where("special_id = {$data['special_id']}")
                    ->field("`content`")
                    ->find();
                $tempMap['special_content'] = $list['content'];
            } else {
                $tempMap['special_content'] = '';
            }


//            $arr = array(array(17, '制川乌', 4, 'g'), array(315, '熟附片', 30, 'g'), array(485, '法半夏', 94, 'g'));
//            var_dump(base64_encode(json_encode($arr)));die;

            //计算价格
            $drugSumPrice = 0;//价格
            $lessCountArr = array();//超量
            $otherNameArr = array();//别名
            $alertArr = array();//是否下架
            foreach (json_decode($tempMap['drug_str']) as $key => $val) {
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
            if (count($alertArr) > 0) {
                ajaxReturn(array('code'=>0,'info'=>'药材['.implode(',', $alertArr).']在该药房已下架!','data'=>[]));
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
     * @Title: delTemp
     * @Description: TODO 医生删除自建模板
     */
    public function delTemp() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['temp_id']=='' || $data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            if ($data['temp_id']==0) {
                ajaxReturn(array('code'=>0,'info'=>'特色方剂模板不可删除!','data'=>[]));
            }
            //查询该模板
            $map['temp_id'] = $data['temp_id'];
//            $map['member_id'] = $data['member_id'];
            $tempInfo = db('temp')->where($map)
                ->field("*")
                ->find();
            if (empty($tempInfo)) {
                ajaxReturn(array('code'=>0,'info'=>'该模板不存在!','data'=>[]));
            }
            if ($tempInfo['type'] == 1) {
                ajaxReturn(array('code'=>0,'info'=>'经典方模板, 不可删除!','data'=>[]));
            }
            //删除模板
            $_result = db('temp')->where($map)->delete();
            if ($_result) {
                ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[]));
            } else {
                ajaxReturn(array('code'=>0, 'info'=>'系统繁忙, 请稍后再试','data'=>[]));
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
            if ($data['state_id'] > 0) {
                $map['state_id'] = $data['state_id'];
            }
            $stateArr = db('temp')->where($map)->field("`temp_id`,`temp_name`,`type`,`drug_str`, `state_id`, `release_date`")->order("`release_date` DESC")->select();
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
            if($data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }


            //加入传承的特色方剂
            $specialList = db('inherit_doctor')->alias('id')
                ->join(['jd_special'=>'s'], 's.inherit_id = id.inherit_id' , 'inner')
                ->join(['jd_inherit'=>'i'], 'i.inherit_id = id.inherit_id' , 'inner')
                ->join(['jd_drug_state'=>'ds'], 's.status = ds.state_id' , 'left')
                ->where("id.`member_id` = {$data['member_id']} AND s.type = 1 AND i.is_display = 1 AND s.is_display = 1")
                ->field("s.special_id, s.inherit_id, s.special_name, s.apply, s.content, s.status, s.alert, s.prescription, s.release_date, ds.subtitle")
                ->order('s.sort DESC')
                ->select();
            $specialArr = array();
            $prescription = array();
            foreach ($specialList as $key=>$val) {
                if (!empty($val['prescription'])) {
//                    var_dump($val['prescription']);die;
                    $prescription = db('prescription')->where("FIND_IN_SET(prescription_id, '{$val['prescription']}')")->field("prescription_id, prescription_name")->select();
                }
                //将特色方剂的克数转为0
                $specialArr[$key]['drug_str'] = base64_encode(($val['content']));
                $specialArr[$key]['type'] = 0;
                $specialArr[$key]['temp_id'] = 0;
                $specialArr[$key]['apply'] = $val['apply'];
                $specialArr[$key]['alert'] = $val['alert'];
                $specialArr[$key]['prescription'] = $prescription;
                $specialArr[$key]['special_id'] = $val['special_id'];
                $specialArr[$key]['temp_name'] = $val['special_name'];
                $specialArr[$key]['release_date'] = $val['release_date'];
                $specialArr[$key]['state_id'] = $val['status'];
                $specialArr[$key]['subtitle'] = $val['subtitle'] ? $val['subtitle'] : '';
            }

            //加入传承的特色良方
            $specialList1 = db('inherit_doctor')->alias('id')
                ->join(['jd_special'=>'s'], 's.inherit_id = id.inherit_id' , 'inner')
                ->join(['jd_inherit'=>'i'], 'i.inherit_id = id.inherit_id' , 'inner')
                ->join(['jd_drug_state'=>'ds'], 's.status = ds.state_id' , 'left')
                ->where("id.`member_id` = {$data['member_id']}  AND s.type = 2 AND i.is_display = 1 AND s.is_display = 1")
                ->field("s.special_id, s.inherit_id, s.special_name, s.content, s.status, s.release_date, ds.subtitle")
                ->order('s.sort DESC')
                ->select();
            $specialArr1 = array();
            foreach ($specialList1 as $key=>$val) {
                //将特色良方的克数转为0
                $specialArr1[$key]['drug_str'] = base64_encode(($val['content']));
                $specialArr1[$key]['type'] = 1;
                $specialArr1[$key]['temp_id'] = 0;
                $specialArr1[$key]['special_id'] = $val['special_id'];
                $specialArr1[$key]['temp_name'] = $val['special_name'];
                $specialArr1[$key]['release_date'] = $val['release_date'];
                $specialArr1[$key]['state_id'] = $val['status'];
                $specialArr1[$key]['subtitle'] = $val['subtitle'] ? $val['subtitle'] : '';
            }

            //获取自建的非经典模板数组
            $map['member_id'] = $data['member_id'];
            $map['type'] = 0;
            $stateArr = db('temp')->alias('t') ->join(['jd_drug_state'=>'ds'], 't.state_id = ds.state_id' , 'left')->where($map)->field("t.`temp_id`,t.`temp_name`,t.`type`,t.`drug_str`, t.`state_id`, t.`release_date`, t.`release_date`, ds.`subtitle`")->order("`release_date` DESC")->select();

            foreach ($stateArr as $key=>$val) {
                $stateArr[$key]['drug_str'] = base64_encode($val['drug_str']);
                $stateArr[$key]['special_id'] = 0;
                $stateArr[$key]['type'] = 2;
                $stateArr[$key]['subtitle'] = $val['subtitle'] ? $val['subtitle'] : '';
            }

            //获取经典模板数组
            $map1['type'] = 1;
            $classicArr = db('temp')->alias('t') ->join(['jd_drug_state'=>'ds'], 't.state_id = ds.state_id' , 'left')->where($map1)->field("t.`temp_id`,t.`temp_name`,t.`type`,t.`drug_str`, t.`state_id`, t.`release_date`, ds.`subtitle`")->order("`release_date` DESC")->select();
            foreach ($classicArr as $key=>$val) {
                $classicArr[$key]['drug_str'] = base64_encode($val['drug_str']);
                $classicArr[$key]['type'] = 3;
                $classicArr[$key]['special_id'] = 0;
                $stateArr[$key]['subtitle'] = $val['subtitle'] ? $val['subtitle'] : '';
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>array_merge($specialArr, $specialArr1, $stateArr, $classicArr)));
        }
    }

    public function history() {
        if($this->request->isPost()) {
            $data = input('post.');
            $res = checkSign($data);
            if ($res['code'] == 0) {
                ajaxReturn($res);
            }
            if ($data['member_id'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
            }
            $history = db('order_prescription')->alias('op')
                ->join(['jd_order'=>'o'], 'op.order_id = o.order_id' , 'left')
                ->join(['jd_drug_state'=>'ds'], 'op.state_id = ds.state_id' , 'left')
                ->where("op.prescription_type=0 AND o.doctor_id = {$data['member_id']}")
                ->field("op.order_id,op.add_date,op.drug_str,ds.subtitle")
                ->order("add_date DESC")
                ->select();
            $history1 = array();
            foreach ($history as $key => $val) {
                $history1[$key] = $val;
                $history1[$key]['add_date'] = date("Y-m-d", $val['add_date']);
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>$history1));
        }
    }

    public function cream() {
        if($this->request->isPost())
        {
            $data=input('post.');
//            $res=checkSign($data);
//            if($res['code']==0)
//            {
//                ajaxReturn($res);
//            }
            $aryCream = $this->view->setting['aryCream'];
            $cream = array();
            foreach ($aryCream as $key => $val) {
                $cream[$key]['cream'] = $val;
                $cream[$key]['list'] = db('cream_square')->field('id,title,price,cover')->where("type_id={$key} and is_show=1")->order("`sort` ASC")->select();
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>$cream));
        }
    }

    public function revisitMember() {
        if($this->request->isPost())
        {
            $data=input('post.');
//            $res=checkSign($data);
//            if($res['code']==0)
//            {
//                ajaxReturn($res);
//            }
            if($data['member_id']=='' || $data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            // 第一个参数用户ID， 第二个参数医生ID
            $revisit = Model('Prescription')->revisitMember($data['member_id'], $data['doctor_id']);
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>$revisit));
        }
    }

    public function revisitMemberCount() {
        if($this->request->isPost())
        {
            $data=input('post.');
//            $res=checkSign($data);
//            if($res['code']==0)
//            {
//                ajaxReturn($res);
//            }
            if($data['member_id']=='' || $data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            // 第一个参数用户ID， 第二个参数医生ID
            $count = Model('Prescription')->revisitMemberCount($data['member_id'], $data['doctor_id']);
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>$count));
        }
    }

    // 服药说明
    public function medicine() {
        if($this->request->isPost())
        {
            $data=input('post.');
//            $res=checkSign($data);
//            if($res['code']==0)
//            {
//                ajaxReturn($res);
//            }

            $medicine = db('medicine')->field('id,title')->where("is_show=1 and type_id = {$data['type_id']}")->order('sort', 'ASC')->select();
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>$medicine));
        }
    }

    // 煎煮方法
    public function decoction() {
        if($this->request->isPost())
        {
            $data=input('post.');
//            $res=checkSign($data);
//            if($res['code']==0)
//            {
//                ajaxReturn($res);
//            }

            $decoction = db('decoction')->field('id,title')->where("is_show=1")->order('sort', 'ASC')->select();
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>$decoction));
        }
    }

    // 辩证库
    public function dialectical() {
        if($this->request->isPost())
        {
            $data=input('post.');
//            $res=checkSign($data);
//            if($res['code']==0)
//            {
//                ajaxReturn($res);
//            }
            $dialectical = db('dialectical')->field('id,title')->where("is_show=1 and title like '%{$data['title']}%'")->order('sort', 'ASC')->select();
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>$dialectical));
        }
    }

    // 中成药次数查询
    public function drugconfig() {
        if($this->request->isPost())
        {
            $data=input('post.');
//            $res=checkSign($data);
//            if($res['code']==0)
//            {
//                ajaxReturn($res);
//            }
            $config = db('drug_config')->field('frequency,slice,method')->where("drug_id={$data['drug_id']}")->order('sort', 'ASC')->select();
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>$config));
        }
    }

}