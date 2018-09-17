/********************
 * @Author jfxu
 * <p> need:jquery.js/layer.js/dropzone.js/toastr.js </p>
 ********************/

/*******************************************************************************
 * Ajax (JSON)
 * Ajax.ajax({ 
 * 	url:'',
 * 	params:JSON.stringify($('#defaultForm').serializeObject()),
 * 	success:function(data){ } 
 * })
 ******************************************************************************/
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
			var index = openLayerLoading();
			$.ajax({
				type : "POST",
				async : config.async,
				// contentType : 'application/json',
				url : config.url,
				data : config.params,
				dataType : config.dataType,
				success : function(data) {
					layer.close(index);
					if (data.code == 99) { // nologin
						showMsg(data.msg, 2, function() {
							jumpUrl("admin/login.do");
						});
						return;
					}
					if (data.code == 100) { // noauthority
						showMsg(data.msg, 2);
						return;
					}
					if (config.success) {
						config.success(data);
					}
				},
				error : function(er) {
					layer.close(index);
					showMsg('Request Error', 2);
				}
			});
		} else {
			showMsg('Request Url Is Error', 2);
		}
	}
};
// json参数值：JSON.stringify($('#defaultForm').serializeObject())
$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};

var parseParam = function(param) {
	var paramStr = "";
    $.each(param, function(k,v) {
        if(v == null){
            v = "";
        }
        paramStr += k + "=" + encodeURIComponent(v) + "&";
    });
	return paramStr.substring(0, paramStr.length - 1);
};

/**
 * toast
 * @param type 1-success 2-error
 * @param title
 * @param content
 */
function toast(type, title, content) {
	toastr.options = {
		"closeButton" : true,
		"debug" : false,
		"progressBar" : true,
		"positionClass" : "toast-top-center",
		"showDuration" : "100",
		"hideDuration" : "1000",
		"timeOut" : "4000",
		"extendedTimeOut" : "1000"
	};

	if (type == 1) { // success
		toastr.success(title, content);
	} else if (type == 2) { // error
		toastr.error(title, content);
	}
}

/**
 * layer询问框
 * @param title
 * @param url
 * @param param {"key":"value"}
 */
function layerConfirm(title, url, param){
	layer.confirm(title, {btn: ['确定','取消'], icon:3}, function(){
		Ajax.ajax({
			url: url,
			params: param,
			success: function(data){
				if(data.code==0) {
					showMsg(data.msg,1,function(){
						location.reload();
					});
				} else {showMsg(data.msg,2);}
			}
		});
	});
}

/**
 * 显示提示层
 * @param msg
 * @param type 1-success 2-fail
 * @param fun
 */
function showMsg(msg, type, func) {
	if (func) {
		layer.msg(msg, {
			icon : type,
			time : 2000
		}, func);
	} else {
		layer.msg(msg, {
			icon : type,
			time : 2000
		});
	}
}

/**
 * 打开frame层
 * @param title
 * @param width
 * @param height
 * @param url
 * @param maxmin 是否最大/小化
 * @returns
 */
function openLayerFrame(title, width, height, url, maxmin) {
	return openLayerWin(title, width, height, url, maxmin, 1);
}

/**
 * 打开frame层[无边框]
 * @param width
 * @param height
 * @param url
 * @returns
 */
function openLayer(width, height, url) {
	return openLayerWin(false, width, height, url, false, true);
}

/**
 * 打开layer【父方法】
 * @returns index
 */
function openLayerWin(title, width, height, url, maxmin, closeBtn) {
	var index = layer.open({
		type : 2,
		title : title,
		closeBtn : closeBtn,
		shift : 5,
		shade : [ 0.5, '#393D49' ],
		shadeClose : false,
		maxmin : maxmin,
		area : [ width, height ],
		content : url
	});
	return index;
}

/**
 * 打开HTML窗口【对象】
 * @param title
 * @param width
 * @param height
 * @param $obj 对象，如：$(".layer-edit")
 * @returns
 */
