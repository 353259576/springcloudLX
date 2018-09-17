<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<% String path = request.getContextPath();
    String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
    String basePath = request.getScheme() + "://" + request.getServerName() + port + path + "/";%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <link href="/static/theme/qp/css/index.css" rel="stylesheet" type="text/css" />
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <script src="/static/theme/qp/js/jquery-1.9.1.min.js"></script>
    <title>砍价详情</title>
</head>

<body>

<body>
<input type="hidden" id="productId" value="${param.productId}">
<div class="wap">
    <div class="hide">
        <h2>砍价详情</h2>
    </div>
    <div class="contain">
        <div class="banner">
            <img src="${product.productImg}"/>
        </div>
        <div class="zt">
            <h3>${product.productName}</h3>
            <p><span>￥${product.curPrice}</span><b>￥${product.normalPrice}</b></p>
            <ul>
                <li style="background: url(/static/theme/qp/img/01.01_05.png) no-repeat; background-size: 26%;">${product.hitsCount}</li>
                <li style="background: url(/static/theme/qp/img/01.01_07.png) no-repeat; background-size: 26%;">${product.kanCount}</li>
            </ul>
        </div>
        <div class="ft">
            <h3>${product.vendor.vendorName}</h3>
            <div class="dw">
                <p>${product.vendor.vendorAddr}  ${product.vendor.vendorAddrDetail}</p>
                <%--<a><img src="/static/theme/qp/img/dh_13.png"/></a>--%>
            </div>
        </div>
        <div class="sm">
            <h3>产品说明</h3>
            <ul>
                <li style="width: 100%;">兑换时间：
                    <fmt:formatDate value="${product.productStartTime }" pattern="yyyy-MM-dd"></fmt:formatDate> -
                    <fmt:formatDate value="${product.productEndTime }" pattern="yyyy-MM-dd"></fmt:formatDate>
                </li>
                <li>${product.isOrder?"需预约":"无需预约"}</li>
                <li>兌换时间：09:00~18:00</li>
            </ul>
        </div>
    </div>
    <div class="bk"><a id="btn" href="javascript:;">点击帮助好友砍价</a></div>
</div>
</body>

<script>
    $(function () {
        $("#btn").click(function () {
            var pid = $("#productId").val();
            $.ajax({
                type : "post",
                url : "helpkan.do",
                data : {productId:pid},
                dataType : "json",
                success : function(data) {
                    if(data.code==0){
                        $("#btn").attr("disabled",true);
                        $("#btn").css("backgroundColor","#969c98");
                        alert("砍价成功,砍价后金额："+data.data.curPrice+"元");
                    }else if(data.code==99){
                        location.href="login.do?redirectURL=kan.do?productId="+pid;
                    }else {
                        alert(data.msg);
                    }
                }
            });
        })
    })
</script>
</body>
</html>
