<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<% String path = request.getContextPath();
String port=request.getServerPort()==80?"":":"+request.getServerPort();
String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"/>
<meta charset="utf-8"/>
<%@ include file="include/head.jsp" %>
<title>首页</title>
</head>

<body>
<%@ include file="include/top.jsp" %>

<div class="container text-center">
	<h1>欢迎，这是首页。</h1>
	<p>
		<a class="btn btn-danger" href="admin/login.do">后台管理系统</a>
</a>
	</p>
</div>

<%@ include file="include/footer.jsp" %>
</body>
</html>