<?php
namespace app\home\model;

use think\Model;

class Prescription extends Model
{

    // 添加复诊患者
    public function revisitMember($memberId, $doctorId) {
        $haircount = db('revisit_member')->where("member_id = {$memberId} and doctor_id = {$doctorId}")->count();
        if (!$haircount) {
            $revisit_member = array(
                'member_id' => $memberId,
                'doctor_id' => $doctorId,
                'add_date' => time(),
            );
            $_return = db('revisit_member')->insertGetId($revisit_member);
        } else {
            $_return = 1;
        }
        return $_return;
    }

    // 查询复诊患者数量
    public function revisitMemberCount($memberId, $doctorId) {
        $haircount = db('revisit_member')->where("member_id = {$memberId} and doctor_id = {$doctorId}")->count();
        return $haircount;
    }

}