function openLayerContent(title, width, height, $obj) {
	var index = layer.open({
		type : 1,
		title : title,
		shade : [ 0.5, '#393D49' ],
		area : [ width, height ],
		content : $obj,
		cancel : function(index) {
			layer.close(index);
		}
	});
	return index;
}

/**
 * 打开HTML窗口【HTML】
 * @param html HTML代码
 * @param closeBtn 1-有关闭按钮 0-无
 * @param shadeClose 是否有遮罩层 true/false
 */
function openLayerHTML(html, closeBtn, shadeClose, width, height) {
	layer.open({
		type : 1,
		title : false,
		area : [ width, height ],
		closeBtn : closeBtn,
		shadeClose : shadeClose,
		content : html
	});
}

/**
 * 加载动画
 * @returns
 */
function openLayerLoading() {
	var index = layer.load(2, {
		shade : [ 0.1, '#000' ],
		time : 20000
	});
	return index;
}

/**
 * 重置表单
 */
function resetForm(id) {
    $(id)[0].reset();
    $(id).find("input[type=hidden]").val('');
}

/**
 * 校验字段长度
 * @param sel
 * @param min
 * @param max
 * @returns {Boolean} true-未通过验证
 */
function checkString(sel, min, max){
	var obj=$(sel);
	if (typeof (obj) == "undefined") {
		return true;
	}
	if (obj.val().length < min || obj.val().length > max) {
		obj.focus();
		return true;
	}
	return false;
}

function checkPhone(sel){
	return checkRE(sel, /^1[3|4|5|7|8][0-9]\d{8}$/);
}

function checkNumber(sel){
	return checkRE(sel, /^(0|[1-9][0-9]*)$/);
}

function checkMoney(sel){
	return checkRE(sel, /^(\d+)(\.?)(\d{0,2})$/);
}

function checkUrl(sel){
	return checkRE(sel, /[a-zA-z]+:\/\/[^\s]*/);
}

/**
 * 正则校验
 * @param selector 选择器
 * @param reExp 正则表达式
 * 		num:/^[1-9]\d*$/
 * 		email:/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
 * 		money:/^(\d+)(\.?)(\d{0,2})$/ 
 * 		phone:/^1[3|4|5|7|8][0-9]\d{8}$/
 * 		idcard:/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/
 * @returns {Boolean} true-未通过
 */
function checkRE(sel, reExp) {
	var obj = $(sel);
	if (!reExp.test(obj.val())) {
		obj.focus();
		return true;
	}
	return false;
}

/**
 * 创建上传按钮
 * @param target 创建区域
 * @param areaId 表单的name
 * @param defaultVal 表单默认值
 * @param isAdd 是否是新增[新增不显示预览图]
 */
/*function createUpload(target, areaId, defaultVal, isAdd){
 var html='<a class="btn btn-sm btn-info" onclick="uploadImg(1,\''+areaId+'\');">'
 + '<i class="fa fa-picture-o"></i>选择图片</a><input type="hidden" name="'+areaId+'" id="'+areaId+'" value="'+defaultVal+'">'
 + '<div img-area-id="'+areaId+'">';
 if(isAdd == 0 && defaultVal != ''){
 html += '<a class="img-area"><img src="'+defaultVal+'" width="150" class="img-thumbnail">'
 + '<span class="img-del" title="删除" onclick="uploadDel(this,\''+areaId+'\')">x</span></a>';
 }
 html += '</div>';
 $(target).html(html);
 }*/

/**
 * 上传文件
 * @param id 隐藏域id
 */
function uploadFile(id, isMobile) {
    var width = "700px";
    var height = "400px";
    if(isMobile) {
        width = "90%";
        height = "80%";
    }
	openLayer(width, height, '/user/upload.html?type=file&id=' + id);
}

/**
 * 上传图片
 * @param limit 文件限制
 * @param id 隐藏域id
 */
