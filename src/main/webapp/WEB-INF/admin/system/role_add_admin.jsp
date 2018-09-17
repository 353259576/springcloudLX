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
		<input type="hidden" id="groupId" name="groupId" value="${groupId}" />
		<div class="form-group">
			<label class="col-sm-2 control-label">管理员电话号码：</label>
			<div class="col-sm-9">
			    <input type="text" id="phonenum" name="phonenum"  class="form-control" placeholder="管理员电话号码">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-3">
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
	                        message: '管理员电话号码不能为空'
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
		/*	var $form = $(e.target);
			console.log($form);*/
			var groupId = $("#groupId").val();
			var phonenum = $("#phonenum").val();
			console.log(groupId+phonenum);
			$.ajax({
				url: 'admin/system/openaddadmin',
				data: {"groupId":groupId,"phonenum":phonenum},
				success: function(data) {
					if(data==0){
						window.location.href= 'admin/system/adminDetail?groupId='+groupId+'&adminPhone='+phonenum;
					}else {
                        parent.location.reload(this);
					}
				}
			});
		});
	});
</script>
</body>
</html>