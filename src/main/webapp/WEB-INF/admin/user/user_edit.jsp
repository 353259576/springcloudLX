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
	<form class="form-horizontal" id="userEditForm">
		<div class="form-group">
			<label class="col-sm-2 control-label">用户名：</label>
			<div class="col-sm-9">
			    <input type="text" name="userName" value="${user.userName }" class="form-control" placeholder="用户名">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">头像：</label>
			<div class="col-sm-9">
                <input type="hidden" name="userAvatar" id="userAvatar" value="${user.userAvatar}">
                <div img-area-id="userAvatar">
                    <c:if test="${not empty user.userAvatar}">
                        <a class="img-area"><img src="${user.userAvatar}"><span onclick="uploadDel(this,'userAvatar')">x</span></a>
                    </c:if>
                    <a class="img-area-btn" onclick="uploadImg(1,'userAvatar')"></a>
                </div>
            </div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">手机号：</label>
			<div class="col-sm-9">
			    <input type="text" name="userPhone" value="${user.userPhone }" class="form-control" placeholder="手机号">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">登录密码：</label>
			<div class="col-sm-9">
			    <input type="text" name="userPassword" class="form-control" placeholder="登录密码">
			    <span class="help-block">留空表示不修改密码</span>
			</div>
		</div>
        <div class="form-group">
            <label class="col-sm-2 control-label">账号：</label>
            <div class="col-sm-9">
                <div class="radio radio-info radio-inline">
                    <input type="radio" name="isDelete" id="gender1" value="0" ${user.isDelete?'':'checked' }>
                    <label for="gender1">正常</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" name="isDelete" id="gender2" value="1" ${user.isDelete?'checked':'' }>
                    <label for="gender2">禁用</label>
                </div>
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label">其他信息：</label>
			<div class="col-sm-9">
				<p class="form-control-static">注册时间：<fmt:formatDate value="${user.userCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
				<p class="form-control-static">最近登陆时间：<fmt:formatDate value="${user.userLoginTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-3">
				<input type="hidden" name="id" value="${user.id }">
		        <button type="submit" class="btn btn-info btn-block">保存</button>
	        </div>
        </div>
	</form>
</div>

<script type="text/javascript">
	$(function(){
		datePicker("#userBirthday","yyyy-mm-dd",2);
        cityPicker("#city-picker");

		$("#userEditForm").bootstrapValidator({
			excluded: [':disabled'],
			fields: {
                userName: {
					validators: {
	                    notEmpty: {
	                        message: '用户名不能为空'
	                    },
	                    stringLength: {
	                        min: 2,
	                        max: 16,
	                        message: '用户名为2-16个字符'
	                    }
	                }
				},
                userPhone: {
					validators: {
	                    regexp: {
		                    regexp: /^1[3|4|5|7|8][0-9]\d{8}$/,
		                    message: '手机号码格式不正确'
		                }
					}
				},
                userPassword: {
					validators: {
	                    stringLength: {
	                        min: 6,
	                        max: 16,
	                        message: '密码长度为6-16个字符'
	                    }
					}
				}
			}
		}).on('success.form.bv', function(e) {
			e.preventDefault();
			var $form = $(e.target);
			Ajax.ajax({
				url: 'admin/user/userEdit.do',
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