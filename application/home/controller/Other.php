<?php
namespace app\home\controller;
use think\Request;
class Other extends Common
{

    /**
     * @Title: getAreaList
     * @Description: TODO 获取地区列表
     */
    public function getAreaList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);

            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            //获取地区数组
            $map['is_display'] = 1;
            $list=db('area')->where($map)->field("`area_id`,`name`")->order("`sort` DESC")->select();
            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>$list));
        }
    }

    /**
     * @Title: getHospitalList
     * @Description: TODO 获取医院列表
     */
    public function getHospitalList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            //获取医院数组
            $map['is_display'] = 1;
            $list=db('hospital')->where($map)->field("`hospital_id`,`hospital_name`")->order("`sort` DESC")->select();
            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>$list));
        }
    }
}