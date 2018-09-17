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
    <title>用车订单</title>
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
        function opendepartment(id) {
            layer.open({
                type: 2,
                title: '网点页',
                shadeClose: true,
                shade: 0.8,
                area: ['80%', '80%'],
                content: 'admin/company/selectdepartment?companyId='+id //iframe的url
            });
        }

        function openExcel(departmentId) {
            layer.open({
                type: 2,
                title: 'excel查看',
                shadeClose: true,
                shade: 0.8,
                area: ['90%', '90%'],
                content: 'admin/company/selectexcel?departmentId='+departmentId //iframe的url
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
                        <form action="/admin/company/selectcompany" method="post" class="form-inline" id="queryForm">
                            <label> 公司名称:<input type="text" name="companyName" value="" class="form-control input-sm"></label>
                            <button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <c:if test="${pagination != null&&pagination.getList()!= null&&pagination.getList().size() != 0}">
                    <tr role="row">
                        <th>序号</th>
                        <th>商家名称</th>
                        <th>所属网点</th>
                        <th>联系方式</th>
                        <th>银行卡</th>
                        <th>提现账期</th>
                        <th>提现手续费率</th>
                        <th>所属区域</th>
                        <th>地址</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </c:if>
                    </thead>
                    <tbody>
                    <c:forEach items="${pagination.list}" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1}</td>
                            <td>${v.name}</td>
                            <td><a onclick="opendepartment(${v.id})">查看</a></td>
                            <td>${v.phone}</td>
                            <td>${v.companyBrand}</td>
                            <td>${v.zhangqi}</td>
                            <td>${v.shouxufei}</td>
                            <td>${v.area}</td>
                            <td>${v.address}</td>
                            <td>${v.status}</td>
                            <td>
                                <a class="btn btn-sm btn-info" title="修改企业" data-open="modal"
                                   href="/admin/company/opendatecompany?id=${v.id}" data-width="800px" data-height="500px"><i class="fa fa-plus"></i>修改企业</a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${pagination1 != null&&pagination1.getList()!= null&&pagination1.getList().size() != 0}">
                        <tr role="row">
                            <th>序号</th>
                            <th>网点名称</th>
                            <th>所属商家</th>
                            <th>联系方式</th>
                            <th>EXCEL</th>
                            <th>所属区域</th>
                            <th>地址</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                    </c:if>

                    <c:forEach items="${pagination1.list}" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1}</td>
                            <td>${v.name}</td>
                            <td>${v.company.name}</td>
                            <td>${v.phone}</td>
                            <td><a onclick="openExcel(${v.id})">打开</a> </td>
                            <td>${v.area}</td>
                            <td>${v.address}</td>
                            <td>${v.status}</td>
                            <td>
                                <a class="btn btn-sm btn-info" title="修改网点" data-open="modal"
                                   href="/admin/company/opendatedepartment?comapnyId=${v.company.id}&id=${v.id}" data-width="800px" data-height="500px"><i class="fa fa-plus"></i>修改网点</a>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-4">
                        <a class="btn btn-sm btn-info" title="新增企业" data-open="modal"
                           href="/admin/company/opendatecompany" data-width="800px" data-height="500px"><i class="fa fa-plus"></i>新增企业</a>
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
<script type="text/javascript">
    $(function () {
        $(".btn-enable").click(function () {
            var title = $(this).attr("title") == "" ? $(this).attr("data-original-title") : $(this).attr("title");
            layerConfirm('确定要'+ title +'吗',
                "backcompany/deletecompany.do", {"adminId":$(this).attr('data-id')});
        });
    });
</script>
</body>
</html>
