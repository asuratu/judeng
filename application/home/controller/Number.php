<?php
namespace app\home\controller;
use think\Request;
use think\Db;
class Number extends Common
{
    /**
     * 开方数量
     */
    public function prescriptions()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['doctor_id']==''||$data['type']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if (!isset($data['page'])) {
                $data['page'] = 1;
            }
            if (!isset($data['pageSize'])) {
                $data['pageSize'] = 10;
            }
            $data['pageCount'] = ($data['page'] - 1) * $data['pageSize'];
            $prescription = Db::field('o.`pay_status`, o.`order_id`, o.`order_sn`, o.`order_status`, o.`order_date`, op.`patient_mobile`, op.`patient_name`, op.`patient_sex`, op.`patient_age`, op.`dialectical`')
                ->table('jd_order o, jd_order_prescription op')
                ->where("o.`order_id` = op.`order_id` and o.order_type = 3 and o.doctor_id = {$data['doctor_id']}")
                ->order('o.order_date', 'DESC')
                ->limit($data['page'],$data['pageCount'])
                ->select();
            foreach ($prescription as $val) {
                var_dump($val);die;
                $val['pay_status_name'] = $this->view->setting['aryOrderPayStatus'][$val['pay_status']];
                $val['order_status'] = $this->view->setting['aryOrderStatus'][$val['order_status']];
                $val['order_date'] = date('Y-m-d H:i', $val['order_date']);
            }

            ajaxReturn(array('code' =>1, 'info' => '登录成功','data'=>[$prescription]));

        }
    }

    /**
     * 提醒购药
     */
    public function medicine()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']==''||$data['smscode']==''|| $data['device_tokens']=='' || $data['is_system']=='')
            {
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

    /**
     * 评论数量
     */
    public function comment()
    {
        if($this->request->isPost())
        {
            $data=input('post.');


        }
    }

}
