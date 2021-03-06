<?php
namespace app\home\model;

use think\Model;

class Setting extends Model
{

    public function findAdmin() {
        $con = db('sys_setting')->select();
        $configname = array();
        foreach ($con as $val) {
            $configname[$val['field_name']] = $val['synopsis'];
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

    // 获取环信token
    public function huanxin() {
        //获取环信token
        import('Easemob', EXTEND_PATH);

        $options['client_id'] = config('client_id');
        $options['client_secret'] = config('client_secret');
        $options['org_name'] = config('org_name');
        $options['app_name'] = config('app_name');

        $h=new \Easemob($options);
        return $h->getToken();
    }

    // 往黑名单中加人
    public function addUserForBlacklist($username,$usernames) {
        //获取环信token
        import('Easemob', EXTEND_PATH);

        $options['client_id'] = config('client_id');
        $options['client_secret'] = config('client_secret');
        $options['org_name'] = config('org_name');
        $options['app_name'] = config('app_name');

        $h=new \Easemob($options);
        return $h->addUserForBlacklist($username,$usernames);
    }


    public function getBlacklist($username) {
        //获取环信token
        import('Easemob', EXTEND_PATH);

        $options['client_id'] = config('client_id');
        $options['client_secret'] = config('client_secret');
        $options['org_name'] = config('org_name');
        $options['app_name'] = config('app_name');

        $h=new \Easemob($options);
        return $h->getBlacklist($username);
    }

    // 从黑名单中减人
    public function deleteUserFromBlacklist($username,$usernames) {
        //获取环信token
        import('Easemob', EXTEND_PATH);

        $options['client_id'] = config('client_id');
        $options['client_secret'] = config('client_secret');
        $options['org_name'] = config('org_name');
        $options['app_name'] = config('app_name');

        $h=new \Easemob($options);
        return $h->deleteUserFromBlacklist($username,$usernames);
    }

}