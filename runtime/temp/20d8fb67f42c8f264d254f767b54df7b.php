<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:62:"E:\wook\201804\judeng/application/home\view\hair\template.html";i:1528018657;}*/ ?>
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

<div class="page-tit">群发消息</div>
<div class="attention">
    <div class="wrapper">
        <div class="doctors clearfix">
            <div class="toux"><img src="<?php echo $doctor['face_photo']; ?>"></div>
            <div class="wenz">
                <h3><?php echo $doctor['member_name']; ?></h3>
                <div class="sign-div">
                    <?php
                    if ($doctor['recom'] == 1) {
                    ?>
                    <span>推荐</span>
                    <?php
                    }
                    ?>
                    <span class="orange">特色</span>
                    <?php
                    if ($doctor['is_clinic'] == 1) {
                    ?>
                    <span>义诊</span>
                    <?php
                    }
                    ?>
                </div>
                <h4>
                    <?php if(is_array($title) || $title instanceof \think\Collection || $title instanceof \think\Paginator): $i = 0; $__LIST__ = $title;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                    <?php echo $v['title_name']; ?>　　
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </h4>
            </div>
        </div>
    </div>
</div>
<div class="template">
    <div class="wrapper">
        <div class="template-top">
            <p>
                医生：<br>
                <?php echo $hair['content']; ?>
            </p>
            <?php if(is_array($hairattach) || $hairattach instanceof \think\Collection || $hairattach instanceof \think\Paginator): $i = 0; $__LIST__ = $hairattach;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
            <img src="<?php echo $v['src']; ?>">
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
        <div class="code clearfix">
            <div class="fl">
                <img src="/public/home/images/icon.png">
                <p class="p">
                    扫描医生名片二维码<br>
                    随时<font color="#ea5520"> 问诊 调方</font>
                </p>
            </div>
            <div class="fr"><img src="<?php echo $doctor['invite']; ?>"></div>

        </div>
    </div>
</div>
<div class="font">
    微信扫描上方医生名片二维码<br>
    关注小橘灯医馆微信服务号同时关注医生<br>
    即可随时在微信与医生沟通，进行问诊调方
</div>

</body>
</html>
<script type="text/javascript" src="/public/home/js/common.js"></script>