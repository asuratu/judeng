<?php
namespace app\home\controller;
use think\Request;
use think\Db;
class Certified extends Common
{

    /**
     * @Title: certifiedIndex
     * @Description: TODO 进入认证的界面(获取认证详情)
     */
    public function certifiedIndex() {
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


            $temp['member_id'] = $data['member_id'];
            $detail = db('doctor')->where($temp)->field("*")->find();
            $picDetail = db('doctor_info')->where($temp)->field("*")->find();
            $bankDetail = db('deposit')->where($temp)->field("*")->find();

            $hospitalRepartStr = explode(',', $detail['hospital_repart_str']);
            $info['is_certified'] = $detail['is_certified'];
            $info['face_photo'] = $detail['face_photo'];

            $info['job_pic1'] = $picDetail ? $picDetail['job_pic1'] : '';
            $info['job_pic2'] = $picDetail ? $picDetail['job_pic2'] : '';
            $info['tech_pic1'] = $picDetail ? $picDetail['tech_pic1'] : '';
            $info['tech_pic2'] = $picDetail ? $picDetail['tech_pic2'] : '';
            $info['quali_pic1'] = $picDetail ? $picDetail['quali_pic1'] : '';
            $info['quali_pic2'] = $picDetail ? $picDetail['quali_pic2'] : '';

            $info['true_name'] = $detail['true_name'];
            $info['sex'] = $detail['sex'];
            $info['birthday'] = date('Y-m-d', $detail['birthday']);
            $info['idcode'] = $detail['idcode'];
            $info['hospital_id'] = $detail['hospital_id'];
            $info['title_id'] = $detail['title_id'];

            $info['bank_id'] = $bankDetail['bank_id'];
            $info['deposit_name'] = $bankDetail['deposit_name'];
            $info['deposit_number'] = $bankDetail['deposit_number'];
            $info['mobile'] = $bankDetail['mobile'];

            //认证时所选的科室是主要科室
            $info['hospital_repart_str'] = $hospitalRepartStr[0];
            $info['goodat_id'] = $detail['goodat_id'];
            $info['introduction'] = $detail['introduction'];

            ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[$info]));
        }
    }

    /**
     * @Title: addCertifie
     * @Description: TODO 提交(修改)认证
     */
    public function addCertifie() {
        if($this->request->isPost())
        {
            try{
                Db::startTrans();
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

                $temp['member_id'] = $data['member_id'];
                $detail = db('doctor')->where($temp)->field("*")->find();

                //若认证已通过或审核中, 则不可提交
                if (in_array($detail['is_certified'], array(1, 2))) {
                    ajaxReturn(array('code'=>0, 'info'=>'您已提交过认证, 不可重复提交!','data'=>[]));
                }

                //保存图片数据流 - OSS
                $upPaperInfo = json_decode(Model('Oss')->upPic('uploads/paper'), true);
                $upPaperInfo['release_date'] = time();

                $upInfo['face_photo'] = $upPaperInfo['face_photo'];
                $upInfo['portrait'] = $upPaperInfo['face_photo'];
                unset($upPaperInfo['face_photo']);
                $upInfo['true_name'] = $data['true_name'];
                $upInfo['member_name'] = $data['true_name'];
                $upInfo['sex'] = $data['sex'];
                $upInfo['birthday'] = strtotime($data['birthday']);
                $upInfo['idcode'] = $data['idcode'];
                $upInfo['hospital_id'] = $data['hospital_id'];//单选一个医院
                $upInfo['title_id'] = $data['title_id'];//id字符串
                $upInfo['title_str'] = $data['title_str'];//名称字符串
                $upInfo['hospital_repart_str'] = $data['hospital_repart_str'];
                $upInfo['goodat_id'] = $data['goodat_id'] ?: '';
                $upInfo['introduction'] = $data['introduction'] ? (substr($data['introduction'],0,300)) : '';
                $upInfo['release_date'] = time();
                $upInfo['is_certified'] = 1;//状态改为审核中

                $bankId = $data['bank_id'] ?: 0;
                unset($data['bank_id']);

                $_identity1 = db('doctor')->where($temp)->update($upInfo);


                //更新或插入银行信息
                $temp['bank_id'] = $bankId;
                $bankDetail['bank_id'] = $bankId;
                $bankDetail['deposit_name'] = $data['deposit_name'] ?: '';
                $bankDetail['deposit_number'] = $data['deposit_number'] ?: '';
                $bankDetail['mobile'] = $data['mobile'] ?: '';
                $bankDetail['add_date'] = time();

                if ($bankId) {
                    if (db('deposit')->where($temp)->find()) {
                        $_identity2 = db('deposit')->where($temp)->update($bankDetail);
                    } else {
                        $bankDetail['member_id'] = $data['member_id'];
                        $_identity2 = db('deposit')->insert($bankDetail);
                    }
                } else {
                    $_identity2 = true;
                }


                //更新或插入证书信息
                unset($temp['bank_id']);
                if (db('doctor_info')->where($temp)->find()) {
                    $_identity3 = db('doctor_info')->where($temp)->update($upPaperInfo);
                } else {
                    $upPaperInfo['add_date'] = time();
                    $upPaperInfo['member_id'] = $data['member_id'];
                    $_identity3 = db('doctor_info')->insert($upPaperInfo);
                }

                if ($_identity1 && $_identity2 && $_identity3) {
                    Db::commit();
                    ajaxReturn(array('code'=>1, 'info'=>'ok','data'=>[]));
                } else {
                    Db::rollback();
                    ajaxReturn(array('code'=>0, 'info'=>'系统繁忙, 稍后再试!','data'=>[]));
                }
            } catch (\Exception $e) {
                Db::rollback();
                return false;
            }
        }
    }
}