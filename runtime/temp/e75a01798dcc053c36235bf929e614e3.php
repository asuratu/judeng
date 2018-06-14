<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:74:"D:\workLP\20180502\judeng\wwwroot/application/home\view\inherit\video.html";i:1528343598;}*/ ?>
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
<div class="page-tit"></div>
<div class="video-box">
    <video src="<?php echo $info['video_url']; ?>" controls poster="<?php echo $info['video_cover']; ?>"></video>
</div>
<div class="editor video-detail">
    <div class="wrapper">
        <h3><?php echo $info['title']; ?></h3>
        <h4><?php echo $info['release_date']; ?></h4>
        <?php echo $info['substance']; ?>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="/public/home/js/common.js"></script>