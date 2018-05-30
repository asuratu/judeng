<%@ page language="C#" autoeventwireup="true" inherits="index, App_Web_dzxv45om" %>

<%@ Register Src="~/Control/top.ascx" TagName="Control" TagPrefix="top" %>
<%@ Register Src="~/Control/foot.ascx" TagName="Control" TagPrefix="foot" %>
<%@ Register Src="~/Control/Search.ascx" TagName="Control" TagPrefix="search" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>【美国EST】管道及管件压力测试和换热管封堵设备-上海阿而本工贸有限公司</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.js" type="text/javascript"></script>
    <link href="css/slideshow.css" rel="stylesheet" />
    <script src="js/slideshow.js" type="text/javascript"></script>
</head>

<body>
<form id="form" runat="server">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td bgcolor="#FFFFFF">
                <top:Control ID="top" runat="server" />
            </td>
        </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                <!-- 代码 开始 -->
                <div class="comiis_wrapad" id="slideContainer">
                    <div id="frameHlicAe" class="frame cl">
                        <div class="temp"></div>
                        <div class="block">
                            <div class="cl">
                                <ul class="slideshow" id="slidesImgs">
                                    <li>
                                        <img src="images/ban.jpg" width="1365" height="372" alt="" /><span class="title"></span></li>
                                    <li>
                                        <img src="images/ban2.jpg" width="1365" height="372" alt="" /><span class="title"></span></li>
                                    <li>
                                        <img src="images/ban3.jpg" width="1365" height="372" alt="" /><span class="title"></span></li>
                                </ul>
                            </div>
                            <div class="slidebar" id="slideBar">
                                <ul>
                                    <li class="on">1</li>
                                    <li>2</li>
                                    <li>3</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    SlideShow(5000);
                </script>
            </td>
        </tr>
    </table>
    <search:Control ID="search" runat="server" />
    <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="341" height="233" valign="top">
                <table width="337" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td valign="top" bgcolor="#FFFFFF">
                            <table width="337" height="34" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="27">&nbsp;</td>
                                    <td width="225" align="left" class="title16c"><a href="news.aspx" class="link4link">新闻资讯</a></td>
                                    <td width="85"><a href="News.aspx" class="link3link">更多&gt;&gt;&gt;</a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!--首页推荐新闻-->
                <asp:Repeater ID="repeater_news" runat="server">
                    <ItemTemplate>
                        <table width="337" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td bgcolor="#FFFFFF">
                                    <table width="337" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="27">&nbsp;</td>
                                            <td width="196" align="left"><%#Eval("CreateTime","{0:d}") %></td>
                                            <td width="113">&nbsp;</td>
                                        </tr>
                                    </table>
                                    <table width="337" height="28" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="27" height="28">&nbsp;</td>
                                            <td width="278" align="left" class="lan12"><a href="News_more.aspx?id=<%#Eval("id") %>" target="_blank" class="link7link"><%#Eval("Title").ToString().Length>20?Eval("Title").ToString().Substring(0,20) + "...":Eval("Title").ToString() %></a></td>
                                            <td width="32">&nbsp;</td>
                                        </tr>
                                    </table>
                                    <table width="337" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="27">&nbsp;</td>
                                            <td width="278" align="left" class="duanluo1" type="newsContents"><%#Eval("Contents").ToString()%></td>
                                            <td width="32">&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <%#GetNewsBottom(Container.ItemIndex)%>
                    </ItemTemplate>
                </asp:Repeater>
                <table width="337" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="20" align="center" bgcolor="#FFFFFF">&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
            <td width="455" valign="top">
                <table width="455" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td bgcolor="#FFFFFF">
                            <table width="100%" height="34" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="36">&nbsp;</td>
                                    <td width="333" align="left" class="title16c"><strong><a href="about.aspx?id=5" class="link4link">上海润质电力工程有限公司</a></strong></td>
                                    <td width="86"><a href="about.aspx?id=5" class="link3link">更多&gt;&gt;&gt;</a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="201" valign="top" bgcolor="#FFFFFF">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td valign="top">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="5%" valign="top">&nbsp;</td>
                                    <td width="19%" align="left" valign="top">
                                        <%=banner4 %></td>
                                    <td width="72%" align="left" valign="top" class="duanluo2"><p>
                                            <!--润质电力公司-->
                                            上海润质公司拥有一支专业的服务团队，主要提供特殊阀门的现场及离线维修服务，为用户提供快速反应的服务能力。<span id="sp_dl" runat="server" style="display:none;"></span>服务于电力、化工、石油、船舶、军用潜艇等行业</p>
                                        <!--带压堵漏简介-->
                                        <span id="sp_dydl" runat="server" style="display:none;"></span>
                                    </td>
                                    <td width="4%">&nbsp;</td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td valign="top">
                                        <%=banner2 %></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="4">&nbsp;</td>
            <td width="294" align="left" valign="top" bgcolor="#EAEAEA">
                <table width="100%" height="34" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="27" bgcolor="#FFFFFF">&nbsp;</td>
                        <td width="197" align="left" bgcolor="#FFFFFF" class="title16c"><a href="yxwl_down.aspx" class="link4link">文档资料下载</a></td>
                        <td width="113" bgcolor="#FFFFFF">&nbsp;</td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td valign="top" bgcolor="#FFFFFF">&nbsp;</td>
                        <td bgcolor="#FFFFFF">&nbsp;</td>
                        <td bgcolor="#FFFFFF">&nbsp;</td>
                    </tr>
                </table>
                <table width="100%" height="159" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                    <tr>
                        <td>&nbsp;</td>
                        <td align="left" valign="top" style="height: 66px;">
                            <!--内容添加--><img src="images/dl.jpg" width="160px" height="56px">
                            <!--内容添加-->
                            <!--营销网络-->
                            <span id="sp_yxwl" runat="server" style="display:none;"></span>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td width="24" height="87">&nbsp;</td>
                        <td align="left" valign="top">
                            <!--文档下载-->
                            <asp:Repeater ID="repeater_down" runat="server">
                                <ItemTemplate>
                                    <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="89%" background="images/xd.png">
                                                <li><a href="<%#Eval("FileDown") %>" target="_blank" class="link6link"><%#Eval("Title").ToString().Length >30?Eval("Title").ToString() + "...":Eval("Title").ToString() %></a></li>
                                            </td>
                                            <td width="11%" background="images/xd.png"><a href="<%#Eval("FileDown") %>" target="_blank">
                                                <img src="images/d.png" width="23" height="14" border="0" /></a></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:Repeater>
                            <table width="100" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        <td width="17">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="341" height="243" valign="top">
                <table width="337" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td valign="top" bgcolor="#FFFFFF">
                            <table width="337" height="34" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="27">&nbsp;</td>
                                    <td width="225" align="left" class="title16c"><a href="http://www.alpen-sh.com/EFCO.aspx?id=1" class="link4link">电厂服务</a></td>
                                    <td width="85" align="left"><a href="http://www.alpen-sh.com/EFCO.aspx?id=1" class="link3link">更多&gt;&gt;&gt;</a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="337" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="176" bgcolor="#FFFFFF">
                            <table width="100%" height="159" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td align="left" class="title16c">
                                        <p>
                                            <%=banner3 %>
                                        </p>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td width="27" height="78">&nbsp;</td>
                                    <td align="left" valign="top" class="duanluo2">高压主汽门、调门，中压主汽门、调门、联合调门，高加给水三通阀，高压旁路阀、低压旁路阀、小流量阀的阀芯、阀座车削、堆焊、补焊和热处理、研磨。
                                        <!--德国EFCO-->
                                        <span id="sp_efco" runat="server"  style="display:none;"></span>                                        </td>
                                    <td width="11">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="455" valign="top">
                <table width="455" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td bgcolor="#FFFFFF">
                            <table width="100%" height="34" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="35">&nbsp;</td>
                                    <td width="339" align="left" class="title16c"><a href="est.aspx" class="link4link">美国EST</a>
                                        <DIV></DIV></td>
                                    <td width="81"><a href="est.aspx" class="link3link">更多&gt;&gt;&gt;</a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="180" valign="top" bgcolor="#FFFFFF">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="5%" valign="top">&nbsp;</td>
                                    <td width="19%">
                                        <%=banner1 %></td>
                                    <td width="72%" class="duanluo2">
                                        <p>
                                            提供管壳式换热器、冷凝器、管道、管道系统及压力容器的整套产品和服务。服务于全球的发电、炼油、石油化工、精细化工和制药行业。</p>
                                        <!--美国EST-->
                                        <span id="sp_est" runat="server" style="display:none;"></span>
                                    </td>
                                    <td width="4%" valign="right">&nbsp;</td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <table width="350" border="0" align="center" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="center">
                                                                <table width="110" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td><%=banner5 %></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="center">
                                                                <table width="110" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td><%=banner6 %></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="center">
                                                                <table width="110" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td><%=banner7 %></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="7"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="4">&nbsp;</td>
            <td width="294" align="left" valign="top" bgcolor="#EAEAEA">
                <table width="100%" height="34" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="23" bgcolor="#FFFFFF">&nbsp;</td>
                        <td width="193" align="left" bgcolor="#FFFFFF" class="title16c"><a href="about.aspx?id=10" class="link4link">德国Frenzelit</a></td>
                        <td width="81" bgcolor="#FFFFFF"><a href="about.aspx?id=10" class="link3link">更多&gt;&gt;&gt;</a></td>
                    </tr>
                </table>
                <table width="100%" height="180" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                    <tr>
                        <td>&nbsp;</td>
                        <td width="105" align="left" valign="top" class="title16c">
                            <%=banner8 %></td>
                        <td width="151" align="left" valign="top" class="duanluo2">涉及垫圈、技术纺物、绝缘材料和新材料——公司经营已经超过125年历史。                            </td>
                        <td>&nbsp;</td>
                    </tr>
                    <%--<tr>
                        <td width="24" height="105">&nbsp;</td>
                        <td colspan="2" align="left" valign="top">司服务于全球的发电、炼油、石油化工、精细化工和制药行业。 </td>
                        <td width="17">&nbsp;</td>
                    </tr>--%>
                </table>
            </td>
        </tr>
    </table>
    <foot:Control ID="foot" runat="server" />
