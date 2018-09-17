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
	<form class="form-horizontal" id="adminEditForm">
		<div class="form-group">
			<label class="col-sm-2 control-label">组名：</label>
			<div class="col-sm-9">
			    <input type="text" name="groupName" value="${group.groupName }" class="form-control" placeholder="用户名">
			</div>
		</div>
			<c:if test="${fatherGroup!=null}">
				<c:if test="${fatherGroup.overall==true}">
					<div class="form-group">
						<label class="col-sm-2 control-label">是否为全局管理组：</label>
						<div class="col-sm-9">
							<select name="overall">
								<option value="0">非全局</option>
								<option value="1">全局</option>
							</select>
						</div>
					</div>
				</c:if>
			</c:if>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-3">
				<c:if test="${group!=null}">
					<input type="hidden" name="id" value="${group.groupId }">
				</c:if>
                <c:if test="${fatherGroupId!=null}">
                    <input type="hidden" name="fatherGroupId" value="${fatherGroupId}">
                </c:if>

		        <button type="submit" class="btn btn-info btn-block">确定</button>
	        </div>
        </div>
	</form>
</div>

<script type="text/javascript">
	$(function(){
        cityPicker("#city-picker");

		$("#adminEditForm").bootstrapValidator({
			fields: {
                groupName: {
					validators: {
	                    notEmpty: {
	                        message: '组名不能为空'
	                    },
	                    stringLength: {
	                        min: 2,
	                        max: 16,
	                        message: '2-16个字符'
	                    }
	                }
				}
			}
		}).on('success.form.bv', function(e) {
			e.preventDefault();
			var $form = $(e.target);
			Ajax.ajax({
				url: 'admin/system/openinsertgroup',
				params: $form.serialize(),
				success: function(data) {
					if(data.code==0) {
						showMsg(data.msg,1,function(){parent.location.reload();});
					} else {showMsg(data.msg,2);}
				}
			});
		});
	});
</script>
</body>
</html>