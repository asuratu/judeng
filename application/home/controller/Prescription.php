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

            if($data['str']=='' || $data['prescription_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //根据字符串模糊查找药材信息
            $map['Is_user'] = 1;
            $map['keywords']=array('like','%'.strtoupper($data['str']).'%');
                $list=db('drug')->where($map)->field("`drug_id`,`drug_name`,`Drug_unit`,`price`,`num`, `other_name`")->order("`add_date` ASC")->select();

            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[base64_encode(json_encode($list))]));
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
                $temp['type'] = 1;//可以防止反复添加
                $target = db('drug_record')->where($temp)->field("*")->find();
                if ($target) {
                    array_push($tabooArr2, $val);
                    $contrastTemp['key'] = $target['key'];
                    $contrastTemp['type'] = abs($target['type']-1);
                    $contrastList = db('drug_record')->where($contrastTemp)->field("*")->select();
                    foreach ($contrastList as $val2) {
                        if (in_array($val2['name'], $drugArr)) {
                            array_push($tabooArr2, $val2['name']);
                        }
                    }
                    array_push($tabooArr, $tabooArr2);
                }
            }
            if (count($tabooArr) > 0) {
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
            $map['is_display'] = 1;
            $stateArr = db('drug_state')->where($map)->field("`state_id`,`state_name`,`make`,`weight`,`taking`,`instructions`")->order("`sort` DESC")->select();

            foreach ($stateArr as $key => $val) {
                //查询该药态下的药方
                $houseArr = db('drug_relation')->where($map)->alias('d')
                    ->join(['jd_title'=>'t'], 'd.title_id = t.title_id' , 'left')
                    ->join(['jd_area'=>'a'], 'd.area_id = a.area_id' , 'left')
                    ->join(['jd_hospital'=>'h'], 'd.hospital_id = h.hospital_id' , 'left')
                    ->field("d.*, t.title_name, a.name, h.hospital_name")
                    ->find();
                var_dump(2);die;
            }





            $drugArr = json_decode(base64_decode($data['tabooStr']));
            $drugArr = array_unique($drugArr);
            $tabooArr = array();
            foreach ($drugArr as $val) {
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
                        if (in_array($val2['name'], $drugArr)) {
                            array_push($tabooArr2, $val2['name']);
                        }
                    }
                    array_push($tabooArr, $tabooArr2);
                }
            }
            if (count($tabooArr) > 0) {
                ajaxReturn(array('code'=>0, 'info'=>'存在配伍禁忌!','data'=>$tabooArr));
            } else {
                ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[]));
            }
        }
    }
}