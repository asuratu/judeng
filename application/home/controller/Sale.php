<?php
namespace app\home\controller;
use think\Request;
use think\Db;
class Sale extends Common
{

    /**
     * @Title: mySaleDetail
     * @Description: TODO 我的销售情况
     */
    public function mySaleDetail() {
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

            //自己出售调制服务包的情况
            $orderDetail = db('order')->alias('o')
                ->join(['jd_order_product'=>'op'], 'op.order_id = o.order_id' , 'inner')
                ->where("o.`doctor_id` = {$data['member_id']} AND o.pay_status = 2 AND o.order_type = 4")
                ->field("o.*, op.*")
                ->order('o.order_date DESC')
                ->select();
            $totalAmount = 0;
            foreach ($orderDetail as $val) {
                $totalAmount += $val['pay_amount']*(1-($val['commission']/100)-($val['base_commission']/100));
            }

            //从下级获得的传承佣金
            $parentDetail = db('order')->alias('o')
                ->join(['jd_order_product'=>'op'], 'op.order_id = o.order_id' , 'inner')
                ->where("op.`parent_id` = {$data['member_id']} AND o.pay_status = 2 AND o.order_type = 4")
                ->field("o.*, op.*")
                ->order('o.order_date DESC')
                ->select();
            $commission = 0;
            foreach ($parentDetail as $val1) {
                $commission += $val1['pay_amount']*($val1['commission']/100);
            }

            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[['commission'=>$commission, 'totalAmount'=>$totalAmount]]));
        }
    }

    /**
     * @Title: selfGoodsList
     * @Description: TODO 服务包销售明细
     */
    public function selfGoodsList() {
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

            //自己出售调制服务包的情况
            $orderDetail = db('order')->alias('o')
                ->join(['jd_order_product'=>'op'], 'op.order_id = o.order_id' , 'inner')
                ->join(['jd_doctor'=>'d'], 'o.doctor_id = d.member_id' , 'inner')
                ->where("o.`doctor_id` = {$data['member_id']} AND o.pay_status = 2 AND o.order_type = 4")
                ->field("o.order_date, o.order_id, o.pay_amount, op.commission, op.base_commission, op.product_name, d.true_name, d.face_photo")
                ->order('o.order_date DESC')
                ->select();

            $monthArr = array();
            foreach ($orderDetail as $key=>$val) {
                //月份
                $monthStr = date('Y-m', $val['order_date']);
                $val['earn'] = $val['pay_amount']*(1-($val['commission']/100)-($val['base_commission']/100));
                $val['order_date'] = date('Y-m-d H:i:s', $val['order_date']);
                $monthArr[$monthStr][] = $val;
            }
            $keyArr = array_keys($monthArr);
            $valArr = array_values($monthArr);
            $lastArr = array();
            foreach ($valArr as $key1=>$val1) {
                $lastArr[$key1]['key'] = $keyArr[$key1];
                $lastArr[$key1]['value'] = $valArr[$key1];
            }
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$lastArr));
        }
    }


    /**
     * @Title: inviteInherit
     * @Description: TODO 邀请医生加入传承
     */
    public function inviteInherit() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['member_id']=='' || $data['inherit_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //查询成功邀请加入传承的医生总数
            $successDoc = db('inherit_doctor')->alias('id')
                ->join(['jd_inherit'=>'i'], 'i.inherit_id = id.inherit_id' , 'inner')
                ->where("id.member_id = {$data['member_id']} AND id.is_checked = 1 AND i.is_display = 1")
                ->field("i.inherit_name, i.inherit_id")
                ->count();
            //读取该医生的二维码
            $img = db('inherit_doctor')
                ->where("is_checked = 1 AND member_id = {$data['member_id']} AND inherit_id = {$data['inherit_id']}")
                ->field('img_url')
                ->find();
            //php判断二维码文件能否打开
            if ($img['img_url'] && file_get_contents($img['img_url'])){
                $img_url = $img['img_url'];
            }else{
                //文件不存在
                //生成邀请加入传承的二维码
                $insertData['img_url'] =  config('url') . createPic(config('url').'/member/inviteInherit?memberId='.$data['member_id'].'&inheritId='.$data['inherit_id']);
                db('inherit_doctor')
                    ->where("is_checked = 1 AND member_id = {$data['member_id']} AND inherit_id = {$data['inherit_id']}")
                    ->update($insertData);
                $img_url = $insertData['img_url'];
            }
            $url = config('url').'/member/inviteInherit?memberId='.$data['member_id'].'&inheritId='.$data['inherit_id'];
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[['successDoc'=>$successDoc, 'img'=>$img_url, 'shareUrl'=>$url]]));
        }
    }

    /**
     * @Title: myInheritList
     * @Description: TODO 查询医生成功加入的传承列表
     */
    public function myInheritList() {
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
            //查询成功加入的传承列表
            $successDoc = db('inherit_doctor')->alias('id')
                ->join(['jd_inherit'=>'i'], 'i.inherit_id = id.inherit_id' , 'inner')
                ->where("id.member_id = {$data['member_id']} AND id.is_checked = 1 AND i.is_display = 1")
                ->field("i.inherit_name, i.inherit_id")
                ->order('i.sort DESC')
                ->select();
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$successDoc));
        }
    }


    /**
     * @Title: myInheritTeam
     * @Description: TODO 我的传承销售团队
     */
    public function myInheritTeam() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }

            if($data['member_id']=='' || $data['inherit_id']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //找到我的所有下线
            if ($data['inherit_id'] > 0) {
                $where = "id.parent_id = {$data['member_id']} AND id.is_checked = 1 AND i.is_display = 1 AND id.inherit_id = {$data['inherit_id']} AND id.member_id != {$data['member_id']}";
            } else {
                $where = "id.parent_id = {$data['member_id']} AND id.is_checked = 1 AND i.is_display = 1 AND id.member_id != {$data['member_id']}";
            }

            $successDoc = db('inherit_doctor')->alias('id')
                ->join(['jd_inherit'=>'i'], 'i.inherit_id = id.inherit_id' , 'inner')
                ->where($where)
                ->field("id.member_id, id.inherit_id, i.inherit_name")
                ->order('i.sort DESC')
                ->select();

            foreach ($successDoc as $key=>$val) {
                //查找医生信息
                $docInfo = db('doctor')
                    ->where("member_id = {$val['member_id']}")
                    ->field("school_str, member_id, true_name, face_photo, is_clinic, recom")
                    ->find();

                //查询流派信息
                if ($docInfo['school_str']) {
                    $docInfo['school_arr'] = db('school')
                        ->where("school_id IN({$docInfo['school_str']})")
                        ->field("school_name")
                        ->order('sort DESC')
                        ->select();
                } else {
                    $docInfo['school_arr'] = array();
                }


                //是否有自建特色方剂 -- 特色标识
                $existGoods = db('self_goods')
                    ->where("member_id = {$val['member_id']} AND content != '' AND is_checked = 2 AND end_date > ".time())
                    ->field('self_goods_id')
                    ->count();
                $existGoods > 0 ? $docInfo['has_self_goods'] = 1 : $docInfo['has_self_goods'] = 0;
                //累计销售次数
                $saleInfo = db('order')->alias('o')
                    ->join(['jd_order_product'=>'op'], 'op.order_id = o.order_id' , 'inner')
                    ->join(['jd_doctor'=>'d'], 'o.doctor_id = d.member_id' , 'inner')
                    ->where("(o.`doctor_id` = {$val['member_id']} AND op.`inherit_id` = {$val['inherit_id']}) AND o.pay_status = 2 AND o.order_type = 4")
                    ->field("o.order_id, o.pay_amount, op.commission, op.base_commission")
                    ->select();

                $docInfo['sale_num'] = count($saleInfo);

                //计算返佣
                $docInfo['earn'] = 0;
                foreach ($saleInfo as $val1) {
                    $docInfo['earn'] += $val1['pay_amount']*($val1['commission']/100);
                }

                $successDoc[$key]['content'] = $docInfo;

            }
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$successDoc));
        }
    }


    public function selfTeamList() {
        if($this->request->isPost())
        {
            $data=input('post.');
            $res=checkSign($data);
            if($res['code']==0)
            {
                ajaxReturn($res);
            }
            if($data['member_id']=='' || $data['type']=='')
            {
                ajaxReturn(array('code'=>0,'info'=>'参数不完整','data'=>[]));
            }

            //type 0全部 1我的销售 2团队销售
           switch ($data['type']) {
               case 0:
                   //自己出售调制服务包的情况
                   $orderDetail = db('order')->alias('o')
                       ->join(['jd_order_product'=>'op'], 'op.order_id = o.order_id' , 'inner')
                       ->join(['jd_doctor'=>'d'], 'o.doctor_id = d.member_id' , 'inner')
                       ->where("(o.`doctor_id` = {$data['member_id']} OR op.`parent_id` = {$data['member_id']}) AND o.pay_status = 2 AND o.order_type = 4")
                       ->field("o.order_date, o.order_id, o.pay_amount, op.commission, op.base_commission, op.product_name, op.parent_id, d.true_name, d.face_photo")
                       ->order('o.order_date DESC')
                       ->select();

                   $monthArr = array();
                   foreach ($orderDetail as $key=>$val) {
                       //月份
                       $monthStr = date('Y-m', $val['order_date']);
                       if ($val['order_id'] == $data['member_id']) {
                           $val['earn'] = $val['pay_amount']*(1-($val['commission']/100)-($val['base_commission']/100));
                       } else {
                           $val['earn'] = $val['pay_amount']*($val['commission']/100);
                       }
                       $val['order_date'] = date('Y-m-d H:i:s', $val['order_date']);
                       $monthArr[$monthStr][] = $val;
                   }
                   $keyArr = array_keys($monthArr);
                   $valArr = array_values($monthArr);
                   $lastArr = array();
                   foreach ($valArr as $key1=>$val1) {
                       $lastArr[$key1]['key'] = $keyArr[$key1];
                       $lastArr[$key1]['value'] = $valArr[$key1];
                   }
//                   var_dump($lastArr);die;
                   break;
               case 1:
                    //我的销售
                   //自己出售调制服务包的情况
                   $orderDetail = db('order')->alias('o')
                       ->join(['jd_order_product'=>'op'], 'op.order_id = o.order_id' , 'inner')
                       ->join(['jd_doctor'=>'d'], 'o.doctor_id = d.member_id' , 'inner')
                       ->where("(o.`doctor_id` = {$data['member_id']}) AND o.pay_status = 2 AND o.order_type = 4")
                       ->field("o.order_date, o.order_id, o.pay_amount, op.commission, op.base_commission, op.product_name, op.parent_id, d.true_name, d.face_photo")
                       ->order('o.order_date DESC')
                       ->select();

                   $monthArr = array();
                   foreach ($orderDetail as $key=>$val) {
                       //月份
                       $monthStr = date('Y-m', $val['order_date']);
                       $val['earn'] = $val['pay_amount']*(1-($val['commission']/100)-($val['base_commission']/100));
                       $val['order_date'] = date('Y-m-d H:i:s', $val['order_date']);
                       $monthArr[$monthStr][] = $val;
                   }
                   $keyArr = array_keys($monthArr);
                   $valArr = array_values($monthArr);
                   $lastArr = array();
                   foreach ($valArr as $key1=>$val1) {
                       $lastArr[$key1]['key'] = $keyArr[$key1];
                       $lastArr[$key1]['value'] = $valArr[$key1];
                   }
//                   var_dump($lastArr);die;
                   break;
               default:
                   //团队出售调制服务包的情况
                   $orderDetail = db('order')->alias('o')
                       ->join(['jd_order_product'=>'op'], 'op.order_id = o.order_id' , 'inner')
                       ->join(['jd_doctor'=>'d'], 'o.doctor_id = d.member_id' , 'inner')
                       ->where("(op.`parent_id` = {$data['member_id']} AND o.`doctor_id` != {$data['member_id']}) AND o.pay_status = 2 AND o.order_type = 4")
                       ->field("o.order_date, o.order_id, o.pay_amount, op.commission, op.base_commission, op.product_name, op.parent_id, d.true_name, d.face_photo")
                       ->order('o.order_date DESC')
                       ->select();

                   $monthArr = array();
                   foreach ($orderDetail as $key=>$val) {
                       //月份
                       $monthStr = date('Y-m', $val['order_date']);
                       $val['earn'] = $val['pay_amount']*($val['commission']/100);
                       $val['order_date'] = date('Y-m-d H:i:s', $val['order_date']);
                       $monthArr[$monthStr][] = $val;
                   }
                   $keyArr = array_keys($monthArr);
                   $valArr = array_values($monthArr);
                   $lastArr = array();
                   foreach ($valArr as $key1=>$val1) {
                       $lastArr[$key1]['key'] = $keyArr[$key1];
                       $lastArr[$key1]['value'] = $valArr[$key1];
                   }
//                   var_dump($lastArr);die;
                   break;
           }
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>$lastArr));
        }
    }

    /**
     * @Title: wallet
     * @Description: TODO 我的账户钱包-零钱明细
     */
    public function walletLog() {
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
            $logDetail = db('wallet_log')
                ->where("(member_id = {$data['member_id']})")
                ->field("*")
                ->order('add_date DESC')
                ->select();

            //查询特色方剂
            $inArr = array();
            $outArr = array();
            foreach ($logDetail as $val) {
               if ($val['type'] == 0) {
                    array_push($inArr, $val);
               } elseif ($val['type'] == 1) {
                   array_push($outArr, $val);
               }
            }
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[['in'=>$inArr, 'out'=>$outArr]]));
        }
    }









}