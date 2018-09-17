<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.xujunfei.com/tags" prefix="mytag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<% String path = request.getSession().getServletContext().getContextPath();
    String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
    String basePath = request.getScheme() + "://" + request.getServerName() + port + path + "/";%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="/static/theme/common/bootstrap.min.css" rel="stylesheet">
    <link href="/static/theme/common/global.css" rel="stylesheet">
    <link href="/static/theme/back/css/style.min.css" rel="stylesheet">

    <script src="/static/library/jquery/jquery-2.1.1.min.js"></script>
    <script src="/static/library/bootstrap/bootstrap.min.js"></script>
    <script src="/static/library/bootstrap/bootstrapValidator.js"></script>
    <script src="/static/library/plugins/layer/layer.js"></script>
    <script src="/static/library/plugins/toastr/toastr.min.js"></script>
    <script src="/static/library/plugins/pace/pace.min.js"></script>
    <script src="/static/library/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/static/library/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="/static/theme/common/global.js"></script>
    <script src="/static/theme/back/js/main.js"></script>
    <script src="/static/theme/common/global.js"></script>
</head>
<body>
<div class="ibox-content">
    <form class="form-horizontal" id="userEditForm">
        <div class="form-group">
            <label class="col-sm-2 control-label">用户名：</label>
            <div class="col-sm-9">
                <input type="text" name="userName" value="${user.name}" class="form-control" placeholder="用户名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">头像：</label>
            <div class="col-sm-9">
                <input type="hidden" name="headImgUrl" id="headImgUrl" value="${user.headImgUrl}">
                <div img-area-id="userAvatar">
                    <a class="img-area-btn" onclick="uploadImg(1,'headImgUrl')"></a>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">手机号：</label>
            <div class="col-sm-9">
                <input type="text" name="userphone" value="${user.userphone}" class="form-control" placeholder="手机号">
            </div>
        </div>        
        <div class="form-group">
            <label class="col-sm-2 control-label">昵称：</label>
            <div class="col-sm-9">
                <input type="text" name="nickname" value="${user.nickname}" class="form-control" placeholder="手机号">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">账号状态：</label>
            <div class="col-sm-9">
                <div class="radio radio-info radio-inline">
                    <input type="radio" name="delete" id="gender1" value="0" checked>
                    <label for="gender1">正常</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" name="delete" id="gender2" value="1" >
                    <label for="gender2">禁用</label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">其他信息：</label>
            <div class="col-sm-9">
                <p class="form-control-static">注册时间：${user.createTime}</p>
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