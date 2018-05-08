<?php
namespace app\home\controller;
use app\tools\Html;
use think\Request;
use app\tools\Spell;
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

            ajaxReturn(array('code' =>1, 'info' => 'ok','data'=>[$order]));

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

            ajaxReturn(array('code' =>1, 'info' => 'ok','data'=>[$order],'total'=>$total));
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
     * 添加患者分组
     */
    public function addPatientGroup()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['group_name']==''||$data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $data['group_name'] = Html::getTextToHtml($data['group_name'], 200);
            $data['group_name_eng'] = str_replace(' ', '', Spell::getChineseChar($data['group_name']));
            $patient = array();
            $patient['doctor_id'] = intval($data['doctor_id']);
            $patient['group_name'] = $data['group_name'];
            $patient['group_name_eng'] = $data['group_name_eng'];
            $patient['add_date'] = time();

            $_identity = db('patient_group')->insertGetId($patient);
            if ($_identity) {
                ajaxReturn(array('code'=>1,'info'=>'分组添加成功'));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'分组添加失败'));
            }
        }
    }

    /**
     * 修改患者分组名称
     */
    public function updatePatientGroup()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['group_name']==''||$data['group_id']==''||$data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $data['group_name'] = Html::getTextToHtml($data['group_name'], 200);
            $data['group_name_eng'] = str_replace(' ', '', Spell::getChineseChar($data['group_name']));
            $patient = array();
            $patient['doctor_id'] = intval($data['doctor_id']);
            $patient['group_id'] = intval($data['group_id']);
            $patient['group_name'] = $data['group_name'];
            $patient['group_name_eng'] = $data['group_name_eng'];
            $return = db('patient_group')->update($patient);
            if ($return) {
                ajaxReturn(array('code'=>1,'info'=>'分组修改成功'));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'分组修改失败'));
            }
        }
    }

    /**
     * 删除患者分组
     */
    public function deletePatientGroup()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['group_id']==''||$data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $patient = array();
            $patient['group_id'] = intval($data['group_id']);
            $patient['doctor_id'] = intval($data['doctor_id']);
            $_identity = db('patient_group')->where($patient)->delete();
            if ($_identity) {
                ajaxReturn(array('code'=>1,'info'=>'分组删除成功'));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'分组删除失败'));
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


}