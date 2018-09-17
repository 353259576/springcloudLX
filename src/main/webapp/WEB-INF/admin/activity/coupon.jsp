<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="com.jf.system.Constant,com.jf.system.SystemUtil,java.util.Date" %>
<% String path = request.getContextPath();
    String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
    String basePath = request.getScheme() + "://" + request.getServerName() + port + path + "/";%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <script src="/static/library/jquery/jquery-2.1.1.min.js"></script>
    <script src="/static/library/jquery/jquery.slimscroll.min.js"></script>
    <script src="/static/library/jquery/jquery.fullPage.min.js"></script>

    <link href="/static/theme/activity/css/jquery.fullPage.css" rel="stylesheet"/>
    <link href="/static/theme/activity/css/mui.min.css" rel="stylesheet"/>
    <link href="/static/theme/activity/css/style.css" rel="stylesheet"/>
    <link rel="shortcut icon" href="/static/theme/default/images/favicon.ico" rel="stylesheet"/>
    <link href="/static/theme/common/bootstrap.min.css" rel="stylesheet">
    <link href="/static/theme/common/global.css" rel="stylesheet">
    <link href="/static/theme/activity/css/couponStyle.css" rel="stylesheet">

    <script src="/static/library/plugins/layer/layer.js"></script>
    <script src="/static/theme/back/js/main.js"></script>
    <script src="/static/theme/common/global.js"></script>
    <script src="/static/theme/back/js/validator.js"></script>
    <script src="/static/library/bootstrap/bootstrap.min.js"></script>
    <script src="/static/library/bootstrap/bootstrapValidator.js"></script>
    <script src="/static/library/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/static/library/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="static/library/plugins/toastr/toastr.min.js"></script>
    <script src="/static/library/plugins/pace/pace.min.js"></script>
</head>
<body>
<div class="main">
    <div class="banner"><img src="/static/theme/activity/images/banner-cj.jpg"/></div>
    <div class="main-header">
        <p>老铁们注意了<span></span></p>
        <input type="hidden" id="price">
        <input type="hidden" id="name">
        <input type="hidden" id="type">
        <input type="hidden" id="userId" value="${userId}">
        <input type="hidden" id="count" value="${count}">
        <p class="p1">今日免费<span class="coud_num"></span> 次抽奖机会</p>
    </div>
    <div class="main-body ">
        <!--转盘-->
        <div id="zhuanpan" class="rotation">
            <img id="img" class="rotary-table " src="/static/theme/activity/images/four_zhuanpan1.png">
        </div>
        <!--指针-->
        <img id="tip" class="point i_cont rotation" src="/static/theme/activity/images/pointer1.png">
    </div>
    <div class="main-footer"><a href="/activity/zhongjiang.do" class="footer-a2">中奖记录>></a><a href="#" class="footer-a"
                                                                                data-toggle="modal"
                                                                                data-target="#myModal">活动规则>></a></div>
</div>
<!-- 30元话费 -->
<div id="apply1" class="modal fade padding1" tabindex="-1" data-replace="true" data-backdrop="static">
    <div class="modal-dialog modal-content">
        <div class="modal-body">
            <div class="img1"><img src="/static/theme/activity/images/30yuanhuafei.png"/></div>
            <p><span>奖品将于次月10日前到账，请留意查收！</span></p>
            <a href="#" class="colse1" data-dismiss="modal"></a>
            <button type="button" class="but5" data-dismiss="modal" data-toggle="modal">确定</button>
        </div>
    </div>
</div>
<!--100M省内流量 -->
<div id="apply2" class="modal fade padding1" tabindex="-1" data-replace="true" data-backdrop="static">
    <div class="modal-dialog modal-content">
        <div class="modal-body">
            <div class="img1"><img src="/static/theme/activity/images/100mshengneiliuliang.png"/></div>
            <p><span>奖品将于次月10日前到账，请留意查收！</span></p>
            <a href="#" class="colse1" data-dismiss="modal"></a>
            <button type="button" class="but5" data-dismiss="modal" data-toggle="modal">确定</button>
        </div>
    </div>
</div>
<!--500M省内流量 -->
<div id="apply3" class="modal fade padding1" tabindex="-1" data-replace="true" data-backdrop="static">
    <div class="modal-dialog modal-content">
        <div class="modal-body">
            <div class="img1"><img src="/static/theme/activity/images/500mshengneiliuliang.png"/></div>
            <p><span>奖品将于次月10日前到账，请留意查收！</span></p>
            <a href="#" class="colse1" data-dismiss="modal"></a>
            <button type="button" class="but5" data-dismiss="modal" data-toggle="modal">确定</button>
        </div>
    </div>
</div>
<!--300M省内流量 -->
<div id="apply4" class="modal fade padding1" tabindex="-1" data-replace="true" data-backdrop="static">
    <div class="modal-dialog modal-content">
        <div class="modal-body">
            <div class="img1"><img src="/static/theme/activity/images/300mshengneiliuliang.png"/></div>
            <p><span>奖品将于次月10日前到账，请留意查收！</span></p>
            <a href="#" class="colse1" data-dismiss="modal"></a>
            <button type="button" class="but5" data-dismiss="modal" data-toggle="modal">确定</button>
        </div>
    </div>
</div>
<!-- 温馨提示 -->
<div id="myModal" class="modal fade s3" tabindex="-1" data-replace="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="hd-title"></div>
        <a href="#" class="close2"></a>

        <div class="modal-body" style="height: 250px; overflow: auto;">
            <p>1.活动时间：即日起至 2017年12月31日。<br/>
                2.此优惠仅限合肥去扑购app客户使用。<br/>
                3.优惠券仅限在合肥去扑购APP签约网点使用，成功领取优惠券后，您将收到来自去扑购的短信提示。<br/>
                4.每人每天可参与 3 次，每日 500 个名额，抢完即止，券自领取之日起 30 天内有效。<br/>
                5.您可以下载去扑购APP用手机号登录即可查询洗车网点，及享用本次优惠券。<br/>
                6.本活动填写手机号码，即为您的去扑购APP账号。<br/>
                7.如有任何疑问可拨打去扑科技客服电话<a>0551-65307150</a>。<br/>
                <span>备注：非实名制用户不能受理流量包，请进行实名补登记后再购买。</span></p>
        </div>

    </div>
</div>
<script src="/static/library/plugins/coupon/coupon.js"></script>
</body>
</html>