<?php
namespace app\home\model;

use think\Model;

class Setting extends Model
{

    public function findAdmin() {
        $con = db('sys_setting')->select();
        $configname = array();
        foreach ($con as $val) {
            $configname[$val['field_name']] = $val['field_desc'];
        }
        return $configname;
    }

    // 增加医生每日接单次数
    public function doctorCount($doctorId) {
        $date = strtotime(date('Y-m-d', time()));
        $count = db('doctor_count')->where("day_date = {$date} and doctor_id = {$doctorId}")->count();
        if ($count) {
            $_return = db('doctor_count')->where("day_date = {$date} and doctor_id = {$doctorId}")->setInc('count');
        } else {
            $count_info = array(
                'doctor_id' => $doctorId,
                'day_date' => $date,
                'count' => 1,
                'add_date' => time(),
            );
            $_return = db('doctor_count')->insertGetId($count_info);
        }
        return $_return;
    }

    // 查询每日医生接单次数
    public function receiptCount($doctorId) {
        $date = strtotime(date('Y-m-d', time()));
        $doctor = db('doctor_count')->where("day_date = {$date} and doctor_id = {$doctorId}")->field('count')->find();
        if ($doctor) {
            return $doctor['count'];
        } else {
            return 0;
        }
    }

}