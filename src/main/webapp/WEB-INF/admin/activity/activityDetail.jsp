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
<body>
<%--<nav class="mui-bar mui-bar-tab">
    <a class="mui-tab-item mui-active" href="activityDetail.jsp">
        <span class="mui-icon mui-icon-phone"></span>
        <span class="mui-tab-label">电话</span>
    </a>
    <a class="mui-tab-item" id="wo">
        <span class="mui-icon mui-icon-compose"></span>
        <span class="mui-tab-label">买单</span>
    </a>
</nav>--%>
<script type="text/javascript">
    window.onscroll = function () {
        var top = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
        var node = document.getElementById('onecap-child');
        if (top > 150) {//500就是滚动条滚动到的位置，大于500才显示
            node.style.display = 'block';
        } else {
            node.style.display = 'none';
        }
    }
</script>
<header class="mui-bar mui-bar-nav" id="onecap-child" style="display: none;">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>

    <h1 class="mui-title">${product.vendor.vendorName}</h1>
</header>
<div class="mui-banner">
    <img src="/static/theme/activity/images/img.jpg">

    <p><span>${product.vendor.vendorName}</span><br/><i>9:00-20:00</i></p>

    <div class="mui-ch-map mui-col-xs-12">
        <span class="mui-col-xs-9">${product.vendor.vendorAddr}</span>
        <span class="mui-col-xs-1 mui-icon mui-icon-location"></span>
        <%--	<span class="mui-col-xs-2">500m</span>--%>
    </div>
</div>
<div class="mui-content mui-cintent-ch">
    <div class="mui-car-list">
        <c:forEach items="${productList }" var="v" varStatus="vs">
            <ul class="mui-table-view">
                <input type="hidden" id="" value="${v.id}"/>
                <li class="mui-table-view-cell">${v.productName}</li>
                <li class="mui-table-view-cell" onclick="wash(this)"><span>${v.productName}</span>
                    <p class="fr"><s>￥${v.normalPrice}</s><span>￥1</span></p></li>
            </ul>
        </c:forEach>
        <%--<ul class="mui-table-view">--%>
        <%--<li class="mui-table-view-cell">普通洗车</li>--%>
        <%--<li class="mui-table-view-cell">小型车洗车<p class="fr"><s>￥25</s><span>￥20</span></p></li>--%>
        <%--<li class="mui-table-view-cell">大型车洗车<p class="fr"><s>￥25</s><span>￥20</span></p></li>--%>
        <%--</ul>--%>
        <%--<ul class="mui-table-view">--%>
        <%--<li class="mui-table-view-cell">汽车检测</li>--%>
        <%--<li class="mui-table-view-cell">小型车洗车<p class="fr"><s>￥100</s><span>￥1</span></p></li>--%>
        <%--<li class="mui-table-view-cell">大型车洗车<p class="fr"><s>￥100</s><span>￥1</span></p></li>--%>
        <%--</ul>--%>
    </div>
    <%--<div class="mui-card-all">
    <div class="mui-card">
        <div class="mui-card-header mui-card-media" >
            <img src="/static/theme/activity/images/tit14.jpg" />
            <div class="mui-media-body">
                185***4723
                <p>发表于 2017-07-70 15:30</p>
            </div>
        </div>
        <!--内容区-->
        <div class="mui-card-content" style="text-indent:2rem;padding: 5px 10px; text-align: justify;">
            MUI是一种单独发行的Windows版本的代号。它的正式名字叫Windows多语种版（Windows Multilanguage Version）。
                   在这个版本的Windows中，用户可以自己设定Windows界面中使用的语言。这样，大型公司只需要一种安装操作就可以在全世界范围内部署Windows。
                   用户界面的语种可以由本地用户自己选择，或者可以按照组织单元的组策略进行统一设定。使用不同语言的用户可以实现对同一台工作站的共享。

        </div>
    </div>
    <div class="mui-card">
        <div class="mui-card-header mui-card-media" >
            <img src="/static/theme/activity/images/tit14.jpg" />
            <div class="mui-media-body">
                185***4723
                <p>发表于 2017-07-70 15:30</p>
            </div>
        </div>
        <!--内容区-->
        <div class="mui-card-content" style="text-indent:2rem;padding: 5px 10px; text-align: justify;">
            MUI是一种单独发行的Windows版本的代号。它的正式名字叫Windows多语种版（Windows Multilanguage Version）。
        </div>
    </div>
    </div>--%>
</div>
<script type="javascript">
    function wash(obj) {
        var productId = obj.id;
        var productName = $(obj).children("span").eq(0).text();
        var product = $(obj).children("p").children("span").eq(0).text();
        var a = wash1(productId, product, productName)
    }
    function wash1(productId, product, productName) {
        android.wash2(productId, product, productName);
        console.log(productId + "," + product + "," + productName);
    }
</script>
</body>
</html>