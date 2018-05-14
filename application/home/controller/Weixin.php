<?php
namespace app\home\controller;
use think\Db;
use think\Controller;
use think\Wechat;
class Weixin extends Controller {
    /**
     * 接口地址
     * @return string
     */

    public function messageTemplate($type, $post = array()) {
        $wechat_config=db('wx_user')->cache(true)->find();
//        logger::debug('abce');
        $_token = $this->getAccessToken();
        $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=" . $_token; //模板信息请求地址
        switch ($type) {
            case 1: //订单成功
                $template_id = 'LmWETx_eb1lqjj2JeUJG1aKLfr3iY3Y0IeZriXW7EG0';
                $_url = $post['url'];
                $_data =  array(
                    'first' => array('value' => '恭喜你购买课程成功！', 'color'=>"#173177"),
                    'keyword1' => array('value' => $post['order_sn'], 'color'=>"#173177"),
                    'keyword2' => array('value' => $post['sort_name'], 'color'=>'#173177'),
                    'keyword3' => array('value' => $post['order_amount'], 'color'=>'#173177'),
                    'keyword4' => array('value' => $post['mobile'], 'color'=>'#173177'),
                    'keyword5' => array('value' => $post['date'], 'color'=>'#173177'),
                    'remark'=> array('value' => '谢谢您的光临！', 'color' => '#173177'),
                );
                break;
            case 2: //开课提醒
                $template_id = 'N8Cfe_0USanj3dMT_8w0anKuv4_CfqyFl5JDPGQi7kY';
                $_url = $post['url'];
                $_data =  array(
                    'userName' => array('value' => $post['userName'], 'color'=>"#173177"),
                    'courseName' => array('value' => $post['courseName'], 'color'=>"#173177"),
                    'date' => array('value' => $post['date'], 'color'=>"#173177"),
                    'remark'=> array('value' => '感谢您对昂立一课的支持', 'color' => '#173177'),
                );
                break;
            case 3: //退款申请提交成功 maohongbin
                $template_id = 'v8UOpsDguSJwnnh1YMCRm39TzRXCHz_IxQmZOjtoACk';
                $_url = $post['url'];
                $_data =  array(
                    'first' => array('value' => '您的退款申请已提交', 'color'=>"#173177"),
                    'keyword1' => array('value' => $post['order_sn'], 'color'=>"#173177"),
                    'keyword2' => array('value' => $post['order_amount'], 'color'=>'#173177'),
                    'keyword3' => array('value' => $post['refund_way'], 'color'=>'#173177'),
                    'keyword4' => array('value' => $post['refund_date'], 'color'=>'#173177'),
                    'remark'=> array('value' => '昂立一课平台保障您的学车权益，投诉与咨询电话：4006002669。', 'color' => '#173177'),
                );
                break;
            case 4: //退款审核失败 maohongbin
                $template_id = 'FUPd6X1GuhJdR0ynNizG3Svk3edsUEvVjHTxyGKzi7k';
                $_url = $post['url'];
                $_data =  array(
                    'first' => array('value' => $post['first'], 'color'=>"#173177"),
                    'keyword1' => array('value' => $post['student_name'], 'color'=>"#173177"),
                    'keyword2' => array('value' => $post['mobile'], 'color'=>'#173177'),
                    'keyword3' => array('value' => $post['apply_info'], 'color'=>'#173177'),
                    'keyword4' => array('value' => $post['examine_remark'], 'color'=>'#173177'),
                    'remark'=> array('value' => '请联系学生说明情况', 'color' => '#173177'),
                );
                break;
            case 5: //退款审核成功 maohongbin
                $template_id = 'F44JGj8flM4ppidPdhjesOXRIdBJD_5CxcFrUeflk8Q';
                $_url = $post['url'];
                $_data =  array(
                    'first' => array('value' => '退款成功通知。', 'color'=>"#173177"),
                    'keyword1' => array('value' => $post['class_name'], 'color'=>"#173177"),
                    'keyword2' => array('value' => $post['class_date'], 'color'=>'#173177'),
                    'keyword3' => array('value' => $post['student_name'], 'color'=>'#173177'),
                    'keyword4' => array('value' => $post['order_sn'], 'color'=>'#173177'),
                    'keyword5' => array('value' => $post['order_amount'], 'color'=>'#173177'),
                    'remark'=> array('value' => $post['remark'], 'color' => '#173177'),
                );
                break;
            case 6: //课后评价 maohongbin
                $template_id = 'QSNC0X0p7Lgk7IZXtRpFeBFEhBLDwZ6fv8bt9YVy4xc';
                $_url = $post['url'];
                $_data =  array(
                    'first' => array('value' => $post['first'], 'color'=>"#173177"),
                    'keyword1' => array('value' => $post['class_name'], 'color'=>"#173177"),
                    'keyword2' => array('value' => $post['class_date'], 'color'=>'#173177'),
                    'keyword3' => array('value' => $post['teacher'], 'color'=>'#173177'),
                    'remark'=> array('value' => $post['remark'], 'color' => '#173177'),
                );
                break;
            case 7: //推送新课程 guizhouchen
                $template_id = 'RTdJDpkNbzVsI_SqG71j4wFDQCUFv_68V9qhdDsCD3I';
                $_url = $post['url'];
                $_data =  array(
                    'first' => array('value' => "您好 您购买的课程视频上线了！", 'color'=>"#173177"),
                    'keyword1' => array('value' => $post['class_name'], 'color'=>"#173177"),
                    'keyword2' => array('value' => $post['class_date'], 'color'=>'#173177'),
//                    'keyword3' => array('value' => $post['teacher'], 'color'=>'#173177'),
                    'remark'=> array('value' => "赶紧进入昂立一课网站学习吧", 'color' => '#173177'),
                );
                break;
            default :
                $template_id = '';
                $_url = '';
                $_data = array();
                break;
        }
        $template = array(
            'touser' => $post['openid'],
            'template_id' => $template_id,// 模板ID
            'url' => $_url,
            'data' => $_data
        );

        //将上面的数组数据转为json格式
        $post_data = json_encode($template);
        //发送数据，post方式<br>　　　　　　　　　//配置curl请求
        $ch = curl_init(); //创建curl请求
        curl_setopt($ch, CURLOPT_URL, $url); //设置发送数据的网址
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1); //设置有返回值，0，直接显示
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,0); //禁用证书验证
        curl_setopt($ch, CURLOPT_POST, 1); //post方法请求
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);//post请求发送的数据包
        //接收执行返回的数据
        $data = curl_exec($ch);
        //关闭句柄
        curl_close($ch);
