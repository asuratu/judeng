<?php

ini_set("display_errors", "on");

require_once dirname(__DIR__) . '/api_sdk/vendor/autoload.php';

use Aliyun\Core\Config;
use Aliyun\Core\Profile\DefaultProfile;
use Aliyun\Core\DefaultAcsClient;
use Aliyun\Api\Sms\Request\V20170525\SendSmsRequest;
use Aliyun\Api\Sms\Request\V20170525\SendBatchSmsRequest;
use Aliyun\Api\Sms\Request\V20170525\QuerySendDetailsRequest;

// 加载区域结点配置
Config::load();

/**
 * Class SmsDemo
 *
 * 这是短信服务API产品的DEMO程序，直接执行此文件即可体验短信服务产品API功能
 * (只需要将AK替换成开通了云通信-短信服务产品功能的AK即可)
 * 备注:Demo工程编码采用UTF-8
 */
class SmsDemo
{
    static $acsClient = null;

    /**
     * 取得AcsClient
     *
     * @return DefaultAcsClient
     */
    public static function getAcsClient() {
        //产品名称:云通信流量服务API产品,开发者无需替换
        $product = "Dysmsapi";

        //产品域名,开发者无需替换
        $domain = "dysmsapi.aliyuncs.com";

        // TODO 此处需要替换成开发者自己的AK (https://ak-console.aliyun.com/)
        $accessKeyId = "LTAIPGIjaTRy7ZND"; // AccessKeyId

        $accessKeySecret = "TTG3ibN7JWFHrAKtneylBU1nfj9WSl"; // AccessKeySecret

        // 暂时不支持多Region
        $region = "cn-hangzhou";

        // 服务结点
        $endPointName = "cn-hangzhou";


        if(static::$acsClient == null) {

            //初始化acsClient,暂不支持region化
            $profile = DefaultProfile::getProfile($region, $accessKeyId, $accessKeySecret);

            // 增加服务结点
            DefaultProfile::addEndpoint($endPointName, $region, $product, $domain);

            // 初始化AcsClient用于发起请求
            static::$acsClient = new DefaultAcsClient($profile);
        }
        return static::$acsClient;
    }

    /**
     * 发送短信
     * @return stdClass
     */

    public static function sendSms($mobile, $body, $type) {
        // 初始化SendSmsRequest实例用于设置发送短信的参数
        $request = new SendSmsRequest();
        //可选-启用https协议
        //$request->setProtocol("https");

        // 必填，设置短信接收号码
        $request->setPhoneNumbers($mobile);

        // 必填，设置签名名称，应严格按"签名名称"填写，请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/sign
        $request->setSignName("小橘灯");

        // 必填，设置模板CODE，应严格按"模板CODE"填写, 请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/template
        switch ($type) {
            case 0: //通用模板
                //您的验证码${code}，该验证码6分钟内有效，请勿泄漏于他人！
                $tempCode = "SMS_135807928";
                break;
            case 1: //手机号开方短信通知
                //来自${name}医生的消息，内容为：${content}，http://api.judeng.net:88/${orderId}，请点击查看！如有疑问可联系客服400-700-512
                $tempCode = "SMS_136860216";
                break;
            default:
                $tempCode = "SMS_135807928";
                break;
        }
        $request->setTemplateCode($tempCode);


        // 可选，设置模板参数, 假如模板中存在变量需要替换则为必填项
        //// 短信模板中字段的值
        $request->setTemplateParam(json_encode($body, JSON_UNESCAPED_UNICODE));

        // 可选，设置流水号
        $request->setOutId("yourOutId");

        // 选填，上行短信扩展码（扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段）
        $request->setSmsUpExtendCode("1234567");

        // 发起访问请求
        $acsResponse = static::getAcsClient()->getAcsResponse($request);
        return $acsResponse;
    }

    /**
     * 批量发送短信
     * @return stdClass
     */
    public static function sendBatchSms($mobileArr, $codeArr, $type=0) {

        // 初始化SendSmsRequest实例用于设置发送短信的参数
        $request = new SendBatchSmsRequest();

        //可选-启用https协议
        //$request->setProtocol("https");

        // 必填:待发送手机号。支持JSON格式的批量调用，批量上限为100个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
        $request->setPhoneNumberJson(json_encode($mobileArr, JSON_UNESCAPED_UNICODE));

        // 必填:短信签名-支持不同的号码发送不同的短信签名
        $signArr = array();
        for ($i = 0; $i < count($mobileArr); $i++) {
            array_push($signArr, "小橘灯");
        }
        $request->setSignNameJson(json_encode($signArr, JSON_UNESCAPED_UNICODE));

        // 必填:短信模板-可在短信控制台中找到
        //不同type走不同模板
        switch ($type) {
            case 0: //通用模板
                //您的验证码${code}，该验证码6分钟内有效，请勿泄漏于他人！
                $tempCode = "SMS_135807928";
                break;
            case 1://手机号开方短信通知
                //来自${name}医生的消息，内容为：${content}，http://api.judeng.net:88/${orderId}，请点击查看！如有疑问可联系客服400-700-512
                $tempCode = "SMS_136382712";
                break;
            case 2:
                $tempCode = "SMS_135807928";
                break;
            default:
                break;
        }

        $request->setTemplateCode($tempCode);

        // 必填:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
        // 友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
        $request->setTemplateParamJson(json_encode($codeArr, JSON_UNESCAPED_UNICODE));

        // 可选-上行短信扩展码(扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段)
        // $request->setSmsUpExtendCodeJson("[\"90997\",\"90998\"]");

        // 发起访问请求
        $acsResponse = static::getAcsClient()->getAcsResponse($request);

        return $acsResponse;
    }

    /**
     * 短信发送记录查询
     * @return stdClass
     */
    public static function querySendDetails() {

        // 初始化QuerySendDetailsRequest实例用于设置短信查询的参数
        $request = new QuerySendDetailsRequest();

        //可选-启用https协议
        //$request->setProtocol("https");

        // 必填，短信接收号码
        $request->setPhoneNumber("12345678901");

        // 必填，短信发送日期，格式Ymd，支持近30天记录查询
        $request->setSendDate("20170718");

        // 必填，分页大小
        $request->setPageSize(10);

        // 必填，当前页码
        $request->setCurrentPage(1);

        // 选填，短信发送流水号
        $request->setBizId("yourBizId");

        // 发起访问请求
        $acsResponse = static::getAcsClient()->getAcsResponse($request);

        return $acsResponse;
    }

}

//// 调用示例：
//set_time_limit(0);
//header('Content-Type: text/plain; charset=utf-8');
//
//$response = SmsDemo::sendSms();
//echo "发送短信(sendSms)接口返回的结果:\n";
//print_r($response);
//
//sleep(2);
//
//$response = SmsDemo::sendBatchSms();
//echo "批量发送短信(sendBatchSms)接口返回的结果:\n";
//print_r($response);
//
//sleep(2);
//
//$response = SmsDemo::querySendDetails();
//echo "查询短信发送情况(querySendDetails)接口返回的结果:\n";
//print_r($response);
