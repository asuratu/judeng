<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
error_reporting(E_ERROR | E_WARNING | E_PARSE);
/**
+--------------------------------------------------------------------------
 * CURL 模拟post提交
+-------------------------------------------------------------------------
 *@param $url url地址
 *@param $data 提交数据
+-------------------------------------------------------------------------
 */
function curlPost($url,$data)
{
    $ch = curl_init();
    if(stripos($url,"https://")!==FALSE)
    {
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    }
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
    curl_setopt($ch, CURLOPT_POST,true);
    curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
    $content = curl_exec($ch);
    $status = curl_getinfo($ch);
    curl_close($ch);
    if(intval($status["http_code"])==200){
        return $content;
    }else{
        return false;
    }
}


/**
+--------------------------------------------------------------------------
 * CURL 模拟get提交
+-------------------------------------------------------------------------
 *@param $url url地址
+-------------------------------------------------------------------------
 */
function curlGet($url)
{
    $ch = curl_init();
    if(stripos($url,"https://")!==FALSE)
    {
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    }
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
    curl_setopt($ch, CURLOPT_HEADER, 0);
    $content = curl_exec($ch);
    $status = curl_getinfo($ch);
    curl_close($ch);
    if(intval($status["http_code"])==200){
        return $content;
    }else{
        return false;
    }
}

/**
+--------------------------------------------------------------------------
 * 返回json 数据
+-------------------------------------------------------------------------
 *@param $data array
+-------------------------------------------------------------------------
 */
function ajaxReturn($data,$type = 'json')
{
    exit(json_encode($data));
}


/**
+--------------------------------------------------------------------------
 * 验证签名
+-------------------------------------------------------------------------
 *@param $data array
+-------------------------------------------------------------------------
 */

function checkSign($data)
{
    if($data['_time']=='')
    {
        return array('code'=>0,'info'=>'参数不完整');
    }
    $outtime=config('outtime');
    if(time()-$data['_time']>$outtime)
    {
        return array('code'=>0,'info'=>'请求超时，请重新请求！');
    }
    $key=config('key');
    $data['key']=$key;
    $sign=$data['sign'];
    unset($data['sign']);
    $sign_md5=join('',$data);
    if($sign==$sign_md5)
    {
        return array('code'=>1,'info'=>'签名成功！');
    }else
    {
        return array('code'=>1,'info'=>'签名失败！');
    }
}

/**
+----------------------------------------------------------
 * 生成随机字符串
+----------------------------------------------------------
 * @param int       $length  要生成的随机字符串长度
 * @param string    $type    随机码类型：0，数字+大写字母；1，数字；2，小写字母；3，大写字母；4，特殊字符；-1，数字+大小写字母+特殊字符
+----------------------------------------------------------
 * @return string
+----------------------------------------------------------
 */
function randCode($length = 5, $type = 0) {
    $arr = array(1 => "0123456789", 2 => "abcdefghijklmnopqrstuvwxyz", 3 => "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 4 => "~@#$%^&*(){}[]|");
    $code='';
    if ($type == 0) {
        array_pop($arr);
        $string = implode("", $arr);
    } else if ($type == "-1") {
        $string = implode("", $arr);
    } else {
        $string = $arr[$type];
    }
    $count = strlen($string) - 1;
    for ($i = 0; $i < $length; $i++) {
        $str[$i] = $string[rand(0, $count)];
        $code .= $str[$i];
    }
    return $code;
}

/**
+--------------------------------------------------------------------------
 * 发送短信
+-------------------------------------------------------------------------
 *@param $data array
+-------------------------------------------------------------------------
 */

function sendSMS($mobile,$body)
{
    header("Content-Type:text/html;charset=utf-8");
    $data['apikey'] = '7f96f1736e202ad7994d5d74c559ac23';   //帐号
    $data['mobile'] = $mobile; //手机号码， 多个用英文状态下的 , 隔开
    $data['text'] =$body; //短信内容需要用urlencode编码下
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept:text/plain;charset=utf-8',
        'Content-Type:application/x-www-form-urlencoded', 'charset=utf-8'));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v2/sms/single_send.json');
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
    $result = curl_exec($ch);
    $res=json_decode($result,true);
    if($res['code']===0)
    {
        return true;
    }else
    {
        return false;
    }
}
