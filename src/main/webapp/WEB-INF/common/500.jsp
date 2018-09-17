<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath();
String port=request.getServerPort()==80?"":":"+request.getServerPort();
String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<title>500</title>
<link rel="shortcut icon" href="static/theme/default/images/icos.ico" />
<link rel="stylesheet" href="static/theme/default/css/404.css" />
</head>

<body onload="cycleTimer();">
	<div class=bg>
		<div class=cont>
			<div class=c1>
				<img class=img1 src="static/theme/default/images/404/01.png">
			</div>
			<h2>Sorry…服务器内部错误</h2>
			<DIV class=c2>
				<a class=re href="/">返回首页</a>
				<a class=home href="/"><span id="timecount" style="color: red">5</span>秒自动跳转</a>
			</div>
			<div class=c3>
				<a class=c3 href="/">【】</a>提醒您 - 您可能输入了错误的网址，或者该网页已删除或移动
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	var timer=5;
	function cycleTimer() {
		if (timer == 0) {
			location.href = '/';
		} else {
			document.getElementById("timecount").innerHTML = timer;
			setTimeout(function() {
				cycleTimer(timer--);
			}, 1000);
		}
	}
	</script>
</body>
</html>