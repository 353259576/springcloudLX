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
				<span class="note">最多<span class="span-color" id="limit"> ${limit } </span> 个文件，每个文件最多<span class="span-color"> ${size } </span>MB</span>
			</div>
		</form>
	</div>
</div>

<div class="btn-con">
	<button type="button" class="btn" onclick="add()">确定</button>
</div>

<script type="text/javascript" src="static/library/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="static/library/plugins/dropzone/dropzone.js"></script>
<script type="text/javascript" src="static/library/plugins/layer/layer.js"></script>
<script type="text/javascript">
	var index = parent.layer.getFrameIndex(window.name);
	
	var limit = ${limit};
	var size = ${size };
	var id = '${id}';
	var accept = ".jpg,.jpeg,.png,.gif,.bmp";

	Dropzone.options.uploads= {
		url : "uploadImage.do",
		paramName : "file",
		maxFiles : limit,
		maxFilesize : size,
		addRemoveLinks : true,
		acceptedFiles : accept,
		init : function() {
			this.on("success", function(data) {
				var ret = data.xhr.responseText;
				$("#dropzone").append("<input type='hidden' name='files' data-file=" + data.name + " value=" + ret + ">");
			});
			this.on("removedfile", function(data) {
				if(typeof(data.xhr)!="undefined"){
					var ret = data.xhr.responseText;
					// 根据返回文件名删除
					$("input[name='files'][value=" + ret + "]").remove();
				}
            });
		}
	};
	
	function add() {
		var strArr = new Array();
		var imgHTML = "";
        var files = $("input[name='files']");
        files.each(function() {
            strArr.push($(this).val());
	         imgHTML += '<a class="img-area"><img src="' + $(this).val() + '" /><span onclick="uploadDel(this,\'' + id + '\')">x</span></a>';
		});
		if(strArr.length > 0) {
            // 图片地址
            var pv = parent.$("#"+id).val();
            if(pv == "") {
                parent.$("#"+id).val(strArr.join(','));
            }else{
                var pvArr = pv.split(",");
                var t = pvArr.concat(strArr);
                parent.$("#"+id).val(t.join(','));
            }
            // 图片预览
            var pt = parent.$("[img-area-id='"+id+"']").find(".img-area").last();
            if(pt.html() == undefined){
                parent.$("[img-area-id='"+id+"'] .img-area-btn").before(imgHTML);
            }else{
                pt.after(imgHTML);
            }
			parent.layer.msg('上传成功',{offset: 30, icon:1});
		}
		parent.layer.close(index);
	}
	
	function closeWin() {
		parent.layer.close(index);
	}
	
</script>
</body>
</html>