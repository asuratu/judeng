<?php
namespace app\home\controller;

use app\tools\Html;
use app\tools\Spell;
use think\Db;

class Remind extends Common
{

    /**
     * 提醒购药
     */
    public function medicine()
    {
        if($this->request->isPost()) {
            $data=input('post.');

            if($data['order_id']==''||$data['order_id']== '')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            // 查询这个订单提醒次数是否用完
            $medicineCount = $this->medicineCount($data['doctor_id'], $data['order_id']);
            if ($medicineCount['daycount'] == 0) {
                ajaxReturn(array('code' =>0, 'info' => '此订单今日购药提醒次数已经用完'));
            }

            $member = db('order')
                ->alias('o')
                ->join('member m', 'o.`patient_id` = m.`member_id`', 'LEFT')
                ->where("o.order_id = {$data['order_id']}")
                ->field("m.`member_name`, m.`openid`, m.`mobile`, o.`order_type`, o.`order_status`, o.`order_sn`, o.`doctor_id`")
                ->find();
            $member['member_name'] = $member['member_name'] ? $member['member_name'] : $member['mobile'];

            if ($member['order_status'] == 0) {         // 0待购药 其他待复诊
                $data['url'] = 'http://wechat.bohetanglao.com/home/center/detail/ordersn/'.$member['order_sn'].'.html';
                $data['first'] = '您有一张待购药订单，请及时查看。';
                $data['prescription'] = '门诊订单';
                $data['remark'] = '点击详情，跳转到该订单单页~';
            }  {                            // 待复诊提醒
                $data['url'] = 'http://wechat.bohetanglao.com/home/advise/chat/memberid/' . $member['doctor_id'] . '/type/1.html';
                $data['first'] = '您有一张待处理复诊单，请及时查看。';
                $data['prescription'] = '门诊复诊';
                $data['remark'] = '点击详情，跳转到聊天页面~';
            }
            var_dump($data);die;

            // 增加一条发送记录
            $this->addMedicine($data['doctor_id'], $data['order_id']);

            $data['openid'] = $member['openid'];
            $data['member_name'] = $member['member_name'];
            Model('Weixin')->messageTemplate(6, $data);
            ajaxReturn(array('code' =>1, 'info' => 'ok'));

        }
    }

    // 添加群发图文的次数
    public function addMedicine($doctor_id, $order_id) {
        // 算出今天的时间戳
        $day_date = strtotime(date('Y-m-d', time()));
        $haircount = db('doctor_daycount')->where("doctor_id = {$doctor_id} and order_id = {$order_id} and day_date = {$day_date}")->count();
        if ($haircount) {
            db('doctor_daycount')->where("doctor_id = {$doctor_id} and order_id = {$order_id} and day_date = {$day_date}")->setInc('day_count',1);
        } else {
            $hair_info = array(
                'doctor_id' => $doctor_id,
                'order_id' => $order_id,
                'day_count' => 1,
                'day_date' => $day_date,
                'add_date' => time(),
            );
            db('doctor_daycount')->insert($hair_info);
        }
        return true;
    }

    // 查询群发图文的次数
    public function medicineCount($doctor_id, $order_id) {
        // 算出这个月的时间戳
        $con = Model('Setting')->findAdmin();
        $daycount = $con['day_number'];
        $day_date = strtotime(date('Y-m-d', time()));
        $hair = db('doctor_daycount')->where("doctor_id = {$doctor_id} and order_id = {$order_id} and day_date = {$day_date}")->find();
        $number = array();
        if ($hair) {
            $daycount = $daycount - $hair['day_count'];
            $number['daycount'] = $daycount < 0 ? 0 : $daycount;
        } else {
            $number['daycount'] = $daycount;
        }
        return $number;
    }



}
