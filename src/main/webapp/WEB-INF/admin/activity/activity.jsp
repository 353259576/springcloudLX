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
<!--移动端版本兼容 -->
<script type="text/javascript">
    var phoneWidth = parseInt(window.screen.width);
    var phoneScale = phoneWidth / 720;
    var ua = navigator.userAgent;
    if (/Android (\d+\.\d+)/.test(ua)) {
        var version = parseFloat(RegExp.$1);
        // andriod 2.3
        if (version > 2.3) {
            document.write('<meta name="viewport" content="width=720, minimum-scale = ' + phoneScale + ', maximum-scale = ' + phoneScale + ', target-densitydpi=device-dpi">');
            // andriod 2.3以上
        } else {
            document.write('<meta name="viewport" content="width=720, target-densitydpi=device-dpi">');
        }
        // 其他系统
    } else {
        document.write('<meta name="viewport" content="width=720, user-scalable=no, target-densitydpi=device-dpi">');
    }

    if (IsPC()) {
        document.write('<meta name="viewport" content="width=720, user-scalable=no, target-densitydpi=device-dpi">');

    }
    function IsPC() {
        var userAgentInfo = navigator.userAgent;
        var Agents = new Array("Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod");
        var flag = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                flag = false;
                break;
            }
        }
        return flag;
    }
</script>
<body style="margin:0 auto;  width:720px !important;" class="gf">
<!--广发信用卡洗车-->
<div class="car_g">
    <div class="car_g_banner"></div>
    <div class="wash">
        <div class="receive wash-car" onclick="receive()">立即领取</div>
        <div class="card wash-car" onclick="card()">快速办卡</div>
        <input type="hidden" id="latitude"/>
        <input type="hidden" id="longitude"/>
    </div>
    <div class="car_city">
        <li>选择城市点击查看洗车网点</li>
        <li><a>合肥</a></li>
    </div>
    <div class="car_process">
        <p class="p">操作流程</p>
        <li class="car_process_li">通过广发银行信用卡支付1元<br/>获得洗车卷</li>
        <li>凭手机号到洗车网点验证使用<br/>(下载去扑购APP查询洗车卷)</li>
    </div>
    <div class="car_rule">
        <div class="p">操作流程</div>
        <p>1.活动时间：即日起至 2017年12月31日。</p>

        <p>2.此优惠仅限合肥广发信用卡客户使用。</p>

        <p>3.优惠券仅限在合肥去扑购APP签约网点使用，成功领取本券后，您将收到来自去扑购的短信提示。</p>

        <p>4.每人每月可参与 2 次，每月 500 个名额，抢完即止，券自领取之日起 30 天内有效。</p>

        <p>5.您可以下载去扑购APP用手机号登录即可查询洗车网点，及享用本次优惠券。</p>

        <p>6.本活动填写手机号码，即为您的去扑购APP账号。</p>

        <p>7.如有任何疑问可拨打去扑科技客服电话<a>0551-65307150</a>。</p>
    </div>
    <div class="car_wei">
        <img src="/static/theme/activity/images/weixin.png">

        <p>扫一扫获取更多优惠卷信息</p>
    </div>
</div>

<script type="javascript">
    function receive() {
        var lat = document.getElementById("latitude").value;
        var lon = document.getElementById("longitude").value;
        console.log(lon)
        window.location.href = 'activity/list.do?lat=' + lat + '&lon=' + lon;
    }
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (pos) {
            var latitude = pos.coords.latitude;
            var longitude = pos.coords.longitude;
            document.getElementById("latitude").value = latitude;
            document.getElementById("longitude").value = longitude;
            console.log(latitude + "," + longitude)
        });
    }
</script>
</body>
</html>