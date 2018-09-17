<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="com.ws.system.Constant,com.ws.utils.system.SystemUtil,java.util.Date"%>
<% String path = request.getContextPath();
String port=request.getServerPort()==80?"":":"+request.getServerPort();
String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<title></title>
<link href="static/theme/common/bootstrap.min.css" rel="stylesheet">
<link href="static/theme/back/css/style.min.css" rel="stylesheet">
</head>
<%
	long date = new Date().getTime(); // 服务器时间
	String remote = request.getHeader("x-forwarded-for")==null?request.getRemoteAddr():request.getHeader("x-forwarded-for"); // 访问IP
	double[] arr = new SystemUtil().getSpace();// 磁盘、磁盘使用
%>
<body style="padding: 15px;">

<!-- 样式一 -->
<%--<div class="ibox-content" id="charts" style="height: 420px;"></div>
<div class="mt10">
    <span class="label label-info"><%=Constant.SYS_NAME %> <%=Constant.SYS_VER %></span>
    <span class="label label-info"><%=application.getServerInfo()%></span>
    <span class="label label-info">
        <i class="fa fa-flash"></i><%=arr[4]%>GB／<%=arr[5]%>GB
                    <i class="fa fa-service"></i><%=arr[1]%>GB／<%=arr[2]%>GB
    </span>
    <span class="label label-default pull-right" id="date">NOW: 00:00:00</span>
</div>--%>

<!-- 样式二 -->
<div class="row">
    <!-- <div class="col-md-4 home-panel animated fadeInDown">
        <div class="home-item">
            <div class="home-item-head">
                <div class="ico"><i class="fa fa-user"></i></div>
                <h3>会员管理</h3>
            </div>
            <div class="home-item-footer">
                <ul>
                    <li class="w50"><a href="admin/user/userList.do">会员列表</a></li>
                    <li class="w50"><a href="admin/user/userInfoList.do">会员资料</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-md-4 home-panel animated fadeInDown">
        <div class="home-item">
            <div class="home-item-head">
                <div class="ico"><i class="fa fa-user"></i></div>
                <h3>订单管理</h3>
            </div>
            <div class="home-item-footer">
                <ul>
                    <li class="w50"><a href="admin/user/approvalList.do">用车订单</a></li>
                    <li class="w50"><a href="admin/loan/loanList.do?type=1">维修订单</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-md-4 home-panel animated fadeInDown">
        <div class="home-item">
            <div class="home-item-head">
                <div class="ico"><i class="fa fa-user"></i></div>
                <h3>资金管理</h3>
            </div>
            <div class="home-item-footer">
                <ul>
                    <li class="w50"><a href="admin/product/productList.do">押金管理</a></li>
                    <li class="w50"><a href="admin/product/kanList.do">收益管理</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-md-4 home-panel animated fadeInDown">
        <div class="home-item">
            <div class="home-item-head">
                <div class="ico"><i class="fa fa-user"></i></div>
                <h3>风控系统</h3>
            </div>
            <div class="home-item-footer">
                <ul>
                    <li class="w50"><a href="admin/order/orderList.do">车辆风控系统</a></li>
                    <li class="w50"><a href="admin/order/fundList.do">资金风控系统</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-md-4 home-panel animated fadeInDown">
        <div class="home-item">
            <div class="home-item-head">
                <div class="ico"><i class="fa fa-user"></i></div>
                <h3>应用管理</h3>
            </div>
            <div class="home-item-footer">
                <ul>
                    <li class="w50"><a href="admin/web/articleList.do">列表</a></li>
                    <li class="w50"><a href="admin/web/bannerList.do">轮播图</a></li>
                </ul>
            </div>
        </div>
    </div>
    -->
    <div class="col-md-4 home-panel animated fadeInDown">
        <div class="home-item">
            <div class="home-item-head">
                <div class="ico"><i class="fa fa-gear"></i></div>
                <h4><%=Constant.SYS_NAME %> <%=Constant.SYS_VER %></h4>
                <h4><%=application.getServerInfo()%> ／ <span id="date"></span></h4>
                <h4><i class="fa fa-flash"></i><%=arr[4]%>GB／<%=arr[5]%>GB
                    <i class="fa fa-server"></i><%=arr[1]%>GB／<%=arr[2]%>GB</h4>
            </div>
        </div>
    </div>
</div>

<script src="static/library/jquery/jquery-2.1.1.min.js"></script>
<script src="static/library/plugins/echarts/echarts.min.js"></script>
<script type="text/javascript">
	$(function(){
		window.setInterval("serverDate()", 1000);

        loadData();
	});
	
	var sd=<%=date%>;
	function serverDate(){
		var date=new Date(sd);
		var timeStr=date.getFullYear()+"-"+format(date.getMonth()+1)+"-"+format(date.getDate())+" "+format(date.getHours())+":"+
			format(date.getMinutes())+":"+format(date.getSeconds());
		$("#date").html(timeStr);
		sd+=1000;
	}
	function format(s) {
        return s < 10 ? ("0" + s) : s;
    }

    function loadData(){
        var xData = function() {
            var data = [];
            for (var i = 0; i <= 23; i++) {
                data.push(i + "时");
            }
            return data;
        }();
        var yData = function() {
            var data = [];
            for (var i = 0; i <= 23; i++) {
                data.push(Math.floor(Math.random() * 10000));
            }
            return data;
        }();
        option = {
            backgroundColor: "#344b58",
            "title": {
                "text": "当日网站访问量数据统计",
                "subtext": "Yu Lan Ting Web Statics",
                x: "4%",
                textStyle: {
                    color: '#fff',
                    fontSize: '22'
                },
                subtextStyle: {
                    color: '#90979c',
                    fontSize: '16',
                },
            },
            "tooltip": {
                "trigger": "axis",
                "axisPointer": {
                    "type": "shadow",
                    textStyle: {
                        color: "#fff"
                    }
                },
            },
            "grid": {
                "borderWidth": 0,
                "top": 110,
                "bottom": 95,
                textStyle: {
                    color: "#fff"
                }
            },
            "calculable": true,
            "xAxis": [{
                "type": "category",
                "axisLine": {
                    lineStyle: {
                        color: '#90979c'
                    }
                },
                "splitLine": {
                    "show": false
                },
                "axisTick": {
                    "show": false
                },
                "splitArea": {
                    "show": false
                },
                "axisLabel": {
                    "interval": 0,
                },
                "data": xData,
            }],
            "yAxis": [{
                "type": "value",
                "splitLine": {
                    "show": false
                },
                "axisLine": {
                    lineStyle: {
                        color: '#90979c'
                    }
                },
                "axisTick": {
                    "show": false
                },
                "axisLabel": {
                    "interval": 0,
                },
                "splitArea": {
                    "show": false
                },
            }],
            "series": [{
                "name": "总计",
                "type": "bar",
                "barMaxWidth": 35,
                "barGap": "10%",
                "itemStyle": {
                    "normal": {
                        "color": "rgba(255,144,128,1)",
                        "label": {
                            "show": true,
                            "textStyle": {
                                "color": "#fff"
                            },
                            "position": "top",
                            formatter: function(p) {
                                return p.value > 0 ? (p.value) : '';
                            }
                        }
                    }
                },
                "data": yData,
            }
            ]
        }
        var myChart = echarts.init(document.getElementById('charts'));
        myChart.setOption(option);
    }
</script>
</body>
</html>