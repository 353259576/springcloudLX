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
    <script src="/static/library/jquery/jquery-1.11.2.min.js"></script>
    <script src="/static/library/bootstrap/bootstrap.min.js"></script>
    <script src="/static/library/bootstrap/bootstrapValidator.js"></script>
    <script src="/static/library/plugins/layer/layer.js"></script>
    <script src="/static/library/plugins/toastr/toastr.min.js"></script>
    <script src="/static/library/plugins/pace/pace.min.js"></script>
    <script src="/static/library/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/static/library/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=X9ahaCzL5BHiZyTea8FMrxH4strOjYmI"></script>
    <script src="/static/theme/common/global.js"></script>
    <script src="/static/theme/back/js/main.js"></script>
    <script src="/static/theme/common/global.js"></script>
    <style>
        #allmap {
            width: 100%;
            height: 100%;
        }
    </style>
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
                            <label> 单车ID:<input type="text" name="vehicleimei" id="vehicleimei" value="${imei}"
                                                class="form-control input-sm"></label>
                            <label> 用户/手机号:<input type="text" name="vehiclephone" id="vehiclephone" value="${phone}"
                                                  class="form-control input-sm"></label>
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
                            <%--<label> 所属维修部门:
                                <select class="form-control input-sm" name="vehicledepartmentId" id="vehicledepartmentId">
                                    <option value="0">--请选择维修部门--</option>
                                    <c:forEach items="${dList}" var="v" varStatus="vs">
                                        <option value="${v.id}">${v.name}</option>
                                    </c:forEach>
                                </select>
                            </label>--%>
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
                        <th>所属维修部门</th>
                        <th>状态</th>
                        <th>位置</th>
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
                            <td>${v.status}</td>
                            <td>
                                <a class="btn btn-sm btn-circle btn-warning"
                                   onclick="address(${v.lon},${v.lat})">
                                    <c:if test="${v.lon!=null && v.lat!=null && v.lat!='' && v.lat!=''}">
                                        <i class="fa fa-map-marker"></i></c:if>
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
<div class="layer-win layer-edit" style="width:100%; height:100%;">
    <div id="allmap"></div>
</div>
<script type="text/javascript">
    $(function () {
        datePicker('#startDate,#endDate', "yyyy-mm-dd", 2);
    });

    function address(longitude, latitude) {
        console.log(longitude)
        openLayerContent('当前位置', 700, 500, $(".layer-edit"));
        // 百度地图API功能
        var map = new BMap.Map("allmap");
        var point = new BMap.Point(longitude, latitude);
        var myIcon = new BMap.Icon("../static/theme/images/icon_che.png", new BMap.Size(82, 87));
        var marker = new BMap.Marker(point, {icon: myIcon});  // 创建标注
        map.addOverlay(marker);              // 将标注添加到地图中
        map.centerAndZoom(point, 13);
    }
</script>
</body>
</html>