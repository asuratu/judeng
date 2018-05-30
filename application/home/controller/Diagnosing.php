<?php
namespace app\home\controller;
use think\Request;
use think\Db;
class Diagnosing extends Common
{
    /**
     * @Title: addHospital
     * @Description: TODO 医生添加医疗机构
     */
    public function addHospital()
    {
        if ($this->request->isPost()) {
            $data = input('post.');
            $res = checkSign($data);
            if ($res['code'] == 0) {
                ajaxReturn($res);
            }
            if ($data['area_id'] == '' || $data['member_id'] == '' || $data['hospital_repart_id'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
            }
            //获取医生的详细信息
            $map['member_id'] = $data['member_id'];
            $doctorInfo = db('doctor')
                ->where($map)
                ->field("*")
                ->find();
            if (empty($doctorInfo)) {
                ajaxReturn(array('code' => 0, 'info' => '用户不存在!', 'data' => []));
            }
            if (strpos($doctorInfo['hospital_repart_str'], $data['hospital_repart_id']) !== false) {
                ajaxReturn(array('code' => 0, 'info' => '您已添加过该科室!', 'data' => []));
            }
            //绑定科室的上限是6个
            $maxNum = config('maxDepartNum');
            if (count(explode(',', $doctorInfo['hospital_repart_str'])) >= $maxNum) {
                ajaxReturn(array('code' => 0, 'info' => '您最多绑定' . $maxNum . '个科室!', 'data' => []));
            }
            //更新用户的科室信息
            $userMap['hospital_repart_str'] = $doctorInfo['hospital_repart_str'] ? $doctorInfo['hospital_repart_str'] . ',' . $data['hospital_repart_id'] : $data['hospital_repart_id'];
            $userMap['release_date'] = time();
            $_identity = db('doctor')->where($map)->update($userMap);
            if ($_identity) {
                ajaxReturn(array('code' => 1, 'info' => 'ok', 'data' => []));
            } else {
                ajaxReturn(array('code' => 0, 'info' => 'ok', 'data' => []));
            }
        }
    }

    /**
     * @Title: getHospitalList
     * @Description: TODO 获取医院列表(添加医疗机构时)
     */
    public function getAddHospitalList()
    {
        if ($this->request->isPost()) {
            $data = input('post.');
            $res = checkSign($data);
            if ($res['code'] == 0) {
                ajaxReturn($res);
            }
            if ($data['member_id'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
            }
            //查询医生信息
            $doctorMap['member_id'] = $data['member_id'];
            $memberInfo = db('doctor')->where($doctorMap)->field("*")->find();

            if (empty($memberInfo)) {
                ajaxReturn(array('code' => 0, 'info' => '该用户不存在!', 'data' => []));
            }
            //查询该地区医院数组
            $map['is_display'] = 1;
            if ($data['area_id']) {
                $map['area_id'] = $data['area_id'];
            }
            $list = db('hospital')->where($map)->field("`hospital_id`,`hospital_name`, area_id, address")->order("`sort` DESC")->select();
            foreach ($list as $key => $val) {
                //查询当前医院的所有科室
                $keshiMap['hospital_id'] = $val['hospital_id'];
                $keshiList = db('hospital_repart')->where($keshiMap)->alias('hr')
                    ->join(['jd_department' => 'd'], 'hr.department_id = d.department_id', 'left')
                    ->field("hr.hospital_repart_id, d.department_name")
                    ->select();
                $hospitalRepartArr = explode(',', $memberInfo['hospital_repart_str']);

                foreach ($keshiList as $key1 => $val1) {
                    if (in_array($val1['hospital_repart_id'], $hospitalRepartArr)) {
                        $keshiList[$key1]['selected'] = 1;
                    } else {
                        $keshiList[$key1]['selected'] = 0;
                    }
                }
                $list[$key]['content'] = $keshiList;
            }
            ajaxReturn(array('code' => 1, 'info' => 'ok', 'data' => $list));
        }
    }

    /**
     * @Title: getAddHospitalList
     * @Description: TODO 获取医生所选的医院列表(添加坐诊信息时)
     */
    public function getDiaHospitalList()
    {
        if ($this->request->isPost()) {
            $data = input('post.');
            $res = checkSign($data);
            if ($res['code'] == 0) {
                ajaxReturn($res);
            }
            if ($data['member_id'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
            }
            //查询医生信息
            $doctorMap['member_id'] = $data['member_id'];
            $memberInfo = db('doctor')->where($doctorMap)->field("*")->find();

            if (empty($memberInfo)) {
                ajaxReturn(array('code' => 0, 'info' => '该用户不存在!', 'data' => []));
            }
            //查询该地区医院数组
            if ($memberInfo['hospital_repart_str'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '清先添加医疗机构!', 'data' => []));
            }
            $departArr = explode(',', $memberInfo['hospital_repart_str']);
            $arr1 = array();
            foreach ($departArr as $key => $val) {
                //查当前科室信息
                $departMap['hr.`hospital_repart_id`'] = $val;
                $departInfo = db('hospital_repart')->where($departMap)->alias('hr')
                    ->join(['jd_department' => 'd'], 'hr.department_id = d.department_id', 'left')
                    ->field("hr.hospital_repart_id, hr.hospital_id, d.department_name")
                    ->find();
                if (empty($departInfo)) {
                    continue;
                }
                //查询所属的医院信息
                $hospitalMap['hospital_id'] = $departInfo['hospital_id'];
                if (isset($arr1[$departInfo['hospital_id']]) && $arr1[$departInfo['hospital_id']] != '') {
                    $arr1[$departInfo['hospital_id']]['content'][] = $departInfo;
                } else {
                    $hospitalInfo = db('hospital')->where($hospitalMap)->field("*")->find();
                    $arr1[$hospitalInfo['hospital_id']]['hospital_id'] = $hospitalInfo['hospital_id'];
                    $arr1[$hospitalInfo['hospital_id']]['hospital_name'] = $hospitalInfo['hospital_name'];
                    $arr1[$hospitalInfo['hospital_id']]['address'] = $hospitalInfo['address'];

                    $arr1[$hospitalInfo['hospital_id']]['content'][] = $departInfo;
                }
            }
            ajaxReturn(array('code' => 1, 'info' => 'ok', 'data' => array_values($arr1)));
        }
    }

    /**
     * @Title: addCertifie
     * @Description: TODO 添加坐诊信息
     */
    public function addDiagnosing()
    {
        if ($this->request->isPost()) {
            try {
                Db::startTrans();
                $data = input('post.');
                $res = checkSign($data);
                if ($res['code'] == 0) {
                    ajaxReturn($res);
                }

                if ($data['member_id'] == '' || $data['hospital_repart_id'] == '' || $data['start_time'] == '' || $data['end_time'] == '') {
                    ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
                }
                $data['start_time'] = strtotime($data['start_time']);
                $data['end_time'] = strtotime($data['end_time']);

                //参数检查
                if ($data['start_time'] >= $data['end_time']) {
                    ajaxReturn(array('code' => 0, 'info' => '结束时间应大于开始时间!', 'data' => []));
                }
                if ($data['start_time'] < time()) {
                    ajaxReturn(array('code' => 0, 'info' => '开始时间应大于当前时间', 'data' => []));
                }
                //查询医生信息
                $doctorMap['member_id'] = $data['member_id'];
                $memberInfo = db('doctor')->where($doctorMap)->field("*")->find();
                if (strstr($memberInfo['hospital_repart_str'], $data['hospital_repart_id']) === false) {
                    ajaxReturn(array('code' => 0, 'info' => '您还未添加该科室!', 'data' => []));
                }
                //查询已有排班
                $paibanList = db('diagnosis_list')->where('member_id = ' . $data['member_id'] . ' AND start_time > ' . time())->field("*")->select();
                //检查是否有时间重叠
                foreach ($paibanList as $val) {
                    if (!($val['end_time'] < $data['start_time'] || $val['start_time'] > $data['end_time'])) {
                        ajaxReturn(array('code' => 0, 'info' => '您的排班时间有重叠!', 'data' => []));
                    }
                }

                //新增排班记录
                $paibanMap['member_id'] = $data['member_id'];
                $paibanMap['hospital_repart_id'] = $data['hospital_repart_id'];
                $paibanMap['start_time'] = $data['start_time'];
                $paibanMap['end_time'] = $data['end_time'];
                $paibanMap['add_date'] = time();
                $paibanMap['release_date'] = time();
                $_identity = db('diagnosis_list')->insert($paibanMap);


                if ($_identity) {
                    Db::commit();
                    ajaxReturn(array('code' => 1, 'info' => 'ok', 'data' => []));
                } else {
                    Db::rollback();
                    ajaxReturn(array('code' => 0, 'info' => '系统繁忙, 稍后再试!', 'data' => []));
                }
            } catch (Exception $e) {
                Db::rollback();
                return false;
            }
        }
    }

    /**
     * @Title: seeDiagnosingList
     * @Description: TODO 医生查看坐诊列表(含所有已过期的)
     */
    public function seeDiagnosingList()
    {
        if ($this->request->isPost()) {
            $data = input('post.');
            $res = checkSign($data);
            if ($res['code'] == 0) {
                ajaxReturn($res);
            }
            if ($data['member_id'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
            }

            //查询医生信息
            $doctorMap['member_id'] = $data['member_id'];
            $memberInfo = db('doctor')->where($doctorMap)->field("*")->find();
            if (empty($memberInfo)) {
                ajaxReturn(array('code' => 0, 'info' => '该用户不存在!', 'data' => []));
            }
            //查询排班列表
            $paibanMap['dl.`member_id`'] = $data['member_id'];
            $paibanList = db('hospital_repart')->alias('hr')
                ->join(['jd_department' => 'd'], 'hr.department_id = d.department_id', 'inner')
                ->join(['jd_hospital' => 'h'], 'hr.hospital_id = h.hospital_id', 'inner')
                ->join(['jd_diagnosis_list' => 'dl'], 'hr.hospital_repart_id = dl.hospital_repart_id', 'inner')
                ->where($paibanMap)
                ->field("dl.diagnosis_id, dl.start_time, dl.end_time, h.hospital_name, d.department_name")
                ->order('dl.start_time DESC')
                ->select();
            foreach ($paibanList as $key => $val) {
                $paibanList[$key]['content'] = date('Y年m月d日 H:i', $val['start_time']) . '-' . date('Y年m月d日 H:i', $val['end_time']);
                if (time() >= $val['start_time']) {
                    $paibanList[$key]['expired'] = 0;
                } else {
                    $paibanList[$key]['expired'] = 1;
                }
            }
            ajaxReturn(array('code' => 1, 'info' => 'ok', 'data' => $paibanList));
        }
    }

    /**
     * @Title: delDiagnosing
     * @Description: TODO 医生删除坐诊信息
     */
    public function delDiagnosing() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['diagnosis_id']=='' || $data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //查询该排班信息
            $map['diagnosis_id'] = $data['diagnosis_id'];
            $map['member_id'] = $data['member_id'];
            $tempInfo = db('diagnosis_list')->where($map)
                ->field("*")
                ->find();
            if (empty($tempInfo)) {
                ajaxReturn(array('code'=>0,'info'=>'该排班信息不存在!','data'=>[]));
            }

            //删除模板
            $_result = db('diagnosis_list')->where($map)->delete();
            if ($_result) {
                ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[]));
            } else {
                ajaxReturn(array('code'=>0, 'info'=>'系统繁忙, 请稍后再试','data'=>[]));
            }
        }
    }
}