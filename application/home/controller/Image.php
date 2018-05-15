<?php
namespace app\home\controller;
use app\tools\Html;
use think\Paginator;
use think\Request;
use app\tools\Spell;
use think\Db;

class Image extends Common
{
    /**
     * 群发图文
     */
    public function sendHair()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['is_hair']==''||$data['doctor_id']==''||$data['doctor_member']==''||$data['member_id']==''||$data['is_type']==''||$data['content']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $data['is_type'] = $data['is_type'] != 1 ? 0 : 1;

            // 处理群发次数、短信次数是否已经用完
            $haircount = $this->haircount($data['doctor_id']);
            if ($haircount['haircount'] == 0) {
                ajaxReturn(array('code' =>0, 'info' => '群发次数已经用完'));
            }

            if ($data['is_type'] == 1) {
                if ($haircount['messagecount'] == 0) {
                    ajaxReturn(array('code' =>0, 'info' => '短信次数已经用完'));
                }
            }

            $sendHair = array();
            $sendHair['doctor_name'] = $data['doctor_member'];
            $sendHair['hospital'] = '小橘灯中医';
            $sendHair['content'] = $data['content'];
            $sendHair['remark'] = '点击这里查看公告内容';
            if ($data['is_hair'] == 0) {                  // 0 为图文 1 链接
                $sendHair['url'] = 'www.baidu.com';
                $sendHair['first'] = $sendHair['doctor_name'] . '医生:我发布了公告内容,请及时查看';
            } else {
                $sendHair['url'] = $data['url'];
                $sendHair['first'] = '来自' . $sendHair['doctor_name'] . '医生分享的链接';
            }
            $data['member_id'] = trim($data['member_id'], ',');
            $public_number = array();
            $mobile_number = array();
            // 增加一条发送记录
            $member = db('member')->field('member_name, mobile, openid, is_type')->where("member_id", "in", "{$data['member_id']}")->select();
            foreach ($member as $val) {
                if ($val['is_type'] == 0) {
                    $public_number[] = $val['openid'];
                } else {
                    $mobile_number[] = $val['mobile'];
                }
            }
            foreach ($public_number as $val) {
                $sendHair['openid'] = $val;
                Model('Weixin')->messageTemplate(2, $sendHair);
            }
            // 短信推送
            if ($data['is_type'] == 1) {
                // 之后开发

            }

            // 增加一条发送记录
            $this->addHaircount($data['doctor_id'], $data['is_type']);

            ajaxReturn(array('code' =>1, 'info' => 'ok'));
        }
    }

    public function sendHairCount()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            // 查询群发次数、短信次数是否已经用完
            $haircount = $this->haircount($data['doctor_id']);
            ajaxReturn(array('code' =>1, 'info' => 'ok','data'=>$haircount));
        }
    }

    // 添加群发图文的次数
    public function addHaircount($doctor_id, $messagecount) {
        // 算出这个月的时间戳
        $moon_date = strtotime(date('Y-m', time()));
        $haircount = db('doctor_haircount')->where("doctor_id = {$doctor_id} and moon_date = {$moon_date}")->count();
        if ($haircount) {
            db('doctor_haircount')->where("doctor_id = {$doctor_id} and moon_date = {$moon_date}")->setInc('hair_count',1);
            db('doctor_haircount')->where("doctor_id = {$doctor_id} and moon_date = {$moon_date}")->setInc('message_count',$messagecount);
        } else {
            $hair_info = array(
                'doctor_id' => $doctor_id,
                'hair_count' => 1,
                'message_count' => $messagecount,
                'moon_date' => $moon_date,
                'add_date' => time(),
            );
            db('doctor_haircount')->insert($hair_info);
        }
        return true;
    }

    // 查询群发图文的次数
    public function haircount($doctor_id) {
        // 算出这个月的时间戳
        $haircount = 90;
        $messagecount = 20;
        $moon_date = strtotime(date('Y-m', time()));
        $hair = db('doctor_haircount')->where("doctor_id = {$doctor_id} and moon_date = {$moon_date}")->find();
        $number = array();
        if ($hair) {
            $haircount = $haircount - $hair['hair_count'];
            $messagecount = $messagecount - $hair['message_count'];
            $number['haircount'] = $haircount < 0 ? 0 : $haircount;
            $number['messagecount'] = $messagecount < 0 ? 0 : $messagecount;
        } else {
            $number['haircount'] = $haircount;
            $number['messagecount'] = $messagecount;
        }
        return $number;
    }

}
