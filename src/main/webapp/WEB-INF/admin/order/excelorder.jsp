<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<meta charset="utf-8">
<%@ taglib uri="http://www.xujunfei.com/tags" prefix="mytag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<% String path = request.getSession().getServletContext().getContextPath();
    String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
    String basePath = request.getScheme() + "://" + request.getServerName() + port + path + "/";%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>用车订单</title>
    <link href="../static/theme/common/bootstrap.min.css" rel="stylesheet">
    <link href="../static/theme/common/global.css" rel="stylesheet">
    <link href="../static/theme/back/css/style.min.css" rel="stylesheet">

    <script src="../static/library/jquery/jquery-2.1.1.min.js"></script>
    <script src="../static/library/bootstrap/bootstrap.min.js"></script>
    <script src="../static/library/bootstrap/bootstrapValidator.js"></script>
    <script src="../static/library/plugins/layer/layer.js"></script>
    <script src="../static/library/plugins/toastr/toastr.min.js"></script>
    <script src="../static/library/plugins/pace/pace.min.js"></script>
    <script src="../static/library/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../static/library/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../static/theme/common/global.js"></script>
    <script src="../static/theme/back/js/main.js"></script>
    <script src="../static/theme/common/global.js"></script>
    <style>
        .header{height:auto; position: relative;}
        .header .nav li .second-nav ,.header .nav li .third-nav{display:none;background: #fff; color:#333; z-index: 99999}
        .second-nav{ position: relative; top:0px; }
        .second-nav li:last-child{padding-bottom:10px !important}
        .second-nav li a{display: block; width:100%; height:100%}
        .second-nav li:hover ,.third-nav li:hover{background: #009688; ;}
        .second-nav li:hover a,.third-nav li:hover a{color:#fff }
        .nav li{width:100%; height:30px; line-height:30px; font-size:14px; padding:0px 15px; display: block;}
        .third-nav li a{color: #333 !important}
        .third-nav li:hover a{color:#fff !important }
        .third-nav{position:absolute;left:100%; width:150px; height:auto; margin-top:-30px}
    </style>
    <script type="text/javascript">
        $(function(){
            var _this1=null;
            $('.nav>li').hover(function(){
                _this1=$(this);
                _this1.find('.second-nav').show();
                var _this2=null;
                _this1.find('.second-nav').find('li').hover(function(){
                    _this2=$(this);
                    _this2.find('.third-nav').show();
                    _this2.find('.third-nav').hover(function(){
                        $(this).show();
                    },function(){
                        $(this).hide();
                    });
                },function(){
                    _this2.find('.third-nav').hide();
                });
            },function(){
                _this1.find('.second-nav').hide();
            });
            $(document).on("click",".lia",function(){
                $(".dot").val($(this).text())
                $("input").blur();
                var selectvalue=$(this).attr("id");
                $('.dot').attr('id',selectvalue);
                if(selectvalue==null||selectvalue=="0"){
                    $("#departmentId").val(null);
                    $("#companyId").val(null);
                }else {
                    var valuelist = selectvalue.split("-");
                    if(valuelist[0]=="1"){
                        $("#companyId").val(valuelist[1])
                        $("#departmentId").val(null);
                    }else if(valuelist[0]=="2"){
                        $("#departmentId").val(valuelist[1])
                        $("#companyId").val(null);
                    }
                }

                $('.second-nav').hide();
            })
        });
    </script>
    <script>
        function changeselect() {
            var selectvalue = $("#myselect").val();
            if(selectvalue==null||selectvalue=="0"){
                $("#departmentId").val(null);
                $("#companyId").val(null);
            }else {
                var valuelist = selectvalue.split("-");
                if(valuelist[0]=="1"){
                    $("#companyId").val(valuelist[1])
                    $("#departmentId").val(null);
                }else if(valuelist[1]=="2"){
                    $("#departmentId").val(valuelist[1])
                    $("#companyId").val(null);
                }
            }
        }


        function deleteorder(id) {
            layer.confirm('你确定要删除该订单', {
                btn: ['删除','取消'] //按钮
            }, function(){
                $.ajax({
                    type:"post",
                    url:"/admin/order/deleteusermag",
                    data:{"id":id},
                    async:true,
                    success:function (data) {
                        if(data.code==1){
                            layer.msg('删除完毕', {icon: 1});
                            window.location.reload();
                        }else {
                            layer.msg(data.data);
                        }

                    }
                });



            });
        }



       function openupdateorder(id){
           layer.open({
               type: 2,
               title: '订单修改',
               shadeClose: true,
               shade: 0.8,
               area: ['40%', '90%'],
               content: 'admin/order/openupdateorder?id='+id //iframe的url
           });
       }
       
       function makeExcel() {
           var path = "admin/order/makeexcel";
           var list = new Array();
           var listName = new Array();
           var k = 0;
           var companyName = $("#companyName").val();
           var departmentName = $("#departmentName").val();
           var orderName = $("#orderName").val();
           var startTime = $("#startTime").val();
           var endTime = $("#endTime").val();
           if(companyName != null&&companyName != ""){
               list[k] = companyName;
               listName[k] = "companyName";
               k++;
           }
           if(departmentName != null&&departmentName != ""){
               list[k] = departmentName;
               listName[k] = "departmentName";
               k++;
           }
           if(orderName != null&&orderName != ""){
               list[k] = orderName;
               listName[k] = "orderName";
               k++;
           }
           if(startTime != null&&startTime != ""){
               list[k] = startTime;
               listName[k] = "startTime";
               k++;
           }
           if(endTime != null&&endTime != ""){
               list[k] = endTime;
               listName[k] = "endTime";
               k++;
           }
           if(k>0){
               path += "?"+listName[0]+"="+list[0];
           }
           for(var i = 1; i < k; i++){
               path += "&"+listName[i]+"="+list[i];
           }
           console.log(path);
           window.open(path);
       }


       function startshijian() {
           var starttime = $("#startDate").val();
           $("#startTime").val(starttime);
       }
        function endshijian() {
            var endTime = $("#endDate").val();
            $("#endTime").val(endTime);
        }

    </script>
</head>
<body class="gray-bg">
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <form action="/admin/order/selectexcelusermsg" method="post" class="form-inline"
                              id="queryForm">
                           <%-- <label> 单车企业:<input type="text" name="companyId" id="companyId" value="${companyId}"
                                                class="form-control input-sm"></label>--%>
                            <%--<label>单车企业:
                                <select class="form-control input-sm" name="companyId"
                                        id="companyId">

                                <option value="0">--全部--</option>
                                <c:forEach items="${list }" var="v" varStatus="vs">
                                    <option value="${v.id}">${v.name}</option>
                                </c:forEach>
                                </select>
                            </label>
--%>
                           <%-- <label> 运营商家或网点:
                                <select class="form-control input-sm" name="myselect" id="myselect" onchange="changeselect()">
                                    <c:if test="${bool==true}">
                                        <option value="0">全部</option>
                                    </c:if>
                                    <c:forEach var="k" items="${companies}">
                                        <option value="1-${k.id}"  <c:if test="${k.id==companyId}">selected</c:if>>${k.name}</option>
                                    </c:forEach>
                                    <c:forEach var="k" items="${departments}">
                                        <option value="2-${k.id}"  <c:if test="${k.id==departmentId}">selected</c:if>>${k.name}</option>
                                    </c:forEach>
                                </select>

                            </label>--%>


                               <label> 公司名称:<input type="text" name="companyName" id="companyName" value="${excelSaveUserMsg.companyName}"
                                                   class="form-control input-sm"></label>
                               <label> 网点名称:<input type="text" name="departmentName" id="departmentName" value="${excelSaveUserMsg.departmentName}"
                                                   class="form-control input-sm"></label>






                            <label> 订单名称:<input type="text" name="orderName" id="orderName" value="${excelSaveUserMsg.orderName}"
                                                class="form-control input-sm"></label>
                            <label> 创建时间:
                                <input type="text" class="form-control input-sm" id="startDate"
                                       name="startDate" placeholder="开始时间" onchange="startshijian()">
                                <input type="hidden" id="startTime" name="startTime" value="${excelSaveUserMsg.startTime}">
                                <input type="text" class="form-control input-sm" id="endDate"
                                       name="endDate" placeholder="结束时间" onchange="endshijian()">
                                <input type="hidden" id="endTime" name="endTime" value="${excelSaveUserMsg.endTime}">
                            </label>

                            <button type="submit" class="btn btn-sm btn-info"><i
                                class="fa fa-search"></i></button>
                            <a onclick="makeExcel()">生成EXCEL文件</a>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered" id="ta">
                    <thead>
                    <tr role="row">
                        <th>序号</th>
                        <th>ID</th>
                        <th>用户姓名</th>
                        <th>用户号码</th>
                        <th>订单名称</th>
                        <th>订单数量</th>
                        <th>订单备注</th>
                        <th>公司名称</th>
                        <th>网点名称</th>
                        <th>创建时间</th>
                        <th>创建用户</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pagination.list }" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1 }</td>
                            <td>${v.id }</td>
                            <td>${v.userName}</td>
                            <td>${v.userPhone}</td>
                            <td>${v.orderName}</td>
                            <td>${v.orderNum}</td>
                            <td>${v.orderRemake}</td>
                            <td>${v.companyName}</td>
                            <td>${v.departmentName}</td>
                            <td><fmt:formatDate value="${v.createDate}"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${v.adminName}</td>
                            <td><a onclick="deleteorder(${v.id})">删除</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-8">
                        <div class="pagination-ul">
                            <mytag:Pagination pagination="${pagination}" queryForm="queryForm"/>
                        </div>
                    </div>
                </div>
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
           &lt;%&ndash; <div class="panel-body">
                <div id="chart" style="height: 400px;width: 100%;"></div>
            </div>&ndash;%&gt;
        </div>
    </div>
</div>--%>
<script type="text/javascript">
    $(function () {
        datePicker('#startDate,#endDate', "yyyy-mm-dd", 2);
    });
    var idTmr;

    function getExplorer() {
        var explorer = window.navigator.userAgent;
        //ie
        if (explorer.indexOf("MSIE") >= 0) {
            return 'ie';
        }
        //firefox
        else if (explorer.indexOf("Firefox") >= 0) {
            return 'Firefox';
        }
        //Chrome
        else if (explorer.indexOf("Chrome") >= 0) {
            return 'Chrome';
        }
        //Opera
        else if (explorer.indexOf("Opera") >= 0) {
            return 'Opera';
        }
        //Safari
        else if (explorer.indexOf("Safari") >= 0) {
            return 'Safari';
        }
    }

    function method1(tableid) {//整个表格拷贝到EXCEL中
        if (getExplorer() == 'ie') {
            var curTbl = document.getElementById(tableid);
            var oXL = new ActiveXObject("Excel.Application");

            //创建AX对象excel
            var oWB = oXL.Workbooks.Add();
            //获取workbook对象
            var xlsheet = oWB.Worksheets(1);
            //激活当前sheet
            var sel = document.body.createTextRange();
            sel.moveToElementText(curTbl);
            //把表格中的内容移到TextRange中
            sel.select();
            //全选TextRange中内容
            sel.execCommand("Copy");
            //复制TextRange中内容
            xlsheet.Paste();
            //粘贴到活动的EXCEL中
            oXL.Visible = true;
            //设置excel可见属性

            try {
                var fname = oXL.Application.GetSaveAsFilename("Excel.xls",
                    "Excel Spreadsheets (*.xls), *.xls");
            } catch (e) {
                print("Nested catch caught " + e);
            } finally {
                oWB.SaveAs(fname);

                oWB.Close(savechanges = false);
                //xls.visible = false;
                oXL.Quit();
                oXL = null;
                //结束excel进程，退出完成
                //window.setInterval("Cleanup();",1);
                idTmr = window.setInterval("Cleanup();", 1);

            }

        }
        else {
            tableToExcel('ta');
        }
    }

    $("#type").change(function () {
        var type = $(this).val();
//        orderselect(type);
    });
    //    function orderselect(type){
    //        Ajax.ajax({
    //            url: "url",
    //            params: {"type":type},
    //            success: function(data) {
    //
    //            }
    //        });
    //    }

    function Cleanup() {
        window.clearInterval(idTmr);
        CollectGarbage();
    }

    var tableToExcel = (function () {
        var uri = 'data:application/vnd.ms-excel;base64,',
            template = '<html><head><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',
            base64 = function (s) {
                return window.btoa(unescape(encodeURIComponent(s)))
            },
            format = function (s, c) {
                return s.replace(/{(\w+)}/g,
                    function (m, p) {
                        return c[p];
                    })
            }
        return function (table, name) {
            if (!table.nodeType) table = document.getElementById(table)
            var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
            window.location.href = uri + base64(format(template, ctx))
        }
    })();
</script>


<script type="text/javascript" src="/static/library/plugins/echarts/echarts.min.js"></script>
<script type="text/javascript">
    $(function () {
        stat(1);
        $("input[name='rd']").change(function () {
            var type = $("input[name='rd']:checked").val();
//            stat(type);
        });

        Ajax.ajax({
            url: "/datas/a.json",
            params: null,
            success: function (data) {
                $("#data1-1").html(data.d);
                $("#data1-2").html(data.b);
                $("#data1-3").html(data.c);
            }
        });
    });

    function stat(type) {
        var myChart = echarts.init(document.getElementById('chart'));
        myChart.showLoading({text: '正在努力的读取数据中...'});

        Ajax.ajax({
            url: "/datas/h.json",
            // params: {"type":type},
            success: function (data) {
                if (data.code == 0) {
                    myChart.setOption(
                        option = {
                            title: {
                                text: '资金管理'
                            },
                            tooltip: {
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
                                data: ['诚信金', '押金', '维修']
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
                            xAxis: [
                                {
                                    type: 'category',
                                    boundaryGap: true,
                                    data: data.data.x
                                }
                            ],
                            yAxis: [
                                {
                                    name: '元',
                                    type: 'value'
                                }
                            ],
                            series: [
                                {
                                    name: '诚信金',
                                    type: 'line',
                                    stack: '总额',
                                    // label: {
                                    //     normal: {
                                    //         show: true,
                                    //         position: 'top'
                                    //     }
                                    // },
                                    // areaStyle: {normal: {
                                    //     opacity: '0'
                                    // }},
                                    data: data.data.m
                                },
                                {
                                    name: '押金',
                                    type: 'line',
                                    stack: '总额',
                                    // label: {
                                    //     normal: {
                                    //         show: true,
                                    //         position: 'top'
                                    //     }
                                    // },
                                    // areaStyle: {normal: {
                                    //     opacity: '0'
                                    // }},
                                    data: data.data.y
                                },
                                {
                                    name: '维修',
                                    type: 'line',
                                    stack: '总额',
                                    // label: {
                                    //     normal: {
                                    //         show: true,
                                    //         position: 'top'
                                    //     }
                                    // },
                                    // areaStyle: {normal: {
                                    //     opacity: '0'
                                    // }},
                                    data: data.data.z
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


</body>
</html>
