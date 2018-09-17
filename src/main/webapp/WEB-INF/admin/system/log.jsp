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
						<form action="admin/system/logList.do" class="form-inline" method="post" id="queryForm">
							<label>操作人：<input class="form-control input-sm" name="logUser" value="${logUser }"></label>
							<label>操作日期：<input type="text" class="form-control input-sm" id="logCreateTime" name="logCreateTime" placeholder="操作日期" value="${logCreateTime }"></label>
							<button class="btn btn-warning btn-sm" type="submit">搜索</button>
						</form>
					</div>
				</div>
				<div class="alert alert-warning mb5">当前日志记录总数：<b>${logCount }</b>
					<button class="btn btn-warning btn-sm backup" mon="1">备份并删除一个月之前的日志</button>
					<button class="btn btn-warning btn-sm backup" mon="2">备份并删除两个月之前的日志</button>
					<button class="btn btn-warning btn-sm backup" mon="3">备份并删除三个月之前的日志</button>
				</div>
				<div class="alert alert-warning mb5"><i class="fa fa-star"></i>由于日志数据较多，请定期清理旧日志（清理三个月之前的日志）；旧日志请查看导出文件；注意：点击备份后，数据文件将下载到本地。</div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr role="row">
							<th>序号</th>
							<th>操作人</th>
							<th>备注</th>
							<th>参数</th>
							<th>操作日期</th>
							<th>操作IP</th>
						</tr>
					</thead>
					<tbody id="dataList">
						<c:forEach items="${pagination.list }" var="v" varStatus="vs">
							<tr>
								<td>${vs.index+1 }</td>
								<td>${v.logUser }</td>
								<td>${v.logRemark }</td>
								<td>${v.logParams }</td>
								<td><fmt:formatDate value="${v.logCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
								<td>${v.logIp }</td>
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

<script type="text/javascript">
	$(function(){
		datePicker('#logCreateTime',"yyyy-mm-dd",2);
		
		$(".backup").click(function(){
			var mon=$(this).attr("mon");
			var idx=layer.confirm('确定要执行此操作吗？操作不可恢复', {btn: ['确定','取消'],icon:3},function(){
				location.href="admin/system/backupLog.do?monthAgo="+mon;
				layer.close(idx);
			});
		});
	});
</script>
</body>
</html>