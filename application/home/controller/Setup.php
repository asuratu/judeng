<?php
namespace app\home\controller;
use app\tools\Html;
use think\Paginator;
use think\Request;
use app\tools\Spell;
use think\Db;

class Setup extends Common
{
    /**
     * 查询在线问诊信息
     */
    public function findInquiry()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $doctor = db('diagnosis_set')->where("member_id = {$data['doctor_id']}")->field('all_open as online_inquiry, love_num as love_inquiry, graphic_speech, image_price as first_price, reimage_price as consultation_price, image_num as receipt')->find();
            if (!$doctor) {
                ajaxReturn(array('code'=>0,'info'=>'医生信息不存在','data'=>[]));
            }

            // 查询后台配置的参数
            $con = Model('Setting')->findAdmin();
            $doctor['first_price'] = $doctor['first_price'] == 0 ? $con['diagnosis_price'] : $doctor['first_price'];
            $doctor['consultation_price'] = $doctor['consultation_price'] == 0 ? $con['revisit_price'] : $doctor['consultation_price'];

            // 查询医生每日接单数量
            $receiptCount = $this->receiptCount($data['doctor_id']);
            $receipt_surplus = $doctor['receipt'] - $receiptCount;
            $receipt_surplus = $receipt_surplus < 0 ? 0 : $receipt_surplus;

            // 页面提示文字
            $doctor['diagnosis_name'] = $con['diagnosis_name'];      // 初诊提示文字
            $doctor['revisit_name'] = $con['revisit_name'];         // 复诊提示文字
            $doctor['receipt_name'] = '今日剩余次数'. $receipt_surplus .'次';         // 接单提示文字 后期处理逻辑

            // 页面选项的最大值
            $doctor['diagnosis_number'] = $con['diagnosis_number'];      // 初诊价格上限
            $doctor['revisit_number'] = $con['revisit_number'];      // 复诊价格上限
            $doctor['receipt_number'] = $con['receipt_number'];      // 接单价格上限
            $doctor['love_number'] = $con['love_number'];      // 爱心数量上限

            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$doctor));
        }
    }

    /**
     * 查询药方及服务设置
     */
    public function findPrescription() {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $doctor = db('doctor')->where("member_id = {$data['doctor_id']}")->field('open_pharmacy, platform_default, inherit, inherit_feature, concealment_number, questions_number')->find();
            if (!$doctor) {
                ajaxReturn(array('code'=>0,'info'=>'医生信息不存在','data'=>[]));
            }
            $doctor['questions_up'] = 2000;
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$doctor));
        }
    }

    // 设置在线问诊信息
    public function updateInquiry() {
        if($this->request->isPost()) {
            $data=input('post.');
//            if($data['doctor_id']==''||$data['online_inquiry']==''||$data['love_inquiry']==''||$data['graphic_speech']==''||$data['first_price']==''||$data['consultation_price']==''||$data['receipt']=='')
//            {
//                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
//            }
            $prescription = array();
            $prescription['all_open'] = $data['online_inquiry'];
            $prescription['love_num'] = $data['love_inquiry'];
            $prescription['graphic_speech'] = $data['graphic_speech'];
            $prescription['image_price'] = $data['first_price'];
            $prescription['reimage_price'] = $data['consultation_price'];
            $prescription['image_num'] = $data['receipt'];
            $prescription['release_date'] = time();
            $doctor = db('diagnosis_set')->where("member_id = {$data['doctor_id']}")->update($prescription);
            if ($doctor) {
                ajaxReturn(array('code'=>1,'info'=>'ok'));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'修改失败'));
            }
        }
    }


    // 设置药方及服务配置
    public function updatePrescription() {
        if($this->request->isPost()) {
            $data=input('post.');
//            if($data['doctor_id']==''||$data['open_pharmacy']==''||$data['platform_default']==''||$data['inherit']==''||$data['inherit_feature']==''||$data['concealment_number']==''||$data['questions_number']=='')
//            {
//                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
//            }
            $prescription = array();
            $prescription['open_pharmacy'] = $data['open_pharmacy'];
            $prescription['platform_default'] = $data['platform_default'];
            $prescription['inherit'] = $data['inherit'];
            $prescription['inherit_feature'] = $data['inherit_feature'];
            $prescription['concealment_number'] = $data['concealment_number'];
            $prescription['questions_number'] = $data['questions_number'];
            $prescription['release_date'] = time();
            $doctor = db('doctor')->where("member_id = {$data['doctor_id']}")->update($prescription);
            if ($doctor) {
                ajaxReturn(array('code'=>1,'info'=>'ok'));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'修改失败'));
            }
        }
    }

    // 测试内部生成医生每日接单次数接口
    public function doctorCount() {
        // 第一个参数医生ID
        $_doctor = Model('Setting')->doctorCount(2);
        if ($_doctor) {
            ajaxReturn(array('code'=>1,'info'=>'ok'));
        } else {
            ajaxReturn(array('code'=>0,'info'=>'修改失败'));
        }
    }

    // 查询今日接单次数
    public function receiptCount($doctorId) {
        return Model('Setting')->receiptCount($doctorId);
    }

}
