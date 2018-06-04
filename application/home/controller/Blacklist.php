<?php
namespace app\home\controller;
use app\tools\Html;
use think\Paginator;
use think\Request;
use app\tools\Spell;
use think\Db;

class Blacklist extends Common
{
    /**
     * 添加删除黑名单
     */
    public function black()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['doctor_id']==''||$data['member_id']==''||$data['is_type']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            // 执行增删逻辑操作
            $this->addBlacklist($data['doctor_id'], $data['member_id'], $data['is_type']);
        }
    }

    public function addBlacklist($doctor_id, $member_id, $type) {
        $blacklistcount = db('blacklist')->where("doctor_id = {$doctor_id} and member_id = {$member_id} and is_show = {$type}")->count();
        if ($blacklistcount) {
            ajaxReturn(array('code' =>0, 'info' => '请勿重复操作增删黑名单操作'));
        }
        $time = time();
        $blacklistcount = db('blacklist')->where("doctor_id = {$doctor_id} and member_id = {$member_id}")->count();
        if ($blacklistcount) {           // 添加如果查询次数为0 执行添加删除，否则执行修改操作
            $update = array(
                'is_show' => $type,
                'release_date' => $time,
            );
            $_return = db('blacklist')->where("doctor_id = {$doctor_id} and member_id = {$member_id}")->update($update);
        } else {
            if ($type == 0) {            // 0     添加            1 删除
                $blacklist_info = array(
                    'doctor_id' => $doctor_id,
                    'member_id' => $member_id,
                    'is_show' => 0,
                    'add_date' => $time,
                    'release_date' => $time,
                );
                $_return = db('blacklist')->insertGetId($blacklist_info);
            } else {
                $_return = 0;
            }
        }

        if ($_return == 0) {
            ajaxReturn(array('code' =>0, 'info' => '增删黑名单操作失败'));
        } else {
            $member = db('member')->where("member_id={$member_id}")->find();
            $doctor = db('doctor')->where("member_id={$doctor_id}")->find();

            // TODO 未测试
            if ($type == 0) {                        // 0     添加            1 删除
                Model('Setting')->addUserForBlacklist($doctor['member_sn'], array($member['openid']));
            } else {
                Model('Setting')->deleteUserFromBlacklist($doctor['member_sn'], array($member['openid']));
            }

            $update = array(
                'is_show' => $type,
                'release_date' => $time,
            );
            db('doctor_member')->where("doctor_id = {$doctor_id} and member_id = {$member_id}")->update($update);
            db('group_patient')->where("doctor_id = {$doctor_id} and member_id = {$member_id}")->update($update);
            ajaxReturn(array('code' =>1, 'info' => 'ok'));
        }

        return true;
    }

    /**
     * 获取黑名单下的患者列表
     */
    public function allBlacklist()
    {
        if($this->request->isPost()) {
            $data=input('post.');

            if($data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            if (!isset($data['page'])) {
                $data['page'] = 1;
            }
            if (!isset($data['pageSize'])) {
                $data['pageSize'] = 10;
            }
            $data['pageCount'] = ($data['page'] - 1) * $data['pageSize'];
            $comment = Db::field('m.`member_id`, m.`member_name`, m.`true_name`, m.`mobile`, m.`portrait`, m.`sex`, m.`age`')
                ->table('jd_blacklist b, jd_member m')
                ->where("b.doctor_id = {$data['doctor_id']} and b.is_show = 0 and b.`member_id` = m.`member_id`")
                ->order('b.release_date', 'DESC')
                ->limit($data['pageCount'],$data['pageSize'])
                ->select();
            $order = array();
            foreach ($comment as $key => $val) {
                array_push($order, $val);
                $order[$key]['portrait'] = $val['portrait'];
                $order[$key]['member_name'] = !empty($val['true_name']) ? $val['true_name'] : (!empty($val['member_name']) ? $val['member_name'] : $val['mobile']);
            }
            $total = Db::table('jd_blacklist b, jd_member m')
                ->where("b.doctor_id = {$data['doctor_id']} and b.is_show = 0 and b.`member_id` = m.`member_id`")
                ->count();
//            $order['tatal'] = $total;
            ajaxReturn(array('code' =>1, 'info' => 'ok','data'=>$order,'total'=>$total));

        }
    }

}
