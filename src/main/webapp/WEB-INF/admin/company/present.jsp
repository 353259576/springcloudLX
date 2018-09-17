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
    <title>运营商家提现</title>
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
                        <form action="/admin/present/select" method="post" class="form-inline"
                              id="queryForm">
                            <label> 商家:
                                <select class="form-control input-sm" name="companyId" id="companyId">
                                    <c:if test="${bool==true}">
                                        <option value="0">全部</option>
                                    </c:if>
                                    <c:forEach var="k" items="${company}">
                                        <option value="${k.id}"  <c:if test="${k.id==companyId}">selected</c:if>>${k.name}</option>
                                    </c:forEach>
                                </select>
                            </label>


                            <label> 状态:
                                <select class="form-control input-sm" name="status" id="status">
                                    <option value="0">全部</option>
                                    <option value="1" <c:if test="${'1' eq status}">selected</c:if>>未退</option>
                                    <option value="2" <c:if test="${'2' eq status}">selected</c:if>>已退</option>
                                </select>
                            </label>
                            <button type="submit" class="btn btn-sm btn-info"><i
                                class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered" id="ta">
                    <thead>
                    <tr role="row">
                        <th>序号</th>
                        <th>退款ID</th>
                        <th>商家名称</th>
                        <th>提现金额</th>
                        <th>提现手续费</th>
                        <th>提现实际金额</th>
                        <th>提现时间</th>
                        <th>提现完成时间</th>
                        <th>提现状态</th>
                        <c:if test="${bool==true}">
                            <th>操作</th>
                        </c:if>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pagination.list }" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1 }</td>
                            <td>${v.id}</td>
                            <td>${v.companyid.name}</td>
                            <td>${v.price}</td>
                            <td>${v.shouxufei}</td>
                            <td>${v.realPrice}</td>
                            <td><fmt:formatDate value="${v.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${v.agreesTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>
                                <c:if test="${v.status==true}">已提现</c:if>
                                <c:if test="${v.status==false}">待提现</c:if>
                            </td>
                           <c:if test="${bool==true}">

                               <td>
                                   <c:if test="${v.status==false}">
                                   <div class="col-sm-4">
                                       <a class="btn btn-sm btn-enable" title="确认提现" data-id="${v.id}">确认提现</a>
                                   </div>
                               </c:if>
                               </td>

                           </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-4">

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
<script type="text/javascript">
    $(function () {
        $(".btn-enable").click(function () {
            var title = $(this).attr("title") == "" ? $(this).attr("data-original-title") : $(this).attr("title");
            layerConfirm('确定要'+ title +'吗',
                "admin/present/update", {"id":$(this).attr('data-id')});
        });
    });
</script>
</html>
