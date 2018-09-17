<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<meta charset="utf-8">
<%@ taglib uri="http://www.xujunfei.com/tags" prefix="mytag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<% String path = request.getSession().getServletContext().getContextPath();
    String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
    String basePath = request.getScheme() + "://" + request.getServerName() + port + path + "/";%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>添加网点</title>
    <link href="../static/theme/common/bootstrap.min.css" rel="stylesheet">
    <link href="../static/theme/common/global.css" rel="stylesheet">
    <link href="../static/theme/back/css/style.min.css" rel="stylesheet">
    <script src="../static/library/jquery/jquery-2.1.1.min.js"></script>
    <script src="../static/library/bootstrap/bootstrap.min.js"></script>
    <script src="../static/library/bootstrap/bootstrapValidator.js"></script>
    <script src="../static/library/plugins/layer/layer.js"></script>
    <script src="../static/library/plugins/toastr/toastr.min.js"></script>
    <script src="../static/library/plugins/pace/pace.min.js"></script>
    <script src="../static/library/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../static/library/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../static/theme/common/global.js"></script>
    <script src="../static/theme/back/js/main.js"></script>
    <script src="../static/theme/back/js/validator.js"></script>
</head>
<body>
<div class="ibox-content">
    <form class="form-horizontal" id="adminEditForm">
        <div class="form-group">
            <label class="col-sm-2 control-label">订单名称：</label>
            <div class="col-sm-9">
                <input type="hidden" name="departmentId" id="departmentId" value="${departmentId}">
                <input type="text" name="orderName" id="orderName"  class="form-control"
                       placeholder="订单名称">
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-2 control-label">订单数量：</label>
            <div class="col-sm-9">
                <input type="text" name="orderNum" id="orderNum"  class="form-control"
                       placeholder="订单数量">
            </div>
        </div>



        <div class="form-group">
            <label class="col-sm-2 control-label">用户名称：</label>
            <div class="col-sm-9">
                <input type="text" name="userName" id="userName"  class="form-control"
                       placeholder="用户名称">
            </div>
        </div>



        <div class="form-group">
            <label class="col-sm-2 control-label">用户电话：</label>
            <div class="col-sm-9">
                <input type="text" name="userPhone" id="userPhone" class="form-control"
                       placeholder="用户电话">
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-2 control-label">订单备注：</label>
            <div class="col-sm-9">
                <input type="text" name="orderRemake" id="orderRemake"  class="form-control"
                       placeholder="订单备注">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">时间：</label>
            <div class="col-sm-9">
                <input type="text" name="createTime" id="createTime"
                       class="form-control" placeholder="订单开始时间" >
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-3">
                <%-- <input type="hidden" name="id" value="">--%>
                <button type="button" onclick="toCompany()" class="btn btn-info btn-block">确定
                </button>
            </div>
        </div>
    </form>
</div>





<script type="text/javascript">
    $(function () {
        cityPicker("#city-picker");
    });

    function toCompany() {
        console.log("进入函数")
        Ajax.ajax({
            url: 'admin/company/insertusermsg',
            params: $("#adminEditForm").serialize(),
            success: function (data) {
                if(data.code==1){
                    parent.layer.closeAll();
                    layer.msg(data.data);
                    parent.window.location.reload();
                }else {
                    layer.msg(data.data);
                }

            },
            error: function (data) {
                layer.msg(data.data);
            }
        });
    }
</script>
</body>
</html>