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
<!--车况管理-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="/static/theme/common/bootstrap.min.css" rel="stylesheet">
    <link href="/static/theme/common/global.css" rel="stylesheet">
    <link href="/static/theme/back/css/style.min.css" rel="stylesheet">

    <script src="/static/library/jquery/jquery-2.1.1.min.js"></script>
    <script src="/static/library/bootstrap/bootstrap.min.js"></script>
    <script src="/static/library/bootstrap/bootstrapValidator.js"></script>
    <script src="/static/library/plugins/layer/layer.js"></script>
    <script src="/static/library/plugins/toastr/toastr.min.js"></script>
    <script src="/static/library/plugins/pace/pace.min.js"></script>
    <script src="/static/library/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/static/library/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="/static/theme/common/global.js"></script>
    <script src="/static/theme/back/js/main.js"></script>
    <script src="/static/theme/common/global.js"></script>
    <script src="http://malsup.github.io/min/jquery.form.min.js"></script>
</head>
<body class="gray-bg  pace-done">
<div class="pace  pace-inactive">
    <div class="pace-progress" data-progress-text="100%" data-progress="99" style="width: 100%;">
        <div class="pace-progress-inner"></div>
    </div>
    <div class="pace-activity"></div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <form action="" method="post" class="form-inline" id="queryForm">
                            <label> 单车ID:<input type="text" name="vehicleimei" value="${imei}"
                                                class="form-control input-sm"></label>
                            <label> 手机号:<input type="text" name="vehiclephone" value="${phone}"
                                               class="form-control input-sm"></label>
                            <label> 所属企业:
                                <select class="form-control input-sm" name="vehiclecompanyId"
                                        id="companyId">
                                    <option value="0">--请选择企业--</option>
                                    <c:forEach items="${companyList}" var="v" varStatus="vs">
                                        <option value="${v.id}">${v.name}</option>
                                    </c:forEach>
                                </select>
                            </label>
                            <label> 所属维修部门:
                                <select class="form-control input-sm" name="vehicledepartmentId"
                                        id="vehicledepartmentId">
                                    <option value="0">--请选择维修部门--</option>
                                    <c:forEach items="${dList}" var="v" varStatus="vs">
                                        <option value="${v.id}">${v.name}</option>
                                    </c:forEach>
                                </select>
                            </label>
                            <button type="submit" class="btn btn-sm btn-info"><i
                                class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">

                        <th>序号</th>
                        <th>单车ID</th>
                        <th>用户名</th>
                        <th>手机号</th>
                        <th>所属企业</th>
                        <th>所属维修公司</th>
                        <th>操作</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${p.list}" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1 }</td>
                            <td>${v.erweimaId}</td>
                            <td>${v.authorUser.name}</td>
                            <td>${v.authorUser.userphone}</td>
                            <td>${v.company.name}</td>
                            <td>${v.department.name}</td>
                            <td>
                                <a class="btn btn-sm btn-circle btn-danger changecompany"><%-- onclick="company(${v.imei},${v.company.name})--%>
                                    <i class=" fa fa-exchange"></i>
                                </a>
                                <a class="btn btn-sm btn-circle btn-danger changemaintenance">
                                   <%--title="更改维修部门" href="javascript:void(0)"--%>
                                   <%--onclick="updatedepartment(${v.imei},${v.company.name},${v.department.id})">--%>
                                    <i class=" fa fa-bicycle"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-4">

                    </div>
                    <div class="col-sm-8">
                        <div class="pagination-ul">
                            <mytag:Pagination pagination="${p}" queryForm="queryForm"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="ibox-content layer-win layer-edit">
    <form class="form-horizontal col-sm-12 layui-layer-iframe  layer-anim-05 "action="/vehicleBack/changecompany.do"
          id="userEditFormCompany">
        <div class="form-group">
            <label class="col-sm-2 control-label">单车id：</label>
            <div class="col-sm-10">
                <input type="text" name="imei" id="imei" value="1" class="form-control"
                       placeholder="单车id"
                       readonly>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">现在所属企业：</label>
            <div class="col-sm-10">
                <input type="text" name="oldCompany" id="oldCompany" value="" class="form-control" readonly
                       placeholder="现在所属企业">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">修改所属企业：</label>
            <div class="col-sm-10">
                <select class="form-control input-sm" name="newCompanyId"
                        id="newCompanyId">
                    <option value="0">--请选择企业--</option>
                    <c:forEach items="${companyList}" var="v" varStatus="vs">
                        <option value="${v.id}">${v.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-6">
                <input type="hidden" name="id" value="10305">
                <button type="submit" class="btn btn-info btn-block">保存</button>
            </div>
        </div>
    </form>
</div>
<div class="ibox-content layer-win layer-edit1">
    <form class="form-horizontal col-sm-12 layui-layer-iframe  layer-anim-05 " action="/vehicleBack/changedepartment.do"   id="userEditFormDepartment">
        <div class="form-group">
            <label class="col-sm-2 control-label">单车id：</label>
            <div class="col-sm-10">
                <input type="text" name="dimei" id="dimei" value="1" class="form-control"
                       placeholder="单车id"
                       readonly>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">现在所属维修部门：</label>
            <div class="col-sm-10">
                <input type="text" name="oldCompany" id="oldDepartment" value="" class="form-control"
                       placeholder="现在所属企业">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">修改所属维修部门：</label>
            <div class="col-sm-10">
                <select class="form-control input-sm" name="newDepratmentId"
                        id="newDepratmentId">
                    <option value="0">--请选择维修部门--</option>
                    <c:forEach items="${dList}" var="v" varStatus="vs">
                        <option value="${v.id}">${v.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-6">
                <input type="hidden" name="id" value="10305">
                <button type="submit" class="btn btn-info btn-block">保存</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $(function () {
        $("#userEditFormCompany").ajaxForm(function(data){
            if(data.data<2){
                alert(data.msg);
                location.reload();
            }else{
                alert(data.msg);
            }
        });
        $("#userEditFormDepartment").ajaxForm(function(data){
            if(data.data<2){
                alert(data.msg);
                location.reload();
            }else{
                alert(data.msg);
            }
        });

        // 更改公司
       $(".changecompany").click(function () {
            var phone = $(this).parent().parent().find("td").eq(3).text();
            var imei = $(this).parent().parent().find("td").eq(1).text();
            var company = $(this).parent().parent().find("td").eq(4).text();
           $("#oldCompany").val(company);
           $("#imei").val(imei);
            if (phone == "") {
                 openLayerContent('修改', 600, 400, $(".layer-edit"));
            } else {
                alert("车辆被授权，不能修改企业！")
            }
        });
        // 更改公司
       $(".changemaintenance").click(function () {
           var phone = $(this).parent().parent().find("td").eq(3).text();
           var imei = $(this).parent().parent().find("td").eq(1).text();
           var department = $(this).parent().parent().find("td").eq(5).text();
           $("#oldDepartment").val(department);
           $("#dimei").val(imei);
           openLayerContent('修改', 600, 400, $(".layer-edit1"));
        });

        /*function updatedepartment(imei, company, department) {
          /!*  var obj = $(this).parent().parent().find("td").eq(3).text();*!/
            var phone = $(this).parent().parent().find("td").eq(3).text();
            var imei = $(this).parent().parent().find("td").eq(1).text();
            var department = $(this).parent().parent().find("td").eq(5).text();
            $("#oldDepartment").val(department);
            $("#imei").val(imei);
        /!*    $("#department").val(department);*!/
            if (obj == "") {
                openLayerContent('修改', 600, 400, $(".layer-edit"));
            } else {
                alert("已绑定企业")
            }
        }

        //维修部门
        $(".changemaintenance").click(function () {
//            var obj = $(this).parent().parent().find("td").eq(3).text();
//            if (obj == "") {
            openLayerContent('修改', 600, 400, $(".layer-edit"));
//            } else {
//                alert("已绑定维修企业")
//            }*/
       /* });*/

    });

</script>
</body>
</html>