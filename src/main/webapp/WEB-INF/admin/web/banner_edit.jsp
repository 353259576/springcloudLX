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
	<form class="form-horizontal" method="post" id="bannerEditForm">
		<div class="form-group">
			<label class="col-sm-2 control-label">标题：</label>
			<div class="col-sm-9">
			    <input type="text" name="bannerTitle" value="${banner.bannerTitle }" class="form-control" placeholder="标题">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">图片：</label>
			<div class="col-sm-9">
                <input type="hidden" name="bannerImage" id="bannerImage" value="${banner.bannerImage}">
                <div img-area-id="bannerImage">
                    <c:if test="${!add}">
                        <a class="img-area"><img src="${banner.bannerImage}"><span onclick="uploadDel(this,'bannerImage')">x</span></a>
                    </c:if>
                    <a class="img-area-btn" onclick="uploadImg(1,'bannerImage')"></a>
                </div>
            </div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">地址：</label>
			<div class="col-sm-9">
			    <input type="text" name="bannerUrl" value="${banner.bannerUrl }" class="form-control" placeholder="地址">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">排序：</label>
			<div class="col-sm-9">
			    <input type="text" name="bannerSort" value="${banner.bannerSort }" class="form-control" placeholder="排序">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">其他信息：</label>
			<div class="col-sm-9">
				<p class="form-control-static">创建时间：<fmt:formatDate value="${banner.bannerCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
				<p class="form-control-static">更新时间：<fmt:formatDate value="${banner.bannerUpdateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
				<p class="form-control-static">更新人：${banner.bannerUpdateAdmin }</p>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-3">
				<input type="hidden" name="id" value="${banner.id }">
		        <button type="submit" class="btn btn-info btn-block">保存</button>
	        </div>
        </div>
	</form>
</div>

<script type="text/javascript">
	$(function(){
		$("#bannerEditForm").bootstrapValidator({
			fields: {
                bannerTitle: {
					validators: {
	                    notEmpty: { 
	                        message: '标题不能为空'
	                    },
	                    stringLength:{
	                        max : 64,
	                        message : '最多64个字符'
	                    }
					}
				},
                bannerUrl: {
					validators: {
						notEmpty: { 
		                    message: '地址不能为空'
		                }
	                }
				},
                bannerSort: {
					validators: {
						regexp: {
		                    regexp: /^(0|[1-9][0-9]*)$/,
		                    message: '请输入正整数'
		                }
	                }
				}
			}
		}).on('success.form.bv', function(e) {
			e.preventDefault();
			if($("#bannerImage").val()==""){
				toast(2, "", "请上传图片");
				$("button[type=submit]").removeAttr("disabled");
				return;
			}
			var $form = $(e.target);
			Ajax.ajax({
				url: 'admin/web/bannerEdit.do',
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