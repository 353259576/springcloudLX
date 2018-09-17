/**
 * webUploader for web/wenxin
 * @version 1.0
 */

var files = new Array;
var $list = $("#fileList");
var $btn = $("#upBtn");
var index;
$btn.on('click', function () {
    index = layer.open({type: 2});
    uploader.upload();
    /*layer.open({
     content: '上传成功'
     });*/
});
$("#getBtn").click(function () {
    console.log(files);
})
var uploader = WebUploader.create({
    auto: true,
    swf: '<%=basePath%>static/library/plugins/webuploader/Uploader.swf',
    server: 'upload.do',
    pick: '#filePicker',
    resize: false,
    accept: {
        title: 'Files',
        extensions: 'gif,jpg,jpeg,bmp,png,mp4,avi,flv'
        /*mimeTypes: 'image/!*'*/
    },
    fileNumLimit: 9,
    fileSingleSizeLimit: 10 * 1024 * 1024,  //10M
    fileSizeLimit: 90 * 1024 * 1024
});

uploader.on('fileQueued', function (file) {
    //file.name
    var $li = $(
            '<span id="' + file.id + '" class="img-thumbnail img-uploads">' +
            '<a href="javascript:;" class="img-del"><i class="glyphicon glyphicon-remove"></i></a>'+
            '<img>' + '</span>'
        ),
        $img = $li.find('img');
    $list.append($li);

    // 创建缩略图
    uploader.makeThumb(file, function (error, src) {
        if (error) {
            file.type = 2;
            $img.replaceWith('<img src="static/theme/back/images/file/video.png">');
            return;
        }

        $img.attr('src', src);
    }, 80, 80);

    $li.on( 'click', 'a.img-del', function() {
        uploader.removeFile( file );
    });
});

// 文件上传过程中创建进度条实时显示
uploader.on('uploadProgress', function (file, percentage) {
    var $li = $('#' + file.id),
        $percent = $li.find('.progress span');

    // 避免重复创建
    if (!$percent.length) {
        $percent = $('<p class="progress"><span></span></p>')
            .appendTo($li)
            .find('span');
    }

    $percent.css('width', percentage * 100 + '%');
});

uploader.on('fileDequeued', function( file ) {
    removeFile( file );
});

function removeFile( file ) {
    var $li = $('#' + file.id);
    $li.off().find('.file-panel').off().end().remove();
    for(var i=0; i<files.length; i++) {
        if(files[i].rname == file.rname) {
            files.splice(i, 1);
            break;
        }
    }
}

// 文件上传成功，给item添加成功class, 用样式标记上传成功。
uploader.on('uploadSuccess', function (file) {
    $('#' + file.id).addClass('upload-state-done');
});

uploader.on('uploadAccept', function (obj, ret) {
    if(ret.error == 0){
        obj.file.rname = ret.url;
        files.push(obj.file);
    }else{
        layer.open({
            content: ret.message
        });
    }
});

uploader.on('error', function (type) {
    if (type == "Q_EXCEED_NUM_LIMIT") {
        layer.open({
            content: '文件数量超出限制'
        });
    } else if (type == "Q_EXCEED_SIZE_LIMIT") {
        layer.open({
            content: '文件大小超出限制'
        });
    } else if (type == "Q_TYPE_DENIED") {
        layer.open({
            content: '文件类型不符合'
        });
    }
});

// 文件上传失败，显示上传出错。
uploader.on('uploadError', function (file) {
    var $li = $('#' + file.id),
        $error = $li.find('div.error');
    // 避免重复创建
    if (!$error.length) {
        $error = $('<div class="error"></div>').appendTo($li);
    }
    $error.text('上传失败');
});

// 完成上传完了，成功或者失败，先删除进度条。
uploader.on('uploadComplete', function (file) {
    $('#' + file.id).find('.progress').remove();
    layer.close(index);
});