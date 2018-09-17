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

<body>
<div class="ibox-content">
	<form class="form-horizontal" id="changePwdForm">
		<div class="form-group">
			<label class="col-sm-3 control-label">原密码：</label>
			<div class="col-sm-9">
			    <input type="password" name="oldPwd" class="form-control" placeholder="请输入原密码">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">新密码：</label>
			<div class="col-sm-9">
			    <input type="password" name="newPass" class="form-control" placeholder="请输入新密码">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">重复密码：</label>
			<div class="col-sm-9">
			    <input type="password" name="newPass2" class="form-control" placeholder="请再输入一次密码">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-3">
		        <button type="submit" class="btn btn-warning btn-block">确定</button>
	        </div>
        </div>
	</form>
</div>
</body>
</html>