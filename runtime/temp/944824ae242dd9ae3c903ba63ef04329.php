<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:76:"D:\workLP\20180502\judeng\wwwroot/application/home\view\inherit\article.html";i:1528421886;}*/ ?>
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
    <style>
        *{
            -webkit-touch-callout:none;  /*系统默认菜单被禁用*/
            -webkit-user-select:none; /*webkit浏览器*/
            -khtml-user-select:none; /*早期浏览器*/
            -moz-user-select:none;/*火狐*/
            -ms-user-select:none; /*IE10*/
            user-select:none;
        }
    </style>
    <script type="text/javascript" src="/public/home/js/jquery.min.js"></script>
</head>
<body>
<div class="page-tit"></div>
<div class="editor video-detail">
    <div class="wrapper">
        <h3><?php echo $info['title']; ?></h3>
        <h4><?php echo $info['release_date']; ?></h4>
        <?php echo $info['substance']; ?>
    </div>
</div>
</body>
<script type="text/javascript">
    document.body.onselectstart=document.body.oncontextmenu=function(){ return false;}
</script>
</html>
<script type="text/javascript" src="/public/home/js/common.js"></script>