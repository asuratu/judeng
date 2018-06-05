<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:72:"D:\workLP\20180502\judeng\wwwroot/application/home\view\doctor\plan.html";i:1528142661;}*/ ?>
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
<div class="page-tit">
    <div class="wrapper clearfix">
        查看调理方案
        <a href="" class="fl">关闭</a>
        <a href="" class="fr">再次开方</a>
    </div>
</div>
<div class="plan">
    <div class="plan-con01">
        <div class="wrapper">
            <h2>辩症</h2>
            <div class="con">
                <dl class="clearfix">
                    <dd>林思思</dd>
                    <dd><img src="/public/home/images/sex.png">女</dd>
                    <dd>25岁</dd>
                    <dd class="wid100">13178478998</dd>
                    <dd class="wid100">辩证：背部不适，近些天来越发频繁</dd>
                </dl>
            </div>
        </div>
    </div>
    <div class="plan-con02">
        <h3>开方</h3>
        <div class="con">
            <h4>内服饮片·上海-康美智慧药方</h4>
            <h5>R:</h5>
            <p>
                <span>当归9克</span>
                <span>黄芪6克</span>
                <span>防风6克</span>
                <span>生甘草3克</span>
                <span>白芍9克</span>
                <span>熟地黄4克</span>
                <span>广藿香3克黄芪6克</span>
            </p>
            <div class="line">
                共<span>10</span>剂，每日<span>1</span>剂，一剂分<span>3</span>次服用
            </div>
            <p>
                服药说明：<br>
                煎服
            </p>
        </div>
    </div>
    <div class="plan-con03">
        <h3>选填</h3>
        <div class="con">
            <p>诊金：<font color="#ea5520">￥8.00</font></p>
            <p class="clearfix">
                购药后患者可查看药方
                <span class="fr">不可看</span>
            </p>
        </div>
    </div>
    <div class="plan-con01 plan-con04">
        <div class="wrapper">
            <h2>明细</h2>
            <div class="con">
                <dl class="clearfix">
                    <dd class="wid100">
                        药费
                        <span class="fr">￥9,31*10=￥93.10</span>
                    </dd>
                    <dd class="wid100">
                        治疗服务费
                        <span class="fr">￥8</span>
                        <div class="clearb"></div>
                        <p>* 治疗服务费请根据平台上限收取，超过将仅收取上限制</p>
                    </dd>
                    <dd class="wid100">
                        诊金
                        <span class="fr">￥0</span>
                    </dd>
                    <dd class="wid100">
                        总计
                        <span class="fr">￥101.10</span>
                        <div class="clearb"></div>
                        <p>* 不包含代煎费用和运送费用</p>
                    </dd>
                </dl>
                <a href="javascript:;" class="sq">收起明细</a>
            </div>
        </div>
    </div>
    <div class="plan-con05">
        <p>
            医生签名：于庆阳<br>
            开方时间：2018-04-17
        </p>
    </div>

</div>

</body>
</html>
<script type="text/javascript" src="/public/home/js/common.js"></script>
<script>
    $(function () {
        $('.sq').click(function () {
            if($(this).hasClass('zk')){
                $(this).removeClass('zk').text("收起明细");
                $('.plan-con04 dd:gt(0)').show();
            }
            else{
                $(this).addClass('zk').text("展开明细");
                $('.plan-con04 dd:gt(0)').hide();
            }
        })
    })
</script>