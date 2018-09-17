
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String path = request.getContextPath();
String port=request.getServerPort()==80?"":":"+request.getServerPort();
String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="shortcut icon" href="static/theme/default/images/favicon.ico" />
<link href="../static/theme/common/bootstrap.min.css" rel="stylesheet">
<link href="../static/theme/common/global.css" rel="stylesheet">
<link href="../static/theme/back/css/style.min.css" rel="stylesheet">
<script src="../static/library/jquery/jquery-2.1.1.min.js"></script>
<script src="../static/library/bootstrap/bootstrap.min.js"></script>
<script src="../static/library/bootstrap/bootstrapValidator.js"></script>
<script src="../static/library/plugins/layer/layer.js"></script>
<script src="../static/library/plugins/toastr/toastr.min.js"></script>
<script src="../static/library/plugins/pace/pace.min.js"></script>
<script src="../static/library/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../static/library/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../static/theme/common/global.js"></script>
<script src="../static/theme/back/js/main.js"></script>
<script src="../static/theme/common/global.js"></script>
</head>
<body>
<div class="ibox-content">
    <form class="form-horizontal" id="userEditForm">
	     <div class="form-group">
            <label class="col-sm-2 control-label">单车id：</label>
            <div class="col-sm-9">
                <input type="text" name="userid" value="1" class="form-control" placeholder="单车id">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">用户名：</label>
            <div class="col-sm-9">
                <input type="text" name="userName" value="Ary气宇非凡" class="form-control" placeholder="用户名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">手机号：</label>
            <div class="col-sm-9">
                <input type="text" name="userPhone" value="18949816048" class="form-control" placeholder="手机号">
            </div>
        </div>        
        <div class="form-group">
            <label class="col-sm-2 control-label">所属企业：</label>
            <div class="col-sm-9">
                <input type="text" name="userComputer" class="form-control" value="安徽去扑网络科技有限公司" placeholder="所属公司">
            </div>
        </div>
		<div class="form-group">
            <label class="col-sm-2 control-label">所属维修企业：</label>
            <div class="col-sm-9">
                <input type="text" name="wxComputer" class="form-control" value="安徽去扑网络科技有限公司" placeholder="所属公司">
            </div>
        </div>
		<div class="form-group">
            <label class="col-sm-2 control-label">状态：</label>
            <div class="col-sm-9">
                <input type="text" name="wxComputer" class="form-control" value="维修中" placeholder="维修中">
            </div>
        </div>
		<div class="form-group">
            <label class="col-sm-2 control-label">位置:</label>
            <div class="col-sm-2">
                <div  class="form-control" style="text-align:center;">点击查找</div>
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
                    <input type="radio" name="isDelete" id="gender1" value="0" checked>
                    <label for="gender1">正常</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" name="isDelete" id="gender2" value="1" >
                    <label for="gender2">禁用</label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">其他信息：</label>
            <div class="col-sm-9">
                <p class="form-control-static">注册时间：2017-10-24 18:34:59</p>
                <p class="form-control-static">最近登陆时间：</p>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-3">
                <input type="hidden" name="id" value="10305">
                <button type="submit" class="btn btn-info btn-block">保存</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(function(){
        datePicker("#userBirthday","yyyy-mm-dd",2);
        // cityPicker("#city-picker");

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