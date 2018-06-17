<?php
/*
    推送测试
*/
namespace app\home\model;

use think\Model;

class Umeng extends Model
{
    private $_config = array();

    public function __construct()
    {
        parent::__construct();
        $this->_config = $this->_makeConfig();
    }


    /*
        安卓发送
    */
    public function PtoAndroid($device_tokens, $ticker, $title, $text)
    {

        if (count($device_tokens) > 500) {
            die('设备超过500个');
        }

        //拼接签名
        $post_data = $this->_android($device_tokens, $ticker, $title, $text);
        $sign = $this->_makeSign($post_data, 1);
        $url = $this->_config['url'] . '?sign=' . $sign;

        //发送请求
        $res = $this->_curl($url, $post_data);

        //判断
        if ($res['ret'] != 'SUCCESS') {
            //发送失败，
            die($res['data']->error_code);
        }
    }


    public function testA()
    {
        $device_tokens = array('D584D61C-EF20-4F76-8BE9-19B81FB7B141');
        $this->PtoAndroid($device_tokens, '通知栏的文字', '测试标题', '测试内容');
    }


    /*
        iOS发送
    */
    public function PtoIos($device_tokens, $text)
    {
        if (count($device_tokens) > 500) {
            die('设备超过500个');
        }

        //拼接post数据
        $post_data = $this->_ios($device_tokens, $text);

        //拼接签名
        $sign = $this->_makeSign($post_data, 2);
        $url = $this->_config['url'] . '?sign=' . $sign;

        //发送请求
        $res = $this->_curl($url, $post_data);
        //判断
        if ($res['ret'] != 'SUCCESS') {
            //发送失败，
            die($res['data']->error_code);
        }
    }

    public function testIos()
    {
        $device_tokens = array('D584D61C-EF20-4F76-8BE9-19B81FB7B141');
        $this->PtoIos($device_tokens, 'hello');
    }


    //生成配置文件
    private function _makeConfig()
    {
        return array(
            'method' => 'POST',
            'url' => 'http://msg.umeng.com/api/send',
				'ios_app_key'				=> '5b037dedb27b0a26ec00002a',
				'ios_app_master_secret' 	=> 'ychjmpydpgeipzlcequ9md4qrabeej7a',
				'and_app_key' 				=> '5b027216f29d9847b500007d',
				'and_app_master_secret' 	=> 'o44cidfhfxgrq4cabhzcufim774aoxa4',
			);
		}


    /*
        生成签名
        @param 		post_body 请求体
                    type 	1,安卓，2 ios
        @return 	str
    */
    private function _makeSign($post_body, $type)
    {
        if ($type == 1)
            return strtolower(md5($this->_config['method'] . $this->_config['url'] . $post_body . $this->_config['and_app_master_secret']));
        else
            return strtolower(md5($this->_config['method'] . $this->_config['url'] . $post_body . $this->_config['ios_app_master_secret']));

    }


    /*
        android post_body设置
        @param 		ticker 	str 提示栏文字
                    title 	str 通知标题
                    text 	str 文字描述
                    device_tokens 	array 设备号
        @return
    */
    private function _android($device_tokens, $ticker, $title, $text, $type = 'unicast')
    {

        $temp_arr = array(
            'appkey' => $this->_config['and_app_key'],
            'timestamp' => time(),
            'type' => $type,
            'device_tokens' => trim(implode(', ', $device_tokens), ', '),
            'payload' => array(
                'display_type' => 'notification',//通知，友盟接管处理
                'body' => array(
                    'ticker' => $ticker,
                    'title' => $title,
                    'text' => $text,
                    'after_open' => 'go_app',
//                    'custom' => 'do things', //点击通知后做的事
					),
				),
				'production_mode' 		=> 'false',//测试，上线为true
                'description' 			=> 'cccc',//描述
			);

			return json_encode($temp_arr);
		}


    /*
        ios post_body消息体设置
        @param 		ticker 	str 提示栏文字
                    title 	str 通知标题
                    text 	str 文字描述
                    device_tokens 	array 设备号
        @return
    */
    private function _ios($device_tokens, $text, $type = 'unicast')
    {
        $temp_arr = array(
            'appkey' => $this->_config['ios_app_key'],
            'timestamp' => time(),
            'type' => $type,
            'device_tokens' => trim(implode(', ', $device_tokens), ', '),
            'payload' => array(
                'aps' => array(
                    'alert' => $text,
                    'after_open' => 'go_app',
//                    'custom' => 'do things', //点击通知后做的事
                ),
            ),
            'production_mode' 		=> 'false',//测试，上线为true
            'description' 			=> 'broadcast',//描述
        );
        return json_encode($temp_arr);

        $member=array();
        $memberCount = count($_model['member']);
        foreach ($_model['member'] as $val) {
            $b = 0;
            $k = 0;
            foreach ($_model['member'] as $_key => $_val) {
                if ($_val->score > $b) {
                    $k = $_key;
                }
            }
        }
    }


    /*
        拼接curl请求
    */
    private function _curl($url, $post)
    {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_BINARYTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 60);
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post);

        $result = curl_exec($ch);

        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlErrNo = curl_errno($ch);
        $curlErr = curl_error($ch);
        curl_close($ch);

        if ($httpCode == "0")
            die("Curl error number:" . $curlErrNo . " , Curl error details:" . $curlErr . "\r\n");
        else if ($httpCode != "200")
            die("Http code:" . $httpCode . " details:" . $result . "\r\n");
        else
            return (array)json_decode($result);
    }
}