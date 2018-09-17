<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/static/theme/common/bootstrap.min.css" rel="stylesheet">
    <link href="/static/theme/common/global.css" rel="stylesheet">
    <link href="/static/theme/back/css/style.min.css" rel="stylesheet">

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
    <script>
        function tixian(companyId) {
            if(companyId==null){
                return;
            }
            var price = $("#withdrawals-input").val();
            $.ajax({
                url: 'admin/present/insert',
                data:{"companyId":companyId,"price":price},
                success: function (data) {
                    if(data.code==0){
                        layer.msg(data.data);
                    }else {
                        layer.msg(data.data);
                        layer.closeAll();
                    }
                },
                error : function() {
                }
            });
        }
    </script>



</head>
<%--<%
	long date = new Date().getTime(); // 服务器时间
	String remote = request.getHeader("x-forwarded-for")==null?request.getRemoteAddr():request.getHeader("x-forwarded-for"); // 访问IP
	double[] arr = new SystemUtil().getSpace();// 磁盘、磁盘使用
%>--%>


<body class="gray-bg  pace-done"><div class="pace  pace-inactive"><div class="pace-progress" data-progress-text="100%" data-progress="99" style="width: 100%;">
    <div class="pace-progress-inner"></div>
</div>
    <div class="pace-activity"></div></div>
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <form action="" method="post" class="form-inline" id="queryForm">
                            <label> 运营商家:
                                <select class="form-control input-sm" name="companyId" id="companyId">
                                    <c:if test="${bool==true}">
                                        <option value="0">全部</option>
                                    </c:if>
                                    <c:forEach var="k" items="${companies}">
                                        <option value="${k.id}"  <c:if test="${k.id==companyId}">selected</c:if>>${k.name}</option>
                                    </c:forEach>
                                </select>

                            </label>
                            <label> 时间:
                                <select class="form-control input-sm" name="pd" id="pd">
                                    <option value="0"  <c:if test="${pd==0}">selected</c:if>>当月</option>
                                    <option value="1"  <c:if test="${pd==1}">selected</c:if>>上一个月</option>
                                    <option value="2"  <c:if test="${pd==2}">selected</c:if>>上二个月</option>
                                </select>

                            </label>
                            <button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
                            <label><input type="button" class="btn btn-sm btn-danger" onclick="formReset()" value="重置"></label>
                            <script type="text/javascript">
                                function formReset(){
                                    document.getElementById("queryForm").reset()
                                }
                            </script>
                            <input type="hidden" name="pageNo">
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">
                        <th>历史总收益</th>
                        <th>总余额</th>
                        <th>可提现金额</th>
                        <th>冻结金额</th>
                        <th>账期</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${companyId==null}">

                    </c:if>



                    <tr>
                        <td>${allRealPrice}</td>
                        <td>${yue}</td>
                        <td>${ketixianyue}</td>
                        <td>${dongjie}</td>
                        <td><c:if test="${company != null}">
                            每月${company.zhangqi}号到账
                        </c:if></td>
                        <td><c:if test="${company != null}"> <a onclick="repair(${company.id})">申请提现</a></c:if></td>
                    </tr>
                    </tbody>
                </table>
                <div class="layer-win layer-edit">
                    <form class="form-horizontal" id="apprForm">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">输入金额</label>
                            <div class="col-sm-8">
                                <input type="text" name="money" oninput="onlyNum(this)" value="" id="withdrawals-input" class="form-control input-sm" placeholder="提现金额为10的整数倍">
                            </div>
                        </div>
                    </form>
                    <div class="form-group car-button">
                        <div class="col-sm-6 col-sm-offset-3 ">
                            <button type="button" class="btn btn-primary" id="withdrawals-btn" onclick="tixian(${companyId})" style="display:block; margin:30px auto;" >确定</button>
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
										<input name="rd" type="radio" id="r3" value="1" checked>
										<label for="r3">本月</label>
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
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function repair(){
        openLayerContent('申请提现', 600, 450, $(".layer-edit"));
    }
    function onlyNum(obj){
        if(obj.value != obj.value.replace(/\D/gi, '')){
            obj.value = obj.value.replace(/\D/gi, '');
        }
    }
    $(function(){
        $("#withdrawals-btn").click(function(){
            var money = $("#withdrawals-input").val();
            if(money==""){
                showMsg("输入提现金额");
                return false;
            }
            if(money%10==0) {
                return true;
            }else{
                showMsg("提现金额为10的整数倍")
                return false;
            }
            showMsg(money);
            $.ajax({
                url: 'url',
                data:{"money":money},
                success: function (data) {
                    console.log(data);
                },
                error : function() {
                }
            });
        });
    });
</script>
<script type="text/javascript" src="/static/library/plugins/echarts/echarts.min.js"></script>
<script type="text/javascript">
    $(function(){
        stat();
    });
    function stat(){
        var myChart = echarts.init(document.getElementById('chart'));
        var myChart1 = echarts.init(document.getElementById('chart1'));
        var json1 ='${orderMap1}';
        var json2 ='${orderMap2}';
        obj1 = JSON.parse(json1);
        obj2 = JSON.parse(json2);
        console.log(obj1)
        console.log(obj1.x)

        myChart.setOption(
            option = {
                title: {
                    text: '预计每日单量'
                },
                tooltip : {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross',
                        label: {
                            backgroundColor: '#6a7985'
                        }
                    },
                    formatter: '{a} <br/>{b} : {c}'
                },
                legend: {
                    data:['每日单量曲线']
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
                        data : obj2.x
                    }
                ],
                yAxis : [
                    {
                        name : '单量',
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'每日单量曲线',
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
                        data:obj2.y
                    }
                ]
            }
        )

        myChart1.setOption(
            option = {
                title: {
                    text: '预计收益'
                },
                tooltip : {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross',
                        label: {
                            backgroundColor: '#6a7985'
                        }
                    },
                    formatter: '{a} <br/>{b} : {c}'
                },
                legend: {
                    data:['预计收益总额']
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
                        data : obj1.x
                    }
                ],
                yAxis : [
                    {
                        name : '元',
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'每日收益总额',
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
                        data:obj1.y
                    }
                ]
            }

        )

    }

</script>
</body>
</html>