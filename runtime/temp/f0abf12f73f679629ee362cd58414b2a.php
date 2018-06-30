<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:74:"D:\workLP\20180502\judeng\wwwroot/application/home\view\doctor\detail.html";i:1530261140;}*/ ?>
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
</div>
<div class="plan">
    <div class="plan-con01">
        <div class="wrapper">
            <h2>辨症</h2>
            <div class="con">
                <dl class="clearfix">
                    <dd><?php echo $lastOrder['patient_name']; ?></dd>
                    <dd><?php echo $lastOrder['patient_sex']?'女':'男'; ?></dd>
                    <dd><?php echo $lastOrder['patient_age']; ?></dd>
                    <dd class="wid100"><?php echo $lastOrder['patient_mobile']; ?></dd>
                    <dd class="wid100">辨症：<?php echo $lastOrder['dialectical']; ?></dd>
                </dl>
            </div>
        </div>
    </div>
    <div class="plan-con02">
        <h3>开方</h3>
        <div class="con">
            <h4><?php echo $relationDetail['state_name']; ?>·<?php echo $relationDetail['area_name']; ?>-<?php echo $relationDetail['prescription_name']; ?></h4>
            <h5>R:</h5>
            <p>
                <?php if(is_array($drugInfo) || $drugInfo instanceof \think\Collection || $drugInfo instanceof \think\Paginator): $i = 0; $__LIST__ = $drugInfo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;
                if (in_array($v, $specialDrugInfo)) {
                ?>
                <span><?php echo $v[1]; ?>?<?php echo $v[3]; ?></span>
                <?php
                } else {
                ?>
                <span><?php echo $v[1]; ?><?php echo $v[2]; ?><?php echo $v[3]; ?></span>
                <?php
                }
                endforeach; endif; else: echo "" ;endif; ?>
            </p>
            <div class="line">
                <?php echo $taking[0]; ?><span><?php echo $taking[1]; ?></span><?php echo $taking[2]; ?><span><?php echo $taking[3]; ?></span><?php echo $taking[4]; ?><span><?php echo $taking[5]; ?></span><?php echo $taking[6]; ?>
            </div>
            <p>
                服药说明：<br>
                <?php echo $lastOrder['instructions']; ?>
            </p>
        </div>
    </div>
    <div class="plan-con03">
        <h3>选填</h3>
        <div class="con">
            <p>辨症费：<font color="#ea5520">￥<?php echo $lastOrder['see_price']; ?></font></p>
            <p class="clearfix">
                购药前患者可查看药方
                <span class="fr"><?php echo $lastOrder['prescription_status']?'可查看':'不可看'; ?></span>
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
                        <span class="fr">￥<?php echo round($lastOrder['price'], 2); ?>*<?php echo $lastOrder['dose']; ?>=￥<?php echo round($lastOrder['price'], 2)*$lastOrder['dose']; ?></span>
                    </dd>
                    <dd class="wid100">
                        辨症费
                        <span class="fr">￥<?php echo $lastOrder['see_price']; ?></span>
                    </dd>
                    <dd class="wid100">
                        总计
                        <span class="fr">￥<?php echo $lastOrder['total_price']; ?></span>
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
            医生签名：<?php echo $name; ?><br>
            开方时间：<?php echo date('Y-m-d', $lastOrder['add_date']); ?>
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