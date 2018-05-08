<?php
namespace app\home\controller;
use think\Request;
class His extends Common
{

    /**
     * @Title: updateDrugList
     * @Description: TODO 同步His药品库(注: 每天凌晨1点更新)
     */
    public function updateDrugList() {
        set_time_limit (0);
        $url = 'http://192.168.30.31/tktservice/tkt_service.asmx/TKT_YP_Z_SELECT_ALL';
        $_info = curlGet($url);
        $xml=new \SimpleXMLElement($_info);
        $array = json_decode(json_encode($xml),true);

        $listArr = array();
        foreach ($array['string'] as $key => $val) {
            $listArr[intval($key/13)][] = $val;
        }

        foreach ($listArr as $key2 => $val2) {
                //若该药房的药品名已存在就更新, 否则插入
                $temp['drug_name'] = $val2[0];
                $temp['his_drug_id'] = $val2[1];
                $temp1['his_drug_id'] = $val2[1];

                $temp['manufacturer'] = $val2[6] ?: '';
                $temp['pos_code'] = $val2[2];
                $temp['goods_code'] = $val2[3];
                $temp['k_name'] = $val2[4];
                $temp['Drug_spec'] = $val2[5];
                $temp['Drug_unit'] = $val2[7];
                $temp['Is_user'] = intval($val2[8]) ?: 0;
                $temp['price'] = floatval($val2[9]) ?: 0;
                $temp['num'] = floatval($val2[10]) ?: 0;
                $temp['money'] = floatval($val2[11]) ?: 0;
                $temp['date'] = $val2[12] ?: time();
                $temp['release_date'] = time();

                if (db('drug')->where($temp1)->count() > 0) {
                    //更新
                    $map['prescription_id'] = 1;
                    $map['drug_name'] = $temp['drug_name'];
                    db('drug')->where($map)->update($temp);
                } else {
                    //插入
                    $temp['prescription_id'] = 1;
                    $temp['add_date'] = time();
                    db('drug')->insert($temp);
                }
        }
        ajaxReturn(array('code'=>1,'info'=>'ok','data'=>[]));
    }
}