<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.ws.system.Constant"%>
<% String path = request.getContextPath();
String port=request.getServerPort()==80?"":":"+request.getServerPort();
String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>
<!DOCTYPE html>
<html>
<head lang="en">
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录</title>
<script type="text/javascript">if (window != top) { parent.location.reload(); }</script>
<%@ include file="include.jsp"%>
<link rel="stylesheet" href="static/library/plugins/camera/camera.css" />
</head>

<body class="gray-bg">
	<div id="templatemo_banner_slide" class="container_wapper">
		<div class="camera_wrap camera_emboss" id="camera_slide">
			<div data-src="static/theme/back/images/login/2.jpg"></div>
			<div data-src="static/theme/back/images/login/3.jpg"></div>
			<div data-src="static/theme/back/images/login/4.jpg"></div>
			<div data-src="static/theme/back/images/login/5.jpg"></div>
		</div>
	</div>
	
<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <h1 class="logo-name"> 平台管理中心 </h1>
        <h5>版本：<%=Constant.SYS_VER %></h5>

        <form style="opacity: .8;" role="form" id="loginForm">
            <div class="form-group input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" placeholder="用户名" name="username">
            </div>
            <div class="form-group input-group">
                <span class="input-group-addon"><i class="fa fa-key"></i></span>
                <input type="password" class="form-control" placeholder="密码" name="password">
            </div>
            <div class="form-group">
                <div class="row">
				    <div class="col-md-7 col-sm-7 col-xs-7">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-bars"></i></span>
                            <input type="text" class="form-control" id="validNum" name="validNum" placeholder="验证码">
                        </div>
				    </div>
				    <div class="col-md-5 col-sm-5 col-xs-5">
				        <img src="getValidCode.do" onclick="changeNum(this)" id="validImg">
				    </div>
				</div>
            </div>
            <button type="submit" class="btn btn-danger block full-width">登 录</button>
            <h5><a href="index.do">网站首页</a></h5>
        </form>
    </div>
</div>
<script src="static/library/jquery/jquery.easing.min.js"></script>
<script src="static/library/plugins/camera/camera.min.js"></script>
<script src="static/library/plugins/camera/templatemo_script.js"></script>
</body>
</html>