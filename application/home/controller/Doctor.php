<?php
namespace app\home\controller;

use think\Request;
use app\tools\Html;
use think\Db;

class Doctor extends Common
{

    // 退出修改医生登录状态
    public function signOut()
    {
        if ($this->request->isPost()) {
            $data = input('post.');
            $res = checkSign($data);
            if ($res['code'] == 0) {
                ajaxReturn($res);
            }
            if ($data['doctor_id'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
            }
            $doctor = array(
                'doctor_id' => $data['doctor_id'],
                'is_login' => 0,
                'release_date' => time(),
            );
            db('doctor')->insert($doctor);
            ajaxReturn(array('code' => 1, 'info' => 'ok', 'data' => []));
        }
    }

    // type 0 咨询回复提醒
    // 医生操作发送给患者
    public function sendMember() {
        $data=input('post.');
        $res = checkSign($data);
        if ($res['code'] == 0) {
            ajaxReturn($res);
        }
        if($data['doctor_id']==''||$data['member_id']=='')
        {
            ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
        }
        $doctor = db('doctor')->where("member_id={$data['doctor_id']}")->find();
        $member = db('member')->field('member_name, mobile, openid, is_type')->where("member_id={$data['member_id']}")->find();
        $sendHair['doctor_name'] = $doctor['true_name'];
        $sendHair['hospital'] = '小橘灯中医';
        $sendHair['content'] = $doctor['true_name'] . '医生回复了您的消息，请尽快查看';
        $sendHair['remark'] = '点击这里进入医生咨询聊天界面';
        $sendHair['url'] = 'http://wechat.bohetanglao.com/home/advise/chat/memberid/' . $data['doctor_id'] . '/type/0.html';
        $sendHair['first'] = $sendHair['doctor_name'] . '医生:我回复了您的咨询,请及时查看';
        $sendHair['openid'] = $member['openid'];
        if ($member['is_type'] == 0) {
            Model('Weixin')->messageTemplate(2, $sendHair);
        }
        ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
    }

    /**
     * @Title:
     * @Description: TODO 医生资料修改
     */
    public function updateData()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            $res = checkSign($data);
            if ($res['code'] == 0) {
                ajaxReturn($res);
            }
            if($data['content']==''||$data['is_type']==''|| $data['doctor_id']=='')
            {
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $doctor = array();
            $doctor['member_id'] = $data['doctor_id'];
            $doctor['release_date'] = time();
            if ($data['is_type'] == 0) {       // 0 擅长修改 1 简介修改
                $data['content'] = trim($data['content'], ',');
                $this->countGood($data['content']);
                $doctor['goodat_id'] = $data['content'];
            } else {
                $doctor['introduction'] = Html::getTextToHtml($data['content'], 450);
            }

            $return = db('doctor')->update($doctor);
            if ($return) {
                ajaxReturn(array('code'=>1,'info'=>'修改成功','data'=>[]));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'修改失败','data'=>[]));
            }
        }
    }

    public function countGood($goodId) {
        $goodSum = 15;
        $good_id = explode(',', $goodId);
        if (count($good_id) > $goodSum) {
            ajaxReturn(array('code'=>0,'info'=>'最多只可以选择' . $goodSum . '个'));
        }
        return true;
    }

    // 我的医馆
    public function findData() {
        $data=input('post.');
        $res = checkSign($data);
        if ($res['code'] == 0) {
            ajaxReturn($res);
        }
        if($data['doctor_id']=='')
        {
            ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
        }
        $doctor = db('doctor')->where("member_id = {$data['doctor_id']}")
            ->field('member_id, true_name, title_str, inherit, school_str, face_photo, goodat_id, introduction, hospital_id')
            ->find();

        //是否显示流派
        if ($doctor['inherit'] && !empty($doctor['school_str'])) {
            $doctor['school_str'] = db('school')
                ->where("school_id IN({$doctor['school_str']}) AND is_display = 1")
                ->field('school_name')
                ->select();
        } else {
            $doctor['school_str'] = array();
        }
        //第一医疗机构
        $hospital = db('hospital')->where("hospital_id = {$doctor['hospital_id']}")
            ->field('hospital_name')
            ->find();
        $doctor['hospital_name'] = $hospital['hospital_name'];

        // 查询擅长
        $doctor['goodat_id'] = $this->goodsId($doctor['goodat_id']);

        // 查询公告管理
        $doctorNotice = $this->noticeList($data['doctor_id']);
        if ($doctor) {
            $doctor['notice'] = $doctorNotice;
            ajaxReturn(array('code'=>1,'info'=>'修改成功','data'=>$doctor));
        } else {
            ajaxReturn(array('code'=>0,'info'=>'数据错误'));
        }
    }


    // 资料预览
