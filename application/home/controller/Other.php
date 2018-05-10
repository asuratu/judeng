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

            if($data['area_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //获取地区数组
            $map['is_display'] = 1;
            $list=db('area')->where($map)->field("`area_id`,`name`")->order("`sort` DESC")->select();
            foreach ($list as $key => $val) {
                if ($val['area_id'] == $data['area_id']) {
                    $list[$key]['selected'] = 1;
                } else {
                    $list[$key]['selected'] = 0;
                }
            }
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

            if ($data['member_id']) {
                //查询该用户所选的医院
                $temp['member_id'] = $data['member_id'];
                $hospital = db('doctor')->where($temp)->field("`hospital_id`")->find();
                $hospital = $hospital['hospital_id'];
            } else {
                $hospital = 0;
            }

            //获取医院数组
            $map['is_display'] = 1;
            $list=db('hospital')->where($map)->field("`hospital_id`,`hospital_name`")->order("`sort` DESC")->select();
            foreach ($list as $key => $val) {
                if ($val['hospital_id'] == $hospital) {
                    $list[$key]['selected'] = 1;
                } else {
                    $list[$key]['selected'] = 0;
                }
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>$list));
        }
    }

    /**
     * @Title: getbankList
     * @Description: TODO 获取银行列表
     */
    public function getbankList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['bank_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //获取银行数组
            $map['is_display'] = 1;
            $list=db('bank')->where($map)->field("`bank_id`,`bank_name`")->order("`sort` DESC")->select();

            foreach ($list as $key => $val) {
                if ($val['bank_id'] == $data['bank_id']) {
                    $list[$key]['selected'] = 1;
                } else {
                    $list[$key]['selected'] = 0;
                }
            }

            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>$list));
        }
    }

    /**
     * @Title: getDepartmentList
     * @Description: TODO 根据医院获取科室列表
     */
    public function getDepartmentList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['hospital_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //获取科室数组
            $map['hospital_id'] = $data['hospital_id'];
            $list = db('hospital_repart')->where($map)->alias('hr')
                ->join(['jd_department'=>'d'], 'hr.department_id = d.department_id' , 'left')
                ->field("hr.hospital_repart_id, d.department_name")
                ->select();
            $hospitalRepartArr = explode(',', $data['hospital_repart_str']);

            foreach ($list as $key => $val) {
                if (in_array($val['hospital_repart_id'], $hospitalRepartArr)) {
                    $list[$key]['selected'] = 1;
                } else {
                    $list[$key]['selected'] = 0;
                }
            }

            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>$list));
        }
    }

    /**
     * @Title: getGoodAtList
     * @Description: TODO 获取医生擅长列表
     */
    public function getGoodAtList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if ($data['member_id']) {
                //查询该用户所选的擅长
                $temp['member_id'] = $data['member_id'];
                $goodAtStr = db('doctor')->where($temp)->field("`goodat_id`")->find();
                $goodAtStr = explode(',', $goodAtStr['goodat_id']);
            } else {
                $goodAtStr = array();
            }

            //获取擅长数组
            $map['is_show'] = 1;
            $list=db('goodat')->where($map)->field("`goodat_id`,`goodat_name`, level, `parent_id`")->order("`sort` DESC")->select();
            $arr1 = array();
            $arr2 = array();
            foreach ($list as $key => $val) {
                if ($val['level'] == 1) {
                    array_push($arr1, $val);
                } else {
                    if (in_array($val['goodat_id'], $goodAtStr)) {
                        $val['selected'] = 1;
                    } else {
                        $val['selected'] = 0;
                    }
                    array_push($arr2, $val);
                }
            }
            foreach ($arr1 as $key1=>$val1) {
                $arr3 = array();
                foreach ($arr2 as $key2=>$val2) {
                    if ($val2['parent_id'] == $val1['goodat_id']) {
                        array_push($arr3, $val2);
                    }
                }
                $arr1[$key1]['content'] = $arr3;
            }
            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>$arr1));
        }
    }

    /**
     * @Title: getTitleList
     * @Description: TODO 获取职称列表
     */
    public function getTitleList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            $titleArr = explode(',',$data['title_id']);
            //获取职称数组
            $map['is_show'] = 1;
            $list=db('title')->where($map)->field("`title_id`,`title_name`")->order("`sort` DESC")->select();
            foreach ($list as $key => $val) {
                if (in_array($val['title_id'], $titleArr)) {
                    $list[$key]['selected'] = 1;
                } else {
                    $list[$key]['selected'] = 0;
                }
            }

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