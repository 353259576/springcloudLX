<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr role="row">
							<th>序号</th>
							<th>标题</th>
							<th>图片</th>
							<th>访问地址</th>
							<th>创建时间</th>
							<th>更新时间</th>
							<th>排序<i class="fa fa-question-circle" title="序号越小排名越靠前" data-toggle="tooltip" data-placement="bottom"></i></th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${banners }" var="v" varStatus="vs">
							<tr>
								<td>${vs.index+1 }</td>
								<td>${v.bannerTitle }</td>
								<td><img src="${v.bannerImage }" class="img-thumbnail" width="100"></td>
                                <td><a>${v.bannerUrl }</a></td>
								<td><fmt:formatDate value="${v.bannerCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
								<td><fmt:formatDate value="${v.bannerUpdateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
								<td>${v.bannerSort }</td>
								<td>
									<a class="btn btn-sm btn-circle btn-warning" href="admin/web/bannerDetail.do?bannerId=${v.id }" title="编辑"
										data-open="modal" data-toggle="tooltip" data-placement="top"><i class="fa fa-info-circle"></i></a>
									<c:choose>
										<c:when test="${isDelete }">
											<a class="btn btn-sm btn-circle btn-warning btn-enable" title="恢复" data-id="${v.id }"
												data-toggle="tooltip" data-placement="top"><i class="fa fa-check"></i></a>
										</c:when>
										<c:otherwise>
											<a class="btn btn-sm btn-circle btn-danger btn-enable" title="删除" data-id="${v.id }"
												data-toggle="tooltip" data-placement="top"><i class="fa fa-times"></i></a>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>	
						</c:forEach>
					</tbody>
				</table>
				<div class="row">
					<div class="col-sm-4">
						<a class="btn btn-sm btn-info" href="admin/web/bannerDetail.do" title="新增轮播图"
							data-open="modal"><i class="fa fa-plus"></i>新增轮播图</a>
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
            layerConfirm('确定要'+ title +'该轮播图吗',
                    "admin/web/bannerEnable.do", {"bannerId":$(this).attr('data-id')});
        });
    });
</script>
</body>
</html>