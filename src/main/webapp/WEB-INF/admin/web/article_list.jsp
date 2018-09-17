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
				<div class="row">
					<div class="col-sm-12">
						<form action="admin/web/articleList.do" method="post" class="form-inline" id="queryForm">
							<label> 标题:<input type="text" name="articleTitle" value="${articleTitle }" class="form-control input-sm"></label>
							<button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
						</form>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr role="row">
							<th>序号</th>
							<th>标题</th>
							<th>创建时间</th>
							<th>更新时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagination.list }" var="v" varStatus="vs">
							<tr>
								<td>${vs.index+1 }</td>
								<td>${v.articleTitle }</td>
								<td><fmt:formatDate value="${v.articleCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
								<td><fmt:formatDate value="${v.articleUpdateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
								<td><i class="fa ${v.isDelete?'fa-times':'fa-check' }"></i></td>
								<td>
									<a class="btn btn-sm btn-circle btn-warning" href="admin/web/articleDetail.do?articleId=${v.id }" title="编辑"
										data-open="modal" data-toggle="tooltip" data-placement="top"><i class="fa fa-info-circle"></i></a>
									<c:choose>
										<c:when test="${v.isDelete }">
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
						<a class="btn btn-sm btn-info" href="admin/web/articleDetail.do" title="新增内容"
							data-open="modal"><i class="fa fa-plus"></i>新增内容</a>
					</div>
					<div class="col-sm-8">
						<div class="pagination-ul">
							<mytag:Pagination pagination="${pagination}" queryForm="queryForm" />
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
            layerConfirm('确定要'+ title +'该内容吗',
                    "admin/web/articleEnable.do", {"articleId":$(this).attr('data-id')});
        });
    });
</script>
</body>
</html>