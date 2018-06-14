<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:77:"D:\workLP\20180502\judeng\wwwroot/application/home\view\doctor\attention.html";i:1528476442;}*/ ?>
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
<div class="page-tit">关注医生</div>
<div class="attention">
    <div class="wrapper">
        <div class="doctors clearfix">
            <div class="toux"><img src="<?php echo $info['face_photo']; ?>"></div>
            <div class="wenz">
                <h3><?php echo $info['true_name']; ?></h3>
                <div class="sign-div">
                    <?php echo $info['recom']?'<span>推荐 </span>':''; ?>
                    <?php echo $info['has_self_goods']?'<span class="orange">特色 </span>':''; ?>
                    <?php echo $info['is_clinic']?'<span>义诊 </span>':''; ?>
                </div>
                <h4>
                    <?php if(is_array($info['title_str']) || $info['title_str'] instanceof \think\Collection || $info['title_str'] instanceof \think\Paginator): $i = 0; $__LIST__ = $info['title_str'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                    <?php echo $v; endforeach; endif; else: echo "" ;endif; ?>
                </h4>
            </div>
        </div>
        <div class="code">
            <p class="p">
                扫描医生名片二维码<br>
                随时<font color="#ea5520"> 问诊 调方</font>
            </p>
            <center><img src="<?php echo $info['url']; ?>"></center>
            <p>
                微信扫描上方医生名片二维码<br>
                关注小橘灯医馆微信服务号同时关注医生<br>
                即可随时在微信与医生沟通，进行问诊调方
            </p>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="/public/home/js/common.js"></script>