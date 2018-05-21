<?php
namespace app\home\model;

use think\Model;

class Number extends Model
{


    // 添加患者
    public function doctorMember($memberId, $doctorId, $inquisitionName) {
        $haircount = db('doctor_member')->where("member_id = {$memberId} and doctor_id = {$doctorId}")->count();
        if ($haircount) {
            $update = array(
                'inquisition_name' => $inquisitionName,
                'inquisition' => time(),
            );
            $_return = db('doctor_member')->where("member_id = {$memberId} and doctor_id = {$doctorId}")->update($update);
        } else {
            $member_info = array(
                'member_id' => $memberId,
                'doctor_id' => $doctorId,
                'inquisition_name' => $inquisitionName,
                'inquisition' => time(),
                'grouping' => '',
                'is_status' => 1,
                'add_date' => time(),
            );
            $_return = db('doctor_member')->insertGetId($member_info);
        }
        return $_return;
    }

    // 咨询时候操作
    public function doctorCounsell($memberId, $doctorId, $inquisitionName = '咨询') {
        $haircount = db('doctor_member')->where("member_id = {$memberId} and doctor_id = {$doctorId}")->count();
        if ($haircount) {
            $_return = db('doctor_member')->where("member_id = {$memberId} and doctor_id = {$doctorId}")->setInc('counsell_number', 1);
        } else {
            $member_info = array(
                'member_id' => $memberId,
                'doctor_id' => $doctorId,
                'inquisition_name' => $inquisitionName,
                'inquisition' => time(),
                'grouping' => '',
                'is_status' => 1,
                'is_chat' => 0,
                'counsell_number' => 1,
                'add_date' => time(),
            );
            $_return = db('doctor_member')->insertGetId($member_info);
        }
        return $_return;
    }

}