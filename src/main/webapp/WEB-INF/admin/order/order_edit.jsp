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
                <input type="hidden" name="id" id="id" value="${order.id}">
                <input type="hidden" name="departmentId" id="departmentId" value="${departmentId}">
                <input type="text" name="orderName" id="orderName" value="${order.orderName}" class="form-control"
                       placeholder="订单名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">订单单价：</label>
            <div class="col-sm-9">
                <input type="text" name="orderPrice" value="${order.orderPrice}" id="orderPrice"
                       class="form-control" placeholder="订单单价" >
            </div>
        </div>
        <c:if test="${order != null}">
            <div class="form-group">
                <label class="col-sm-2 control-label">时间：</label>
                <div class="col-sm-9">
                    <fmt:formatDate value="${order.createTime}" var="mydate"  pattern="yyyy-MM-dd HH:mm:ss"/>
                    <input type="text" name="createTime" value="${mydate}" id="createTime"
                           class="form-control" placeholder="订单开始时间" >
                </div>
            </div>
        </c:if>
        <div class="form-group">
            <label class="col-sm-2 control-label">订单总数：</label>
            <div class="col-sm-9">
                <input type="text" name="orderNum" value="${order.orderNum}" id="orderNum"
                       class="form-control" placeholder="订单总数" >
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



<c:if test="${order==null}">
    <div class="ibox-content">
        <form class="form-horizontal" id="fileUploadForm" enctype="multipart/form-data" method="post">

            <div class="form-group">
                <label class="col-sm-2 control-label">excel文件批量增加：</label>
                <div class="col-sm-9">
                    <input type="file" name="excelfile"  id="excelfile"
                           class="form-control" placeholder="excel文件批量增加" >
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-3">
                        <%-- <input type="hidden" name="id" value="">--%>
                    <button type="button" onclick="upload(${departmentId});" class="btn btn-info btn-block">确定
                    </button>
                </div>
            </div>
        </form>
    </div>
</c:if>








<script type="text/javascript">
    $(function () {
        cityPicker("#city-picker");
    });
    function upload(departmentId) {
	 if($('#excelfile').val()==""){
		 layer.msg("请上传文件！")
        return false;
      }
        var formData = new FormData();
        formData.append("excelfile",document.getElementById("excelfile").files[0]);
        formData.append("departmentId",departmentId);



        $.ajax({
            type:"post",
            url:"admin/order/insertorders",
            processData:false,
            contentType: false,
            data:formData,
            async:true,
            success:function (data) {
				//
                if(data.code==1){
                    parent.window.location.reload();
                    parent.layer.closeAll();
					$(".btn").removeAttr("disabled")
                }else {
                    layer.msg(data.data);
                }

            }
        });
    }
    

    function toCompany() {
        var name = $("#name").val();
        <c:if test="${id == null}">
        var phone = $("#phone").val();
        </c:if>
        var area = $("#city-picker").val();
        var adress = $("#adress").val();

        if (orderName == "") {
            alert("名称不能为空！");
            return;
        }
        if (orderPrice == "") {
            alert("每单价格不能为空！"); return;
        }
        if (orderNum == "") {
            alert("订单数量不能为空！"); return;
        }
        Ajax.ajax({
            <c:if test="${order == null}">
            url: 'admin/order/insertorder',
            </c:if>
            <c:if test="${order != null}">
            url: 'admin/order/updateorder',
            </c:if>
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