<?php
namespace app\home\controller;
use think\Request;
use app\tools\Html;

class Doctor extends Common
{
    /**
     * @Title:
     * @Description: TODO 医生资料修改
     */
    public function updateData()
    {
        if($this->request->isPost()) {
            $data=input('post.');
            if($data['content']==''||$data['is_type']==''|| $data['doctor_id']=='')
            {
               ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }
            $doctor = array();
            $doctor['member_id'] = $data['doctor_id'];
            $doctor['release_date'] = time();
            if ($data['is_type'] == 0) {       // 0 擅长修改 1 简介修改
                $data['content'] = trim($data['content'], ',');
                $this->countGood($data['content']);
                $doctor['goodat_id'] = $data['content'];
            } else {
                $doctor['introduction'] = Html::getTextToHtml($data['content'], 500);
            }

            $return = db('doctor')->update($doctor);
            if ($return) {
                ajaxReturn(array('code'=>1,'info'=>'修改成功','data'=>[]));
            } else {
                ajaxReturn(array('code'=>0,'info'=>'修改失败','data'=>[]));
            }

        }
    }

    public function countGood($goodId) {
        $goodSum = 15;
        $good_id = explode(',', $goodId);
        if (count($good_id) > $goodSum) {
            ajaxReturn(array('code'=>0,'info'=>'最多只可以选择' . $goodSum . '个'));
        }
        return true;
    }

    // 我的医馆
    public function findData() {
        $data=input('post.');
        if($data['content']==''||$data['is_type']==''|| $data['doctor_id']=='')
        {
            ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
        }
        $doctor = array();
        $doctor['member_id'] = $data['doctor_id'];
        $doctor['release_date'] = time();
        if ($data['is_type'] == 0) {       // 0 擅长修改 1 简介修改
            $data['content'] = trim($data['content'], ',');
            $this->countGood($data['content']);
            $doctor['goodat_id'] = $data['content'];
        } else {
            $doctor['introduction'] = Html::getTextToHtml($data['content'], 500);
        }

        $return = db('doctor')->update($doctor);
        if ($return) {
            ajaxReturn(array('code'=>1,'info'=>'修改成功','data'=>[]));
        } else {
            ajaxReturn(array('code'=>0,'info'=>'修改失败','data'=>[]));
        }
    }


    // 资料预览
    public function dataPreview() {

    }
}
