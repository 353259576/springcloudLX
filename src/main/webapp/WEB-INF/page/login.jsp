<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<% String path = request.getContextPath();
    String port=request.getServerPort()==80?"":":"+request.getServerPort();
    String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <base href="<%=basePath%>"/>
    <link href="/static/theme/qp/css/index.css" rel="stylesheet" type="text/css" />
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <script src="/static/theme/qp/js/jquery-1.9.1.min.js"></script>
    <title>登录去扑购</title>
</head>

<body>
	<div class="wap">
		<div class="hide">
	       <h2>登录</h2>
	       <%--<a href="#"><img src="/static/theme/qp/img/dll_03.png"/></a>--%>
        </div>
        <div class="xxk">
        	<ul>
        		<%--<li class="bottm">账号密码登录</li>--%>
        		<li>快捷免密登录</li>
        	</ul>
        </div>
        <div class="xxk_conter">
        	<%--<div class="xxk_conter_left xxk_conter_right">
        		<div class="con_zm">
        			<input type="text" placeholder="请输入账号"/>
        		</div>
        		<div class="con_zm">
        			<input type="text" placeholder="请输入密码"/>
        		</div>
        		<button>登录</button>
        		<a href="#" style="text-align: right;">忘记密码？</a>
        	</div>--%>
            <input type="hidden" id="redirect" value="${redirectURL}">
        	<div class="xxk_conter_right">
        		<div class="con_zm">
        			<input type="text" id="phone" placeholder="请输入手机号码"/>
        		</div>
        		<div class="con_zm_01">
        			<input type="text" id="sms" placeholder="请输入验证码"/>
        			<input style="font-size:12px; background-color: #3bc16a; color: #ffffff; border-radius: 20px; width: 30%; float: right;" type="button" id="btnSms" value="获取验证码" />
        		</div>
        		<button type="button" id="login">登录</button>
        		<%--<a href="#">登录即同意《用户注册》协议</a>--%>
        	</div>
        </div>
	</div>
	<script>
		$(".xxk_conter_right").hide().first().show();
            $(document).ready(function () {
            $(".xxk ul li").click(function () {
                $(".xxk_conter_right").hide().eq($(this).index()).show();
            });
        });
        $(".xxk ul li").each(function (index) {
            $(this).click(function () {
                $(".xxk ul li").removeClass("bottm");
                $(".xxk ul li").eq(index).addClass("bottm");
            });
        });

		$("#login").click(function () {
		    if($("#phone").val() == ""){
		        alert("手机号不能为空");
		        return;
            }
            $.ajax({
                type : "post",
                url : "dologin.do",
                data : {phone:$("#phone").val(),sms:$("#sms").val()},
                dataType : "json",
                success : function(data) {
                    if(data.code==0){
                        alert("登录成功");
                        location.href=$("#redirect").val();
                    }else{
                        alert(data.msg);
                    }
                }
            });
        });
        $("#btnSms").click(function () {
            if($("#phone").val() == ""){
                alert("手机号不能为空");
                return;
            }
            $.ajax({
                type : "post",
                url : "sms.do",
                data : {phone:$("#phone").val()},
                dataType : "json",
                success : function(data) {
                    if(data.code==0){
                        $("#btnSms").attr("disabled",true);
                        $("#btnSms").css("backgroundColor","#969c98");
                        alert("发送成功");
                    }else{
                        alert(data.msg);
                    }
                }
            });
        });
	</script>
</body>
</html>