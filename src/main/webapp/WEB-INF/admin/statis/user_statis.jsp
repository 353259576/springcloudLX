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

<body class="gray-bg">

<div class="wrapper wrapper-content">
	<div class="row">
		<div class="col-sm-2">
			<div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-danger pull-right">总</span>
                    <h5>总会员</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="data1-1">00</h1>
                    <small>人</small>
                </div>
            </div>
		</div>
		<div class="col-sm-2">
			<div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">月</span>
                    <h5>本月新增</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="data1-2">00</h1>
                    <div class="stat-percent font-bold text-navy"><span id="data1-3">00</span>%</div>
                    <small>人</small>
                </div>
            </div>
		</div>
		
		<div class="col-sm-2">
			<div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-danger pull-right">总</span>
                    <h5>铜牌会员</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="data2-1">00</h1>
                    <small>人</small>
                </div>
            </div>
		</div>
		<div class="col-sm-2">
			<div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-danger pull-right">总</span>
                    <h5>银牌会员</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="data2-2">00</h1>
                    <small>人</small>
                </div>
            </div>
		</div>
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-danger pull-right">总</span>
                    <h5>金牌会员</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="data2-3">00</h1>
                    <small>人</small>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-danger pull-right">总</span>
                    <h5>钻石会员</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="data2-4">00</h1>
                    <small>人</small>
                </div>
            </div>
        </div>
	</div>

	<div class="row">
    	<div class="col-sm-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<form class="form-inline">
						<span>显示：
                            <div class="radio radio-info radio-inline">
                                <input name="rd" type="radio" id="r1" value="1" checked>
                                <label for="r1">今天</label>
                            </div>
                            <div class="radio radio-info radio-inline">
                                <input name="rd" type="radio" id="r2" value="2">
                                <label for="r2">本周</label>
                            </div>
                            <div class="radio radio-info radio-inline">
                                <input name="rd" type="radio" id="r3" value="3">
                                <label for="r3">本月</label>
                            </div>
                            <div class="radio radio-info radio-inline">
                                <input name="rd" type="radio" id="r4" value="4">
                                <label for="r4">本季度</label>
                            </div>
                        </span>
					</form>
    			</div>
    			<div class="panel-body">
    				<div id="chart" style="height: 400px;width: 100%;"></div>
    			</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4"><div id="chart5" style="height: 300px;width: 100%;"></div></div>
                        <div class="col-md-4"><div id="chart6" style="height: 300px;width: 100%;"></div></div>
                        <div class="col-md-4"><div id="chart7" style="height: 300px;width: 100%;"></div></div>
                    </div>
                </div>
    		</div>
    	</div>
    </div>
</div>

<script type="text/javascript" src="static/library/plugins/echarts/echarts.min.js"></script>
<script type="text/javascript">
$(function(){
    stat(1);
    stat5();stat6();stat7();

    $("input[name='rd']").change(function () {
        var type=$("input[name='rd']:checked").val();
        stat(type);
    });

	Ajax.ajax({
		url: "admin/statis/userStatData.do",
		params: null,
		success: function(data) {
			$("#data1-1").html(data.a);
			$("#data1-2").html(data.b);
			if(data.b!=0){
                $("#data1-3").html((data.a / data.b * 100).toFixed(2));
            }
			$("#data2-1").html(data.d);
			$("#data2-2").html(data.e);
			$("#data2-3").html(data.f);
			$("#data2-4").html(data.g);
		}
	});


});

