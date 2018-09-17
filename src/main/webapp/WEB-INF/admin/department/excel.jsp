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
    <title>excel</title>
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
    <script src="../static/theme/common/global.js"></script>
    <script>
        function uploadExcel() {
            var departmentId = $("#departmentId").val();
            var formData = new FormData();
            formData.append("departmentId",departmentId);
            formData.append("excelFile",document.getElementById("excelFile").files[0]);


            $.ajax({
                type:"post",
                url:"admin/company/insertexcel",
                processData:false,
                contentType: false,
                data:formData,
                async:true,
                success:function (data) {
                    if(data.code==1){
                        window.location.reload();
                    }else {
                        layer.msg(data.data);
                    }

                }
            });
        }
    </script>

</head>
<body class="gray-bg">
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <form action="/admin/company/selectexcel" method="post" class="form-inline" id="queryForm">
                            <input type="hidden" id="departmentId" name="departmentId" value="${departmentId}">
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">
                        <th>序号</th>
                        <th>文件名称</th>
                        <th>上传用户</th>
                        <th>上传时间</th>
                        <th>下载</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pagination.list}" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1}</td>
                            <td>${v.name}</td>
                            <td>${v.createAdmin.adminName}</td>
                            <td><fmt:formatDate value="${v.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><a href="/admin/company/excel/${v.path}">下载</a></td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-4">
                        <form enctype="multipart/form-data" method="post">
                            <input type="file" name="excelFile" id="excelFile">
                            <button type="button" onclick="uploadExcel()">上传</button>
                        </form>
                    </div>
                    <div class="col-sm-8">
                        <div class="pagination-ul">
                            <mytag:Pagination pagination="${pagination}" queryForm="queryForm"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
