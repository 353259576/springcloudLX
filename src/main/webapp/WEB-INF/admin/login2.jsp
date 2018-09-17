<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.ws.system.Constant"%>
<% String path = request.getContextPath();
String port=request.getServerPort()==80?"":":"+request.getServerPort();
String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>

<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>登录</title>
    <%@ include file="include.jsp"%>
    <script>
        if (window != window.top) top.location.href = self.location.href;
    </script>
    <link href="static/plugins/layui/css/layui.css" rel="stylesheet" />
    <link href="static/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="static/build/css/login.css" rel="stylesheet" />
    <link href="static/plugins/sideshow/css/normalize.css" rel="stylesheet" />
    <link href="static/plugins/sideshow/css/demo.css" rel="stylesheet" />
    <link href="static/plugins/sideshow/css/component.css" rel="stylesheet" />
    <!--[if IE]>
    <script src="static/plugins/sideshow/js/html5.js"></script>
    <![endif]-->
    <style>
        canvas {
            position: absolute;
            z-index: -1;
        }

        .kit-login-box header h1 {
            line-height: normal;
        }

        .kit-login-box header {
            height: auto;
        }

        .content {
            position: relative;
        }

        .codrops-demos {
            position: absolute;
            bottom: 0;
            left: 40%;
            z-index: 10;
        }

        .codrops-demos a {
            border: 2px solid rgba(242, 242, 242, 0.41);
            color: rgba(255, 255, 255, 0.51);
        }

        .kit-pull-right button,
        .kit-login-main .layui-form-item input {
            background-color: transparent;
            color: white;
        }

        .kit-login-main .layui-form-item input::-webkit-input-placeholder {
            color: white;
        }

        .kit-login-main .layui-form-item input:-moz-placeholder {
            color: white;
        }

        .kit-login-main .layui-form-item input::-moz-placeholder {
            color: white;
        }

        .kit-login-main .layui-form-item input:-ms-input-placeholder {
            color: white;
        }

        .kit-pull-right button:hover {
            border-color: #009688;
            color: #009688
        }
		.container{width:100% !important; padding:0 !important}
		.kit-pull-right{margin-right:100px !important}
    </style>

</head>


<body class="kit-login-bg">
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header" style="position: absolute; width: 100%; height: 980px; _height: 100%;">
            <canvas id="demo-canvas"></canvas>
            <div class="kit-login-box">
                <header>
                    <h1>运营商管理平台管理</h1>
                </header>
                <div class="kit-login-main">
                    <form  class="layui-form" method="post">
                        <div class="layui-form-item">
                            <label class="kit-login-icon">
                                <i class="layui-icon">&#xe612;</i>
                            </label>
                            <input type="text" name="username" lay-verify="required" autocomplete="off" placeholder="这里输入用户名." class="layui-input">
                        </div>
                        <div class="layui-form-item">
                            <label class="kit-login-icon">
                                <i class="layui-icon">&#xe642;</i>
                            </label>
                            <input type="password" name="password" lay-verify="required" autocomplete="off" placeholder="这里输入密码." class="layui-input">
                        </div>
                        <div class="layui-form-item">
                            <label class="kit-login-icon">
                                <i class="layui-icon">&#xe642;</i>
                            </label>
                            <input type="text" class="layui-input" id="validNum" name="validNum" lay-verify="required|number" autocomplete="off" placeholder="验证码">
                            <span class="form-code" id="changeCode" style="position:absolute;right:2px; top:2px;">
                                <img src="getValidCode.do" onclick="changeNum(this)" id="validImg" style="cursor:pointer;" title="点击刷新"/>
                            </span>
                        </div>
                        <div class="layui-form-item">
                            <div class="kit-pull-left kit-login-remember">
                                <input type="checkbox" name="rememberMe" value="true" lay-skin="primary" checked title="记住帐号?">
                            </div>
                            <div class="kit-pull-right">
                                <button type="button" class="layui-btn layui-btn-primary" onclick="submitform()" lay-submit lay-filter="login">
                                    <i class="fa fa-sign-in" aria-hidden="true" ></i> 登录
                                </button>
                            </div>
                            <div class="kit-clear"></div>
                        </div>
                    </form>
                </div>
                <footer>
                    <p>copyright © <a href="javascript:;" style="color:white; font-size:18px;" target="_blank">安徽猎手网络科技有限公司</a></p>
                </footer>
            </div>
        </div>
    </div>
</div>
<!-- /container -->

<script src="static/plugins/layui/layui.js"></script>
<script src="static/plugins/sideshow/js/TweenLite.min.js"></script>
<script src="static/plugins/sideshow/js/EasePack.min.js"></script>
<script src="static/plugins/sideshow/js/rAF.js"></script>
<script src="static/plugins/sideshow/js/demo-1.js"></script>
<script>
   /* layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;

        /!*$('#changeCode').on('click', function() {
            $('#changeCode > img')[0].src = './build/images/GetVerfiyCode.png';
        });*!/

        //清理左侧菜单缓存
        var index = layer.load(2, {
            shade: [0.3, '#333']
        });
        $(window).on('load', function() {
            layer.close(index);
            form.on('submit(login)', function(data) {
                var loadIndex = layer.load(2, {
                    shade: [0.3, '#333']
                });
                $.ajax({
                    type:"post",
                    url:"/admin/dologin.do",
                    data:form,
                    async:true,
                    success:function (data) {
                        if(data.code==0){
                            window.location.href = '/admin/index.do';
                        }else {
                            layer.msg(data.msg);
                        }

                    }
                });


                // $.post(data.form.action, data.field, function(res) {
                //     if (!res.rel) {
                //         layer.msg(res.msg, {
                //             icon: 2
                //         });
                //         loadIndex && layer.close(loadIndex);
                //         $('#changeCode').click(); //刷新验证码
                //     } else {
                //         setTimeout(function() {
                //             location.href = '/'
                //         }, 1500);
                //     }
                // }, 'json');
                return false;
            });
        }());

    });*/
</script>
    <script>
        function submitform() {
            alert(123)
            var form = $(".layui-form").serialize();
            $.ajax({
                type:"post",
                url:"/admin/dologin",
                data:form,
                async:true,
                success:function (data) {
                    if(data.code==0){
                        window.location.href = '/admin/index';
                    }else {
                        layer.msg(data.msg);
                    }

                }
            });

        }
    </script>
</body>

</html>
