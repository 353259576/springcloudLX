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
    <style type="text/css">
        .dataList li{display: inline-block;margin: 10px;padding: 10px;float: left;width: 100px;border: solid 1px #ffffff;}
        .dataList li:hover{background: #eff3f9;border-color: #bcccde;}
        .ft{width: 80px;height: 84px;}
        .fn{color: #595c5f;height: 23px;line-height: 23px;overflow: hidden;text-align: center;text-overflow: ellipsis;}
        .folder{background: url("static/theme/back/images/file/folder.png") no-repeat;}
        .picture{background: url("static/theme/back/images/file/picture.png") no-repeat;}
        .text{background: url("static/theme/back/images/file/text.png") no-repeat;}
        .video{background: url("static/theme/back/images/file/video.png") no-repeat;}
        .rar{background: url("static/theme/back/images/file/rar.png") no-repeat;}
        .unknow{background: url("static/theme/back/images/file/unknow.png") no-repeat;}
    </style>
</head>

<body class="gray-bg">

<div class="wrapper-content">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>文件管理</h5>
            <a href="createImage/images.do">增加二维码</a>
        </div>
        <div class="alert alert-warning mb0">
            <i class="fa fa-exclamation-circle"></i>二维码为压缩文件，每个压缩文件含有十张二维码，文件名为文件所包含的二维码的第一张的名称，双击下载。
        </div>
        <div class="ibox-content">
            <div class="row">
                <!-- <div id="tree"></div> -->
                <ol class="breadcrumb">
                </ol>
                <div id="data">
                    <ul class="dataList"></ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    //upload/erweima
    $(function(){
        Ajax.ajax({
            url: "admin/system/getDirectory.do",
            params: {"path":"/upload/erweima"},
            success: function(res) {
                if(res.code==0){
                    var str="";
                    $.each(res.data,function(key,val){
                        if(val["type"]=="folder"){
                            str+='<li title="'+val["path"]+'" type="'+val["type"]+'" ondblclick="openDirectory(this.title,1)"><div class="ft '
                                +val["type"]+'"></div><div class="fn">'+val["name"]+'</div></li>';
                        }else if(val["type"]=="picture"){
                            str+='<li title="'+val["path"]+'" type="'+val["type"]+'" ondblclick="openPicture(this.title)"><div class="ft '
                                +val["type"]+'"></div><div class="fn">'+val["name"]+'</div></li>';
                        }else{
                            str+='<li title="'+val["path"]+'" type="'+val["type"]+'" ondblclick="downLoad(this.title)"><div class="ft '
                                +val["type"]+'"></div><div class="fn">'+val["name"]+'</div></li>';
                        }
                    });
                    $(".dataList").html(str);
                }else{
                    showMsg(res.msg,2);
                }
            }
        });
    });

    function openDirectory(path,isFloder){
        var index = layer.load(2, {shade: [0.1,'#000'],time: 20000});
        var t=$(this);
        Ajax.ajax({
            url: "admin/system/getDirectory.do",
            params: {"path":path},
            success: function(res) {
                if(res.code==0){
                    var str="";
                    $.each(res.data,function(key,val){
                        if(val["type"]=="folder"){
                            str+='<li title="'+val["path"]+'" type="'+val["type"]+'" ondblclick="openDirectory(this.title,1)"><div class="ft '
                                +val["type"]+'"></div><div class="fn">'+val["name"]+'</div></li>';
                        }else if(val["type"]=="picture"){
                            str+='<li title="'+val["path"]+'" type="'+val["type"]+'" ondblclick="openPicture(this.title)"><div class="ft '
                                +val["type"]+'"></div><div class="fn">'+val["name"]+'</div></li>';
                        }else{
                            str+='<li title="'+val["path"]+'" type="'+val["type"]+'" ondblclick="downLoad(this.title)"><div class="ft '
                                +val["type"]+'"></div><div class="fn">'+val["name"]+'</div></li>';
                        }
                    });
                    layer.close(index);
                    $(".dataList").html(str);
                    if(isFloder==1){
                        createBread(path);
                    }
                }else{
                    layer.close(index);
                    showMsg(res.msg,2);
                }
            }
        });
    }


    function createBread(path){
        var arr=path.split("/");
        var str='<li><a title="/" href="javascript:;" onclick="openDirectory(this.title,1)">static</a></li>';
        for(var i=0;i<arr.length;i++){
            if(arr[i]!=""){ //path
                str+='<li><a title="'+arr[i]+'" href="javascript:;" onclick="openSingleDirectory(this)">'+arr[i]+'</a></li>';
            }
        }
        $(".breadcrumb").html(str);
        $(".breadcrumb li:last").addClass("active").children("a").removeAttr("onclick");
    }
    function openSingleDirectory(obj){
        var $dom=$(obj).parent("li").prevAll("li");
        var path="";
        for(var i=$dom.length-1;i>0;i--){
            path += $dom.eq(i-1).children("a").html()+"/";
        }
        path += $(obj).html();
        openDirectory("/"+path,1);
    }

    function openPicture(file){
        var src='static/'+file+'';
        openLayerHTML('<img src="'+src+'" width="100%">', 0, true, 500, 500);
    }

    function downLoad(file){
        window.open("static"+file);
    }
</script>
</body>
</html>