function uploadImg(limit, id, isMobile) {
    var width = "700px";
    var height = "400px";
    if(isMobile) {
        width = "90%";
        height = "80%";
    }
    if (limit <= 0) {
        showMsg("文件数量最少为1", 2);
        return;
    }
    var max = $("[img-area-id='"+id+"']").find(".img-area").size();
    if(limit <= max) {
        showMsg("文件数量最多"+limit+"个", 2);
        return;
    }
    if(limit > 1) {
        limit = limit - max;
    }
    openLayer(width, height, '../user/upload.html?limit=' + limit + "&id=" + id);
}

/**
 * 删除图片
 * @param t
 * @param id 隐藏域id
 */
function uploadDel(t, id) {
	var ele = $(t);
	// 图片地址
	var src = ele.prev("img").attr("src");
	// 图片容器
	var img = ele.parent("a.img-area");

	var arr = $("#" + id).val().split(",");
	var len = arr.length;
	for (var i = 0; i < len; i++) {
		if (arr[i] == src) {
			arr.splice(i, 1);
			var newStr = arr.join(",");
            $("#" + id).val(newStr);
			img.remove();
			return;
		}
	}
}

/**
 * 地址联动选择器 cityPicker("#city-picker");
 * @param id
 */
function cityPicker(id) {
	$.ajaxSetup({cache: true});
	addCSS("../static/library/plugins/city-picker/city-picker.css");
	$.getScript("../static/library/plugins/city-picker/city-picker.data.js", function() {
		$.getScript("../static/library/plugins/city-picker/city-picker.js", function() {
				var $citypicker = $(id);
				$citypicker.citypicker();
			});
	});
}

/**
 * 时间选择器 datePicker("#datetimepicker")
 * @param id
 * @param format    4       3       2           1
 * @param view      yyyy    yyyy-mm yyyy-mm-dd  yyyy-mm-dd hh:ii
 */
function datePicker(ids,format,view) {
	$.ajaxSetup({cache: true});
	$.getScript("/static/library/bootstrap/bootstrap-datetimepicker.min.js",
		function() {
            $(ids).datetimepicker('remove');
            $(ids).val('');
			$(ids).datetimepicker({
				language : 'zh-CN',
				minView : view,
				startView: view,
				format: format,
				todayBtn: true,
				autoclose : true
			});
		}
    );
}

/**
 * 加载css文件
 * @param file css文件路径
 */
function addCSS(file) {
	var link = document.createElement('link');
	link.type = 'text/css';
	link.rel = 'stylesheet';
	link.href = file;
	document.getElementsByTagName("head")[0].appendChild(link);
}

/**
 * URL跳转
 * @param url
 */
function jumpUrl(url) {
	var referLink = document.createElement('a');
	referLink.href = url;
	document.body.appendChild(referLink);
	referLink.click();
}

/**
 * 更改验证码图片
 * @param obj this
 */
function changeNum(obj) {
	var num = Math.floor(Math.random() * 10000);
	obj.src = "getValidCode.do?" + num;
}

/**
 * post提交
 * @param url request
 * @param params {name:value,name:value}
 * @returns anonymous
 */
function post(url, params) {
	var temp = document.createElement("form");
	temp.action = url;
	temp.method = "post";
	temp.style.display = "none";
	for ( var x in params) {
		var opt = document.createElement("textarea");
		opt.name = x;
		opt.value = params[x];
		temp.appendChild(opt);
	}
	document.body.appendChild(temp);
	temp.submit();
	return temp;
}

/**
 * 获取url参数键值
 * @param name
 * @returns
 */
function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}

/**
 * 获取浏览器信息
 * <p>var browser = getBrowserInfo() ; 
 * var verinfo = (browser+"").replace(/[^0-9.]/ig,""); 
 * $("#bwType").text(browser);
 * $("#bwVer").text(verinfo);</p>
 */
