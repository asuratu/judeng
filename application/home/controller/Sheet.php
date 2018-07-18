<?php
namespace app\home\controller;
use think\Request;
class Sheet extends Common
{

    /**
     * @Title: getSheetType
     * @Description: TODO 获取诊单类型
     */
    public function getSheetType() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            $typeList = db('sheet_type')
                ->where("is_display = 1")
                ->field("type_id , type_name")
                ->order('sort DESC')
                ->select();
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$typeList));
        }
    }

    /**
     * @Title: getSheetList
     * @Description: TODO 获取问诊模板列表/分页
     */
    public function getSheetList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['member_id']=='' || $data['type_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $data['page'] = $data['page'] ? intval($data['page']) : 1;
            $data['pageSize'] = $data['pageSize'] ? intval($data['pageSize']) : 5;
            $start = ($data['page']-1)*$data['pageSize'];

            $typeList = db('sheet')
                ->where("is_display = 1 AND type_id = {$data['type_id']} AND (member_id = {$data['member_id']} OR is_classic = 1)")
                ->field("sheet_id, title, release_date, list, is_classic")
                ->limit($start,$data['pageSize'])
                ->order('is_classic DESC, sort DESC')
                ->select();
            $totalNum = db('sheet')
                ->where("is_display = 1 AND type_id = {$data['type_id']} AND member_id = {$data['member_id']}")
                ->field("sheet_id")
                ->count();

            foreach ($typeList as $key=>$val) {
                $typeList[$key]['release_date'] = date('Y-m-d H:i:s', $val['release_date']);
            }
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[['list'=>$typeList, 'total'=>$totalNum]]));
        }
    }

    /**
     * @Title: sheetDetial
     * @Description: TODO 查看问诊单模板详情
     */
    public function sheetDetial() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['member_id']=='' || $data['sheet_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $detail = db('sheet')
                ->where("is_display = 1 AND sheet_id = {$data['sheet_id']} AND member_id = {$data['member_id']}")
                ->field("sheet_id, title, release_date, list")
                ->find();
            if (empty($detail)) {
                ajaxReturn(array('code'=>0,'info'=>'该问诊单模板不存在','data'=>[]));
            }

            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[$detail]));
        }
    }

    /**
     * @Title: getSheetDetial
     * @Description: TODO 查看患者填写的问诊单详情
     */
    public function getSheetDetial() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            //这里的id是sheet_id
            if($data['patient_id']=='' || $data['id']=='' || $data['doctor_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $orderDetail = db('sheet')->alias('s')
                ->join('member_inquisition_question miq', 'miq.sheet_id = s.sheet_id' , 'inner')
                ->join('sheet_type st', 'st.type_id = s.type_id' , 'inner')
                ->where("miq.`member_id` = {$data['patient_id']} AND miq.`doctor_id` = {$data['doctor_id']} AND miq.`sheet_id` = {$data['id']}")
                ->field("miq.*, s.title as sheet_title, st.type_name")
                ->find();

            if (empty($orderDetail)) {
                ajaxReturn(array('code'=>0,'info'=>'该问诊单不存在','data'=>[]));
            }


            $orderDetail['answer_json'] = array_values(json_decode($orderDetail['answer_json'], true));
//            $orderDetail['answer_json'] = $orderDetail['answer_json'][0];
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[$orderDetail]));
        }
    }

    /**
     * @Title: addSheet
     * @Description: TODO 添加/修改问诊单模板   此方法要用事务
     */
    public function addSheet() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['member_id']=='' || $data['type_id']=='' || $data['title']=='' || $data['list']=='' || $data['sheet_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $insertData['type_id'] = $data['type_id'];
            $insertData['title'] = $data['title'];
            $insertData['list'] = $data['list'];
            $insertData['release_date'] = time();

            if (intval($data['sheet_id']) > 0) {
                //查询旧数据
                $oldInfo = db('sheet')
                    ->where("sheet_id = {$data['sheet_id']} AND is_display = 1")
                    ->field("*")
                    ->find();

                if ($oldInfo['title'] == $data['title'] && $oldInfo['is_classic'] == 1) {
                    ajaxReturn(array('code'=>0,'info'=>'经典问诊单，不可修改!','data'=>[]));
                }

                //如果是经典问诊单, 新增一条普通问诊单
                if ($oldInfo['title'] !== $data['title'] && $oldInfo['is_classic'] == 1) {
                    $insertData['member_id'] = $data['member_id'];
                    //添加
                    $insertData['add_date'] = time();
                    $result = db('sheet')->insertGetId($insertData);

                    //往问诊单题目表插数据
                    foreach (json_decode($insertData['list'], true) as $val) {
                        $quesData['question_json'] = json_encode($val);
                        $quesData['sheet_id'] = $result;
                        $quesData['add_date'] = time();
                        $quesData['release_date'] = time();
                        db('sheet_question')->insert($quesData);
                    }
                }
//                elseif ($oldInfo['title'] == $data['title']) {
//                    ajaxReturn(array('code'=>0,'info'=>'标题已存在, 不可重复添加!','data'=>[]));
//                }
                //修改
                if ($oldInfo['is_classic'] == 0) {
                    $_where['sheet_id'] = $data['sheet_id'];
                    $result = db('sheet')->where($_where)->update($insertData);
                    //若修改了题目,则删除sheet_question表旧题目,增加新题目
                    if ($oldInfo['list'] !== $data['list']) {
                        db('sheet_question')->where("sheet_id = {$data['sheet_id']}")->delete();
                        //往问诊单题目表插数据
                        foreach (json_decode($insertData['list'], true) as $val) {
                            $quesData['question_json'] = json_encode($val);
                            $quesData['sheet_id'] = $data['sheet_id'];
                            $quesData['add_date'] = time();
                            $quesData['release_date'] = time();
                            db('sheet_question')->insert($quesData);
                        }
                    }
                }



            } else {
                $insertData['member_id'] = $data['member_id'];
                //添加
                $insertData['add_date'] = time();
                $result = db('sheet')->insertGetId($insertData);

                //往问诊单题目表插数据
                foreach (json_decode($insertData['list'], true) as $val) {
                    $quesData['question_json'] = json_encode($val);
                    $quesData['sheet_id'] = $result;
                    $quesData['add_date'] = time();
                    $quesData['release_date'] = time();
                    db('sheet_question')->insert($quesData);
                }
            }
            if ($result) {
                ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'系统繁忙,稍后再试','data'=>[]));
            }

        }
    }

    /**
     * @Title: delSheet
     * @Description: TODO 删除问诊单模板
     */
    public function delSheet() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['member_id']=='' || $data['sheet_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            //找到该问诊单
            $oldInfo = db('sheet')
                ->where("sheet_id = {$data['sheet_id']} AND is_display = 1")
                ->field("*")
                ->find();
            if ($oldInfo['is_classic'] == 1) {
                ajaxReturn(array('code'=>0,'info'=>'经典问诊单, 不可删除!','data'=>[]));
            }

            $del['sheet_id'] = $data['sheet_id'];
            $del['member_id'] = $data['member_id'];
            db('sheet')->where($del)->delete();
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
        }
    }


}