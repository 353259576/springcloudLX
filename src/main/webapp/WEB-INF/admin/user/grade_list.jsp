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
							<th>会员等级名称</th>
							<th>最低达标分数</th>
							<th>可砍价次数</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${grades }" var="v" varStatus="vs">
							<tr>
								<td>${vs.index+1 }</td>
								<td>${v.gname }</td>
								<td>${v.gvalue }</td>
								<td>${v.kcount }</td>
								<td>
									<a class="btn btn-sm btn-circle btn-warning" title="编辑" href="admin/user/gradeEditPage.do?gid=${v.id }"
                                       data-open="modal" data-width="400px" data-height="300px"
										data-toggle="tooltip" data-placement="top"><i class="fa fa-pencil-square"></i></a>
								</td>
							</tr>	
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

</body>
</html>