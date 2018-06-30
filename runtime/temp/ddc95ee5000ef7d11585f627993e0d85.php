<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:72:"D:\workLP\20180502\judeng\wwwroot/application/home\view\doctor\plan.html";i:1529398603;}*/ ?>
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
    <style>
        .pay-div{}
        .pay-tit{padding:.3rem;background:#f1f1f1;}
        .pay-tit div{padding:.6rem 0;text-align:center;border-radius:.1rem;background-color:#ea5520 !important;background:url(/public/home/image/bg01.jpg) no-repeat left bottom .2rem/1.7rem, url(/public/home/image/bg02.jpg) no-repeat right top .1rem/1.22rem;}
        .pay-tit h3{font-size:.3rem;color:#fff;}
        .pay-tit p{font-size:.24rem;color:#fff;margin-top:.3rem;}
        .pay-con{background:#fff;}
        .pay-con li{padding:.5rem 0;margin:0 .3rem;border-bottom:1px solid #eaeaea;}
        .pay-con li .tit{width:.95rem;}
        .pay-con li h3{font-size:.3rem;color:#000;line-height:.6rem;text-align:center;}
        .pay-con li .ewm{width:3.05rem;margin:.35rem auto 0 auto;text-align:center;border:0.04rem solid #ea5520;}
        .pay-con li .ewm img{padding:.15rem;background:#fff;box-sizing:border-box;}
        .pay-con li .ewm h4{font-size:.28rem;color:#fff;background:#ea5520;line-height:.64rem;}
        .pay-con li .ysqm{line-height:.5rem;color:#666;text-align:center;font-size:.26rem;margin-top:.26rem;}
        .pay-con li .img{max-width:4.96rem;}
        .pay-con .btn{position:relative;padding-top:.98rem;background:#f1f1f1;}
        .pay-con .btn a{background:#ea5520;}
    </style>
</head>
<body>
<div class="page-tit">支付</div>
<div class="pay-div">
    <div class="pay-tit">
        <div>
            <h3>医生已开方，请按步骤付款</h3>
            <p>30秒快速完成</p>
        </div>
    </div>
    <div class="pay-con">
        <ul>
            <li>
                <img src="/public/home/images/01.png" class="tit">
                <h3>长按下方二维码<br>将图片保存至手机相册</h3>
                <div class="ewm">
                    <!--<img src="/public/home/images/code.png">-->
                    <img style="word-break:break-all" src="<?php echo $imgUrl; ?>">
                    <h4>调制方案二维码</h4>
                </div>
                <div class="ysqm">
                    医生签名：<?php echo $doctorName; ?>
                </div>
            </li>
            <li>
                <img src="/public/home/images/02.png" class="tit">
                <center><img src="/public/home/images/pic2.jpg" class="img"></center>
            </li>
            <li>
                <img src="/public/home/images/03.png" class="tit">
                <center><img src="/public/home/images/pic3.jpg" class="img"></center>
            </li>
            <li>
                <img src="/public/home/images/04.png" class="tit">
                <center><img src="/public/home/images/pic4.jpg" class="img"></center>
            </li>
        </ul>
        <div class="btn"><a href="tel:400-700-5120">如有疑问，请联系客服021-51877120</a></div>
    </div>

</div>





</body>
</html>
<script type="text/javascript" src="/public/home/js/common.js"></script>