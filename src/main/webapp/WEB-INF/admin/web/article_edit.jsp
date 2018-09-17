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
	<form class="form-horizontal" method="post" id="articleEditForm">
		<div class="form-group">
			<label class="col-sm-2 control-label">标题：</label>
			<div class="col-sm-9">
			    <input type="text" name="articleTitle" value="${article.articleTitle }" class="form-control" placeholder="标题">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">内容：</label>
			<div class="col-sm-9">
			    <textarea name="articleContent" style="width: 100%;height: 600px;">${article.articleContent }</textarea>
			    <div class="word-count">字数统计：<span id="wc"></span></div>
			</div>
		</div>
		<c:if test="${!add }">
			<div class="form-group">
				<label class="col-sm-2 control-label">其他信息：</label>
				<div class="col-sm-9">
					<p class="form-control-static">创建时间：<fmt:formatDate value="${article.articleCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
					<p class="form-control-static">更新时间：<fmt:formatDate value="${article.articleUpdateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
					<p class="form-control-static">更新人：${article.articleUpdateAdmin }</p>
				</div>
			</div>
		</c:if>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-3">
				<input type="hidden" name="id" value="${article.id }">
		        <button type="submit" class="btn btn-info btn-block">保存</button>
	        </div>
        </div>
	</form>
</div>

<script src="static/library/plugins/kindeditor/kindeditor-min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#articleEditForm").bootstrapValidator({
			fields: {
                articleTitle: {
					validators: {
	                    notEmpty: { 
	                        message: '标题不能为空'
	                    },
	                    stringLength:{
	                        max : 64,
	                        message : '最多64个字符'
	                    }
					}
				}
			}
		}).on('success.form.bv', function(e) {
			e.preventDefault();
			var $form = $(e.target);
			Ajax.ajax({
				url: 'admin/web/articleEdit.do',
				params: $form.serialize(),
				success: function(data) {
					if(data.code==0) {
						showMsg(data.msg,1,function(){parent.location.reload();});
					} else {showMsg(data.msg,2);}
				}
			});
		});
		
		var editor;
	    KindEditor.ready(function(K) {
		    editor = K.create('textarea[name="articleContent"]', {
		        resizeType : 1,
		        allowPreviewEmoticons : false,
		        allowImageUpload : true,
		        uploadJson : '<%=basePath%>uploadwithKE.do',
		        afterBlur: function(){this.sync();},
		        afterChange : function() {
		              K('#wc').html(this.count('text'));
		        }
		    });
	    });
	});
</script>
</body>
</html>