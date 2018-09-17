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

<div class="ibox-content">
	<form id="configForm">
        <table class="table table-bordered" style="width: 50%;">
            <thead><tr><th>配置项</th><th>值</th></tr></thead>
            <tbody>
            <tr><td>可贷金额比例%</td><td>
                <div class="form-group mb0"><input type="text" class="form-control" name="per1" value="${config.per1 }" /></div>
            </td></tr>
            <tr><td>砍价比例%</td><td>
                <div class="form-group mb0"><input type="text" class="form-control" name="per2" value="${config.per2 }" /></div>
            </td></tr>
            </tbody>
        </table>
        <div class="text-center w50"><button type="submit" class="btn btn-info">全部保存</button></div>
    </form>
</div>

<script type="text/javascript">
	$(function(){
		$("#configForm").bootstrapValidator({
			fields: {
                per1: {
					validators: {
						notEmpty: { 
	                        message: '此项不能为空'
	                    },
	                    regexp: {
		                    regexp: /^[0-9]*[1-9][0-9]*$/,
		                    message: '请输入正整数'
		                }
					}
				},
                per2: {
                    validators: {
                        notEmpty: {
                            message: '此项不能为空'
                        }
                    }
                }
			}
		}).on('success.form.bv', function(e) {
			e.preventDefault();
			var $form = $(e.target);
			Ajax.ajax({
				url: 'admin/web/configEdit.do',
				params: $form.serialize(),
				success: function(data) {
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