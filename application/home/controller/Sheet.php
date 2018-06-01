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
                ->where("is_display = 1 AND type_id = {$data['type_id']} AND member_id = {$data['member_id']}")
                ->field("sheet_id, title, release_date, list")
                ->limit($start,$data['pageSize'])
                ->order('sort DESC')
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
     * @Title: addSheet
     * @Description: TODO 添加/修改问诊单模板   此房方法要用事务
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

            $insertData['member_id'] = $data['member_id'];
            $insertData['type_id'] = $data['type_id'];
            $insertData['title'] = $data['title'];
            $insertData['list'] = $data['list'];
            $insertData['release_date'] = time();

            if (intval($data['sheet_id']) > 0) {
                //查询旧数据
                $oldInfo = db('sheet')
                    ->where("sheet_id = {$data['sheet_id']} AND is_display = 1")
                    ->field("list")
                    ->find();
                //修改
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
            } else {
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
            $del['sheet_id'] = $data['sheet_id'];
            $del['member_id'] = $data['member_id'];
            db('sheet')->where($del)->delete();
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
        }
    }


}