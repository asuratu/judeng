<?php
namespace app\home\controller;
use app\tools\Html;
use think\Paginator;
use think\Request;
use app\tools\Spell;
use think\Db;

class Home extends Common
{
    /**
     * 查询医生个人中心页面
     */
    public function find()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $doctor = db('doctor')->where("member_id = {$data['doctor_id']}")->field("member_name, true_name, mobile, face_photo as portrait, is_certified")->find();

            $doctor['certified'] = $this->view->setting['aryCertified'][$doctor['is_certified']];
            $doctor['member_name'] = !empty($doctor['true_name']) ? $doctor['true_name'] : (!empty($doctor['member_name']) ? $doctor['member_name'] : $doctor['mobile']);

            // 开方数
            $doctor['prescriptions'] = Db::table('jd_order o, jd_order_prescription op')
                ->where("o.`order_id` = op.`order_id` and o.order_type = 3 and op.`prescription_type` = 0 and o.doctor_id = {$data['doctor_id']}")
                ->count();

            // 患者数
            $doctor['patient'] = Db::table('jd_doctor_member s, jd_member m')
                ->where("s.doctor_id = {$data['doctor_id']} and s.`member_id` = m.`member_id` and (m.`member_name` like '%{$data['title']}%' or m.`true_name` like '%{$data['title']}%' or m.`mobile` like '%{$data['title']}%' or s.`grouping` like '%{$data['title']}%')")
                ->count();

            // 评论数
            $doctor['comment'] = Db::table('jd_service_evaluation s, jd_member m')
                ->where("s.is_show = 1 and s.doctor_id = {$data['doctor_id']} and s.`member_id` = m.`member_id`")
                ->count();

            $con = Model('Setting')->findAdmin();
            $doctor['version_number'] = $con['version_number'];
            $doctor['service_hot'] = $con['service_hot'];
            ajaxReturn(array('code' =>1, 'info' => 'ok','data'=>$doctor));
        }
    }

}