function stat(type){
	var myChart = echarts.init(document.getElementById('chart'));
	myChart.showLoading({text : '正在努力的读取数据中...'});
	
	Ajax.ajax({
		url: "admin/statis/userStatChart.do",
		params: {"type":type},
		success: function(data) {
            if (data.code == 0) {
                myChart.setOption(
                        option = {
                            title: {
                                text: '会员统计'
                            },
                            tooltip : {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'cross',
                                    label: {
                                        backgroundColor: '#6a7985'
                                    }
                                },
                                //data.data.date + (data.data.date==""?'':'-') +
                                formatter: "{b} <br/> {a}:{c}"
                            },
                            legend: {
                                data:['会员']
                            },
                            toolbox: {
                                feature: {
                                    saveAsImage: {}
                                }
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                containLabel: true
                            },
                            xAxis : [
                                {
                                    type : 'category',
                                    boundaryGap : true,
                                    data : data.data.x
                                }
                            ],
                            yAxis : [
                                {
                                    name : '人',
                                    type : 'value'
                                }
                            ],
                            series : [
                                {
                                    name:'会员',
                                    type:'line',
                                    stack: '总数',
                                    label: {
                                        normal: {
                                            show: true,
                                            position: 'top'
                                        }
                                    },
                                    areaStyle: {normal: {
                                        opacity: '0'
                                    }},
                                    data:data.data.y
                                }
                            ]
                        }

                )
            } else {
                showMsg("未查询到数据", 2);
                myChart.dispose();
            }
            myChart.hideLoading();
        }
	});
}

function stat5(){
    var myChart = echarts.init(document.getElementById('chart5'));
    myChart.showLoading({text : '正在努力的读取数据中...'});

    Ajax.ajax({
        url: "admin/statis/userStatChart.do",
        params: {"type":5},
        success: function(data) {
            if (data.code == 0) {
                myChart.setOption(
                    option = {
                        title : {
                            text: '会员分布统计',
                            subtext: '男女比例',
                            x:'center'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: ['其他','女','男']
                        },
                        series : [
                            {
                                name: '人数',
                                type: 'pie',
                                radius : '55%',
                                center: ['50%', '60%'],
                                data:[
                                    {value:data.data.y[0], name:'其他'},
                                    {value:data.data.y[1], name:'女'},
                                    {value:data.data.y[2], name:'男'}
                                ],
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    }
                )
            } else {
                showMsg("未查询到数据", 2);
                myChart.dispose();
            }
            myChart.hideLoading();
        }
    });
}
function stat6(){
    var myChart = echarts.init(document.getElementById('chart6'));
    myChart.showLoading({text : '正在努力的读取数据中...'});

    Ajax.ajax({
        url: "admin/statis/userStatChart.do",
        params: {"type":6},
        success: function(data) {
            if (data.code == 0) {
                var x=data.data.x;
                var y=data.data.y;
                var arr=new Array();
                for(var i=0;i<x.length;i++){
                    var obj={value:y[i], name:x[i]};
                    arr.push(obj);
                }
                myChart.setOption(
                    option = {
                        title : {
                            text: '会员分布统计',
                            subtext: '年龄比例',
                            x:'center'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: x
                        },
                        series : [
                            {
                                name: '人数',
                                type: 'pie',
                                radius : '55%',
                                center: ['50%', '60%'],
                                data : arr,
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    }
                )
            } else {
                showMsg("未查询到数据", 2);
                myChart.dispose();
            }
            myChart.hideLoading();
        }
    });
}
function stat7(){
    var myChart = echarts.init(document.getElementById('chart7'));
    myChart.showLoading({text : '正在努力的读取数据中...'});

    Ajax.ajax({
        url: "admin/statis/userStatChart.do",
        params: {"type":7},
        success: function(data) {
            if (data.code == 0) {
                var x=data.data.x;
                var y=data.data.y;
                var arr=new Array();
                for(var i=0;i<x.length;i++){
                    if(x[i]==null){x[i]="其他"}
                    var obj={value:y[i], name:x[i]};
                    arr.push(obj);
                }
                myChart.setOption(
                    option = {
                        title : {
                            text: '会员分布统计',
                            subtext: '区域比例',
                            x:'center'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: x
                        },
                        series : [
                            {
                                name: '人数',
                                type: 'pie',
                                radius : '55%',
                                center: ['50%', '60%'],
                                data : arr,
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    }
                )
            } else {
                showMsg("未查询到数据", 2);
                myChart.dispose();
            }
            myChart.hideLoading();
        }
    });
}
</script>
</body>
</html>