function getBrowserInfo() {
	var agent = navigator.userAgent.toLowerCase();
	var regStr_ie = /msie [\d.]+;/gi;
	var regStr_ff = /firefox\/[\d.]+/gi;
	var regStr_chrome = /chrome\/[\d.]+/gi;
	var regStr_saf = /safari\/[\d.]+/gi;
	// IE
	if (agent.indexOf("msie") > 0) {
		return agent.match(regStr_ie);
	}
	// firefox
	if (agent.indexOf("firefox") > 0) {
		return agent.match(regStr_ff);
	}
	// Chrome
	if (agent.indexOf("chrome") > 0) {
		return agent.match(regStr_chrome);
	}
	// Safari
	if (agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0) {
		return agent.match(regStr_saf);
	}
}

/**
 * 检查是否安装flash
 * @returns {Boolean} true已安装
 */
function checkFlash() {
	if ((navigator.userAgent.indexOf('MSIE') >= 0)
			&& (navigator.userAgent.indexOf('Opera') < 0)) {
		var swf1 = new ActiveXObject('ShockwaveFlash.ShockwaveFlash');
		if (swf1) {
			return true;
		}
		return false;
	} else {
		var swf2 = navigator.plugins['Shockwave Flash'];
		if (swf2 != undefined) {
			return true;
		}
		return false;
	}
}

//判断用户浏览器及设备
(function getMobileDevice(window) {
    var ua = navigator.userAgent;
    var mobile = /AppleWebKit.*Mobile.*/.test(ua) || /AppleWebKit/.test(ua); // 是否为移动终端
    var ios = /\(i[^;]+;( U;)? CPU.+Mac OS X/.test(ua); // ios终端
    var android = /(Android);?[\s\/]+([\d.]+)?/.test(ua); // android终端或者uc浏览器
    var iphone = /iphone/i.test(ua); // iphone
    var iPad = /iPad/i.test(ua); // ipad
    var weixin = /micromessenger/i.test(ua); // weixin
    var chrome = /Chrome\/([\d.]+)/.test(ua) || /CriOS\/([\d.]+)/.test(ua); // Chrome
    var mozilla = ua.indexOf('Gecko') > -1 && ua.indexOf('KHTML') == -1; // 火狐内核
    var webkit = /AppleWebKit/i.test(ua); // 苹果、谷歌内核
    var opera = /Presto/i.test(ua); // opera内核
    var safari = /safari/i.test(ua) && !/Chrome/i.test(ua); // 苹果浏览器
    var msie = /msie/i.test(ua); // 微软
    window.device = {
        isMobile: mobile,
        isIos: ios,
        isAndroid: android,
        isIPhone: iphone,
        isIPad: iPad,
        isWeiXin: weixin,
        isChrome: chrome,
        isMozilla: mozilla,
        isWebkit: webkit,
        isOpera: opera,
        isSafari: safari,
        isMsie: msie
    }
})(window);
//console.log(device);

/**
 * 去除html标签
 * @param str
 * @returns
 */
function delHtmlTag(str) {
	return $.trim(str.replace(/<[^>]+>/g, ""));
}

/**
 * 打开新窗口
 * @param url
 * @param width
 * @param height
 */
function openWindow(url, width, height) {
	var iTop = (window.screen.availHeight - 30 - height) / 2; // 获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth - 10 - width) / 2; // 获得窗口的水平位置;
	window.open(url, "name", "width=" + width + ",height=" + height + ",left="
			+ iLeft + ",top=" + iTop + "");
}

/**
 * 获取图片的真实高宽
 * @param img
 * @returns {Array}
 */
function getNaturalImg(img) {
    var image = new Image();
    image.src = img.attr("src");
    var naturalWidth = image.width;
    var naturalHeight = image.height;
    return new Array([naturalWidth,naturalHeight]);
}

/**
 * 在顶部显示tips
 * @param tips
 */
function showTopTips(tips) {
	var html = "<div class='tips'><i class='tips-i'></i><span class='tips-span'>"
			+ tips
			+ "</span><i class='tips-close' onclick='hideTips()'></i></div>";
	$("body").append(html);
	$(".tips").slideDown();
}
function hideTips() {
	$(".tips").slideUp("fast", function() {
		$(".tips").remove();
	});
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
