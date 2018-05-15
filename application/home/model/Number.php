<?php
namespace app\home\model;

use think\Model;

class Number extends Model
{

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
                'add_date' => time(),
            );
            $_return = db('doctor_member')->insertGetId($member_info);
        }
        return $_return;
    }

}