//        logger::debug('data2' . $data);
        //-----------------------------------------------------
        //微信消息记录
//        $message = array();
//        $message['type'] = $type;
//        $message['openid'] = $post['openid'];
//        $message['templateid'] = $template_id;
//        $message['url'] = $_url;
//        $message['content'] = json_encode($_data,JSON_UNESCAPED_UNICODE);
//        $message['return'] = $data;
//        $message['add_time'] = time();
//        $message['status'] = 1;
//        $message['master_id'] = isset($post['master_id']) ? $post['master_id'] : 0;
        //-----------------------------------------------------
        $data = json_decode($data,true); //将json数据转成数组
//        logger::debug('data' . $data);
        return $data;

    }

    /**
     * accessToken
     * @return bool
     */
    public function getAccessToken() {

        $post = array(
            'grant_type' => 'client_credential'
        , 'appid' => $this->appid
        , 'secret' => $this->_appsecret,
        );
        $_tmp = array(
            'token' => ''
        , 'createtime' => '',
        );
//        $_timelimit = 7000;
//        $_cacheId = 'accessTokenh5';
//        if (false !== ($_tmp = $this->cache->get($_cacheId)) && time() - intval($_tmp['createtime']) < $_timelimit) {
//            logger::debug(time() - intval($_tmp['createtime']));
//            return $_tmp['token'];
//        }

        if (($_json = json_decode($this->curl('https://api.weixin.qq.com/cgi-bin/token', $post, 'GET'), true)) !== false &&
            isset($_json['access_token'])
        ) {
            $_tmp = array(
                'token' => $_json['access_token']
            , 'createtime' => time(),
            );
//            $this->cache->set($_cacheId, $_tmp);
            return $_json['access_token'];
        }
//        logger::debug('b' . json_encode($_json));
        return false;
    }
    public function index(){
		$wechat_config=db('wx_user')->cache(true)->find();
        $options = array(
 			'token'=>$wechat_config['w_token'], //填写你设定的key
 			'encodingaeskey'=>$wechat_config['aeskey'], //填写加密用的EncodingAESKey
 			'appid'=>$wechat_config['appid'], //填写高级调用功能的app id
 			'appsecret'=>$wechat_config['appsecret'], //填写高级调用功能的密钥
        );
        $weObj = new Wechat($options);
        $weObj->valid();
        $type  = $weObj->getRev()->getRevType();
		$event = $weObj->getRev()->getRevEvent();
		$content=$weObj->getRevContent();
		if($type=='event'&&$event['event']=='subscribe'&&$event['key']=='')
		{
			$weObj->text('欢迎访问，暂时还未开通')->reply();
			
		}

		   
       
    }
    /**
     * @param $str  关键字字符串
     * @return string
     */
    protected  function dealText($str){
        if(!$str){return false;}
        $string=C('WEIXIN.callback');
        $list=explode('*',$string);
        foreach($list as $value){
            $arr=explode('|',$value);
            if(false!==strpos($arr[0],$str)){
                return $arr[1];
            }else{
                continue;
            }
        }
        return '找不到需要查询的内容！';
    }
}



