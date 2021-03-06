<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:60:"E:\wook\201804\judeng/application/home\view\question\qa.html";i:1527071831;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>常见问题</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <style>
        body,html{padding:0;margin:0;height:100%;}
        body{max-width:750px;margin:auto;}
        h1,h2,h3,h4,p{margin:0;padding:0;}
        ul,li,ol,li{list-style:none;margin:0;padding:0;}
        .editor{font-size:13px;color:#888;line-height:26px;background:#fff;}
        .editor img{max-width:100%;margin:10px auto;display:block;}
        .qa{min-height:100%;box-sizing:border-box;padding-top:15px;background:#f1f1f1;}
        .qa-tit{background:#fff;margin-bottom:15px;line-height:50px;}
        .qa-tit h3{font-size:16px;color:#333;font-weight:normal;padding:0 4%;margin:0;border-bottom:1px solid #e6e6e6;}
        .qa-tit .p{font-size:13px;line-height:22px;color:#666;padding:15px 4%;}
        .qa-tit .p span{text-align:center;color:#f76f1b;display:block;margin-top:10px;}
        .pad{padding:0 4% 10px 4%;}
        img.bor{padding-top:12px;border-top:1px solid #666666;}
    </style>
</head>
<body>
<div class="qa">
    <div class="qa-tit">
        <h3><?php echo $question['question_title']; ?></h3>
        <!--<div class="p">-->
            <!--<p>开方是与患者沟通的最重要的功能，以下是开方的详细介绍。</p>-->
            <!--<span>如何开方页</span>-->
        <!--</div>-->
    </div>
    <div class="editor">
        <?php echo $question['question_answer']; ?>
        <!--<img src="images/1.jpg">-->
        <!--<div class="pad">-->
            <!--当和患者充分沟通了解身体状况后，就可以给患者定制药方了。收到药方后患者即可在平台完成购药，根据您的建议调理身体。以下是开药方的具体流程和步骤，请认真阅览。-->
        <!--</div>-->
        <!--<img src="images/2.jpg" class="bor">-->
        <!--<div class="pad">-->
            <!--1.在和患者对话时，点击输入框上方的辩证开放图标打开选择开方界面；在选择开方界面顶部可选择在线开方或者拍照开方。-->
        <!--</div>-->
        <!--<img src="images/3.jpg" width="80%">-->
        <!--<img src="images/4.jpg" class="bor">-->
        <!--<div class="pad">-->
            <!--2.确认患者资料是否正确，如不正确需要您填入正确的患者信息，并根据患者的身体状况为患者进行诊断，填写辨证。-->
        <!--</div>-->
        <!--<img src="images/5.jpg" width="80%">-->
        <!--<div class="pad">-->
            <!--3.开方时，点击开方下方的还有两家药房可选按钮可修改药房药态。<br>-->
            <!--中药可以开内附中药、外用中药、中成药、粉剂、水丸、蜜丸、滋补膏方。一个药方仅支持一种药态，如需多个药态请向患者开多个药方。-->
        <!--</div>-->
        <!--<img src="images/6.jpg" width="80%">-->
        <!--<img src="images/7.jpg" class="bor">-->
        <!--<div class="pad">-->
            <!--4.选择药房药态<br>-->
            <!--小橘灯目前与众多精品药房精诚合作，为患者提供优质药材。<br><br>-->

            <!--<font color="#ffb384">内服中药</font>：上海-华润三九、北京-康仁堂<br>-->
            <!--<font color="#ffb384">外用中药</font>：北京-康仁堂、上海-华润三九、北京-北京同仁堂、长沙-北京同仁堂、成都-北京同仁堂、长春-北京同仁堂、北京-仟草中药、广州-康美智慧药房、广州-至信药业。<br>-->
            <!--<font color="#ffb384">中成药</font>：北京同仁堂。<br>-->
            <!--<font color="#ffb384">粉剂</font>：北京-北京同仁堂、成都-北京同仁堂、长春-北京同仁堂、长沙-北京同仁堂、北京-仟草中药。<br>-->
            <!--<font color="#ffb384">水丸、蜜丸</font>：成都-北京同仁堂、长春-北京同仁堂、广州-康美智慧药房。<br>-->
            <!--<font color="#ffb384">滋补膏方</font>：北京-北京同仁堂、广州-至信药业、广州-康美智慧药房、长春-北京同仁堂。<br><br>-->

            <!--可根据患者的地区和需求，选择匹配的药房进行开方。-->

            <!--<img src="images/8.jpg" width="80%">-->
            <!--<p>-->
                <!--5.开方时，点击编辑药材按钮即可进入开药方页面开始开方。<br>-->
                <!--输入药材拼音首字母，键盘上方展示与这个拼音匹配的所有药材，可左右滑动查看，点击选择要添加的药材。-->
            <!--</p>-->
            <!--<img src="images/9.jpg" width="80%">-->
            <!--<p>-->
                <!--6.选中药材后，填入需要的克数／袋数，点击右下角确认后即成功添加了一味药材。可以删除添加过的药材，同一味药材仅可添加一次。编辑结束后点击右上角完成，您的药方就成功保存了。-->
                <!--<br>-->
                <!--药材配伍禁忌、药材超过常规用量、毒性药材超量都会在您保存药方时进行提示。-->
            <!--</p>-->
            <!--<img src="images/10.jpg" width="80%">-->

            <!--<p>-->
                <!--7.治疗服务费及服药说明<br>-->
                <!--药方编辑完成后，请根据患者情况，填写服药禁忌及补充说明。<br>-->
                <!--治疗服务费、诊金及购药前是否隐藏药方均可在此设置。<br>-->
                <!--您也可以将该药方命名并保存为模板，下次开方时可以直接选择该模板进行编辑，节省您的时间。-->
            <!--</p>-->
            <!--<img src="images/11.jpg" width="80%">-->
            <!--<p>-->
                <!--8.发送药方给患者<br>-->
                <!--确认药方信息无误，即可点击开方页最下方的发给患者按钮便可将该药方发送给患者，以便患者购药进行调理了。-->
            <!--</p>-->
            <!--<img src="images/12.jpg" width="80%">-->
        <!--</div>-->
        <!--<img src="images/13.jpg" class="bor">-->
        <!--<div class="pad">-->
            <!--<p>9.再给患者开方的时候也可以选择使用模版/历史加减方,还可以查看药价明细。</p>-->

            <!--<img src="images/14.jpg" width="80%">-->
            <!--10.您的门诊患者面对面扫码关注后，可以在通讯录找到该患者，查看患者档案，点击该页面开药方按钮也可以方便的为这个患者开药方。-->
            <!--<img src="images/15.jpg" width="80%">-->

        <!--</div>-->

    </div>

</div>






</body>
</html>