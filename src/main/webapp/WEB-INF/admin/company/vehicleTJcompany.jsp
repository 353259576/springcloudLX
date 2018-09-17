<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<meta charset="utf-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://www.xujunfei.com/tags" prefix="mytag" %>
<% String path = request.getSession().getServletContext().getContextPath();
    String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
    String basePath = request.getScheme() + "://" + request.getServerName() + port + path + "/";%>
<!--车况管理-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>平台收益查询与统计</title>
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="../static/theme/common/bootstrap.min.css" rel="stylesheet">
    <link href="/static/theme/common/global.css" rel="stylesheet">
    <link href="/static/theme/back/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all">
    <script src="/static/library/jquery/jquery-2.1.1.min.js"></script>
    <script src="/static/library/bootstrap/bootstrap.min.js"></script>
    <script src="/static/library/bootstrap/bootstrapValidator.js"></script>
    <script src="/static/library/plugins/layer/layer.js"></script>
    <script src="/static/library/plugins/toastr/toastr.min.js"></script>
    <script src="/static/library/plugins/pace/pace.min.js"></script>
    <script src="/static/library/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/static/library/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="/static/theme/common/global.js"></script>
    <script src="/static/theme/back/js/main.js"></script>
</head>
<body class="gray-bg  pace-done">
<div class="pace  pace-inactive">
    <div class="pace-progress" data-progress-text="100%" data-progress="99" style="width: 100%;">
        <div class="pace-progress-inner"></div>
    </div>
    <div class="pace-activity"></div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <form action="/backcompany/vehicleTJcompany.do"
                              class="form-inline" id="queryForm">
                            <label> 单车id:<input type="text" name="vehicle.imei" value="${imei}"
                                                class="form-control input-sm"></label>
                            <label> 商家:
                                <select class="form-control input-sm" name="companyId" id="companyId">
                                    <c:if test="${bool==true}">
                                        <option value="0">全部</option>
                                    </c:if>
                                    <c:forEach var="k" items="${company}">
                                        <option value="${k.id}"  <c:if test="${k.id==companyId}">selected</c:if>>${k.name}</option>
                                    </c:forEach>
                                </select>
                            </label>
                            <button type="submit" class="btn btn-sm btn-info"><i
                                class="fa fa-search"></i></button>
                            <%--<input type="hidden" name="pageNo">--%>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">
                        <th>序号</th>
                        <th>单车id</th>
                        <th>用户名</th>
                        <th>手机号</th>
                        <th>所属企业</th>
                        <th>押金</th>
                        <th>租金</th>
                        <th>所属维修企业</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${p.list }" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1 }</td>
                            <td>${v.vehicle.imei}</td>
                            <td>${v.user.name}</td>
                            <td>${v.user.userphone}</td>
                            <td>${v.company.name}</td>
                            <td>${v.orderMoney}</td>
                            <td>${v.orderMoney}</td>
                            <td>${v.department.name}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="row">
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-8">
                        <div class="pagination-ul">
                            <mytag:Pagination pagination="${p}" queryForm="queryForm"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-danger pull-right">总</span>
                <h5>总会员</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins" id="data1-1">${allnum}</h1>
                <small>人</small>
            </div>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-success pull-right">月</span>
                <h5>本月新增</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins" id="data1-2">${mothnum}</h1>
                <div class="stat-percent font-bold text-navy"><span id="data1-3">00</span>%</div>
                <small>人</small>
            </div>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-danger pull-right">总</span>
                <h5>押金收入</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins" id="data1-4">${zujin}</h1>
                <small>元</small>
            </div>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-danger pull-right">总</span>
                <h5>租金收入</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins" id="data1-5">${zujin}</h1>
                <small>元</small>
            </div>
        </div>
    </div>

</div>
<%--<div class="row">
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
                <div id="chart1" style="height: 400px;width: 100%;"></div>
            </div>
        </div>
    </div>
</div>--%>
<script src="/plugins/layui/layui.js"></script>
<script>
    $(function () {
        datePicker('#startDate,#endDate', "yyyy-mm-dd", 2);
    });
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
            , layer = layui.layer;
        //总页数低于页码总数
        laypage.render({
            elem: 'demo0'
            , count: 70 //数据总数
            , jump: function (obj) {
            }
        });
    });
