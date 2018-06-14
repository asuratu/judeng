<?php
namespace app\home\controller;
use app\tools\Html;
use think\Model;
use think\Paginator;
use think\Request;
use app\tools\Spell;
use think\Db;

class Umeng extends Common
{

    /**
     * umeng 添加用户的umeng 唯一设备号
     */
    public function add() {
        if($this->request->isPost()) {
            $data = input('post.');
            if ($data['member_id'] == '' || $data['member_id'] == '' || $data['comment'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
            }
        }
    }

    /**
     * umeng 推
     */
    public function send()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['doctor_id']==''||$data['member_id']==''||$data['comment']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            // 查询医生消息
            $doctor = db('doctor')->where("member_id = {$data['doctor_id']}")->field("is_system, device_tokens, disturb_start, disturb_end")->find();
            if (!$doctor) {         // 验证医生信息是否存在，不存在直接退出
                ajaxReturn(array('code'=>0,'info'=>'ok','data'=>[]));
            }

            $data['comment'] = Html::getTextToHtml($data['comment'], 20);

            // 医生咨询消息加一（有择自增，没有则添加）
            Model('Number')->doctorCounsell($data['member_id'], $data['doctor_id']);

            if ($doctor['device_tokens'] == '') {           // 如果设备唯一号不存在，直接退出
                ajaxReturn(array('code'=>0,'info'=>'ok','data'=>[]));
            }

            // 判断是否推送友盟消息  判断方法(医生是否把这个患者设成黑名单，是否在这个时间段设置成免打扰)
            $time = time();
            $disturb_start = strtotime(date('Y-m-d', $time)) + $doctor['disturb_start'];
            $disturb_end = strtotime(date('Y-m-d', $time)) + $doctor['disturb_end'];
            if ($time < $disturb_start || $time > $disturb_end) {         //
                $counsell = db('doctor_member')->where("doctor_id = {$data['doctor_id']} and member_id = {$data['member_id']}")->field("is_chat, is_show")->find();
                if (!$counsell) { // 如果不存在 则直接退出
                    ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
                }
                if ($counsell['is_chat'] == 1 || $counsell['is_show'] == 0) {       // 如果这个患者是不显示的（黑名单患者）或者医生正在聊天状态，不推送消息
                    db('doctor_member')->where("doctor_id = {$data['doctor_id']} and member_id = {$data['member_id']}")->update(array('counsell_number' => 0));
                    ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
                }

                // 下面执行推送
                if ($doctor['is_system'] == 0) {     // is_system == 0 为安卓系统
                    Model('Umeng')->PtoAndroid(array($doctor['device_tokens']), $data['comment'], '患者咨询', $data['comment']);
                } else {
                    Model('Umeng')->PtoIos(array($doctor['device_tokens']), $data['comment']);
                }
                ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));

            } else {                   // 如果是免打扰时间段就不进行友盟推送
                // 免打扰时间段，用户发送消息后执行关闭免打扰后友盟推送表加一
                $this->addDisturbcount($data['doctor_id']);
                ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
            }

        }
    }

    // 添加关闭免打扰后执行的友盟操作的次数
    public function addDisturbcount($doctor_id) {
        $haircount = db('doctor_disturbcount')->where("doctor_id = {$doctor_id}")->count();
        if ($haircount) {
            db('doctor_disturbcount')->where("doctor_id = {$doctor_id}")->setInc('disturb_count',1);
        } else {
            $hair_info = array(
                'doctor_id' => $doctor_id,
                'disturb_count' => 1,
                'add_date' => time(),
            );
            db('doctor_disturbcount')->insert($hair_info);
        }
        return true;
    }

    public function addPatient(){
        header("Access-Control-Allow-Origin:*");
        /*星号表示所有的域都可以接受，*/
        header("Access-Control-Allow-Methods:GET,POST");
        if($this->request->isPost()) {
            $data = input('post.');

            // 医生患者列表，有则修改，没有择添加
            Model('Number')->doctorCounsell($data['member_id'], $data['doctor_id'], '咨询');

            $counsell = db('doctor_member')->where("doctor_id = {$data['doctor_id']} and member_id = {$data['member_id']}")->field("is_chat, is_show")->find();
            if (!$counsell) { // 如果不存在 则直接退出
                ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
            }
            if ($counsell['is_chat'] == 1 || $counsell['is_show'] == 0) {       // 如果这个患者是不显示的（黑名单患者）或者医生正在聊天状态，不推送消息
                db('doctor_member')->where("doctor_id = {$data['doctor_id']} and member_id = {$data['member_id']}")->update(array('counsell_number' => 0));
                ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
            }
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
        }
    }

}
