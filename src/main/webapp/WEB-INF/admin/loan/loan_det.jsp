<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath();
    String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
    String basePath = request.getScheme() + "://" + request.getServerName() + port + path + "/";%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title></title>
    <%@ include file="../include.jsp"%>
</head>

<body>

<div class="ibox">
    <table class="table">
        <tr>
            <td>上牌时间：<fmt:formatDate value="${loan.carTime }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
        </tr>
        <tr><td>行驶里程：${loan.carDist}</td></tr>
    </table>
</div>
<div class="row">
    <div class="col-md-4">
        <table class="table">
            <tr><td>车型</td></tr>
            <c:forTokens items="${loan.carType}" delims="," var="t">
                <tr><td>${t}</td></tr>
            </c:forTokens>
        </table>
    </div>
    <div class="col-md-4">
        <table class="table">
            <tr><td>采购数量</td></tr>
            <c:forTokens items="${loan.carCount}" delims="," var="t">
                <tr><td>${t}</td></tr>
            </c:forTokens>
        </table>
    </div>
    <div class="col-md-4">
        <table class="table">
            <tr><td>车型估价</td></tr>
            <c:forTokens items="${loan.carEva}" delims="," var="t">
                <tr><td>${t}</td></tr>
            </c:forTokens>
        </table>
    </div>
</div>


</body>
</html>
