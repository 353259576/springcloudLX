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
            <label class="col-sm-2 control-label">网点名称：</label>
            <div class="col-sm-9">
                <input type="hidden" name="id" id="id" value="${department.id}">
                <input type="hidden" name="companyId" id="companyId" value="${companyId}">
                <input type="text" name="name" id="name" value="${department.name}" class="form-control"
                       placeholder="网点名称">
            </div>
        </div>
        <%--<c:if test="${department == null}">--%>
        <div class="form-group">
            <label class="col-sm-2 control-label">联系电话：</label>
            <div class="col-sm-9">
                <input type="text" name="phone" id="phone" value="${department.phone}" class="form-control" placeholder="网点账号">
            </div>
        </div>
        <%--</c:if>--%>
        <div class="form-group">
            <label class="col-sm-2 control-label">所属区域：</label>
            <div class="col-sm-9">
                <input type="text" id="city-picker" name="area" value="${department.area}"
                       class="form-control" placeholder="所属区域" readonly data-toggle="city-picker">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">地址：</label>
            <div class="col-sm-9">
                <input type="text" name="address" value="${department.address}" id="address"
                       class="form-control" placeholder="地址" >
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-3">
                <%-- <input type="hidden" name="id" value="">--%>
                <button type="button" onclick="toCompany();" class="btn btn-info btn-block">确定
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
        var name = $("#name").val();
        <c:if test="${id == null}">
        var phone = $("#phone").val();
        </c:if>
        var area = $("#city-picker").val();
        var adress = $("#adress").val();

        if (name == "") {
            alert("名称不能为空！");
            return;
        }
        <c:if test="${id == null}"> if(phone == "") {
            alert("电话号码不能为空！"); return;
        }</c:if>
        if (area == "") {
            alert("区域不能为空！"); return;
        }
        if (adress == "") {
            alert("详细地址不能为空！"); return;
        }
        Ajax.ajax({
            <c:if test="${department == null}">
            url: 'admin/company/insertdepartment',
            </c:if>
            <c:if test="${department != null}">
            url: 'admin/company/updatedepartment',
            </c:if>
            params: $("#adminEditForm").serialize(),
            success: function (data) {
                if(data.code==1){
                    parent.layer.closeAll();
                    parent.window.location.reload();
                    layer.msg(data.data);
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