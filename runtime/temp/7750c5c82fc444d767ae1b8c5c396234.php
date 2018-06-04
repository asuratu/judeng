<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:74:"D:\workLP\20180502\judeng\wwwroot/application/home\view\doctor\regist.html";i:1528079337;}*/ ?>
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
    <script type="text/javascript" src="/public/home/js/jquery.min.js"></script>
</head>
<body>
<div class="login-tit">注册</div>
<div class="login">
    <div class="wrapper">
        <form onsubmit="return false">
            <div class="input clearfix">
                <div class="wz">真实姓名</div>
                <div class="text">
                    <input type="text" class="real-name">
                </div>
            </div>
            <div class="input clearfix">
                <div class="wz">手机号码</div>
                <div class="text">
                    <input type="text" name="mobile" class="mobile">
                </div>
            </div>
            <div class="input clearfix">
                <div class="wz">验证码</div>
                <div class="text">
                    <input type="text" id="mobile_codemobile_code">
                    <a href="javascript:;" id="sendCode">获取验证码</a>
                </div>
            </div>
            <div class="input clearfix">
                <div class="wz">所在地区</div>
                <div class="text">
                    <!--<input type="text" id="addselect" placeholder="" readonly="">-->
                    <select id="area">
                        <option value="0">请选择所在地区</option>
                        <?php if(is_array($area) || $area instanceof \think\Collection || $area instanceof \think\Paginator): $i = 0; $__LIST__ = $area;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                        <option value="<?php echo $v['area_id']; ?>"><?php echo $v['name']; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
            <div class="input clearfix">
                <div class="wz">所在医疗机构</div>
                <div class="text">
                    <select id="hospital">
                        <option value="0">请选择医疗机构</option>
                        <?php if(is_array($hospital) || $hospital instanceof \think\Collection || $hospital instanceof \think\Paginator): $i = 0; $__LIST__ = $hospital;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                        <option value="<?php echo $v['hospital_id']; ?>"><?php echo $v['hospital_name']; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
            <div class="input clearfix">
                <div class="wz">输入密码</div>
                <div class="text">
                    <input type="password" class="password-input">
                </div>
            </div>
            <div class="input clearfix">
                <div class="wz">输入邀请码（可选填）</div>
                <div class="text">
                    <input type="text" id="code" name="code" value="<?php echo $code; ?>">
                </div>
            </div>
            <div class="input ts">
                点击注册默认同意<a href="javascript:;" class="zcxy-btn">《 医生注册协议 》</a>
            </div>
            <div class="input">
                <input type="submit" id="login-content-btn" value="立即注册">
            </div>
            <div class="input ts" align="center">
                已有账号，<a href="javascript:;" onclick="javascript:history.back(-1);">立即登录</a>
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
<script>

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
    })




</script>