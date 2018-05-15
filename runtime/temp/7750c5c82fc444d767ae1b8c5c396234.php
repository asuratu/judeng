<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:74:"D:\workLP\20180502\judeng\wwwroot/application/home\view\doctor\regist.html";i:1526351297;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta name="keywords" />
    <meta name="description" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <meta name="format-detection" content="telephone=no" />
    <link type="text/css" href="/public/home/css/base.css" rel="stylesheet" />
    <link rel="stylesheet" href="/public/home/css/LArea.css">
    <script type="text/javascript" src="/public/home/js/jquery.min.js"></script>
</head>
<body>
<div class="login-tit">注册</div>
<div class="login">
    <div class="wrapper">
        <form>
            <div class="input clearfix">
                <div class="wz">真实姓名</div>
                <div class="text">
                    <input type="text">
                </div>
            </div>
            <div class="input clearfix">
                <div class="wz">手机号码</div>
                <div class="text">
                    <input type="tel">
                </div>
            </div>
            <div class="input clearfix">
                <div class="wz">验证码</div>
                <div class="text">
                    <input type="text">
                    <a href="javascript:;">获取验证码</a>
                </div>
            </div>
            <div class="input clearfix">
                <div class="wz">所在地区</div>
                <div class="text">
                    <input type="text" id="addselect" placeholder="" readonly="">
                </div>
            </div>
            <div class="input clearfix">
                <div class="wz">所在医疗机构</div>
                <div class="text">
                    <select>
                        <option>1</option>
                        <option>2</option>
                    </select>
                </div>
            </div>
            <div class="input clearfix">
                <div class="wz">输入密码</div>
                <div class="text">
                    <input type="password">
                </div>
            </div>
            <div class="input clearfix">
                <div class="wz">输入邀请码（可选填）</div>
                <div class="text">
                    <input type="text">
                </div>
            </div>
            <div class="input ts">
                点击注册默认同意<a href="javascript:;" class="zcxy-btn">《 医生注册协议 》</a>
            </div>
            <div class="input">
                <input type="submit" value="立即注册">
            </div>
            <div class="input ts" align="center">
                已有账号，<a href="">立即登录</a>
            </div>
        </form>
    </div>
</div>
<div class="black"></div>
<div class="zcxy">
    <a href="javascript:;" class="close">×</a>
    <h2>注册协议</h2>
    <div class="editor">
        注册协议注册协议注册协议注册协议注册协议注册协议注册协议注册协议注册协议注册协议注册协议注册协议注册协议
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="/public/home/js/common.js"></script>
<script src="/public/home/js/LAreaData1.js"></script>
<script src="/public/home/js/LAreaData2.js"></script>
<script src="/public/home/js/LArea.js"></script>
<script>
    var area1 = new LArea();
    area1.init({
        'trigger': '#addselect', //触发选择控件的文本框，同时选择完毕后name属性输出到该位置
        'valueTo': '#value', //选择完毕后id属性输出到该位置
        'keys': {
            id: 'id',
            name: 'name'
        }, //绑定数据源相关字段 id对应valueTo的value属性输出 name对应trigger的value属性输出
        'type': 1, //数据源类型
        'data': LAreaData //数据源
    });
    area1.value=[1,13,3];//控制初始位置，注意：该方法并不会影响到input的value
    $(function () {
        //注册协议
        $(".zcxy-btn").click(function () {
            $('.black').fadeIn();
            $(".zcxy").addClass('on')
        });
        $('.close,.black').click(function () {
            $('.black').fadeOut();
            $(".zcxy").removeClass('on')
        })
    })
</script>