<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String path = request.getContextPath();
    String port=request.getServerPort()==80?"":":"+request.getServerPort();
    String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title></title>
    <%@ include file="../include.jsp"%>
</head>

<body class="gray-bg">
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <form action="${ctx}//admin/vehicle/vehiclelist.do" method="post" class="form-inline" id="queryForm">
                            <label> 车辆信息:<input type="text" name="anyone" value="${anyone}" class="form-control input-sm"></label>
                            <button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">
                        <th>序号</th>
                        <th>图片</th>
                        <th>厂家名称</th>
                        <th>品牌</th>
                        <th>车系</th>
                        <th>车型</th>
                        <th>销售名称</th>
                        <th>销售版本</th>
                        <th>颜色</th>
                        <th>年款</th>
                        <th>上市年份</th>
                        <th>指导价格</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pagination.list}" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1 }</td>
                            <c:set var="imgurlfrist" value="${fn:substring(v.imgUrl,0 ,fn:indexOf(v.imgUrl,\",\" ) )}"></c:set>
                            <c:choose>
                                <c:when test="${imgurlfrist==null}">
                                    <td>
                                        <img src="${v.imgUrl}" class="img-thumbnail" data-open="img" width="100">
                                    </td>

                                </c:when>
                                <c:otherwise>
                                    <td><img src="${imgurlfrist}" class="img-thumbnail" data-open="img" width="100"></td>
                                </c:otherwise>
                            </c:choose>
                            <td>${v.cjName}</td>
                            <td>${v.brand}</td>
                            <td>${v.chexi}</td>
                            <td>${v.carModel}</td>
                            <td>${v.sellName}</td>
                            <td>${v.sellEdition}</td>
                            <td>${v.colour}</td>
                            <td>${v.carYear}</td>
                            <td>${v.ipoYear}</td>
                            <td>${v.guidePrice}</td>
                            <td>
                                <a class="btn btn-sm btn-circle btn-warning" href="${ctx}/admin/product/insertorupdategroupbuy.do?sysModelId=${v.sysModelId }" title="创建团购"
                                   data-open="modal" data-toggle="tooltip" data-placement="top"><i class="fa fa-paper-plane"></i></a>
                                <a class="btn btn-sm btn-circle btn-warning" href="${ctx}/admin/vehicle/updateOrInsertVehiclePage.do?id=${v.sysModelId }" title="编辑"
                                   data-open="modal" data-toggle="tooltip" data-placement="top"><i class="fa fa-info-circle"></i></a>
                                <a class="btn btn-sm btn-circle btn-danger btn-enable" title="删除" data-id="${v.sysModelId }"
                                   data-toggle="tooltip" data-placement="top"><i class="fa fa-times"></i></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-4 clearfix">
                        <a class="btn btn-sm btn-info" href="${ctx}/admin/vehicle/updateOrInsertVehiclePage.do" title="添加车型"
                           data-open="modal"><i class="fa fa-plus"></i>添加车型</a>
                    </div>
                    <c:if test="${activity == null}">
                    <div class="col-sm-8 clearfix" style="text-align: right;margin-top: -25px">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li onclick="tiaozhuan(1)" ><a>首页</a></li>
                                <c:if test="${pagination.pageNo>1}">
                                    <li onclick="tiaozhuan(${pagination.pageNo-1})"><a>上一页</a></li>
                                </c:if>

                                <c:forEach var="i" begin="1" end="${pagination.totalPage}">
                                    <c:choose>
                                        <c:when test="${pagination.pageNo==i}">
                                            <li class="active"><a>${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li onclick="tiaozhuan(${i})"><a>${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${pagination.pageNo < pagination.totalPage}">
                                    <li onclick="tiaozhuan(${pagination.pageNo+1})"><a>下一页</a></li>
                                </c:if>
                                <li onclick="tiaozhuan(${pagination.totalPage})"><a>末页</a></lion>
                            </ul>
                        </nav>

                    </div>
                    </c:if>
                </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    function tiaozhuan(pagenum) {
        window.location.href = "${ctx}/admin/vehicle/vehiclelist.do?pageNo="+pagenum;
    }
    $(function () {
        $(".btn-enable").click(function () {
            var title = $(this).attr("title") == "" ? $(this).attr("data-original-title") : $(this).attr("title");
            layerConfirm('确定要'+ title +'该活动吗',
                "${ctx}/admin/vehicle/deletevehicle.do", {"id":$(this).attr('data-id')});
        });
    });
</script>
</body>
</html>
