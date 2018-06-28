<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:74:"D:\workLP\20180502\judeng\wwwroot/application/home\view\doctor\detail.html";i:1530177046;}*/ ?>
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
    </div>
</div>
<div class="plan">
    <div class="plan-con01">
        <div class="wrapper">
            <h2>辩症</h2>
            <div class="con">
                <dl class="clearfix">
                    <dd><?php echo $lastOrder['patient_name']; ?></dd>
                    <dd><?php echo $lastOrder['patient_sex']?'女':'男'; ?></dd>
                    <dd><?php echo $lastOrder['patient_age']; ?></dd>
                    <dd class="wid100"><?php echo $lastOrder['patient_mobile']; ?></dd>
                    <dd class="wid100">辩证：<?php echo $lastOrder['dialectical']; ?></dd>
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
            <p>辨症费：<font color="#ea5520">￥8.00</font></p>
            <p class="clearfix">
                购药前患者可查看药方
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
                        辨症费
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