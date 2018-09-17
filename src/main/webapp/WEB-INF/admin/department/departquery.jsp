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
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>维修企业</title>
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
                        <form action="/department/departquery.do" method="post" class="form-inline"
                              id="queryForm">
                            <label> 用户名/公司名称:
                                <select class="form-control input-sm" name="departmentId"
                                        id="departmentId">
                                    <option value="0">--请选择维修企业--</option>
                                    <c:forEach items="${list }" var="v" varStatus="vs">
                                        <option
                                            value="${v.id}" ${departmentId == v.id?'selected':''} > ${v.name}</option>
                                    </c:forEach>
                                </select></label>
                            <label> 创建时间:
                                <input type="text" class="form-control input-sm" id="startDate"
                                       name="startDate" placeholder="开始时间" value="${startDate}">
                                <input type="text" class="form-control input-sm" id="endDate"
                                       name="endDate" placeholder="结束时间" value="${endDate}">
                            </label>
                            <button type="submit" class="btn btn-sm btn-info"><i
                                class="fa fa-search"></i></button>
                            <label><input type="button" class="btn btn-sm btn-danger"
                                          onclick="formReset()" value="重置"></label>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">
                        <th>序号</th>
                        <th>商家账号</th>
                        <th>注册日期</th>
                        <th>开始日期</th>
                        <th>结束日期</th>
                        <th>所属区域</th>
                        <th>详细地址</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${p.list }" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1 }</td>
                            <td>${v.name}</td>
                            <td><fmt:formatDate value="${v.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                            <td><fmt:formatDate value="${v.startTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                            <td><fmt:formatDate value="${v.endTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                            <td>${v.area}</td>
                            <td>${v.address}</td>
                            <td>${v.status}</td>
                            <td><div class="col-sm-4">
                                <a class="btn btn-sm btn-info" title="修改企业" data-open="modal"
                                   href="/department/departAdd.do?id=${v.id}" data-width="800px" data-height="500px">修改</a>
                            </div>
                                <div class="col-sm-4">
                                    <a class="btn btn-sm btn-enable" title="删除" data-id="${v.id}">删除</a>

                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-4">
                        <a class="btn btn-sm btn-info" title="新增维修企业" data-open="modal"
                           href="/department/departAdd.do" data-width="800px" data-height="500px"><i
                            class="fa fa-plus"></i>新增企业</a>

                    </div>
                    <div class="row">
                        <div class="col-sm-4">

                        </div>
                        <div class="col-sm-8">
                            <div class="pagination-ul">
                                <mytag:Pagination pagination="${p}" queryForm="queryForm" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $(".btn-enable").click(function () {
            var title = $(this).attr("title") == "" ? $(this).attr("data-original-title") : $(
                this).attr("title");
            layerConfirm('确定要' + title + '该企业吗',
                "department/deletedepartment.do", {"departmentId": $(this).attr('data-id')});
        });
    });

    function formReset() {
        document.getElementById("queryForm").reset()
    }
</script>
</body>
</html>