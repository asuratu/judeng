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

    /**
     * 广告管理
     */
    public function getAd() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['type_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            $list=db('ad')->where("type_id = {$data['type_id']} and is_display = 1")->field("`ad_title`,`ad_img`,`ad_url`,`add_date`")->order("`ad_sort` ASC")->select();
            $order = array();
            foreach ($list as $key => $val) {
                array_push($order, $val);
                $order[$key]['ad_img'] = $this->view->setting['base_host'] . $val['ad_img'];
                $order[$key]['add_date'] = date('Y-m-d H:i', $val['add_date']);
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>$order));
        }
    }

}