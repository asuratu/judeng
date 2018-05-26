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
                ->field("o.order_date, o.order_id, o.pay_amount, op.commission, op.base_commission, op.product_name, d.true_name, d.portrait")
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
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[$monthArr]));
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
                       ->field("o.order_date, o.order_id, o.pay_amount, op.commission, op.base_commission, op.product_name, d.true_name, d.portrait")
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
                   break;
               case 1:

                   break;
               default:

                   break;
           }


            //自己出售调制服务包的情况
            $orderDetail = db('order')->alias('o')
                ->join(['jd_order_product'=>'op'], 'op.order_id = o.order_id' , 'inner')
                ->join(['jd_doctor'=>'d'], 'o.doctor_id = d.member_id' , 'inner')
                ->where("o.`doctor_id` = {$data['member_id']} AND o.pay_status = 2 AND o.order_type = 4")
                ->field("o.order_date, o.order_id, o.pay_amount, op.commission, op.base_commission, op.product_name, d.true_name, d.portrait")
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
            ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[$monthArr]));
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