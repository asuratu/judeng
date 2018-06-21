<?php
namespace app\home\controller;
use app\tools\Html;
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
            $prescription = Db::field('o.`pay_status`, o.`order_id`, o.`order_sn`, o.`order_status`, o.`patient_id`, o.`order_date`, op.`patient_mobile`, op.`patient_name`, op.`patient_sex`, op.`patient_age`, op.`dialectical`')
                ->table('jd_order o, jd_order_prescription op')
                ->where("o.`order_id` = op.`order_id` and op.`prescription_type` = 0 and o.order_type = 3 and o.doctor_id = {$data['doctor_id']} {$where}")
                ->order('o.order_date', 'DESC')
                ->limit($data['pageCount'],$data['pageSize'])
                ->select();
            $order = array();
            foreach ($prescription as $key => $val) {
                array_push($order, $val);
                $order[$key]['pay_status_name'] = $this->view->setting['aryOrderPayStatus'][$val['pay_status']];
                $order[$key]['order_status'] = $this->view->setting['aryOrderStatus'][$val['order_status']];
                $order[$key]['order_date'] = date('Y-m-d H:i', $val['order_date']);
            }
            $total = Db::table('jd_order o, jd_order_prescription op')
                ->where("o.`order_id` = op.`order_id` and op.`prescription_type` = 0 and o.order_type = 3 and o.doctor_id = {$data['doctor_id']} {$where}")
                ->count();
            ajaxReturn(array('code' =>1, 'info' => 'ok','data'=>$order,'total'=>$total));

        }
    }

    // 待购药 待复诊订单
    public function findConsultation()
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

            $_where = "o.`order_id` = op.`order_id` and o.`patient_id` = m.`member_id` and op.`prescription_type` = 0 and o.order_type = 3 and o.doctor_id = {$data['doctor_id']}";
            if ($data['type'] == 0) {
                $_where .= ' and o.order_status=0';
                $type_name = '购药时间：';
            } else {
                $seventime = '604800';          // 7 天
                $onemoon = '2592000';           // 一个月
                $_where .= " and (o.order_status=1 or o.order_status=2 or o.order_status=3) and o.pay_date >= {$seventime} and o.pay_date <= {$onemoon}";
//                $_where .= " and (o.order_status=1 or o.order_status=2 or o.order_status=3)";
                $type_name = '复诊时间：';
            }
            $prescription = Db::field('o.`pay_status`, o.`order_id`, o.`order_sn`, o.`order_status`, o.`patient_id`, o.`order_date`, m.`mobile`, m.`portrait`, m.`member_name`, m.`true_name`, m.`mobile`, m.`sex`, m.`age`')
                ->table('jd_order o, jd_order_prescription op, jd_member m')
                ->where($_where)
                ->order('o.order_date', 'DESC')
                ->limit($data['pageCount'],$data['pageSize'])
                ->select();
            $order = array();
            foreach ($prescription as $key => $val) {
                array_push($order, $val);
//                $order[$key]['portrait'] = 'http://wechat.bohetanglao.com/uploads/avatar/' . $val['portrait'];
                $order[$key]['pay_status_name'] = $this->view->setting['aryOrderPayStatus'][$val['pay_status']];
                $order[$key]['order_status'] = $this->view->setting['aryOrderStatus'][$val['order_status']];
                $order[$key]['member_name'] = !empty($val['true_name']) ? $val['true_name'] : (!empty($val['member_name']) ? $val['member_name'] : $val['mobile']);
                $order[$key]['add_date'] = $val['order_date'];
                $order[$key]['order_date'] = $type_name . date('Y-m-d', $val['order_date']);
            }
            $order = $this->array_unset_tt($order, 'patient_id');
            $orderPatient = array();
            foreach ($order as $val) {
                array_push($orderPatient, $val);
            }
            $total = Db::table('jd_order o, jd_order_prescription op, jd_member m')
                ->where($_where)
                ->count();
            ajaxReturn(array('code' =>1, 'info' => 'ok','data'=>$orderPatient,'total'=>$total));

        }
    }

    // 二维数组去重
    function array_unset_tt($arr,$key){
        //建立一个目标数组
        $res = array();
        foreach ($arr as $value) {
            //查看有没有重复项

            if(isset($res[$value[$key]])){
                //有：销毁

                unset($value[$key]);

            }
            else{

                $res[$value[$key]] = $value;
            }
        }
        return $res;
    }

    // 咨询页面患者列表
    public function allConsultationPatient()
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

            $comment = Db::field('s.`member_id`, s.`synopsis`, s.`end_date`, m.`member_name`, m.`true_name`, m.`mobile`, m.`portrait`, m.`openid`, m.`sex`, m.`age`')
                ->table('jd_doctor_member s, jd_member m')
                ->where("s.doctor_id = {$data['doctor_id']} and s.`is_show` = 1 and s.`member_id` = m.`member_id` and (m.`member_name` like '%{$data['title']}%' or m.`true_name` like '%{$data['title']}%' or m.`mobile` like '%{$data['title']}%' or s.`grouping` like '%{$data['title']}%')")
                ->order('s.end_date', 'DESC')
                ->limit($data['pageCount'],$data['pageSize'])
                ->select();
            $order = array();
            foreach ($comment as $key => $val) {
                array_push($order, $val);
//                $order[$key]['portrait'] = 'http://wechat.bohetanglao.com/uploads/avatar/' . $val['portrait'];
                $order[$key]['member_name'] = !empty($val['true_name']) ? $val['true_name'] : (!empty($val['member_name']) ? $val['member_name'] : $val['mobile']);
                $order[$key]['end_date'] = date('m-d', $val['end_date']);

            }
            $total = Db::table('jd_doctor_member s, jd_member m')
                ->where("s.doctor_id = {$data['doctor_id']} and s.`is_show` = 1 and s.`member_id` = m.`member_id` and (m.`member_name` like '%{$data['title']}%' or m.`true_name` like '%{$data['title']}%' or m.`mobile` like '%{$data['title']}%' or s.`grouping` like '%{$data['title']}%')")
                ->count();
