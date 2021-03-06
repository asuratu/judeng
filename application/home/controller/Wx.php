<?php
namespace app\home\controller;
use think\Db;
use think\Controller;
use think\Wechat;
class Wx extends Controller {

    /**
     * @Title: getQrcode
     * @Description: TODO 医生邀请患者的二维码
     */
    public function getQrcode()
    {
        if($this->request->isPost()) {
            $data = input('post.');
            if ($data['doctor_id'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
            }
            //查询是否已经获取过
            $doctorInfo = db('doctor')
                ->where("member_id = {$data['doctor_id']}")
                ->field("`to_user_img`")
                ->find();

            //微信分享的链接
            $shareUrl = config('url').'/member/attention?doctorId='.$data['doctor_id'];

            if ($doctorInfo['to_user_img']) {
                ajaxReturn(array('code' => 1, 'info' => 'ok', 'data' => [$doctorInfo['to_user_img'], $shareUrl]));
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
                $updateInfo['to_user_img'] = $uri;
                $updateInfo['release_date'] = time();
                db('doctor')->where("member_id = {$data['doctor_id']}")->update($updateInfo);
                ajaxReturn(array('code' => 1, 'info' => 'ok', 'data' => [$uri, $shareUrl]));
            } else {
                ajaxReturn(array('code' => 0, 'info' => '服务器繁忙, 请稍后再试!', 'data' => []));
            }
        }
    }

    /**
     * @Title: getDrugQrcode
     * @Description: TODO 手机号开方的二维码
     */
    public function getDrugQrcode()
    {
        if($this->request->isPost()) {
            $data = input('post.');
            if ($data['order_id'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
            }

            $access_token = $this->get_access_token();
            $key = 'orderId_'.$data['order_id'];
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

    /**
     * @Title: get_access_token
     * @Description: TODO 获取令牌
     * @return mixed
     * @author TUGE
     * @date
     */
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
        $web_expires = time() + 3000; // 提前200秒过期
        db('wx_user')->where(array('id'=>$wechat['id']))->update(array('access_token'=>$return['access_token'],'expires'=>$web_expires));
        return $return['access_token'];
    }
    
}



