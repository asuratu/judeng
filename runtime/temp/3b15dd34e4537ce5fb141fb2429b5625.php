<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:73:"D:\workLP\20180502\judeng\wwwroot/application/home\view\doctor\paid1.html";i:1530610747;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta name="keywords" />
    <meta name="description" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <meta name="format-detection" content="telephone=no" />
    <link type="text/css" href="/public/home/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="/public/home/js/jquery.min.js"></script>
    <style>
        body,html,.paid{height:100%;}
        .paid-alert{width:92%;position:fixed;left:50%;top:50%;border-radius:.1rem;background:#fff;text-align:center;
            -webkit-transition: all .4s;
            -moz-transition: all .4s;
            -ms-transition: all .4s;
            -o-transition: all .4s;
            transition: all .4s;
            -webkit-transform: translateX(-50%) translateY(-50%);
            -moz-transform: translateX(-50%) translateY(-50%);
            -ms-transform: translateX(-50%) translateY(-50%);
            transform: translateX(-50%) translateY(-50%);
        }
        .paid-alert img{width:.74rem;margin:.8rem auto .35rem auto;}
        .paid-alert h3{font-size:.34rem;color:#333333;}
        .paid-alert a{display:block;line-height:1rem;border-top:1px solid #ea5520;font-size:.34rem;color:#ea5520;margin-top:.76rem;}
    </style>
</head>
<body>
<div class="paid" style="background:url(/public/home/images/bg.jpg) no-repeat center center/cover;">
    <div class="paid-alert">
        <img src="/public/home/images/iconn.png">
        <h3>服务器繁忙, 请稍后再试</h3>
        <a onclick="window.location.reload()" href="javascript:;">点击刷新</a>
    </div>
</div>

</body>
</html>
<script>
    var deviceWidth = document.documentElement.clientWidth; if(deviceWidth > 750) deviceWidth = 750; document.documentElement.style.fontSize = deviceWidth / 7 + 'px';
</script>