//            $order['tatal'] = $total;
            ajaxReturn(array('code' =>1, 'info' => 'ok','data'=>$order,'total'=>$total));

        }
    }

    // 修改患者列表最后一条显示内容
    public function updateConsultationPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['doctor_id']==''||$data['member_id']==''||$data['synopsis']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $time = time();
            $data['synopsis'] = Html::getTextToHtml($data['synopsis'], 20);
            $haircount = db('doctor_member')->where("doctor_id = {$data['doctor_id']} and member_id = {$data['member_id']}")->count();
            if ($haircount) {
                $update = array(
                    "synopsis" => $data['synopsis'],
                    "end_date" => $time,
                );
                $_return = db('doctor_member')->where("doctor_id = {$data['doctor_id']} and member_id = {$data['member_id']}")->update($update);
            } else {
                $hair_info = array(
                    'member_id' => $data['member_id'],
                    'doctor_id' => $data['doctor_id'],
                    'inquisition_name' => '问诊',
                    'inquisition' => $time,
                    'grouping' => '',
                    'end_date' => $time,
                    'synopsis' => $data['synopsis'],
                    'add_date' => $time,
                );
                $_return = db('doctor_member')->insertGetId($hair_info);
            }
            if ($_return) {
                ajaxReturn(array('code'=>1,'info'=>'ok'));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'添加或修改失败'));
            }
        }
    }


    // 测试内部生成医生患者名单接口
    public function doctorMember() {
        // 第一个参数用户ID， 第二个参数医生ID， 第三个是具体服务类型名称
        Model('Number')->doctorMember(2, 2, '初诊');
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
            $comment = Db::field('s.`member_id`, s.`order_id`, s.`symptom`, s.`evaluate`, s.`evaluate_name`, s.`synopsis`, s.`add_date`, m.`member_name`, m.`true_name`, m.`mobile`, m.`portrait`')
                ->table('jd_service_evaluation s, jd_member m')
                ->where("s.is_show = 1 and s.doctor_id = {$data['doctor_id']} and s.`member_id` = m.`member_id`")
                ->order('s.add_date', 'DESC')
                ->limit($data['pageCount'],$data['pageSize'])
                ->select();
            $order = array();
            foreach ($comment as $key => $val) {
                array_push($order, $val);
                $order[$key]['evaluate_name'] = explode('#@#', trim($val['evaluate_name'], '#@#'));
                $order[$key]['member_name'] = !empty($val['true_name']) ? $val['true_name'] : (!empty($val['member_name']) ? $val['member_name'] : $val['mobile']);
//                $order[$key]['portrait'] = 'http://wechat.bohetanglao.com/uploads/avatar/' . $val['portrait'];
                $order[$key]['evaluate'] = $this->view->setting['aryServiceEvaluation'][$val['evaluate']];
                $order[$key]['add_date'] = date('Y-m-d H:i', $val['add_date']);
            }
            $total = Db::table('jd_service_evaluation s, jd_member m')
                ->where("s.is_show = 1 and s.doctor_id = {$data['doctor_id']} and s.`member_id` = m.`member_id`")
                ->count();
//            $order['tatal'] = $total;
            ajaxReturn(array('code' =>1, 'info' => 'ok','data'=>$order,'total'=>$total));
        }
    }

    /**
     * 获取医生全部患者列表(支持添加页面的患者搜索)
     */
    public function allPatient()
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

            // 判断是否查询分组添加患者页面的搜索
            $group = array();
            if ($data['group_id'] > 0) {
                $group = db('patient_group')->where("group_id = {$data['group_id']}")->find();
            }
            if (!$group) {
                $group = array();
                $group['group_member_id'] = '';
                $group['group_member_name'] = '';
            }
            $group_member = explode(',', $group['group_member_id']);

            $comment = Db::field('s.`member_id`, s.`inquisition_name`, s.`inquisition`, m.`member_name`, m.`true_name`, m.`mobile`, m.`portrait`, m.`sex`, m.`age`, m.`openid`, m.`is_type`')
                ->table('jd_doctor_member s, jd_member m')
                ->where("s.doctor_id = {$data['doctor_id']} and s.`is_show` = 1 and s.`member_id` = m.`member_id` and (m.`member_name` like '%{$data['title']}%' or m.`true_name` like '%{$data['title']}%' or m.`mobile` like '%{$data['title']}%' or s.`grouping` like '%{$data['title']}%')")
                ->order('s.inquisition', 'DESC')
                ->limit($data['pageCount'],$data['pageSize'])
                ->select();
            $order = array();
            foreach ($comment as $key => $val) {
                array_push($order, $val);
                $order[$key]['is_type'] = $this->view->setting['aryMemberType1'][$val['is_type']];
//                $order[$key]['portrait'] = 'http://wechat.bohetanglao.com/uploads/avatar/' . $val['portrait'];
                $order[$key]['member_name'] = !empty($val['true_name']) ? $val['true_name'] : (!empty($val['member_name']) ? $val['member_name'] : $val['mobile']);
                $order[$key]['mobile'] = isset($val['mobile']) ? $val['mobile'] : '未填写手机号码';
                $order[$key]['inquisition'] = date('Y-m-d H:i', $val['inquisition']);

                $order[$key]['group_type'] = (string)(intval(in_array($val['member_id'], $group_member)));
            }
            $total = Db::table('jd_doctor_member s, jd_member m')
                ->where("s.doctor_id = {$data['doctor_id']} and s.`is_show` = 1 and s.`member_id` = m.`member_id` and (m.`member_name` like '%{$data['title']}%' or m.`true_name` like '%{$data['title']}%' or m.`mobile` like '%{$data['title']}%' or s.`grouping` like '%{$data['title']}%')")
                ->count();

            ajaxReturn(array('code' =>1, 'info' => 'ok','data'=>$order,'total'=>$total,'group_member_name'=>$group['group_member_name']));

        }
    }

    /**
     * 获取分组列表
     */
    public function allPatientGroup()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $comment = Db::field('p.`group_id`, p.`group_name`, p.`group_name_eng`, p.`group_member_name`')
                ->table('jd_patient_group p')
                ->where("p.doctor_id = {$data['doctor_id']}")
                ->order('p.add_date', 'DESC')
                ->select();
            $order = array();
            foreach ($comment as $key => $val) {
                array_push($order, $val);
            }
            ajaxReturn(array('code' =>1, 'info' => 'ok','data'=>$comment));

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
            $patient['group_member_id'] = '';
            $patient['group_member_name'] = '';
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

            if($data['doctor_id']==''||$data['group_id']=='')
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
            $comment = Db::field('s.`group_id`, s.`member_id`, m.`member_name`, m.`true_name`, m.`mobile`, m.`portrait`, m.`sex`, m.`age`, m.`openid`, m.`is_type`')
                ->table('jd_group_patient s, jd_member m')
                ->where("s.doctor_id = {$data['doctor_id']} and s.`is_show` = 1 and s.group_id = {$data['group_id']} and s.`member_id` = m.`member_id`")
                ->order('s.add_date', 'ASC')
                ->limit($data['pageCount'],$data['pageSize'])
                ->select();
            $order = array();
            foreach ($comment as $key => $val) {
                array_push($order, $val);
                $order[$key]['is_type'] = $this->view->setting['aryMemberType1'][$val['is_type']];
//                $order[$key]['portrait'] = 'http://wechat.bohetanglao.com/uploads/avatar/' . $val['portrait'];
                $order[$key]['member_name'] = !empty($val['true_name']) ? $val['true_name'] : (!empty($val['member_name']) ? $val['member_name'] : $val['mobile']);
                $order[$key]['mobile'] = isset($val['mobile']) ? $val['mobile'] : '未填写手机号码';
            }
            $total = Db::table('jd_group_patient s, jd_member m')
                ->where("s.doctor_id = {$data['doctor_id']} and s.`is_show` = 1 and s.group_id = {$data['group_id']} and s.`member_id` = m.`member_id`")
                ->count();

            ajaxReturn(array('code' =>1, 'info' => 'ok','data'=>$order,'total'=>$total));

        }
    }

    /**
     * 添加某分组下的患者
     */
    public function addGroupPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['doctor_id']==''||$data['member_id']==''||$data['member_name']==''||$data['group_name']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $type = 0;
            if (isset($data['group_id']) && $data['group_id'] >0) {
                $group_id = db('patient_group')->where("group_id = {$data['group_id']}")->count();
                if ($group_id > 0) {
                    $type = 1;
                }
            }
            if ($type != 1) {
                $data['group_name'] = Html::getTextToHtml($data['group_name'], 200);
                $data['group_name_eng'] = str_replace(' ', '', Spell::getChineseChar($data['group_name']));
                $patient = array();
                $patient['doctor_id'] = intval($data['doctor_id']);
                $patient['group_name'] = $data['group_name'];
                $patient['group_name_eng'] = $data['group_name_eng'];
                $patient['group_member_id'] = '';
                $patient['group_member_name'] = '';
                $patient['add_date'] = time();
                $data['group_id'] = db('patient_group')->insertGetId($patient);
            }


            $patient = array();
            $patient['doctor_id'] = intval($data['doctor_id']);
            $patient['group_id'] = intval($data['group_id']);
            $member = explode(',',$data['member_id']);
            $member_name = explode(',',$data['member_name']);
            foreach ($member as $key => $val) {
                $name = isset($member_name[$key]) ? $member_name[$key] : '';
                $patient['member_id'] = intval($val);
                $count = db('group_patient')->where($patient)->count();
                if (!$count) {
                    db('group_patient')->insert($patient);
                    $this->uploadMember($data['doctor_id'], $data['group_id'], $patient['member_id'], $name, $data['group_name'], 0);
                    $this->uploadGroup($data['doctor_id'], $data['group_id'], $patient['member_id'], $name, $data['group_name'], 0);
                }
            }
            ajaxReturn(array('code' =>1, 'info' => 'ok'));
        }
    }

    /**
     * 删除某分组下的患者
     */
    public function deleteGroupPatient()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['doctor_id']==''||$data['group_id']==''||$data['member_id']==''||$data['member_name']==''||$data['group_name']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $patient = array();
            $patient['doctor_id'] = intval($data['doctor_id']);
            $patient['group_id'] = intval($data['group_id']);
            $patient['member_id'] = intval($data['member_id']);
            $count = db('group_patient')->where($patient)->count();
            if ($count) {
                $this->uploadMember($data['doctor_id'], $data['group_id'], $data['member_id'], $data['member_name'], $data['group_name'], 1);
                $this->uploadGroup($data['doctor_id'], $data['group_id'], $data['member_id'], $data['member_name'], $data['group_name'], 1);
                db('group_patient')->where($patient)->delete();
            }
            ajaxReturn(array('code' =>1, 'info' => 'ok'));
        }
    }

    // 医生患者选择分组处理（支持添加/修改）
    public function uploadMember($doctor_id, $group_id, $member_id, $member_name, $group_name, $type)
    {
        $doctor = db('doctor_member')->where("doctor_id = {$doctor_id} and member_id = {$member_id}")->find();
        $grouping = explode(',', $doctor['grouping']);
        $group = array();
        if ($type == 1) {
            // 删除时候执行
            foreach ($grouping as $key => $val) {
                if ($val != '') {
                    if ($group_name != $val) {
                        $group[] = $val;
                    }
                }
            }
        } else {
            // 添加时候执行
            $i = 0;
            foreach ($grouping as $key => $val) {
                if ($val != '') {
                    $group[] = $val;
                }
                if ($group_name == $val) {
                    $i = 1;
                }
            }
            if ($i == 0) {
                $group[] = $group_name;
            }
        }
        $group = implode(',', $group);
        $doctormember = array();
        $doctormember['doctor_id'] = $doctor_id;
        $doctormember['member_id'] = $member_id;
        $doctormember['dcmember_id'] = $doctor['dcmember_id'];
        $doctormember['grouping'] = $group;
        db('doctor_member')->update($doctormember);
    }

    // 患者分组里面有多少患者处理（支持添加/修改）
    public function uploadGroup($doctor_id, $group_id, $member_id, $member_name, $group_name, $type)
    {
        $doctor = db('patient_group')->where("group_id = {$group_id}")->find();
        $group_member_id = explode(',', $doctor['group_member_id']);
        $group_member = explode(',', $doctor['group_member_name']);
        $group = array();
        $group1 = array();
        if ($type == 1) {
            // 删除时候执行
            foreach ($group_member_id as $key => $val) {
                if ($val != '') {
                    if ($member_id != $val) {
                        $group[] = $val;
                    }
                }
            }
            foreach ($group_member as $key => $val) {
                if ($val != '') {
                    if ($member_name != $val) {
                        $group1[] = $val;
                    }
                }
            }
        } else {
            // 添加时候执行
            $i = 0;
            $j = 0;
            foreach ($group_member_id as $key => $val) {
                if ($val != '') {
                    $group[] = $val;
                }
                if ($member_id == $val) {
                    $i = 1;
                }
            }
            if ($i == 0) {
                $group[] = $member_id;
            }
            foreach ($group_member as $key => $val) {
                if ($val != '') {
                    $group1[] = $val;
                }
                if ($member_name == $val) {
                    $j = 1;
                }
            }
            if ($j == 0) {
                $group1[] = $member_name;
            }
        }
        $group = implode(',', $group);
        $group1 = implode(',', $group1);
        $doctormember = array();
        $doctormember['group_id'] = $group_id;
        $doctormember['group_member_id'] = $group;
        $doctormember['group_member_name'] = $group1;
        db('patient_group')->update($doctormember);
    }


}