//    public function dataPreview1() {
//        $data=input('post.');
//        if($data['doctor_id']=='')
//        {
//            ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
//        }
//        $doctor = db('doctor')->where("member_id = {$data['doctor_id']}")
//            ->field('member_id, true_name, face_photo, goodat_id, introduction, recom, is_clinic, hospital_id, hospital_repart_str, school_str, inherit, title_str, graphic_speech, love_inquiry, concealment_number, online_inquiry,first_price,consultation_price')
//            ->find();
//
//        $diagnosis_set = db('diagnosis_set')->where("member_id = {$data['doctor_id']}")
//            ->find();
//        $doctor['graphic_speech'] = $diagnosis_set['graphic_speech'];
//        $doctor['online_inquiry'] = $diagnosis_set['all_open'];
//        $doctor['first_price'] = $diagnosis_set['image_price'];
//        $doctor['consultation_price'] = $diagnosis_set['reimage_price'];
//        $doctor['love_inquiry'] = $diagnosis_set['love_num'];
//
//        //是否显示流派
//        if ($doctor['inherit']) {
//            $doctor['school_str'] = db('school')
//                ->where("school_id IN({$doctor['school_str']}) AND is_display = 1")
//                ->field('school_name')
//                ->select();
//        } else {
//            $doctor['school_str'] = array();
//        }
//        //第一医疗机构
//        $hospital = db('hospital')->where("hospital_id = {$doctor['hospital_id']}")
//            ->field('hospital_name')
//            ->find();
//        $doctor['hospital_name'] = $hospital['hospital_name'];
//
//        //第一科室
//        if ($doctor['hospital_repart_str']) {
//            $keshiArr = db('hospital_repart')->alias('hr')
//                ->join(['jd_department'=>'d'], 'd.department_id = hr.department_id' , 'inner')
//                ->where("hr.hospital_repart_id IN({$doctor['hospital_repart_str']}) AND hr.is_show = 1")
//                ->field("d.department_name")
//                ->select();
////            $doctor['department_name'] = $keshiArr[0];
//            $doctor['department_name'] = $keshiArr[0];
//        } else {
//            $doctor['department_name'] = array('department_name'=>'');
//        }
//        $doctor['department_name'] = json_encode($doctor['department_name']);
//
//        //是否有自建特色方剂
//        $existGoods = db('self_goods')
//            ->where("member_id = {$data['doctor_id']} AND content != '' AND is_checked = 2 ")
//            ->field('self_goods_id')
//            ->count();
//        $existGoods > 0 ? $doctor['has_self_goods'] = 1 : $doctor['has_self_goods'] = 0;
//        //付款人数
//        $doctor['payNum'] = db('order')
//            ->where("pay_status = 2 AND doctor_id = {$data['doctor_id']}")
//            ->field('distinct(patient_id)')
//            ->count();
//        //是否开启爱心问诊
//
//        //是否开启线上复诊
//
//        //是否开启图文咨询
//
//         //查询调制服务包列表
//        $doctor['selfGoodsList'] = db('self_goods')
//            ->where("member_id = {$data['doctor_id']} AND is_checked = 2 ")
//            ->field('self_goods_id, inherit_id, content, self_goods_name, advantage, price')
//            ->select();
//
//        foreach ($doctor['selfGoodsList'] as $key => $value) {
//            $doctor['selfGoodsList'][$key]['content'] = base64_encode($value['content']);
//        }
//
//        $doctor['is_self_drug'] = $doctor['content'] != '' ? 1 : 0;
//        $doctor['is_inherit'] = $doctor['inherit_id'] != 0 ? 1 : 0;
//
//        //查询坐诊信息
//        $paibanMap['dl.`member_id`'] = $data['doctor_id'];
//        $paibanList = db('hospital_repart')->alias('hr')
//            ->join(['jd_department' => 'd'], 'hr.department_id = d.department_id', 'inner')
//            ->join(['jd_hospital' => 'h'], 'hr.hospital_id = h.hospital_id', 'inner')
//            ->join(['jd_diagnosis_list' => 'dl'], 'hr.hospital_repart_id = dl.hospital_repart_id', 'inner')
//            ->where("dl.`member_id` = {$data['doctor_id']} AND hr.is_show = 1 AND dl.start_time > ".time() )
//            ->field("dl.diagnosis_id, dl.start_time, dl.end_time, h.hospital_name, d.department_name")
//            ->order('dl.start_time DESC')
//            ->select();
//        foreach ($paibanList as $key => $val) {
//            $paibanList[$key]['content'] = date('Y年m月d日 H:i', $val['start_time']) . '-' . date('Y年m月d日 H:i', $val['end_time']);
//            if (time() >= $val['start_time']) {
//                $paibanList[$key]['expired'] = 0;
//            } else {
//                $paibanList[$key]['expired'] = 1;
//            }
//        }
//        $doctor['paiban'] = $paibanList;
//        // 查询擅长
//        $doctor['goodat_id'] = $this->goodsId($doctor['goodat_id']);
//
//        // 查询评价列表
//        $doctorEvaluation = $this->evaluationList($data['doctor_id']);
//        // 查询公告管理
//        $doctorNotice = $this->noticeList($data['doctor_id']);
//        if ($doctor) {
//            $doctor['evaluation'] = $doctorEvaluation;
//            $doctor['notice'] = $doctorNotice;
//
////        var_dump($doctor);die;
//            ajaxReturn(array('code'=>1,'info'=>'修改成功','data'=>$doctor));
//        } else {
//            ajaxReturn(array('code'=>0,'info'=>'数据错误'));
//        }
//    }

    public function dataPreview2() {
        $data=input('post.');
        $res = checkSign($data);
        if ($res['code'] == 0) {
            ajaxReturn($res);
        }
        if($data['doctor_id']=='')
        {
            ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
        }
        $doctor = db('doctor')->where("member_id = {$data['doctor_id']}")
            ->field('member_id, true_name, face_photo, goodat_id, introduction, recom, is_clinic, hospital_id, hospital_repart_str, school_str, inherit, title_str, graphic_speech, love_inquiry, concealment_number, online_inquiry,first_price,consultation_price')
            ->find();

        $diagnosis_set = db('diagnosis_set')->where("member_id = {$data['doctor_id']}")
            ->find();
        $doctor['graphic_speech'] = $diagnosis_set['graphic_speech'];
        $doctor['online_inquiry'] = $diagnosis_set['all_open'];
        $doctor['first_price'] = $diagnosis_set['image_price'];
        $doctor['consultation_price'] = $diagnosis_set['reimage_price'];
        $doctor['love_inquiry'] = $diagnosis_set['love_num'];

        //是否显示流派
        if ($doctor['inherit'] && $doctor['school_str']) {
            $doctor['school_str'] = db('school')
                ->where("school_id IN({$doctor['school_str']}) AND is_display = 1")
                ->field('school_name')
                ->select();
        } else {
//            $doctor['school_str'] = '';
            $doctor['school_str'] = array('school_name'=>'');
        }

        //第一医疗机构
        $hospital = db('hospital')->where("hospital_id = {$doctor['hospital_id']}")
            ->field('hospital_name')
            ->find();
        $doctor['hospital_name'] = $hospital['hospital_name'];

        //第一科室
        if ($doctor['hospital_repart_str']) {
            $keshiArr = db('hospital_repart')->alias('hr')
                ->join(['jd_department'=>'d'], 'd.department_id = hr.department_id' , 'inner')
                ->where("hr.hospital_repart_id IN({$doctor['hospital_repart_str']}) AND hr.is_show = 1")
                ->field("d.department_name")
                ->select();
            $doctor['department_name'] = $keshiArr[0];
        } else {
            $doctor['department_name'] = array('department_name'=>'');
        }

        //是否有自建特色方剂
        $existGoods = db('self_goods')
            ->where("member_id = {$data['doctor_id']} AND content != '' AND is_checked = 2 ")
            ->field('self_goods_id')
            ->count();
        $existGoods > 0 ? $doctor['has_self_goods'] = 1 : $doctor['has_self_goods'] = 0;
        //付款人数
        $doctor['payNum'] = db('order')
            ->where("pay_status = 2 AND doctor_id = {$data['doctor_id']}")
            ->field('distinct(patient_id)')
            ->count();
        //是否开启爱心问诊

        //是否开启线上复诊

        //是否开启图文咨询

        //查询调制服务包列表
        $doctor['selfGoodsList'] = db('self_goods')
            ->where("member_id = {$data['doctor_id']} AND is_checked = 2 ")
            ->field('self_goods_id, inherit_id, content, self_goods_name, advantage, price')
            ->select();

        foreach ($doctor['selfGoodsList'] as $key => $value) {
            $doctor['selfGoodsList'][$key]['content'] = base64_encode($value['content']);
        }

        $doctor['is_self_drug'] = $doctor['content'] != '' ? 1 : 0;
        $doctor['is_inherit'] = $doctor['inherit_id'] != 0 ? 1 : 0;

        //查询坐诊信息
        $paibanMap['dl.`member_id`'] = $data['doctor_id'];
        $paibanList = db('hospital_repart')->alias('hr')
            ->join(['jd_department' => 'd'], 'hr.department_id = d.department_id', 'inner')
            ->join(['jd_hospital' => 'h'], 'hr.hospital_id = h.hospital_id', 'inner')
            ->join(['jd_diagnosis_list' => 'dl'], 'hr.hospital_repart_id = dl.hospital_repart_id', 'inner')
            ->where("dl.`member_id` = {$data['doctor_id']} AND hr.is_show = 1 AND dl.start_time > ".time() )
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
        $doctor['paiban'] = $paibanList;
        // 查询擅长
        $doctor['goodat_id'] = $this->goodsId($doctor['goodat_id']);

        // 查询评价列表
        $doctorEvaluation = $this->evaluationList($data['doctor_id']);
        // 查询公告管理
        $doctorNotice = $this->noticeList($data['doctor_id']);
        if ($doctor) {
            $doctor['evaluation'] = $doctorEvaluation;
            $doctor['notice'] = $doctorNotice;
            ajaxReturn(array('code'=>1,'info'=>'修改成功','data'=>$doctor));
        } else {
            ajaxReturn(array('code'=>0,'info'=>'数据错误'));
        }
    }

    public function dataPreview() {
        $data=input('post.');
        if($data['doctor_id']=='')
        {
            ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
        }
        $doctor = db('doctor')->where("member_id = {$data['doctor_id']}")
            ->field('member_id, true_name, face_photo, goodat_id, introduction, recom, is_clinic, hospital_id, hospital_repart_str, school_str, inherit, title_str, graphic_speech, love_inquiry, concealment_number, online_inquiry,first_price,consultation_price')
            ->find();

        $diagnosis_set = db('diagnosis_set')->where("member_id = {$data['doctor_id']}")
            ->find();
        $doctor['graphic_speech'] = $diagnosis_set['graphic_speech'];
        $doctor['online_inquiry'] = $diagnosis_set['all_open'];
        $doctor['first_price'] = $diagnosis_set['image_price'];
        $doctor['consultation_price'] = $diagnosis_set['reimage_price'];
        $doctor['love_inquiry'] = $diagnosis_set['love_num'];

        //是否显示流派
        if ($doctor['inherit'] && $doctor['school_str']) {
            $doctor['school_str'] = db('school')
                ->where("school_id IN({$doctor['school_str']}) AND is_display = 1")
                ->field('school_name')
                ->select();
        } else {
            $doctor['school_str'] = array();
        }
        //第一医疗机构
        $hospital = db('hospital')->where("hospital_id = {$doctor['hospital_id']}")
            ->field('hospital_name')
            ->find();
        $doctor['hospital_name'] = $hospital['hospital_name'];

        //第一科室
        if ($doctor['hospital_repart_str']) {
            $keshiArr = db('hospital_repart')->alias('hr')
                ->join(['jd_department'=>'d'], 'd.department_id = hr.department_id' , 'inner')
                ->where("hr.hospital_repart_id IN({$doctor['hospital_repart_str']}) AND hr.is_show = 1")
                ->field("d.department_name")
                ->select();
            $doctor['department_name'] = $keshiArr[0];
        } else {
            $doctor['department_name'] = '';
        }

        //是否有自建特色方剂
        $existGoods = db('self_goods')
            ->where("member_id = {$data['doctor_id']} AND content != '' AND is_checked = 2 ")
            ->field('self_goods_id')
            ->count();
        $existGoods > 0 ? $doctor['has_self_goods'] = 1 : $doctor['has_self_goods'] = 0;
        //付款人数
        $doctor['payNum'] = db('order')
            ->where("pay_status = 2 AND doctor_id = {$data['doctor_id']}")
            ->field('distinct(patient_id)')
            ->count();
        //是否开启爱心问诊

        //是否开启线上复诊

        //是否开启图文咨询

        //查询调制服务包列表
        $doctor['selfGoodsList'] = db('self_goods')
            ->where("member_id = {$data['doctor_id']} AND is_checked = 2 ")
            ->field('self_goods_id, inherit_id, content, self_goods_name, advantage, price')
            ->select();

        foreach ($doctor['selfGoodsList'] as $key => $value) {
            $doctor['selfGoodsList'][$key]['content'] = base64_encode($value['content']);
        }

        $doctor['is_self_drug'] = $doctor['content'] != '' ? 1 : 0;
        $doctor['is_inherit'] = $doctor['inherit_id'] != 0 ? 1 : 0;

        //查询坐诊信息
        $paibanMap['dl.`member_id`'] = $data['doctor_id'];
        $paibanList = db('hospital_repart')->alias('hr')
            ->join(['jd_department' => 'd'], 'hr.department_id = d.department_id', 'inner')
            ->join(['jd_hospital' => 'h'], 'hr.hospital_id = h.hospital_id', 'inner')
            ->join(['jd_diagnosis_list' => 'dl'], 'hr.hospital_repart_id = dl.hospital_repart_id', 'inner')
            ->where("dl.`member_id` = {$data['doctor_id']} AND hr.is_show = 1 AND dl.start_time > ".time() )
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
        $doctor['paiban'] = $paibanList;
        // 查询擅长
        $doctor['goodat_id'] = $this->goodsId($doctor['goodat_id']);

        // 查询评价列表
        $doctorEvaluation = $this->evaluationList($data['doctor_id']);
        // 查询公告管理
        $doctorNotice = $this->noticeList($data['doctor_id']);
        if ($doctor) {
            $doctor['evaluation'] = $doctorEvaluation;
            $doctor['notice'] = $doctorNotice;
            ajaxReturn(array('code'=>1,'info'=>'修改成功','data'=>$doctor));
        } else {
            ajaxReturn(array('code'=>0,'info'=>'数据错误'));
        }
    }

    // 医生公告列表获取
    public function noticeList($doctorId) {
        $doctorNotice = db('notice')->where("doctor_id = {$doctorId}")->field('notice_id, notice_name, add_date')->select();
        $notice = array();
        foreach ($doctorNotice as $key => $val) {
            array_push($notice, $val);
            $notice[$key]['notice_name'] = $val['notice_name'];
            $notice[$key]['add_date'] = date('Y-m-d', $val['add_date']);
        }
        return $notice;
    }

    // 医生服务评价列表
    public function evaluationList($doctorId) {
        $doctorEvaluation = db('service_evaluation s, jd_member m')
            ->where("s.doctor_id = {$doctorId} and s.`is_show` = 1 and s.`member_id` = m.`member_id`")
            ->field('s.symptom, s.evaluate, s.evaluate_name, s.synopsis, s.add_date, m.member_name, m.true_name, m.mobile, m.portrait')
            ->select();
        $evaluation = array();
        foreach ($doctorEvaluation as $key => $val) {
            array_push($evaluation, $val);
            $evaluation[$key]['evaluate_name'] = explode('#@#', $val['evaluate_name']);
//            $evaluation[$key]['portrait'] = 'http://wechat.bohetanglao.com/uploads/avatar/' . $val['portrait'];
            $evaluation[$key]['member_name'] = !empty($val['true_name']) ? $val['true_name'] : (!empty($val['member_name']) ? $val['member_name'] : $val['mobile']);
            $evaluation[$key]['add_date'] = date('Y-m-d', $val['add_date']);
        }
        return $evaluation;
    }

    // 查询擅长
    public function goodsId($goodsId) {
        $goodsId = db('goodat')
            ->where('goodat_id', 'in', $goodsId)
            ->where('is_show = 1 and level = 2')
            ->order('sort', 'DESC')
            ->select();
        $good = '';
        foreach ($goodsId as $val) {
            $good .= $val['goodat_name'] . '、';
        }
        $good = trim($good, '、');
        return $good;
    }

    // 获取医生手机是苹果还是安卓，保存设备号


    // 设置免打扰时间 保存时间戳
    public function disturb() {
        if($this->request->isPost()) {
            $data=input('post.');
            $res = checkSign($data);
            if ($res['code'] == 0) {
                ajaxReturn($res);
            }
            if($data['doctor_id']==''||$data['disturb_start']==''|| $data['disturb_end']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $doctor = db('doctor')->where("member_id = {$data['doctor_id']}")->field("member_name, true_name, mobile, is_system, device_tokens")->find();
            if (!$doctor) {         // 验证医生信息是否存在，不存在直接退出
                ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
            }

            if ($data['is_type']=='') {
                $data['is_type'] = 0;
            }

            // 删除免打扰期间患者咨询的次数
            db('doctor_disturbcount')->where("doctor_id = {$data['doctor_id']}")->delete();

            // 处理时间
            $date = date('Y-m-d', time());
            $strdate = strtotime($date);
            $startdate = $date . $data['disturb_start'] . ':00';
            $enddate = $date . $data['disturb_end'] . ':00';
            $start = strtotime($startdate) - $strdate;
            $end = strtotime($enddate) - $strdate;
            if ($start > $end) {
                $start = $start - 86400;
//                $end = $end + 86400;
            }

            if ($data['is_type'] == 1) {
                $start = 0;
                $end = 0;
            }

            $doctor = array(
                'member_id' => $data['doctor_id'],
                'disturb_start' => $start,
                'disturb_end' => $end,
                'release_date' => time(),
            );

            $return = db('doctor')->update($doctor);
            if ($return) {
                ajaxReturn(array('code'=>1,'info'=>'修改成功','data'=>[]));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'修改失败','data'=>[]));
            }
        }
    }

    // 医生查看患者档案
    public function patientFile() {
        if($this->request->isPost()) {
            $data=input('post.');
            $res = checkSign($data);
            if ($res['code'] == 0) {
                ajaxReturn($res);
            }            if($data['doctor_id']==''||$data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            // 查询患者简介信息
            $member = db('member')->where("member_id = {$data['member_id']}")->field("portrait, mobile, true_name, sex, birthday")->find();
            if (!$member) {
                ajaxReturn(array('code'=>0,'info'=>'患者信息不存在','data'=>[]));
            }

            $member['sex'] = $this->view->setting['arySex'][$member['sex']];
//            $member['portrait'] = 'http://wechat.bohetanglao.com/uploads/avatar/' . $member['portrait'];

            $member_info = db('member_info')->where("member_id = {$data['member_id']}")->field("allergy, medical, habit, other_habit")->find();
            if ($member_info) {
                $member['allergy'] = $member_info['allergy'];
                $member['medical'] = $member_info['medical'];
                $member['habit'] = $this->removal($member_info['habit']);
                $member['other_habit'] = $member_info['other_habit'];
            } else {
                $member['allergy'] = '无';
                $member['medical'] = '无';
                $member['habit'] = array();
                $member['other_habit'] = '无';
            }
//            $member['token'] = Model('Setting')->huanxin();

            // 查询患者所在分组
            $group = db('doctor_member')->where("doctor_id = {$data['doctor_id']} and member_id = {$data['member_id']}")->field("grouping")->find();

            // 对取到的数据进行处理
            $group_removal = $this->removal($group['grouping']);
            $member['group_removal'] = $group_removal;

            if ($member) {
                db('doctor_member')->where("doctor_id = {$data['doctor_id']} and member_id = {$data['member_id']}")->update(array('is_status' => 0, 'release_date' => time()));
                ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$member));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'患者信息不存在','data'=>[]));
            }
        }
    }

    // 患者历史病例列表
    public function praintCase() {
        if($this->request->isPost()) {
            $data=input('post.');
            $res = checkSign($data);
            if ($res['code'] == 0) {
                ajaxReturn($res);
            }
            if($data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            if (!isset($data['page'])) {
                $data['page'] = 1;
            }
            if (!isset($data['pageSize'])) {
                $data['pageSize'] = 10;
            }
            $data['pageCount'] = ($data['page'] - 1) * $data['pageSize'];
            $member = Db::field('op.`dialectical`,op.`drug_str`,op.`add_date`,d.`member_name`,d.`true_name`,d.`mobile`,d.`title_str`,op.`order_id`, o.`doctor_id`, o.`patient_id`')
                ->table('jd_order o, jd_order_prescription op, jd_doctor d')
                ->where("o.patient_id = {$data['member_id']} and o.`order_id` = op.`order_id` and o.order_type = 3 and o.`doctor_id` = d.`member_id` and op.`prescription_type` != 1")
                ->order('op.add_date', 'DESC')
                ->limit($data['pageCount'],$data['pageSize'])
                ->select();
            $order = array();
            foreach ($member as $key => $val) {
                array_push($order, $val);
                $order[$key]['drug_str'] = base64_encode($val['drug_str']);
                $order[$key]['member_name'] = !empty($val['true_name']) ? $val['true_name'] : (!empty($val['member_name']) ? $val['member_name'] : $val['mobile']);
                $order[$key]['add_date'] = date('Y-m-d H:i', $val['add_date']);
                $order[$key]['order_id'] = $val['order_id'] ?: 0;
                $order[$key]['patient_id'] = $val['patient_id'] ?: 0;
                $order[$key]['doctor_id'] = $val['doctor_id'] ?: 0;
            }
            $total = Db::table('jd_order o, jd_order_prescription op, jd_doctor d')
                ->where("o.patient_id = {$data['member_id']} and o.`order_id` = op.`order_id` and o.order_type = 3 and o.`doctor_id` = d.`member_id` and op.`prescription_type` != 1")
                ->count();

            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$order,'total'=>$total));
        }
    }

    // 设置医生下面的患者已经查看（不做，嵌入在患者档案里面）

    // 咨询查看 患者咨询数量清0
    public function counselling() {
        if($this->request->isPost()) {
            $data=input('post.');
            $res = checkSign($data);
            if ($res['code'] == 0) {
                ajaxReturn($res);
            }
            if($data['doctor_id']==''||$data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            db('doctor_member')->where("doctor_id = {$data['doctor_id']} and member_id = {$data['member_id']}")->update(array('counsell_number' => 0, 'release_date' => time()));
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
        }
    }

    // 查询咨询，患者的未读数量
    public function counsellNumber() {
        if($this->request->isPost()) {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $doctor = db('doctor_member')->where("doctor_id = {$data['doctor_id']}")->field("sum(is_status) as patient, sum(counsell_number) as counsell")->find();
            if (!$doctor) {
                $doctor = array();
                $doctor['patient'] = (string)0;
                $doctor['counsell'] = (string)0;
            }
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$doctor));
        }
    }

    // 设置正在聊天中，设置退出聊天中
    public function chat() {
        if($this->request->isPost()) {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['doctor_id']==''||$data['member_id']==''||$data['is_chat']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            db('doctor_member')->where("doctor_id = {$data['doctor_id']} and member_id = {$data['member_id']}")->update(array('is_chat' => $data['is_chat'], 'release_date' => time()));
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
        }
    }


    public function removal($group) {
        if (!$group) {
            $group = '';
        }
        $group = explode(',', $group);
        $group_removal = array();
        foreach ($group as $val) {
            if ($val != '') {
                $group_removal[] = $val;
            }
        }
        return $group_removal;
    }
}
