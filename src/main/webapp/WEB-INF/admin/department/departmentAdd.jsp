<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"  %>
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
    <title>商户入驻</title>
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
    <script src="http://malsup.github.io/min/jquery.form.min.js"></script>
</head>
<body>
<div class="ibox-content">
    <form class="form-horizontal" id="adminEditForm" onsubmit="return repair()"
          action="/department/departAddD.do"  method="psot">
        <input type="hidden" name="id" value="${department.id}">
        <div class="form-group">
            <label class="col-sm-2 control-label">维修商家名称：</label>
            <div class="col-sm-9">
                <input type="text" name="name" id="name" value="${department.name}" class="form-control"
                       placeholder="商家名称">
            </div>
        </div>
        <c:if test="${department.id==null}">
        <div class="form-group">
            <label class="col-sm-2 control-label">维修商家账号：</label>
            <div class="col-sm-9">
                <input type="text" name="phone" id="phone" value="${department.phone}" class="form-control"
                       placeholder="商家账号/手机号">
            </div>
        </div>
        </c:if>
        <div class="form-group">
            <label class="col-sm-2 control-label">所属区域：</label>
            <div class="col-sm-9">
                <input type="text" id="city-picker" name="area" value="${department.area}" id="area"
                       class="form-control" placeholder="所属区域" readonly data-toggle="city-picker">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">详细地址：</label>
            <div class="col-sm-9">
                <input type="text" name="address" id="address" value="${department.address}" class="form-control"
                       placeholder="详细地址">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">开始日期：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control input-sm" id="startDate" name="startDate"
                       placeholder="开始日期" value="<fmt:formatDate value="${department.startTime}" pattern="yyyy-MM-dd"></fmt:formatDate>">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">结束日期：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control input-sm" id="endDate" name="endDate"
                       placeholder="结束日期" value="<fmt:formatDate value="${department.startTime}" pattern="yyyy-MM-dd"></fmt:formatDate>">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-3">
                <button type="submit" class="btn btn-info btn-block">确定</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(function () {
        cityPicker("#city-picker");
        datePicker('#startDate,#endDate', "yyyy-mm-dd", 2);
    });

    function repair() {
        var name = $("#name").val();//商家名称
        var phone = $("#phone").val();//商家账号/手机号
        var startDate = $("#startDate").val();//注册日期
        var endDate = $("#endDate").val();//结束日期
        var area = $("#area").val();//所属区域
        var address = $("#address").val();//详细地址
        if (name == "") {
            $(function () {
                setTimeout(function () {
                    alert("商家名称不能为空");

                });
            });
            return false;
        }
        if (!phone) {
            $(function () {
                setTimeout(function () {
                    alert("商家账号不能为空");
                });
            });
            return false;
        }else {
            if (!checkMobile(phone)) {
                $(function () {
                    setTimeout(function () {
                        alert("商家账号格式错误")
                    });
                });
                return false;
            }
        }

        /*if (area = "") {
            alert("所属区域不能为空");
            return false;
        }*/
        /* if (address = "") {
             alert("详细地址不能为空");
             return false;
         }*/
        /* $.ajax({
             url: '../../../department/departAddD.do',
             params: $("#adminEditForm").serialize(),
             success: function (data){
                 if(data.code=0){
                     alert("提交成功！");
                 }
             },
             error : function(){
             }
         });*/

    }

    /* $(function () {
         var options = {
             type: 'POST',
             url: '../../../department/departAddD.do',
             success: showResponse,
             dataType: 'json',
             error: function (xhr, status, err) {
                 alert("操作失败");
             }
         }
     });*/

    $(function () {
        /** 验证文件是否导入成功  */
        $("#adminEditForm").ajaxForm(function (data) {
            if (data.code == "0") {
                alert("提交成功！");
                location.reload();
            }
        });
    });

    //验证手机号码
    function checkMobile(strMobile) {
        var regu = /^[1][3,4,5,7,8][0-9]{9}$/;
        var re = new RegExp(regu);
        if (re.test(strMobile)) {
            return true;
        } else {
            return false;
        }
    }
</script>
</body>
</html>