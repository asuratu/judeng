<?php
namespace app\home\controller;
use think\Request;
use think\Db;
class Selfdrug extends Common
{

    /**
     * @Title: addSelfDrug
     * @Description: TODO 创建调制服务包
     */
    public function addSelfDrug() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['self_goods_name']=='' || $data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            
            //获取传承的详细信息
            $map['i.`is_display`'] = 1;
            $map['i.`inherit_id`'] = $data['inherit_id'];
            $inheritDetail = db('inherit')->alias('i')
                ->join(['jd_doctor'=>'d'], 'i.member_id = d.member_id' , 'inner')
                ->where($map)
                ->field("i.*, d.title_id, d.member_name")
                ->find();
            //处理图片路径
            $inheritDetail['banner'] = $inheritDetail['banner'];
            //处理简介的H5
            $inheritDetail['culture'] = config('url').'/inherit/detail?id='.$data['inherit_id'];
            //判断是否加入过该传承
            $exist = db('inherit_doctor')->where("(`member_id` = {$data['member_id']} OR `parent_id` = {$data['member_id']}) AND `is_checked` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
            if ($exist > 0) {
                $used = 1;
            } else {
                $used = 0;
            }

            //判断是否特色方剂
            $specialNum = db('special')->where("`is_display` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
            if ($specialNum > 0) {
                $useSpecial = 1;
            } else {
                $useSpecial = 0;
            }

            //查询医生职称
            if ($inheritDetail['title_id']) {
                $inheritDetail['title_str'] = db('title')->where('title_id','in',$inheritDetail['title_id'])->field("`title_name`")->select();
            } else {
                $inheritDetail['title_str'] = '';
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>['content'=>$inheritDetail, 'used'=>$used, 'useSpecial'=>$useSpecial]));
        }
    }

    /**
     * @Title: getInheritAndDrug
     * @Description: TODO 获取传承方剂联动列表
     */
    public function getInheritAndDrug() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $existDetail = db('inherit_doctor')->alias('id')
                ->join(['jd_inherit'=>'i'], 'id.inherit_id = i.inherit_id' , 'inner')
                ->where("(id.member_id = {$data['member_id']}) AND id.is_checked = 1")
                ->field("id.inherit_id, i.inherit_name")
                ->order('id.add_date DESC')
                ->select();
            //查询特色方剂
            foreach ($existDetail as $key => $val) {
                $existDetail[$key]['drugList']= db('special')->where("is_display = 1 AND inherit_id = {$val['inherit_id']}")
                    ->field("special_name, special_id, content")
                    ->order('sort DESC')
                    ->select();
                foreach ($existDetail[$key]['drugList'] as $key1=>$val1) {
                    $existDetail[$key]['drugList'][$key1]['content'] = base64_encode($val1['content']);
                }
            }
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$existDetail));
        }
    }







    /**
     * @Title: article
     * @Description: TODO 传承文章详情页(H5)
     */
    public function article() {
        $map['`is_display`'] = 1;
        $map['`article_id`'] = $_GET['id'];
        $articleDetail = db('article')->where($map)->field("*")->find();
        $articleDetail['release_date'] = date('Y-m-d H:i', $articleDetail['release_date']);
        $this->assign('info',$articleDetail);
        return $this->fetch();
    }

    /**
     * @Title: getInheritDrugDetail
     * @Description: TODO 查看特色方剂详情
     */
    public function getInheritDrugDetail() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['special_id']=='' || $data['member_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //查询特色方剂详情
            $specialMap['`is_display`'] = 1;
            $specialMap['`special_id`'] = $data['special_id'];
            $specialArr = db('special')->where($specialMap)->field("*")->find();
            //处理简介的H5
            $specialArr['effect'] = config('url').'/inherit/effect?id='.$data['special_id'];
            //处理药方
            $contentArr = array();
            foreach (json_decode($specialArr['content']) as $key1=>$val1) {
                array_push($contentArr, $val1[1]);
            }
            $specialArr['content'] = base64_encode(json_encode($contentArr));

            $data['inherit_id'] = $specialArr['inherit_id'];
            //判断是否加入过该传承
            $exist = db('inherit_doctor')->where("(`member_id` = {$data['member_id']} OR `parent_id` = {$data['member_id']}) AND `is_checked` = 1 AND `inherit_id` = {$data['inherit_id']}")->count();
            if ($exist <= 0) {
                ajaxReturn(array('code'=>0, 'info'=>'请先加入该传承!','data'=>[]));
            }

            //获取传承的详细信息
            $map['i.`is_display`'] = 1;
            $map['i.`inherit_id`'] = $data['inherit_id'];
            $inheritDetail = db('inherit')->alias('i')
                ->join(['jd_doctor'=>'d'], 'i.member_id = d.member_id' , 'inner')
                ->where($map)
                ->field("i.inherit_id, i.inherit_name, d.title_id, d.member_name")
                ->find();
            //查询医生职称
            if ($inheritDetail['title_id']) {
                $inheritDetail['title_str'] = db('title')->where('title_id','in',$inheritDetail['title_id'])->field("`title_name`")->select();
            } else {
                $inheritDetail['title_str'] = '';
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok!','data'=>['inherit'=>$inheritDetail, 'content'=>$specialArr]));
        }
    }



}