</form><script type="text/javascript">
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F1d354f311788a675c15813867b6cd6b7' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        //带压堵漏
        var dydl = delHtmlTag($("#sp_dydl").text());
        if (dydl.length > 110)
            dydl = dydl.substring(0, 110) + "...";
        $("#sp_dydl").text(dydl);
        //营销网络
        var yxwl = delHtmlTag($("#sp_yxwl").text());
        if (yxwl.length > 65)
            yxwl = yxwl.substring(0, 65) + "...";
        $("#sp_yxwl").text(yxwl);
        //efco
        var efco = delHtmlTag($("#sp_efco").text());
        if (efco.length > 60)
            efco = efco.substring(0, 60) + "...";
        $("#sp_efco").text(efco);
        //电力
        var dl = delHtmlTag($("#sp_dl").text());
        if (dl.length > 40)
            dl = dl.substring(0, 40) + "...";
        $("#sp_dl").text(dl);
        //est
        var est = delHtmlTag($("#sp_est").text());
        if (est.length > 95)
            est = est.substring(0, 95) + "...";
        $("#sp_est").text(est);
        //新闻
        var news = $("td[type='newsContents']");
        for (var i = 0; i < news.length; i++) {
            var newthis = delHtmlTag($(news[i]).text());
            if (newthis.length > 40)
                newthis = newthis.substring(0, 40) + "...";
            $(news[i]).text(newthis);
        }
    })
    function delHtmlTag(str) {
        var a = str.replace(/<[^>]+>/g, "");//去掉所有的html标记
        var b = a.replace(/(^\s+)|(\s+$)/g, "");
        var c = b.replace(/&nbsp;/g, "");
        return c.replace(/\s/g, "");
    }
</script>
<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: yunwuxin <448901948@qq.com>
// +----------------------------------------------------------------------

return [];
