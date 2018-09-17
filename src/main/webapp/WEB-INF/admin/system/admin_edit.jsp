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
		<%--<div class="form-group">
			<label class="col-sm-2 control-label">用户组：</label>
			<div class="col-sm-9">
			    <select class="form-control" name="roleId">
			    	<option value="">--请选择--</option>
			    	<c:forEach items="${roles }" var="v">
						<option value="${v.id }" ${adm.role.id == v.id?'selected':'' }>${v.roleName }</option>
					</c:forEach>
			    </select>
			</div>
		</div>--%>
		<c:if test="${groupId!=null}">
			<input type="hidden" id="groupId" name="groupId" value="${groupId}">
		</c:if>
		<div class="form-group">
			<label class="col-sm-2 control-label">用户名：</label>
			<div class="col-sm-9">
			    <input type="text" name="adminName" value="${adm.adminName }" class="form-control" placeholder="用户名">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">真实姓名：</label>
			<div class="col-sm-9">
			    <input type="text" name="adminRealname" value="${adm.adminRealname }" class="form-control" placeholder="真实姓名">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">手机号：</label>
			<div class="col-sm-9">
			    <input type="text" name="adminPhone" value="${adm.adminPhone }" class="form-control" placeholder="手机号">
			</div>
		</div>
        <div class="form-group">
            <label class="col-sm-2 control-label">员工编号：</label>
            <div class="col-sm-9">
                <input type="text" name="adminNum" value="${adm.adminNum }" class="form-control" placeholder="员工编号">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">所属区域：</label>
            <div class="col-sm-9">
                <input type="text" id="city-picker" name="adminAddr" value="${adm.adminAddr }"
                       class="form-control" placeholder="所属区域" readonly data-toggle="city-picker">
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label">登录密码：</label>
			<div class="col-sm-9">
			    <input type="text" name="adminPassword" class="form-control" placeholder="登录密码">
			    <c:if test="${!add }"><span class="help-block">留空表示不修改密码</span></c:if>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-3">
				<input type="hidden" name="id" value="${adm.id }">
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

                adminName: {
					validators: {
	                    notEmpty: {
	                        message: '用户名不能为空'
	                    },
	                    stringLength: {
	                        min: 2,
	                        max: 16,
	                        message: '2-16个字符'
	                    }
	                }
				},
                adminRealname: {
					validators: {
	                    notEmpty: {
	                        message: '真实姓名不能为空'
	                    },
	                    stringLength: {
	                        min: 2,
	                        max: 10,
	                        message: '2-10个字符'
	                    }
	                }
				},
                adminPhone: {
					validators: {
	                    notEmpty: {
	                        message: '手机号不能为空'
	                    },
						regexp: {
		                    regexp: /^1[3|4|5|7|8][0-9]\d{8}$/,
		                    message: '手机号码格式不正确'
		                }
					}
				},
                adminPassword: {
					validators: {
						callback: {
	                        message: '请输入密码',
	                        callback: function(value, validator) {
	                        	var adminId=validator.getFieldElements('adminId').val();
	                        	if(adminId=="" && value==""){
	                        		validator.updateStatus('adminPassword', 'INVALID');
	                        		return false;
	                        	}
	                        	validator.updateStatus('adminPassword', 'VALID');
	                        	return true;
	                        }
	                    }
					}
				},
                adminNum: {
                    validators: {
                        notEmpty: {
                            message: '员工编号不能为空'
                        }
                    }
                }
			}
		}).on('success.form.bv', function(e) {
			e.preventDefault();
			var $form = $(e.target);
			Ajax.ajax({
				url: 'admin/system/adminEdit',
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