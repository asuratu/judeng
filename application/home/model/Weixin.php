<?php
namespace app\home\model;

use think\Model;

class Weixin extends Model
{

    public function messageTemplate($type, $post = array()) {
//        'oUdv91Pij4jFzftpeMArbEKybnkk'
        $wechat_config=db('wx_user')->cache(true)->find();
        $_token = $this->getAccessToken($wechat_config);
        $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=" . $_token; //模板信息请求地址
        switch ($type) {
            case 1: // 诊断通知
                $template_id = 'YyPJ6I6r132FA2n94SPq1vZRv9n_DM0WcFcl7zSwzNU';
                $_url = $post['url'];
                $_data =  array(
                    'first' => array('value' => $post['first'], 'color'=>"#173177"),                // 头部信息
                    'keyword1' => array('value' => $post['doctor'], 'color'=>"#173177"),            // 就诊人
                    'keyword2' => array('value' => $post['department'], 'color'=>'#173177'),        // 科室
                    'keyword3' => array('value' => $post['diagnosis'], 'color'=>'#173177'),         // 诊断时间
                    'keyword4' => array('value' => $post['results'], 'color'=>'#173177'),           // 诊断结果
                    'remark'=> array('value' => $post['remark'], 'color' => '#173177'),             // 底部信息
                );
                break;
            case 2: // 医嘱提醒  //可以用来提醒群发图文，群发链接
                $template_id = 'AU0-zgIAmwCncz438B0VzlWRSA8R_px60-uaVQO6zrc';
                $_url = $post['url'];
                $_data =  array(
                    'first' => array('value' => $post['first'], 'color'=>"#173177"),                // 头部信息
                    'keyword1' => array('value' => $post['doctor_name'], 'color'=>"#173177"),            // 医生姓名
                    'keyword2' => array('value' => $post['hospital'], 'color'=>'#173177'),        // 医院名称
                    'keyword3' => array('value' => $post['content'], 'color'=>'#173177'),         // 医嘱内容
                    'remark'=> array('value' => $post['remark'], 'color' => '#173177'),             // 底部信息
                );
                break;
            case 3: // 复诊提醒
                $template_id = 'JLuWuDi1Wmc8UUJj7iayRWybg7WTDcJ_4bcAOFtE8WQ';
                $_url = $post['url'];
                $_data =  array(
                    'first' => array('value' => $post['first'], 'color'=>"#173177"),                // 头部信息
                    'keyword1' => array('value' => $post['member_name'], 'color'=>"#173177"),            // 姓名
                    'keyword2' => array('value' => $post['hospital'], 'color'=>'#173177'),        // 就诊医院
                    'keyword3' => array('value' => $post['doctor_name'], 'color'=>'#173177'),         // 就诊医生
                    'keyword4' => array('value' => $post['revisit'], 'color'=>'#173177'),           // 复诊时间
                    'remark'=> array('value' => $post['remark'], 'color' => '#173177'),             // 底部信息
                );
                break;
            case 4: // 待支付提醒
                $template_id = 'LCuZ0KYRrf3x1EYW0CHLcjX2AGLI3lFCzfJmrn6N204';
                $_url = $post['url'];
                $_data =  array(
                    'first' => array('value' => $post['first'], 'color'=>"#173177"),                // 头部信息
                    'keyword1' => array('value' => $post['reservation_type'], 'color'=>"#173177"),            // 预约类型
                    'keyword2' => array('value' => $post['doctor_name'], 'color'=>'#173177'),        // 预约医生
                    'keyword3' => array('value' => $post['location'], 'color'=>'#173177'),         // 预约地点
                    'keyword4' => array('value' => $post['revisit'], 'color'=>'#173177'),           // 预约时间
                    'remark'=> array('value' => $post['remark'], 'color' => '#173177'),             // 底部信息
                );
                break;
            case 5: // 咨询回复提醒
                $template_id = 'o_DUcmNo6sqJjLL5UGmPumzaUS-CPn6xLvf7m4lorng';
                $_url = $post['url'];
                $_data =  array(
                    'first' => array('value' => $post['first'], 'color'=>"#173177"),                // 头部信息
                    'keyword1' => array('value' => $post['consultation'], 'color'=>"#173177"),            // 咨询内容
                    'keyword2' => array('value' => $post['content'], 'color'=>'#173177'),        // 回复内容
                    'keyword3' => array('value' => $post['doctor_name'], 'color'=>'#173177'),         // 医生名
                    'remark'=> array('value' => $post['remark'], 'color' => '#173177'),             // 底部信息
                );
                break;
                case 6: // 购药提醒
                $template_id = '5pQMbCVtzd6TUWJaKb-IyjX469uz6PIRnG_vD_ppJMA';
                $_url = $post['url'];
                $_data =  array(
                    'first' => array('value' => $post['first'], 'color'=>"#173177"),                // 头部信息
                    'keyword1' => array('value' => $post['member_name'], 'color'=>"#173177"),            // 患者姓名
                    'keyword2' => array('value' => $post['prescription'], 'color'=>'#173177'),        // 处方类型
                    'remark'=> array('value' => $post['remark'], 'color' => '#173177'),             // 底部信息
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

        //-----------------------------------------------------
        $data = json_decode($data,true); //将json数据转成数组
//        logger::debug('data' . $data);
        ajaxReturn(array('code' =>1, 'info' => 'ok'));

    }

    /**
     * accessToken
     * @return bool
     */
    public function getAccessToken($wechat_config) {

        $post = array(
            'grant_type' => 'client_credential'
        , 'appid' => $wechat_config['appid']
        , 'secret' => $wechat_config['appsecret'],
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

    /**
     * curl访问ucenter url 默认只获取header
     * @param type $ucphp ucenter接口url
     * @param type $getHeader 是否将header返回
     * @param type $getBody true返回 false不返回
     * @return boolean
     */
    public function curl($url, $post = null, $method = 'POST', $getHeader = false) {
        if (!$url) {
            return false;
        }

        $_headerArray = array(
            'Accept:text/html, application/xhtml+xml, application/javascript, */*'
        , 'Content-Type:application/x-www-form-urlencoded',
//            , 'Referer:https://mp.weixin.qq.com/'
        );
        if ($method == 'GET' && !is_null($post)) {
            $url .= '?' . http_build_query($post);
        }

        $_ch = curl_init();
        curl_setopt($_ch, CURLOPT_URL, $url);
        curl_setopt($_ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($_ch, CURLOPT_HEADER, $getHeader);
        curl_setopt($_ch, CURLOPT_SSL_VERIFYPEER, false);
        //curl_setopt($_ch, CURLOPT_RETURNTRANSFER, true);
        if ($method == 'POST' && !is_null($post)) {
//            logger::debug(http_build_query($post));
            //curl_setopt($_ch, CURLOPT_POSTFIELDS, http_build_query($post));
            curl_setopt($_ch, CURLOPT_POSTFIELDS, $post);
        }
        $_output = curl_exec($_ch);
        //$_status = curl_getinfo($_ch, CURLINFO_HTTP_CODE);
        curl_close($_ch);
//        log::debug($_output);
        return $_output;
    }
}