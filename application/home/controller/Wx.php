<?php
namespace app\home\controller;
use think\Db;
use think\Controller;
use think\Wechat;
class Wx extends Controller {

    public function getQrcode()
    {
        if($this->request->isPost()) {
            $data = input('post.');
            if ($data['doctor_id'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
            }
            $access_token = $this->get_access_token();
            $key = 'doctor_'.$data['doctor_id'];
            if (!$access_token) {
                ajaxReturn(array('code' => 0, 'info' => '获取access_token失败'));

            }
            $url = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=" . $access_token;
            $postArr = array(
                "action_name" => "QR_LIMIT_STR_SCENE",
                "action_info" => array("scene" => array("scene_str" => $key),)
            );
            $res = postJson($url, $postArr);

            $res = json_decode($res, true);
            if ($res['ticket']) {
                $uri = 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=' . urlencode($res['ticket']);
                ajaxReturn(array('code' => 1, 'info' => 'ok', 'data' => [$uri]));
            } else {
                ajaxReturn(array('code' => 0, 'info' => '服务器繁忙, 请稍后再试!', 'data' => []));
            }
        }
    }

    public function get_access_token(){
        //判断是否过了缓存期
        $wechat = db('wx_user')->find();
        $appid=$wechat['appid'];
        $appsecret=$wechat['appsecret'];
        $expire_time = $wechat['expires'];
        if($expire_time > time()){
            return $wechat['access_token'];
        }
        $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={$appid}&secret={$appsecret}";
        $res = curlGet($url);
		$return=json_decode($res,true);
        $web_expires = time() + 7000; // 提前200秒过期
        db('wx_user')->where(array('id'=>$wechat['id']))->update(array('access_token'=>$return['access_token'],'expires'=>$web_expires));
        return $return['access_token'];
    }
    
}



