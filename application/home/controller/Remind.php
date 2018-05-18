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

            if($data['order_id']==''||$data['is_type']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $member = db('order')
                ->alias('o')
                ->join('member m', 'o.`patient_id` = m.`member_id`', 'LEFT')
                ->where("o.order_id = {$data['order_id']}")
                ->field("m.`member_name`, m.`openid`, m.`mobile`")
                ->find();
            $member['member_name'] = $member['member_name'] ? $member['member_name'] : $member['mobile'];

            if ($data['is_type'] == 0) {         // 开方，待购药提醒
                $data['url'] = 'www.baidu.com';
                $data['first'] = '您有一张待处理处方单，请及时查看。';
                $data['prescription'] = '门诊处方';
                $data['remark'] = '点击详情，跳转到该处方单页~';
            } else {                            // 待复诊提醒
                $data['url'] = 'www.baidu.com';
                $data['first'] = '您有一张待处理复诊单，请及时查看。';
                $data['prescription'] = '门诊复诊';
                $data['remark'] = '点击详情，跳转到该复诊单页~';
            }

            $data['openid'] = $member['openid'];
            $data['member_name'] = $member['member_name'];
            Model('Weixin')->messageTemplate(6, $data);
            ajaxReturn(array('code' =>1, 'info' => 'ok'));

        }
    }



}
