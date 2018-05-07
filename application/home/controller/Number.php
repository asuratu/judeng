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
            if ($data['type'] == 0) {
                $where = ' ';
            } else {
                $where = ' and o.`pay_status` = 0';
            }
            $data['pageCount'] = ($data['page'] - 1) * $data['pageSize'];
            $prescription = Db::field('o.`pay_status`, o.`order_id`, o.`order_sn`, o.`order_status`, o.`order_date`, op.`patient_mobile`, op.`patient_name`, op.`patient_sex`, op.`patient_age`, op.`dialectical`')
                ->table('jd_order o, jd_order_prescription op')
                ->where("o.`order_id` = op.`order_id` and o.order_type = 3 and o.doctor_id = {$data['doctor_id']} {$where}")
                ->order('o.order_date', 'DESC')
                ->limit($data['pageCount'],$data['pageCount'])
                ->select();
            $order = array();
            foreach ($prescription as $key => $val) {
                array_push($order, $val);
                $order[$key]['pay_status_name'] = $this->view->setting['aryOrderPayStatus'][$val['pay_status']];
                $order[$key]['order_status'] = $this->view->setting['aryOrderStatus'][$val['order_status']];
                $order[$key]['order_date'] = date('Y-m-d H:i', $val['order_date']);
            }

            ajaxReturn(array('code' =>1, 'info' => '登录成功','data'=>[$order]));

        }
    }

    /**
     * 提醒购药
     */
    public function medicine()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
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
            $comment = Db::field('s.`member_id`, s.`order_id`, s.`symptom`, s.`evaluate`, s.`evaluate_name`, s.`synopsis`, s.`add_date`, m.`member_name`, m.`mobile`, m.`portrait`')
                ->table('jd_service_evaluation s, jd_member m')
                ->where("s.is_show = 1 and s.doctor_id = {$data['doctor_id']} and s.`member_id` = m.`member_id`")
                ->order('s.add_date', 'DESC')
                ->limit($data['pageCount'],$data['pageCount'])
                ->select();
            $order = array();
            foreach ($comment as $key => $val) {
                array_push($order, $val);
                $order[$key]['evaluate_name'] = explode('#@#', $val['evaluate_name']);
                $order[$key]['evaluate'] = $this->view->setting['aryServiceEvaluation'][$val['evaluate']];
                $order[$key]['add_date'] = date('Y-m-d H:i', $val['add_date']);
            }
            $total = Db::table('jd_service_evaluation s, jd_member m')
                ->where("s.is_show = 1 and s.doctor_id = {$data['doctor_id']} and s.`member_id` = m.`member_id`")
                ->count();

            ajaxReturn(array('code' =>1, 'info' => '登录成功','data'=>[$order],'total'=>$total));
        }
    }

    /**
     * 获取医生全部患者列表
     */
    public function allPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

    /**
     * 获取分组列表
     */
    public function allPatientGroup()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

    /**
     * 获取某分组下的患者列表
     */
    public function allGroupPatientList()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

    /**
     * 删除某分组下的患者
     */
    public function deleteGroupPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

    /**
     * 添加患者分组
     */
    public function addGroupPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

    /**
     * 修改患者分组名称
     */
    public function updateGroupPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

    /**
     * 获取医生全部患者列表
     */
    public function allPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

    /**
     * 获取医生全部患者列表
     */
    public function allPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

    /**
     * 获取医生全部患者列表
     */
    public function allPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

    /**
     * 获取医生全部患者列表
     */
    public function allPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

    /**
     * 获取医生全部患者列表
     */
    public function allPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

    /**
     * 获取医生全部患者列表
     */
    public function allPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['mobile']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

        }
    }

}
