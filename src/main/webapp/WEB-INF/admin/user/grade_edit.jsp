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
	<form class="form-horizontal" id="gradeEditForm">
		<div class="form-group">
			<label class="col-sm-3 control-label">名称：</label>
			<div class="col-sm-9">
			    <input type="text" name="gname" value="${grade.gname }" class="form-control" placeholder="名称">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">达标分数：</label>
			<div class="col-sm-9">
			    <input type="text" name="gvalue" value="${grade.gvalue }" class="form-control" placeholder="达标分数">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">可砍价次数：</label>
			<div class="col-sm-9">
			    <input type="text" name="kcount" value="${grade.kcount }" class="form-control" placeholder="可砍价次数">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-3">
				<input type="hidden" name="id" value="${grade.id }">
		        <button type="submit" class="btn btn-info btn-block">保存</button>
	        </div>
        </div>
	</form>
</div>

<script type="text/javascript">
	$(function(){
		$("#gradeEditForm").bootstrapValidator({
			fields: {
                kcount: {
					validators: {
						notEmpty: { 
	                        message: '此项不能为空'
	                    },
	                    regexp: {
                            regexp: /^(0|[1-9][0-9]*)$/,
                            message: '请输入正整数'
		                }
					}
				},
                gvalue: {
					validators: {
						notEmpty: { 
	                        message: '此项不能为空'
	                    },
	                    regexp: {
		                    regexp: /^(0|[1-9][0-9]*)$/,
		                    message: '请输入正整数'
		                }
	                }
				},
                gname: {
					validators: {
	                    notEmpty: {
	                        message: '此项不能为空'
	                    },
	                    stringLength: {
	                        min: 2,
	                        max: 10,
	                        message: '2-10个字符'
	                    }
	                }
				}
			}
		}).on('success.form.bv', function(e) {
			e.preventDefault();
			var $form = $(e.target);
			Ajax.ajax({
				url: 'admin/user/gradeEdit.do',
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