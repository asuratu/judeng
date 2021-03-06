<?php
namespace app\home\controller;

use think\Db;
use app\tools\Html;

class Image extends Common
{

    public function find()
    {
        $data=input('uid/');
        $data = base64_decode($data);
        //查询问题详情页面
        $hair = db('hair')->where("hair_id = '{$data}'")->find();
        if ($hair) {
            $hairattach = db('hair_attach')->where("hair_id = {$hair['hair_id']}")->select();
            $doctor = db('doctor')->where("member_id = {$hair['doctor_id']}")->find();
            $title = db('title')->where("title_id", "in", "{$doctor['title_id']}")->select();
            $doctor['member_name'] = !empty($doctor['true_name']) ? $doctor['true_name'] : (!empty($doctor['member_name']) ? $doctor['member_name'] : $doctor['mobile']);
            if (!$doctor['to_user_img']) {
                $postArr['doctor_id'] = $hair['doctor_id'];
                $to_user_img = postJson('http://api.judeng.net/wx/getQrcode', $postArr);
                if (!$to_user_img) {
                    $to_user_img = json_decode($to_user_img, true);
                    if ($to_user_img['code'] == 1) {
                        $doctor['to_user_img'] = $to_user_img['data'][0];
                    }
                }
            }
        } else {
            return 404;
        }
        $this->assign("hair", $hair);
        $this->assign("hairattach", $hairattach);
        $this->assign("doctor", $doctor);
        $this->assign("title", $title);
        return  $this->fetch('/hair/template');
    }


    /**
     * 群发图文
     */
    public function sendHair()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['is_hair']==''||$data['doctor_id']==''||$data['doctor_member']==''||$data['member_id']==''||$data['is_type']=='')
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
            $sendHair['content'] = '我发布了公告';
            $sendHair['remark'] = '点击这里查看公告内容';
            if ($data['is_hair'] == 0) {                  // 0 为图文 1 链接
                $sendHair['url'] = 'http://wechat.bohetanglao.com/home/advise/chat/memberid/' . $data['doctor_id'] . '/type/0.html';
                $sendHair['first'] = $sendHair['doctor_name'] . '医生:我发布了公告内容,请及时查看';
            } else {
                $sendHair['url'] = $data['url'];
                $sendHair['url'] = 'http://wechat.bohetanglao.com/home/advise/chat/memberid/' . $data['doctor_id'] . '/type/0.html';
                $sendHair['first'] = '来自' . $sendHair['doctor_name'] . '医生分享的链接';
            }
            $data['member_id'] = trim($data['member_id'], ',');
            $public_number = array();
            $mobile_number = array();

            // 查询患者信息
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
//            // 短信推送
            if ($data['is_type'] == 1) {
                // 如果短信推送且为图文推送的话，那么就生成一条图文消息记录
                if ($data['is_hair'] == 0) {                  // 0 为图文 1 链接
                    $hairname = array();
                    $hairname['doctor_id'] = $data['doctor_id'];
                    $hairname['member_id'] = 0;
                    $hairname['content'] = $data['content'];
                    $hairname['add_date'] = time();
                    $hairname['release_date'] = $hairname['add_date'];
                    $hairId = db('hair')->insertGetId($hairname);
                    if ($hairId) {
                        $upPaperInfo = json_decode(Model('Oss')->upPic('uploads/notice'), true);
                        foreach ($upPaperInfo as $key1=>$val1) {
                            $hair_attach = array(
                                'hair_id' => $hairId,
                                'src' => $val1,
                            );
                            db('hair_attach')->insert($hair_attach);
                        }
                    }
                    $hairId = base64_encode($hairId);
                    $url = 'image/find/uid/' . $hairId;
                } else {
                    $url = $data['url'];
                }

//                $comment = "来自" . $data['doctor_member'] . "医生的消息，内容为：" . Html::getTextToHtml($data['content'], 10) . "，http://api.judeng.net/" . $url . "，请点击查看！如有疑问可联系客服021-51877120";
                // 后期再次测试 TODO 测试返回true但是短信没有收到
                $title = array();
                foreach ($mobile_number as $key=>$val) {
                    $title[$key]['name'] = $data['doctor_member'];
                    $title[$key]['content'] = Html::getTextToHtml($data['content'], 10);
                    $title[$key]['orderId'] = $url;
                }

                if ($data['is_hair'] == 0) {
                    sendAliMass($mobile_number, $title, 1);
                }
            }

            // 增加一条发送记录
            $data['is_type'] = count($mobile_number) > 0 ? 1 : 0;     // 如果短信发送里面有短信用户，就增加一次发送记录
            $this->addHaircount($data['doctor_id'], $data['is_type']);

            ajaxReturn(array('code' =>1, 'info' => 'ok'));
        }
    }

    public function sendHairCount()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
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
        $con = Model('Setting')->findAdmin();
        $haircount = $con['group_number'];
        $messagecount = $con['message_number'];
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
