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
						<form action="admin/user/userInfoList.do" method="post" class="form-inline" id="queryForm">
							<label> 用户名/手机号:<input type="text" name="keywords" value="${keywords }" class="form-control input-sm"></label>
							<button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
						</form>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr role="row">
							<th>序号</th>
                            <th>用户名</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>是否已婚</th>
                            <th>职业</th>
                            <th>心仪车型</th>
                            <th>教育状况</th>
                            <th>房产</th>
                            <th>信用记录</th>
                            <th>是否有社保</th>
                            <th>是否有公积金</th>
                            <th>收入</th>
                            <th>住址</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagination.list }" var="v" varStatus="vs">
							<tr>
								<td>${vs.index+1 }</td>
								<td>${v.user.userName }</td>
								<td>${v.gender?'男':'女'}</td>
								<td>${v.age }</td>
                                <td>${v.marry?'已婚':'未婚'}</td>
								<td>${v.profession }</td>
								<td>${v.hobby }</td>
								<td>
                                    <c:if test="${v.education == 1}">高中</c:if>
                                    <c:if test="${v.education == 2}">专科</c:if>
                                    <c:if test="${v.education == 3}">本科</c:if>
                                    <c:if test="${v.education == 4}">本科以上</c:if>
                                </td>
                                <td>
                                    <c:if test="${v.house == 1}">无房</c:if>
                                    <c:if test="${v.house == 2}">有房全款</c:if>
                                    <c:if test="${v.house == 3}">有房按揭</c:if>
                                    <c:if test="${v.house == 4}">租房</c:if>
                                </td>
                                <td>
                                    <c:if test="${v.house == 1}">信用良好</c:if>
                                    <c:if test="${v.house == 2}">少数逾期</c:if>
                                    <c:if test="${v.house == 3}">多次逾期</c:if>
                                    <c:if test="${v.house == 4}">无信用记录</c:if>
                                </td>
								<td>${v.social?'有':'无'}</td>
								<td>${v.fund?'有':'无'}</td>
                                <td>
                                    <c:if test="${v.income == 1}">20000以上</c:if>
                                    <c:if test="${v.income == 2}">12000-20000元</c:if>
                                    <c:if test="${v.income == 3}">8000-12000元</c:if>
                                    <c:if test="${v.income == 4}">5000-8000元</c:if>
                                    <c:if test="${v.income == 5}">3000-5000元</c:if>
                                    <c:if test="${v.income == 6}">3000元以下</c:if>
                                </td>
                                <td>${v.userAddr}</td>
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