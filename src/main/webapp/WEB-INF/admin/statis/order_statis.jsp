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
                    <h5>总订单</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="data1-1">00</h1>
                    <small>共<span id="data1-2">00</span>笔</small>
                </div>
            </div>
		</div>
		<div class="col-sm-2">
			<div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-danger pull-right">总</span>
                    <h5>购物订单</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="data2-1">00</h1>
                    <div class="stat-percent font-bold text-navy"><span id="data2-2">00</span><i class="fa fa-percent"></i></div>
                    <small>元</small>
                </div>
            </div>
		</div>
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-danger pull-right">总</span>
                    <h5>充值订单</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="data2-3">00</h1>
                    <div class="stat-percent font-bold text-navy"><span id="data2-4">00</span><i class="fa fa-percent"></i></div>
                    <small>元</small>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">月</span>
                    <h5>月订单</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="data3-1">00</h1>
                    <small>元</small>
                </div>
            </div>
        </div>
		<div class="col-sm-2">
			<div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">月</span>
                    <h5>月购物</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="data3-2">00</h1>
                    <div class="stat-percent font-bold text-navy"><span id="data3-2-1">00</span><i class="fa fa-percent"></i></div>
                    <small>元</small>
                </div>
            </div>
		</div>
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">月</span>
                    <h5>月充值</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="data3-3">00</h1>
                    <div class="stat-percent font-bold text-navy"><span id="data3-3-1">00</span><i class="fa fa-percent"></i></div>
                    <small>元</small>
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
                        <span>类型：
                            <div class="radio radio-info radio-inline">
                                <input name="t" type="radio" id="r11" value="1" checked>
                                <label for="r11">购物订单</label>
                            </div>
                            <div class="radio radio-info radio-inline">
                                <input name="t" type="radio" id="r22" value="2">
                                <label for="r22">充值订单</label>
                            </div>
                        </span>
					</form>
    			</div>
    			<div class="panel-body">
    				<div id="chart" style="height: 400px;width: 100%;"></div>
    			</div>
    		</div>
    	</div>
    </div>
</div>

<script type="text/javascript" src="/static/library/plugins/echarts/echarts.min.js"></script>
<script type="text/javascript">
$(function(){
    stat(1);

    $("input[name='rd']").change(function () {
        var type=$("input[name='rd']:checked").val();
        stat(type);
    });
    $("input[name='t']").change(function () {
        var type=$("input[name='rd']:checked").val();
        stat(type);
    });

	Ajax.ajax({
		url: "admin/statis/orderStatData.do",
		params: null,
		success: function(data) {
			$("#data1-1").html(data.a);
			$("#data1-2").html(data.b);

			$("#data2-1").html(data.c);
			$("#data2-2").html((data.c / data.a * 100).toFixed(2));
			$("#data2-3").html(data.d);
			$("#data2-4").html((data.d / data.a * 100).toFixed(2));

            $("#data3-1").html(data.e);
            $("#data3-2").html(data.f);
            $("#data3-2-1").html((data.f / data.e * 100).toFixed(2));
            $("#data3-3").html(data.g);
            $("#data3-3-1").html((data.g / data.e * 100).toFixed(2));
		}
	});
});

function stat(type){
	var myChart = echarts.init(document.getElementById('chart'));
	myChart.showLoading({text : '正在努力的读取数据中...'});
	
	Ajax.ajax({
		url: "admin/statis/orderStatChart.do",
		params: {
            "type":type,
            "t":$("input[name='t']:checked").val()
        },
		success: function(data) {
            if (data.code == 0) {
                myChart.setOption(
                        option = {
                            title: {
                                text: '订单统计'
                            },
                            tooltip : {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'cross',
                                    label: {
                                        backgroundColor: '#6a7985'
                                    }
                                },
                                formatter: "{b} <br/> {a0}:{c1} <br/>{a1}:{c0}"
                            },
                            legend: {
                                data:['笔数','金额']
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
                                    name: '笔数',
                                    type : 'value'
                                },
                                {
                                    name: '金额',
                                    type : 'value'
                                }
                            ],
                            series : [
                                {
                                    name:'笔数',
                                    type:'line',
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
                                },
                                {
                                    name:'金额',
                                    type:'line',
                                    yAxisIndex:1,
                                    label: {
                                        normal: {
                                            show: true,
                                            position: 'top'
                                        }
                                    },
                                    areaStyle: {normal: {
                                        opacity: '0'
                                    }},
                                    data:data.data.y2
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