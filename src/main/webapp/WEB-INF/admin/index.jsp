<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.ws.system.Constant"%>
<% String path = request.getContextPath();
String port=request.getServerPort()==80?"":":"+request.getServerPort();
String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<title>后台管理中心</title>
<%@ include file="include.jsp"%>
</head>

<body class="fixed-sidebar full-height-layout gray-bg">
	<div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="nav-close">
			<i class="fa fa-times-circle"></i>
		</div>
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">
				<li class="nav-header">
					<div class="profile-element">
						<span><img alt="image" class="img-circle img-thumbnail" src="static/theme/back/images/avatar.png" width="60px" /></span>
						<a> 
							<span class="clear"> <span class="block m-t-xs">
								<strong class="font-bold">你好 ${admin.adminName }</strong></span>
								<span class="text-muted text-xs block">${admin.role.roleName }</span>
							</span>
						</a>
					</div>
					<div class="logo-element">Admin</div>
				</li>
				
				<c:forEach items="${modules }" var="module">
					<c:if test="${module.modFlag == 1 }">
						<li class="animated fadeInLeft">
							<a> <i class="${module.modIcon } f14"></i> <span class="nav-label">${module.modName }</span></a>
							<ul class="nav nav-second-level">
								<c:set value="${module.id }" var="parent"></c:set>
								<c:forEach items="${modules }" var="module">
									<c:if test="${module.modFlag ==2 && module.parentId == parent }">
										<li class="animated fadeInDown">
											<a class="J_menuItem" href="${module.modPath}${module.modParam}"><i class="${module.modIcon }"></i>${module.modName }</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</li>
					</c:if>
				</c:forEach>
				
			</ul>
		</div>
		</nav>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top mb0" role="navigation">
					<div class="navbar-header">
						<a class="minimalize-styl-2 btn btn-info navbar-minimalize" title="收起菜单" data-toggle="tooltip" data-placement="bottom">
							<i class="fa fa-bars"></i></a>
						<a class="minimalize-styl-2 btn btn-info" id="goBack" title="返回上一级" data-toggle="tooltip" data-placement="bottom">
							<i class="fa fa-arrow-left"></i></a>
						<%-- <a class="navbar-chat minimalize-styl-2 btn btn-warning" title="即时通讯" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-comments"></i></a> --%>
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<!-- dropdown1 -->
						<%--<li class="dropdown">
							<a class="dropdown-toggle count-info" data-toggle="dropdown" title="系统通知">
                                <i class="fa fa-envelope fa-lg"></i> <span class="badge badge-info">${unread }</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                            	<c:forEach items="${msgs }" var="v">
	                                <li class="m-t-xs">
	                                    <div class="dropdown-messages-box">
	                                        <a class="pull-left">
	                                            <img alt="image" class="img-circle" src="static/theme/back/images/user.png">
	                                        </a>
	                                        <div class="media-body">
	                                            <strong>${v.adminMsgFrom }</strong> ${fn:substring(v.adminMsgContent,0,30)}
	                                            <br>
	                                            <small class="text-muted"><fmt:formatDate value="${v.adminMsgCreateTime }" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></small>
	                                        </div>
	                                    </div>
	                                </li>
	                                <li class="divider"></li>
                                </c:forEach>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="admin/msgList.do">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
						</li>--%>
						<!-- dropdown2 -->
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" title="更新日志">
                                <i class="fa fa-cloud-upload fa-lg"></i>
                            </a>
                            <div class="dropdown-menu m-t-xs">
                            	<div class="float-e-margins">
				                    <div class="ibox-title">
				                        <h5>更新日志<small>&nbsp;当前版本:<%=Constant.SYS_VER %></small></h5>
				                    </div>
				                    <div class="ibox-content no-padding">
				                        <div class="panel-body" id="version">
				                            <div class="panel-group">
				                            	<%=Constant.UPGRADE %>
				                            </div>
			                            </div>
		                            </div>
			                    </div>
                            </div>
						</li>
						<!-- dropdown3 -->
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" title="设置">
                                <i class="fa fa-cogs fa-lg"></i>
                            </a>
                            <ul class="dropdown-menu m-t-xs">
								<li><a href="javascript:;" id="changePwd"><i class="fa fa-lock"></i>修改密码</a></li>
								<li><a href="javascript:;" class="logout"><i class="fa fa-sign-out"></i>安全退出</a></li>
								<li><a href="/"><i class="fa fa-home"></i>网站首页</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft" title="上一个选项卡">
					<i class="fa fa-backward"></i>
				</button>
				<!-- tabs -->
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:;" class="active J_menuTab" data-id="admin/home">
							控制台<i class="b-re fa fa-repeat"></i>
						</a>
					</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight" title="下一个选项卡">
					<i class="fa fa-forward"></i>
				</button>
				<button class="roll-nav roll-right J_tabClose dropdown-toggle" data-toggle="dropdown">
					关闭操作<span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right mr60">
					<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
					<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
				</ul>
				<a href="javascript:;" class="roll-nav roll-right J_tabExit logout"><i class="fa fa-sign-out"></i> 退出</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%" data-id="admin/home" src="admin/home" frameborder="0" seamless> </iframe>
			</div>
		</div>
	</div>

<script type="text/javascript">
$(function(){
	$("#changePwd").click(function(){
		openLayerFrame('修改密码', "400px", "380px", "admin/pwd", false);
	});
	
	$(".logout").click(function(){
		layer.confirm('确定退出吗', { btn: ['确定','取消'], icon: 3},function(){
			jumpUrl("admin/logout");
		});
	});
});
</script>
</body>
</html>