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
<link href="static/library/plugins/iCheck/custom.css" rel="stylesheet">
</head>

<body class="gray-bg">

<div class="dataTables_wrapper ibox-content">
	<div class="row">
		<div class="col-sm-12">
			<form action="admin/user/userList.do" method="get" class="form-inline" id="queryForm">
				<input type="hidden" name="mode" value="${mode }">
				<label> 用户名/手机号:<input type="text" name="keywords" value="${keywords }" class="form-control input-sm"></label>
				<label> 注册时间:<input type="text" class="form-control input-sm" id="startDate" name="startDate" placeholder="开始时间" value="${startDate }">
				<input type="text" class="form-control input-sm" id="endDate" name="endDate" placeholder="结束时间" value="${endDate }"> </label>
				<button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
			</form>
		</div>
	</div>
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr role="row">
				<th>选择</th>
				<th>序号</th>
				<th>用户名</th>
				<th>手机号</th>
				<th>注册时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pagination.list }" var="v" varStatus="vs">
				<tr>
					<td>
						<input type="${mode == 1?'radio':'checkbox' }" class="i-checks" name="val" p1="${v.id }" p2="${v.userName }" p3="${v.userPhone }">
					</td>
					<td>${vs.index+1 }</td>
					<td>${v.userName }</td>
					<td>${v.userPhone }</td>
					<td><fmt:formatDate value="${v.userCreateTime }" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
				</tr>	
			</c:forEach>
		</tbody>
	</table>
	<div class="row">
		<div class="col-sm-3">
			<c:if test="${2 eq mode }"><label><input class="i-checks" type="checkbox" id="chooseAll">全选</label></c:if>
			<button class="btn btn-sm btn-info ml10" id="choose">确定选择</button>
			<button class="btn btn-sm btn-warning" id="closeWin">关闭</button>
		</div>
		<div class="col-sm-9">
			<div class="pagination-ul">
				<mytag:Pagination pagination="${pagination}" queryForm="queryForm" />
			</div>
		</div>
	</div>
</div>

<script src="static/library/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.i-checks').iCheck({
	        checkboxClass: 'icheckbox_square-green',
	        radioClass: 'iradio_square-green'
	    });
		datePicker('#startDate,#endDate',"yyyy-mm-dd",2);
		
		var index = parent.layer.getFrameIndex(window.name);
		$("#closeWin").click(function(){
			parent.layer.close(index);
		});
		// 全选-全不选
		$("#chooseAll").on("ifChecked",function() {
			$("input[type=checkbox][name='val']").iCheck("check");
		});
		$("#chooseAll").on("ifUnchecked",function() {
			$("input[type=checkbox][name='val']").iCheck("uncheck");
		});
		
		var mode=${mode};
		$("#choose").click(function(){
			if(mode==1){
				var t=$("input[name='val']:checked");
				if(typeof(t.val())=="undefined"){
					toast(2, "", "请选择用户");
					return;
				}
				var js={"id":t.attr("p1"),"userName":t.attr("p2"),"userPhone":t.attr("p3")};
				parent.dealData(js);
			}
			if(mode==2){
				var result = [];
				$("input[name='val']").each(function(){
					if ($(this).is(":checked")) {
						var js={"id":$(this).attr("p1"),"userName":$(this).attr("p2"),"userPhone":$(this).attr("p3")};
		                result.push(js);
		            }
		        });
                parent.dealData(result);
			}
            parent.layer.close(index);
		});
	});
</script>
</body>
</html>