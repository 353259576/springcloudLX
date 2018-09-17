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
						<form action="admin/web/feedbackList.do" method="post" class="form-inline" id="queryForm">
							<label> 联系方式:<input type="text" name="concat" value="${concat }" class="form-control input-sm"></label>
							<button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
						</form>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr role="row">
							<th>序号</th>
							<th>用户名</th>
							<th>注册手机号</th>
							<th>问题内容</th>
							<th>联系方式</th>
							<th>图片</th>
							<th>发布时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagination.list }" var="v" varStatus="vs">
							<tr>
								<td>${vs.index+1 }</td>
								<td>${v.user.userName }</td>
								<td>${v.user.userPhone }</td>
                                <td>${v.content}</td>
                                <td>${v.concat}</td>
                                <td><img class="img-circle" data-open="img" src="${v.image }" width="100"></td>
								<td><fmt:formatDate value="${v.createTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row">
                    <div class="col-sm-4">

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

</body>
</html>