<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:79:"D:\workLP\20180502\judeng\wwwroot/application/home\view\doctor\doctorLogin.html";i:1527748868;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <title>邀请加入</title>
    <meta name="keywords" />
    <meta name="description" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <meta name="format-detection" content="telephone=no" />
    <link type="text/css" href="/public/home/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="/public/home/js/jquery.min.js"></script>
</head>
<body>
<div class="page-tit">邀请加入</div>
<div class="docLogin">
    <div class="docLogin-tit">
        <div class="wrapper clearfix">
            <div class="toux"><img src="<?php echo $info['face_photo']; ?>"></div>
            <div class="wenz">
                <h3>
                    <?php echo $info['true_name']; ?>医生<br>
                    诚邀您加入<?php echo $inherit['inherit_name']; ?>
                </h3>
                <p>
                    申请通过，即可获得使用方剂权限
                </p>
            </div>
        </div>
    </div>
    <div class="docLogin-con">
        <h3>使用小橘灯已注册的手机号进行登录</h3>
        <div class="form">
            <form>
                <div>
                    <input type="text" class="mobile" placeholder="手机号码">
                </div>
                <div>
                    <input type="text"  placeholder="验证码">
                    <a href="javascript:;" id="sendCode" class="yzm">获取验证码</a>
                </div>
                <div class="submit">
                    <input type="button" id="login-content-btn" value="立即登录">
                </div>
                <div>
                    <a href="/member/webRegist?id=<?php echo $info['invite']; ?>" class="register-btn">没有账号，立即注册</a>
                </div>
            </form>
        </div>
        <div class="ts">
            <p>
                注：<br>
                1、申请加入传承后请耐心等待，小橘灯客服人员会在24小时内和您联系是否通过传承<br>
                2、加入传承后可使用传承中的特色方剂<br>
                3、可向传承内医生发起转诊
            </p>
        </div>

    </div>

</div>

</body>
</html>
<script>
    var deviceWidth = document.documentElement.clientWidth; if(deviceWidth > 750) deviceWidth = 750; document.documentElement.style.fontSize = deviceWidth / 7 + 'px';
</script>

<script>
    //获取短信验证码
    sendCode();
    function sendCode() {
        $("#sendCode").click(function(){
            var mobile = $('.mobile').val();
            var myreg = /^1\d{10}$/;
            if (mobile == '') {
                alert('手机号码不能为空');
                $('.mobile').focus();
                return false;
            } else if (mobile.length!=11) {
                alert('请输入有效的手机号码，需是11位！');
                $('.mobile').focus();
                return false;
            } else if (!myreg.test(mobile)) {
                alert('请输入有效的手机号码！');
                $('.mobile').focus();
                return false;
            } else {
                $.post('/member/getsms',
                    {
                        'mobile' : mobile,
                        'type': 1
                    },
                    function(data){
                        console.log(data);
                        switch (data.code) {
                            case 1:
                                //短信倒计时
                                y=60;
                                $("#sendCode").unbind('click');
                                var int = setInterval(countDown, 1000);
                                break;
                            default :
                                alert(data.info);
                                break;
                        }
                    },'json');
            }
        });
    }

    //注册
    $("#login-content-btn").click(function(){
        var realName = $('.real-name').val();
        var mobile = $('.mobile').val();
        var myreg = /^1\d{10}$/;
        var password = $('.password-input').val();
        var mobileCode = $('#mobile_codemobile_code').val();
        var area_id = $('#area').val();
        var hospital_id = $('#hospital').val();
        var code = $('#code').val();
        var y;
        if(realName == '') {
            alert('真实姓名不能为空');
            $('.realName').focus();
            return false;
        } else if(!myreg.test(mobile)) {
            alert('请输入有效的手机号码！');
            $('.mobile').focus();
            return false;
        } else if(password ==''){
            alert('请输入密码');
            $('.password-input').focus();
        } else if(password.length<6 || password.length>16){
            alert('密码请保持在6到16位');
            $('.password-input').focus();
        } else if(mobileCode == ''){
            alert('请输入短信验证码！');
            $('#mobile_code').focus();
        } else if(area_id == 0){
            alert('请选择地区！');
        } else if(hospital_id == 0){
            alert('请选择医疗机构！');
        } else{
            $.post('/member/doregist',
                {
                    'mobile' : mobile,
                    'password' : password,
                    'true_name': realName,
                    'hospital_id': hospital_id,
                    'area_id': area_id,
                    'invite_code': code,
                    'smscode': mobileCode
                },
                function(data){
                    switch (data.code) {
                        case 1:
                            alert('注册成功!');
                            break;
                        default :
                            alert(data.info);
                            break;
                    }
                },'json');
        }
    })

    function countDown(){
        y--;
        if(y>0){
            $("#sendCode").html(y + '秒后重新获取');
        }else if(y == 0) {
            $("#sendCode").html("请重新获取");
            sendCode();
            //清除定时器
            clearInterval(int);
        }
    }
</script>