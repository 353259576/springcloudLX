<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath();
    String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
    String basePath = request.getScheme() + "://" + request.getServerName() + port + path + "/";%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title></title>
    <%@ include file="../include.jsp"%>
</head>

<body class="gray-bg">

<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <form action="admin/loan/loanReAudit.do" method="post" class="form-inline" id="queryForm">
                            <input type="hidden" name="loanState" value="${loanState}">
                            <label> 用户名/手机号:<input type="text" name="keywords" value="${keywords }" class="form-control input-sm"></label>
                            <label> 真实姓名:<input type="text" name="realname" value="${realname }" class="form-control input-sm"></label>
                            <label> 身份证号码:<input type="text" name="idcardNum" value="${idcardNum }" class="form-control input-sm"></label>
                            <button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">
                        <th>序号</th>
                        <th>用户名</th>
                        <th>真实姓名</th>
                        <th>身份证号码</th>
                        <th>所在地区</th>
                        <th>贷款金额</th>
                        <th>贷款期数</th>
                        <th>年化利率</th>
                        <th>月还款</th>
                        <th>处理信息</th>
                        <th>证件照</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pagination.list }" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1 }</td>
                            <td>${v.user.userName }</td>
                            <td>${v.realname }</td>
                            <td>${v.idcardNum }</td>
                            <td>${v.loanAddr}</td>
                            <td>${v.loanMoney}</td>
                            <td>${v.loanPeroid}</td>
                            <td>${v.loanPer}</td>
                            <td>${v.loanMonth}</td>
                            <td>
                                <fmt:formatDate value="${v.loanCreateTime }" pattern="yyyy-MM-dd HH:mm" var="ct"></fmt:formatDate>
                                <fmt:formatDate value="${v.apprHandleTime }" pattern="yyyy-MM-dd HH:mm" var="ht"></fmt:formatDate>
                                <fmt:formatDate value="${v.backTime }" pattern="yyyy-MM-dd HH:mm" var="bt"></fmt:formatDate>
                                <fmt:formatDate value="${v.collectTime }" pattern="yyyy-MM-dd HH:mm" var="ct2"></fmt:formatDate>
                                <fmt:formatDate value="${v.successTime }" pattern="yyyy-MM-dd HH:mm" var="st"></fmt:formatDate>
                                <fmt:formatDate value="${v.failTime }" pattern="yyyy-MM-dd HH:mm" var="ft"></fmt:formatDate>
                                <fmt:formatDate value="${v.loanTime }" pattern="yyyy-MM-dd" var="lt2"></fmt:formatDate>
                                <a title="申请时间：${ct}<br>回访时间：${bt}<br>收集资料时间：${ct2}<br>成功时间：${st}<br>失败时间：${ft}<br>还款时间：${lt2}<br>
                                处理时间：${ht }<br>处理人：${v.apprHandler }<br>备注：${v.apprRemark }" data-toggle="tooltip" data-placement="bottom" data-html="true">
                                    <i class="fa fa-search"></i>查看</a>
                            </td>
                            <td>
                                <a class="btn-look" data-img0="${v.cardFront}" data-img1="${v.cardBack}"
                                   data-img2="${v.license}"><i class="fa fa-search"></i>点击</a>
                            </td>
                            <td>
                                <a class="btn btn-sm btn-circle btn-warning" title="查看资料" href="admin/loan/loanDetail.do?loanId=${v.id }" data-open="modal"
                                   data-toggle="tooltip" data-placement="top"><i class="fa fa-search"></i></a>
                                <a class="btn btn-sm btn-circle btn-warning" title="查看车辆信息" href="admin/loan/loanDet.do?loanId=${v.id }" data-open="modal"
                                   data-toggle="tooltip" data-placement="top"><i class="fa fa-car"></i></a>
                                <c:if test="${v.loanState == 3}">
                                    <a class="btn btn-sm btn-circle btn-info" title="审核" onclick="audit(${v.id })"
                                       data-toggle="tooltip" data-placement="top"><i class="fa fa-legal"></i></a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-4">

                    </div>
                    <div class="col-sm-8">
                        <div class="pagination-ul">
                            <mytag:Pagination pagination="${pagination}" queryForm="queryForm" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="layer-win layer-edit">
    <form class="form-horizontal" id="apprForm">
        <div class="form-group">
            <label class="col-sm-3 control-label">贷款金额：</label>
            <div class="col-sm-9">
                <input name="loanMoney" id="loanMoney" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">贷款期数：</label>
            <div class="col-sm-9">
                <input name="loanPeroid" id="loanPeroid" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">年化利率：</label>
            <div class="col-sm-9">
                <input name="loanPer" id="loanPer" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">月还款金额：</label>
            <div class="col-sm-9">
                <input name="loanMonth" id="loanMonth" class="form-control">
                <button type="button" id="cal">自动计算</button>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">首次还款时间：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="loanTime" name="loanTime" placeholder="格式：2017-05-01">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-6">
                <input type="hidden" id="loanId" name="loanId">
                <button type="button" class="btn btn-primary" id="btn-save">确定</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    function audit(id){
        $("#loanId").val(id);
        openLayerContent('贷款批复', "500px", "400px", $(".layer-edit"));
    }

    $("#cal").click(function () {
        if($('#loanMoney').val() == "" || $('#loanPeroid').val() == "" || $('#loanPer').val() == ""){
            showMsg("请填写完整信息",2);
            return;
        }
        var money=$("#loanMoney").val();
        var peroid=$("#loanPeroid").val();
        var per=$("#loanPer").val() / 12;
        var res = per * Math.pow(per+1, peroid) / (Math.pow(per+1, peroid) - 1) * money;
        $("#loanMonth").val(res.toFixed(2));
    });

    $("#btn-save").click(function(){
        if($('#loanMoney').val() == "" || $('#loanPeroid').val() == "" || $('#loanPer').val() == ""
            || $('#loanMonth').val() == "" || $("#loanTime").val() == ""){
            showMsg("请填写完整信息",2);
            return;
        }
        Ajax.ajax({
            url:"admin/loan/loanReAppr.do",
            params:$("#apprForm").serialize(),
            success:function(data){
                if(data.code==0) {
                    showMsg(data.msg,1,function(){location.reload();});
                } else {showMsg(data.msg,2);}
            }
        });
    });

    var imgs={
        "title": "",
        "id": '',
        "start": 0,
        "data": [
            {
                "alt": "身份证正面",
                "pid": 0,
                "src": "",
                "thumb": ""
            },
            {
                "alt": "身份证背面",
                "pid": 1,
                "src": "",
                "thumb": ""
            },
            {
                "alt": "营业执照",
                "pid": 2,
                "src": "",
                "thumb": ""
            }
        ]
    }

    $(".btn-look").click(function(){
        imgs.data[0].src = $(this).attr("data-img0");
        imgs.data[1].src = $(this).attr("data-img1");
        imgs.data[2].src = $(this).attr("data-img2");
        layer.photos({
            photos: imgs,
            anim: 0
        });
    });
</script>

</body>
</html>
