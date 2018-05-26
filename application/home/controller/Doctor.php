<?php
namespace app\home\controller;
use think\Request;
use app\tools\Html;

class Doctor extends Common
{
    /**
     * @Title:
     * @Description: TODO 医生资料修改
     */
    public function updateData()
    {
        if($this->request->isPost()) {
            $data=input('post.');
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
                $doctor['introduction'] = Html::getTextToHtml($data['content'], 500);
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
        if($data['doctor_id']=='')
        {
            ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
        }
        $doctor = db('doctor')->where("member_id = {$data['doctor_id']}")
            ->field('member_id, member_name, face_photo, goodat_id, introduction')
            ->find();

        // 数据处理 TODO  涂革处理
        $doctor['face_photo'] = $this->view->setting['base_host'] . $doctor['face_photo'];

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
    public function dataPreview() {
        $data=input('post.');
        if($data['doctor_id']=='')
        {
            ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
        }
        $doctor = db('doctor')->where("member_id = {$data['doctor_id']}")
            ->field('member_id, member_name, face_photo, goodat_id, introduction')
            ->find();

        // 数据处理 TODO  涂革处理
        $doctor['face_photo'] = $this->view->setting['base_host'] . $doctor['face_photo'];

        // 查询擅长
        $doctor['goodat_id'] = $this->goodsId($doctor['goodat_id']);

//         查询问诊复诊爱心问诊 TODO  涂革处理

//         查询调制服务包列表 TODO  涂革处理

//         查询坐诊信息 TODO  涂革处理

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
            ->field('s.symptom, s.evaluate, s.evaluate_name, s.synopsis, s.add_date, m.member_name, m.portrait')
            ->select();
        $evaluation = array();
        foreach ($doctorEvaluation as $key => $val) {
            array_push($evaluation, $val);
            $evaluation[$key]['evaluate_name'] = explode('#@#', $val['evaluate_name']);
            $evaluation[$key]['portrait'] = $this->view->setting['base_host'] . $val['portrait'];
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
            if($data['doctor_id']==''||$data['disturb_start']==''|| $data['disturb_end']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $doctor = db('doctor')->where("member_id = {$data['doctor_id']}")->field("member_name, mobile, is_system, device_tokens")->find();
            if (!$doctor) {         // 验证医生信息是否存在，不存在直接退出
                ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
            }

            if ($data['is_type']=='') {
                $data['is_type'] = 0;
            }

            // 查询免打扰这个期间是否有患者咨询过一生
            $umeng = db('doctor_disturbcount')->where("doctor_id = {$data['doctor_id']}")->count();
            if ($umeng) {
                $doctor['member_name'] = $doctor['member_name'] ? $doctor['member_name'] : $doctor['mobile'];
                $data['comment'] = $doctor['member_name'] . '医生，有患者咨询了您，请及时处理。';
                if ($doctor['is_system'] == 0) {     // is_system == 0 为安卓系统
                    Model('Umeng')->PtoAndroid(array($doctor['device_tokens']), $data['comment'], '免打扰期间患者咨询', $data['comment']);
                } else {
                    Model('Umeng')->PtoIos(array($doctor['device_tokens']), $data['comment']);
                }
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
            if($data['doctor_id']==''||$data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            // 查询患者简介信息
            $member = db('member')->where("member_id = {$data['member_id']}")->field("portrait, mobile, true_name, sex, birthday")->find();
            if (!$member) {
                ajaxReturn(array('code'=>0,'info'=>'患者信息不存在','data'=>[]));
            }

            $member['sex'] = $this->view->setting['arySex'][$member['sex']];

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
            $member['token'] = Model('Setting')->huanxin();

            // 查询患者所在分组
            $group = db('doctor_member')->where("doctor_id = {$data['doctor_id']} and member_id = {$data['member_id']}")->field("grouping")->find();

            // 对取到的数据进行处理
            $group_removal = $this->removal($group['grouping']);

            if ($member) {
                db('doctor_member')->where("doctor_id = {$data['doctor_id']} and member_id = {$data['member_id']}")->update(array('is_status' => 0, 'release_date' => time()));
                ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$member,'group_removal'=>$group_removal));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'患者信息不存在','data'=>[]));
            }
        }
    }

    // 设置医生下面的患者已经查看（不做，嵌入在患者档案里面）

    // 咨询查看 患者咨询数量清0
    public function counselling() {
        if($this->request->isPost()) {
            $data=input('post.');
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
