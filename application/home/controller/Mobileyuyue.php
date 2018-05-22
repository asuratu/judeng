<?php

class Mobileyuyue extends Common {
    /*http://www.yunpian.com/product.html
    用户名：15968306399
    密码：wsm0688*/

    /**
     * 智能匹配模版接口发短信
     * apikey 为云片分配的apikey
     * text 为短信内容
     * mobile 为接受短信的手机号
     */
    
    public function sock_post() {
        $apikey = "42ff3fd78386d7dd9ad38a968ee041b1"; //修改为您的apikey(https://www.yunpian.com)登录官网后获取
        $mobile = "17316392477"; //请用自己的手机号代替
        $text="【昂立外语】您的验证码是1234";
//        $mobile = "13681929794"; //请用自己的手机号代替
//        switch (intval($type)) {
//            case 0:
//                $text="【昂立外语】您的验证码是" . $code;
//                break;
//        }

        // 发送短信
        $data=array('text'=>$text,'apikey'=>$apikey,'mobile'=>$mobile);

        $ch = curl_init();
        /* 设置验证方式 */
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept:text/plain;charset=utf-8', 'Content-Type:application/x-www-form-urlencoded','charset=utf-8'));
        /* 设置返回结果为流 */
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        /* 设置超时时间*/
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        /* 设置通信方式 */
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        if ($status = 0) {
            $json_data = $this->send($ch,$data);
        } else {
            $json_data = $this->send1($ch,$data);
        }
        $array = json_decode($json_data,true);
        curl_close($ch);
        return $array;
    }


    private function send($ch,$data){
        curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v2/sms/single_send.json');
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        return curl_exec($ch);
    }

    private function send1($ch,$data){
        curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v2/sms/batch_send.json');
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        return curl_exec($ch);
    }
}
