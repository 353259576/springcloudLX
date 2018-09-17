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
<link type="text/css" href="static/library/plugins/dropzone/dropzone.css" rel="stylesheet" />
</head>

<body>
<div class="drop-main">
	<div id="dropzone">
		<form class="dropzone dz-clickable" id="uploads" method="post" enctype="multipart/form-data">
			<div class="dz-message">
				拖拽文件到此可以上传或者直接点击蓝色虚线框处<br> 
				<span class="note">最多<span class="span-color" id="limit"> 1 </span> 个文件，每个文件最多<span class="span-color"> ${size } </span>MB</span>
			</div>
		</form>
	</div>
</div>

<div class="btn-con">
	<button type="button" class="btn" onclick="add()">确定</button>
	<%--<button type="button" class="btn btn-close" onclick="closeWin()">关闭</button>--%>
</div>

<script type="text/javascript" src="static/library/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="static/library/plugins/dropzone/dropzone.js"></script>
<script type="text/javascript" src="static/library/plugins/layer/layer.js"></script>
<script type="text/javascript">
	var index = parent.layer.getFrameIndex(window.name);
	
	var size=${size };
	var id='${id}';
	var accept=".rar,.zip,.apk";
	
	Dropzone.options.uploads = {
		url : "admin/uploadAppFile.do",
		paramName : "file",
		maxFiles : 1,
		maxFilesize : size,
		addRemoveLinks : true,
		acceptedFiles : accept,
		init : function() {
			this.on("success", function(data) {
				var ret = data.xhr.responseText;
				$("#dropzone").append("<input type='hidden' name='files' data-file=" + data.name + " value=" + ret + ">");
			});
		}
	};
	
	function add(){
		var val = $("input[name='files']").val();
		if(val != ""){
			parent.$("#"+id).val(val);
			parent.layer.msg('已成功上传',{offset: 30, icon:1});
		}
		parent.layer.close(index);
	}
	
	function closeWin(){
		parent.layer.close(index);
	}
	
</script>
</body>
</html>