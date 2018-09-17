<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/22 0022
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>抽奖记录</title>
</head>
<body>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no">
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

    <div class="title2">抽奖记录</div>
    <div class="list1">
        <c:forEach items="${couponList}" var="v" varStatus="vs">
            <div class="l1">
                <div class="p1">${v.name}</div>
                <div class="p2"><fmt:formatDate value="${v.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
            </div>
        </c:forEach>
    </div>
    <div class="title3">*温馨提示：中奖后，奖品将于一日内到账。</div>
    <a href="/activity/coupon.do" class="bt1">返&nbsp;回</a>
</div>


</div>


</body>
</html>