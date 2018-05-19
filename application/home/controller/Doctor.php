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
            ajaxReturn(array('code'=>1,'info'=>'修改成功','data'=>$doctor, 'notice' => $doctorNotice));
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
            ajaxReturn(array('code'=>1,'info'=>'修改成功','data'=>$doctor, 'evaluation' => $doctorEvaluation, 'notice' => $doctorNotice));
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
}
