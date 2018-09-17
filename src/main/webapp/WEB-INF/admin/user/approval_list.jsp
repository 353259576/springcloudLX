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
						<form action="admin/user/approvalList.do" method="post" class="form-inline" id="queryForm">
							<label> 用户名/邮箱/手机号:<input type="text" name="keywords" value="${keywords }" class="form-control input-sm"></label>
							<label> 身份证号码:<input type="text" name="apprIdcard" value="${apprIdcard }" class="form-control input-sm"></label>
							<label> 申请状态:<select class="form-control input-sm" name="apprState">
									<option value="" ${empty apprState?'selected':'' }>全部</option>
									<option value="0" ${0 eq apprState?'selected':'' }>申请中</option>
									<option value="1" ${1 eq apprState?'selected':'' }>申请成功</option>
									<option value="2" ${2 eq apprState?'selected':'' }>申请失败</option>
								</select>
							</label>
							<button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
						</form>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr role="row">
							<th>序号</th>
							<th>用户名</th>
							<th>手机号</th>
							<th>驾驶证号</th>
							<th>行驶证号</th>
							<th>驾驶证</th>
							<th>行驶证</th>
							<th>申请信息</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagination.list }" var="v" varStatus="vs">
							<tr>
								<td>${vs.index+1 }</td>
								<td><a title="${v.user.userName }" href="admin/user/userDetail.do?userId=${v.user.id }" data-open="modal">${v.user.userName }</a></td>
								<td>${v.user.userPhone }</td>
								<td>${v.apprDriverLicenseId }</td>
								<td>${v.apprXingLicenseId }</td>
								<td><img data-open="img" src="${v.apprDriverLicense }" width="150" height="70" /></td>
								<td><img data-open="img" src="${v.apprXingLicense }" width="150" height="70" /></td>
								<td>
									<fmt:formatDate value="${v.apprCreateTime }" pattern="yyyy-MM-dd HH:mm:ss" var="ct"></fmt:formatDate>
									<fmt:formatDate value="${v.apprUpdateTime }" pattern="yyyy-MM-dd HH:mm:ss" var="ut"></fmt:formatDate>
									<fmt:formatDate value="${v.apprHandleTime }" pattern="yyyy-MM-dd HH:mm:ss" var="ht"></fmt:formatDate>
									<a title="申请时间：${ct }<br>重新提交时间：${ut }<br>处理时间：${ht }<br>处理人：${v.apprHandler }<br>备注：${v.apprRemark }"
										 data-toggle="tooltip" data-placement="bottom" data-html="true">
									<i class="fa fa-search"></i>查看</a>
								</td>
								<td>
									<c:if test="${v.apprState == 0 }"><i class="fa fa-hourglass-start"></i>申请中</c:if>
									<c:if test="${v.apprState == 1 }"><i class="fa fa-check"></i>申请成功</c:if>
									<c:if test="${v.apprState == 2 }"><i class="fa fa-times"></i>申请失败</c:if>
								</td>
								<td>
									<c:if test="${v.apprState == 0 }">
										<a class="btn btn-sm btn-circle btn-danger" title="审核" onclick="audit('${v.id }')"
                                           data-toggle="tooltip" data-placement="top"><i class="fa fa-legal"></i></a>
									</c:if>
								</td>
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

<div class="layer-win layer-edit">
	<form class="form-horizontal" id="apprForm">
		<div class="form-group" >
			<label class="col-sm-3 control-label">驾驶证号码：</label>
			<div class="col-sm-9">
				<input type="text"   name="apprDriverLicenseId" id="apprDriverLicenseId" rows="4" class="form-control" placeholder="驾驶证号码"/>
			</div>
		</div>
		<div class="form-group" >
			<label class="col-sm-3 control-label">行驶证号码：</label>
			<div class="col-sm-9">
				<input type="text"   name="apprXingLicenseId" id="apprXingLicenseId" rows="4" class="form-control" placeholder="行驶证号码"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">选项：</label>
			<div class="col-sm-9">
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="r1" value="1" name="state">
                    <label for="r1">通过</label>
                </div>
			</div>
			<div class="col-sm-9">
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="r2" value="2" name="state">
                    <label for="r2">否决</label>
                </div>
			</div>
		</div>
		<div class="form-group" id="comment">
			<label class="col-sm-3 control-label">备注：</label>
			<div class="col-sm-9">
			    <textarea name="remark" id="remark" rows="4" class="form-control" placeholder="备注"></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-6">
				<input type="hidden" id="userId" name="userId">
		        <button type="button" class="btn btn-primary" id="btn-save">确定</button>
	        </div>
        </div>
	</form>
</div>

<script type="text/javascript">
	function audit(id){
		$("#userId").val(id);
		openLayerContent('实名认证审核', 15000, 300, $(".layer-edit"));
	}
	
	$(function(){
		$("#btn-save").click(function(){
			Ajax.ajax({
				url:"admin/user/auditApproval.do",
				params:$("#apprForm").serialize(),
				success:function(data){
					if(data.code==0) {
						showMsg(data.msg,1,function(){location.reload();});
					} else {showMsg(data.msg,2);}
				}
			});
		});
	});
</script>
</body>
</html>