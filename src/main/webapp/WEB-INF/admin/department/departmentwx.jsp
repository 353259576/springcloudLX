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
    <meta charset="utf-8">
    <title>维修订单管理</title>
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
</head>
<body class="gray-bg">
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <form action="/bangdepartment/wx.do" method="post" class="form-inline"
                              id="queryForm">
                            <label> 单车编号:<input type="text" name="erweimaId" value="${erweimaId}"
                                                class="form-control input-sm"></label>
                            <label> 单车企业:
                                <select class="form-control input-sm" name="department.id"
                                        id="departmentId">
                                    <option value="0">--请选择维修企业--</option>
                                    <c:forEach items="${department}" var="v" varStatus="vs">
                                        <option value="${v.id}">${v.name}</option>
                                    </c:forEach>
                                </select>
                            </label>
                            <button type="submit" class="btn btn-sm btn-info"><i
                                class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <div class="col-sm-4 ibox-content" style="border:none">
                    <a class="btn btn-sm btn-info" title="批量操作" onclick="batch()"><i
                        class="fa  fa-check-square-o"></i>批量操作</a>
                </div>
                <table class="table table-striped table-bordered" id="ta">
                    <thead>
                    <tr role="row">
                        <th><input type="checkbox" name="checkedAll" id="checkedAll" value="0"/>全选
                        </th>
                        <th>序号</th>
                        <th>单车id</th>
                        <th>所属企业</th>
                        <th>所属维修部门</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${p.list }" var="v" varStatus="vs">
                        <tr>
                            <td><input type="checkbox" name="checkbox_td" value="${v.imei}"/>
                                <input type="hidden" name="companyid" value="${v.company.id}"/>
                                <input type="hidden" name="departmentid"
                                       value="${v.department.id}"/></td>
                            <td>${vs.index+1 }</td>
                            <td>${v.erweimaId}</td>
                            <td>${v.company.name}</td>
                            <td>${v.department.name}</td>
                            <td><a class="btn btn-sm btn-circle btn-info" title=""
                                   onclick="repair(${v.imei})"><i
                                class="fa fa-info-circle"></i></a></td>
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
                <div class="layer-win layer-edit">
                    <form class="form-horizontal" id="apprForm">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">维修公司：</label>
                            <div class="col-sm-8">
                                <select class="form-control input-sm" name="repair" id="repair">
                                    <c:forEach items="${department }" var="v" varStatus="vs">
                                        <option value="${v.id}">${v.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </form>
                    <div class="form-group car-button">
                        <div class="col-sm-6 col-sm-offset-3 ">
                            <button type="button" class="btn btn-primary" id="btn-car-button"
                                    style="display:block; margin:30px auto;">确定
                            </button>
                        </div>
                    </div>
                </div>
                <div class="layer-win layer-edit1">
                    <form class="form-horizontal" id="wxFrom">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">维修公司：</label>
                            <div class="col-sm-8">
                                <select class="form-control input-sm" name="repair1" id="repair1">
                                    <c:forEach items="${department}" var="v" varStatus="vs">
                                        <option value="${v.id}">${v.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <input type="hidden" id="imei" name="imei"/>
                        </div>
                    </form>
                    <div class="form-group car-button">
                        <div class="col-sm-6 col-sm-offset-3 ">
                            <button type="button" class="btn btn-primary" id="btn-car-button1"
                                    style="display:block; margin:30px auto;">确定
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        datePicker('#startDate,#endDate', "yyyy-mm-dd", 2);
    });
    $(function () {
        $("#checkedAll").click(function () {
            if ($(this).is(":checked")) { // 全选
                $("input[name='checkbox_td']").each(function () {
                    $(this).prop("checked", true);
                });
            } else { // 取消全选
                $("input[name='checkbox_td']").each(function () {
                    $(this).prop("checked", false);
                });
            }
        });
        //批量替换
        $("#btn-car-button").click(function () {
            var str = "";
            $("input[name='checkbox_td']:checked").each(function () {
                str += $(this).val() + ",";
            })
            $.ajax({
                url: '../../../bangdepartment/updateBatch.do',
                data: {
                    "list": str.substr(0, str.length - 1),
                    "departmentId": $("#repair").val()
                },
                success: function (data) {
                    console.log(data);
                    location.reload();
                },
                error: function () {
                }
            });
        });
        //单一替换
        $("#btn-car-button1").click(function () {
            var list = $("#imei").val();;
            $.ajax({
                url: '../../../bangdepartment/updateBatch.do',
                data: {
                    "list": list,
                    "departmentId": $("#repair1").val()
                },
                success: function (data) {
                    console.log(data);
                    location.reload();
                },
                error: function () {
                }
            });
        });
    })
        function batch() {
            if ($('input[type=checkbox]:checked').is(':checked')) {
                openLayerContent('设置维修公司', 500, 400, $(".layer-edit"))
            } else {
                alert("选择操作序号")
            }
        }

        function repair(imeis) {
            $("#imei").val(imeis);
            openLayerContent('设置维修公司', 500, 400, $(".layer-edit1"));

        }

</script>
</body>
</html>
