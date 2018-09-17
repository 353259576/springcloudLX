/**
 * Webapp Global JS
 * Created by rick on 2016-09-09.
 * need: layer-mobile/layer.js
 */

/**
 * Ajax封装
 * @type {{ajax: ajax}}
 */
Ajax = {
    ajax : function(options) {
        var defaults = {
            async : true,
            dataType : 'json',
            url : null,
            params : null,
            success : null,
            error : null
        };
        var config = $.extend(defaults, options);
        if (config.url) {
            var index = layer.open({type: 2});
            $.ajax({
                type : "POST",
                async : config.async,
                // contentType : 'application/json',
                url : config.url,
                data : config.params,
                dataType : config.dataType,
                success : function(data) {
                    layer.close(index);
                    if (config.success) {
                        config.success(data);
                    }
                },
                error : function(er) {
                    layer.close(index);
                    openDialog('Request Error');
                }
            });
        } else {
            openDialog('Request Url Is Error');
        }
    }
};

/*model select*/
$(".areaMask, .close").click(function() {
    closeLayer();
});

/*header.back*/
$('.header-back,.cancel').click(function () {
    history.back();
});

/**
 * Ajax上传文件
 * @param formId 表单id
 * @param imgId 图片容器id
 */
function upload(formId,imgId) {
    var index = layer.open({type: 2});
    var formData = new FormData($(formId)[0]);
    $.ajax({
        url: 'http://test.cn/upload.do',
        type: 'POST',
        data: formData,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
            //console.log(data);
            //上传成功后，将返回的地址传递到图片容器中
            //可将返回的图片地址放入隐藏域name=imgs中
            $(imgId).attr('src','test.jpg');
            layer.close(index);
        },
        error: function () {
            openDialog('上传失败');
            //此处测试
            $(imgId).attr('src','test.jpg');
            layer.close(index);
        }
    });
}

/**
 * 自定义模态框-显示
 * @param sel
 */
function cusLayer(sel) {
    $('.areaMask').fadeIn();
    $(sel).animate({"bottom": 0});
}

/**
 * 关闭模态框
 */
function closeLayer() {
    $(".areaMask").fadeOut();
    $(".express-area-box").animate({"bottom": "-100%"});
}

/**
 * 显示对话框
 * @param msg
 */
function openDialog(msg){
    layer.open({
        content: msg,
        btn: '关闭'
    });
}

/**
 * 显示提示信息
 * @param msg
 * @param func
 */
function openMsg(msg,func){
    layer.open({
        content: msg,
        skin: 'msg',
        time: 2,
        end: function(){
            if(func){
                func()
            }
        }
    });
}

/**
 * 显示确认框
 * @param msg
 * @param func
 */
function openConfirm(msg,func){
    layer.open({
        content: msg,
        btn: ['确定', '取消'],
        yes: function(index){
            func();
            layer.close(index);
        }
    });
}

/**
 * 跳转url
 * @param url
 */
function jumpUrl(url){
    location.href=url;
}

/**
 * 格式化日期
 *
 * @param value
 * @param type 1-yyyy-MM-dd hh:mm:ss 2-yyyy-MM-dd
 * @returns
 */
function formatDate(value, type) {
    if (value == null || value == '') {
        return '';
    }
    var dt;
    if (value instanceof Date) {
        dt = value;
    } else {
        dt = new Date(value);
    }
    if (type == 1) {
        return dt.format("yyyy-MM-dd hh:mm:ss"); // 扩展的Date的format方法
    } else if (type == 2) {
        return dt.format("yyyy-MM-dd");
    }
}
// 格式化日期-扩展format方法
Date.prototype.format = function(format) {
    var o = {
        "M+" : this.getMonth() + 1,
        // 月
        "d+" : this.getDate(),
        // 天
        "h+" : this.getHours(),
        // 时
        "m+" : this.getMinutes(),
        // 分
        "s+" : this.getSeconds(),
        // 秒
        "q+" : Math.floor((this.getMonth() + 3) / 3),
        // 刻
        "S" : this.getMilliseconds()
        // 毫秒 millisecond
    };
    if (/(y+)/.test(format))
        format = format.replace(RegExp.$1, (this.getFullYear() + "")
            .substr(4 - RegExp.$1.length));
    for ( var k in o)
        if (new RegExp("(" + k + ")").test(format))
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
                : ("00" + o[k]).substr(("" + o[k]).length));
    return format;
};


function format(s){
    return s<10 ? ("0"+s) : s;
}

/**
 * 在文本框显示删除按钮
 */
$.fn.extend({
    addClear: function(options) {
        var options =  $.extend({
            closeSymbol: "",
            color: "#CCC",
            top: 1,
            right: 4,
            returnFocus: true,
            showOnLoad: false,
            onClear: null
        }, options);

        $(this).wrap("<span style='position:relative;display: inline-block; width: 100%;' class='add-clear-span'>");
        $(this).after("<a href='#clear'>"+options.closeSymbol+"</a>");
        $("a[href='#clear']").addClass('clear-btn');

        if($(this).val().length >= 1 && options.showOnLoad === true) {
            $(this).siblings("a[href='#clear']").show();
        }

        $(this).keyup(function() {
            if($(this).val().length >= 1) {
                $(this).siblings("a[href='#clear']").show();
            } else {
                $(this).siblings("a[href='#clear']").hide();
            }
        });

        $("a[href='#clear']").click(function(){
            $(this).siblings("input").val("");
            $(this).hide();
            if(options.returnFocus === true){
                $(this).siblings("input").focus();
            }
            if (options.onClear){
                options.onClear($(this).siblings("input"));
            }
            return false;
        });
        return this;
    }
});
