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
						<form action="admin/system/adminList" method="post" class="form-inline" id="queryForm">
							<label> 用户名/姓名/员工编号:<input type="text" name="keywords" value="${keywords }" class="form-control input-sm"></label>
							<button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
						</form>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr role="row">
							<th>序号</th>
							<th>用户名</th>
							<th>所属组</th>
							<th>真实姓名</th>
							<th>手机号</th>
							<th>员工编号</th>
							<th>所属区域</th>
							<th>注册时间</th>
							<th>上次登录时间</th>
							<th>上次登录IP</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagination.list }" var="v" varStatus="vs">
							<tr>
								<td>${vs.index+1 }</td>
								<td>${v.adminName }</td>
								<td>${v.role.isDelete?'<s>':''} ${v.role.roleName } ${v.role.isDelete?'</s>':''}</td>
								<td>${v.adminRealname }</td>
								<td>${v.adminPhone }</td>
								<td>${v.adminNum }</td>
								<td>${v.adminAddr }</td>
								<td><fmt:formatDate value="${v.adminCreateTime }" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
								<td><fmt:formatDate value="${v.adminLoginTime }" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
								<td>${v.adminLoginIp }</td>
								<td><i class="fa ${v.isDelete?'fa-times':'fa-check' }"></i></td>
								<td>
									<c:choose>
										<c:when test="${v.adminFlag == 1 }">
											<a class="btn btn-sm btn-circle btn-warning" title="编辑" href="admin/system/adminDetail?adminId=${v.id }"
												data-open="modal" data-width="800px" data-height="500px" data-toggle="tooltip" data-placement="top"><i class="fa fa-pencil-square"></i></a>
											<c:choose>
												<c:when test="${v.isDelete }">
													<a class="btn btn-sm btn-circle btn-warning btn-enable" title="启用" data-id="${v.id }"
														data-toggle="tooltip" data-placement="top"><i class="fa fa-check"></i></a>
												</c:when>
												<c:otherwise>
													<a class="btn btn-sm btn-circle btn-danger btn-enable" title="禁用" data-id="${v.id }"
														data-toggle="tooltip" data-placement="top"><i class="fa fa-times"></i></a>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<a class="btn btn-sm btn-circle btn-warning" disabled="disabled" title="不可编辑"
												data-toggle="tooltip" data-placement="top"><i class="fa fa-pencil-square"></i></a>
										</c:otherwise>								
									</c:choose>
								</td>
							</tr>	
						</c:forEach>
					</tbody>
				</table>
				<div class="row">
					<div class="col-sm-4">
						<a class="btn btn-sm btn-info" title="新增管理员" data-open="modal" 
							href="admin/system/adminDetail"><i class="fa fa-plus"></i>新增管理员</a>
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
            layerConfirm('确定要'+ title +'该管理员吗',
                    "admin/system/adminEnable", {"adminId":$(this).attr('data-id')});
        });
    });
</script>
</body>
</html>