</script>
<script type="text/javascript" src="/static/library/plugins/echarts/echarts.min.js"></script>
<script type="text/javascript">
    //    $(function(){
    //        stat(1);
    //
    //
    //        $("input[name='rd']").change(function () {
    //            var type=$("input[name='rd']:checked").val();
    //            stat(type);
    //        });
    //
    //        Ajax.ajax({
    //            url: "/datas/a.json",
    //            params: null,
    //            success: function(data) {
    //                $("#data1-1").html(data.a);
    //                $("#data1-2").html(data.b);
    //                if(data.b!=0){
    //                    $("#data1-3").html((data.a / data.b * 100).toFixed(2));
    //                }
    //                $("#data1-4").html(data.c);
    //                $("#data1-5").html(data.d);
    //            }
    //        });
    //    });
    function stat(type) {
//        var myChart = echarts.init(document.getElementById('chart'));
//        myChart.showLoading({text : '正在努力的读取数据中...'});
//        var myChart1 = echarts.init(document.getElementById('chart1'));
//        myChart1.showLoading({text : '正在努力的读取数据中...'});
//        Ajax.ajax({
//            url: "/datas/b.json",
//            // params: {"type":type},
//            success: function(data) {
//                if (data.code == 0) {
//                    myChart.setOption(
//                        option = {
//                            title: {
//                                text: '会员统计'
//                            },
//                            tooltip : {
//                                trigger: 'axis',
//                                axisPointer: {
//                                    type: 'cross',
//                                    label: {
//                                        backgroundColor: '#6a7985'
//                                    }
//                                },
//                                //data.data.date + (data.data.date==""?'':'-') +
//                                formatter: "{b} <br/> {a}:{c}"
//                            },
//                            legend: {
//                                data:['新增会员','会员总数']
//                            },
//                            toolbox: {
//                                feature: {
//                                    saveAsImage: {}
//                                }
//                            },
//                            grid: {
//                                left: '3%',
//                                right: '4%',
//                                bottom: '3%',
//                                containLabel: true
//                            },
//                            xAxis : [
//                                {
//                                    type : 'category',
//                                    boundaryGap : true,
//                                    data : data.data.x
//                                }
//                            ],
//                            yAxis : [
//                                {
//                                    name : '人',
//                                    type : 'value'
//                                }
//                            ],
//                            series : [
//                                {
//                                    name:'新增会员',
//                                    type:'line',
//                                    stack: '总数',
//                                    // label: {
//                                    //     normal: {
//                                    //         show: true,
//                                    //         position: 'top'
//                                    //     }
//                                    // },
//                                    // areaStyle: {normal: {
//                                    //     opacity: '0'
//                                    // }},
//                                    data:data.data.y
//                                },
//                                {
//                                    name:'会员总数',
//                                    type:'line',
//                                    stack: '总数',
//                                    // label: {
//                                    //     normal: {
//                                    //         show: true,
//                                    //         position: 'top'
//                                    //     }
//                                    // },
//                                    // areaStyle: {normal: {
//                                    //     opacity: '0'
//                                    // }},
//                                    data:data.data.z
//                                }
//
//                            ]
//                        }
//
//                    )
//                } else {
//                    showMsg("未查询到数据", 2);
//                    myChart.dispose();
//                }
//                myChart.hideLoading();
//            }
//        });
//        Ajax.ajax({
//            url: "/datas/h.json",
//            // params: {"type":type},
//            success: function(data) {
//                if (data.code == 0) {
//                    myChart1.setOption(
//                        option = {
//                            title: {
//                                text: '资金管理'
//                            },
//                            tooltip : {
//                                trigger: 'axis',
//                                axisPointer: {
//                                    type: 'cross',
//                                    label: {
//                                        backgroundColor: '#6a7985'
//                                    }
//                                },
//                                //data.data.date + (data.data.date==""?'':'-') +
//                                formatter: "{b} <br/> {a}:{c}"
//                            },
//                            legend: {
//                                data:['诚信金','租金']
//                            },
//                            toolbox: {
//                                feature: {
//                                    saveAsImage: {}
//                                }
//                            },
//                            grid: {
//                                left: '3%',
//                                right: '4%',
//                                bottom: '3%',
//                                containLabel: true
//                            },
//                            xAxis : [
//                                {
//                                    type : 'category',
//                                    boundaryGap : true,
//                                    data : data.data.x
//                                }
//                            ],
//                            yAxis : [
//                                {
//                                    name : '元',
//                                    type : 'value'
//                                }
//                            ],
//                            series : [
//                                {
//                                    name:'诚信金',
//                                    type:'line',
//                                    stack: '总额',
//                                    // label: {
//                                    //     normal: {
//                                    //         show: true,
//                                    //         position: 'top'
//                                    //     }
//                                    // },
//                                    // areaStyle: {normal: {
//                                    //     opacity: '0'
//                                    // }},
//                                    data:data.data.m
//                                },
//                                {
//                                    name:'租金',
//                                    type:'line',
//                                    stack: '总额',
//                                    // label: {
//                                    //     normal: {
//                                    //         show: true,
//                                    //         position: 'top'
//                                    //     }
//                                    // },
//                                    // areaStyle: {normal: {
//                                    //     opacity: '0'
//                                    // }},
//                                    data:data.data.y
//                                }
//
//                            ]
//                        }
//
//                    )
//                } else {
//                    showMsg("未查询到数据", 2);
//                    myChart1.dispose();
//                }
//                myChart1.hideLoading();
//            }
//        });
    }

</script>
</body>
</html>