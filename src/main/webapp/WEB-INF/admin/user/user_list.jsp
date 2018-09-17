<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
                        <form action="../../../admin/user/userList.do" method="post"
                              class="form-inline"
                              id="queryForm">
                            <label> 用户名/手机号:<input type="text" name="userphone" value=""
                                                   class="form-control input-sm"></label>
                            <label> 注册时间:<input type="text" class="form-control input-sm"
                                                id="startDate" name="startDate" placeholder="开始时间"
                                                value="">
                                <input type="text" class="form-control input-sm" id="endDate"
                                       name="endDate" placeholder="结束时间" value=""> </label>
                            <button type="submit" class="btn btn-sm btn-info"><i
                                class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">
                        <th>序号</th>
                        <th>用户名</th>
                        <th>昵称</th>
                        <th>手机号</th>
                        <th>头像</th>
                        <th>注册时间</th>
                        <th>身份证</th>
                        <th>新浪关注</th>
                        <th>QQ关注</th>
                        <th>微信关注</th>
                        <th>状态</th>
                        <!--<th>操作</th>-->
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${pagination.list }" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1 }</td>
                            <td>${v.name }</td>
                            <td>${v.nickname }</td>
                            <td>${v.userphone }</td>
                            <td><img src="${v.headImgUrl }" style="width:80px; height:80px;"></td>
                            <td><fmt:formatDate value="${v.createTime}"
                                                pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td>${v.idCode }</td>
                            <td>
                                <c:if test="${not empty  v.sinaId }">已关注</c:if>
                                <c:if test="${ empty v.sinaId  }">未关注</c:if>
                            </td>
                            <td>
                                <c:if test="${not empty v.qqId }">已关注</c:if>
                                <c:if test="${empty v.qqId  }">未关注</c:if>
                            </td>
                            <td>
                                <c:if test="${not empty v.wxId }">已关注</c:if>
                                <c:if test="${empty v.wxId }">未关注</c:if>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${v.delete==false}">正常</c:when>
                                    <c:when test="${v.delete==true}">禁用</c:when>
                                </c:choose>
                            </td>
                           <!-- <td><a class="btn btn-sm btn-circle btn-warning" title=""
                                   href="../../../admin/user/userdetail.do?id=${v.id}&name=${v.name}&delete=${v.delete}&userphone=${v.userphone}&headImgUrl=${v.headImgUrl}&nickname=${v.nickname}&createTime=${v.createTime}&sianId=${v.sinaId}&qqId=${v.qqId}&wxId=${v.wxId}"
                                   data-open="modal"
                                   data-toggle="tooltip"
                                   data-placement="top" data-original-title="详情"><i
                                class="fa fa-info-circle"></i></a>
                                <a class="btn btn-sm btn-circle btn-danger btn-enable" title=""
                                   data-id="10305" data-toggle="tooltip" data-placement="top"
                                   data-original-title="禁用"><i class="fa fa-times"></i></a>
                            </td>-->
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
<script type="text/javascript">
    $(function () {
        datePicker('#startDate,#endDate', "yyyy-mm-dd", 2);
        $(".btn-enable").click(function () {
            var title = $(this).attr("title") == "" ? $(this).attr("data-original-title") : $(
                this).attr("title");
            layerConfirm('确定要' + title + '该用户吗',
                // "admin/user/userEnable.do",
                {"userId": $(this).attr('data-id')});
        });
    });
</script>
</body>
</html>