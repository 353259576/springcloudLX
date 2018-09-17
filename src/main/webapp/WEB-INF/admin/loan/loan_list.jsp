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
                        <form action="admin/loan/loanList.do" method="post" class="form-inline" id="queryForm">
                            <input type="hidden" name="type" value="${loanType}">
                            <label> 用户名/手机号:<input type="text" name="keywords" value="${keywords }" class="form-control input-sm"></label>
                            <label> 真实姓名:<input type="text" name="realname" value="${realname }" class="form-control input-sm"></label>
                            <label> 身份证号码:<input type="text" name="idcardNum" value="${idcardNum }" class="form-control input-sm"></label>
                            <label> 状态:<select class="form-control input-sm" name="loanState">
                                <option value="" ${empty loanState?'selected':'' }>全部</option>
                                <option value="0" ${0 eq loanState?'selected':'' }>申请中</option>
                                <option value="1" ${1 eq loanState?'selected':'' }>已回访</option>
                                <option value="2" ${2 eq loanState?'selected':'' }>收集资料中</option>
                                <option value="3" ${3 eq loanState?'selected':'' }>贷款成功</option>
                                <option value="4" ${4 eq loanState?'selected':'' }>申请失败</option>
                                <option value="5" ${5 eq loanState?'selected':'' }>已贷款</option>
                            </select>
                            </label>
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
                        <th>预估可贷金额</th>
                        <th>贷款期数</th>
                        <th>处理信息</th>
                        <th>状态</th>
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
                                <c:if test="${v.loanState == 0}">申请中</c:if>
                                <c:if test="${v.loanState == 1}">已回访</c:if>
                                <c:if test="${v.loanState == 2}">收集资料中</c:if>
                                <c:if test="${v.loanState == 3}">贷款成功</c:if>
                                <c:if test="${v.loanState == 4}">申请失败</c:if>
                                <c:if test="${v.loanState == 5}">已贷款</c:if>
                            </td>
                            <td>
                                <a class="btn-look" data-img0="${v.cardFront}" data-img1="${v.cardBack}"
                                   data-img2="${v.license}"><i class="fa fa-search"></i>点击</a>
                            </td>
                            <td>
                                <a class="btn btn-sm btn-circle btn-warning" title="查看资料/提交资料" href="admin/loan/loanDetail.do?loanId=${v.id }" data-open="modal"
                                   data-toggle="tooltip" data-placement="top"><i class="fa fa-search"></i></a>
                                <a class="btn btn-sm btn-circle btn-warning" title="查看车辆信息" href="admin/loan/loanDet.do?loanId=${v.id }" data-open="modal"
                                   data-toggle="tooltip" data-placement="top"><i class="fa fa-car"></i></a>
                                <c:if test="${v.loanState == 0 || v.loanState == 1 || v.loanState == 2}">
                                    <a class="btn btn-sm btn-circle btn-info" title="审核" onclick="audit(${v.id },${v.loanState })"
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
            <label class="col-sm-3 control-label">选项：</label>
            <div class="col-sm-9">
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="r1" value="1" name="state">
                    <label for="r1">已回访</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="r2" value="2" name="state">
                    <label for="r2">收集资料中</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="r3" value="3" name="state">
                    <label for="r3">同意申请</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="r4" value="4" name="state">
                    <label for="r4">拒绝申请</label>
                </div>
            </div>
        </div>
        <div class="form-group" id="comment">
            <label class="col-sm-3 control-label">备注：</label>
            <div class="col-sm-9">
                <textarea name="remark" id="remark" rows="4" class="form-control" placeholder="备注"></textarea>
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
    function audit(id,state){
        $("#loanId").val(id);
        $('input:radio[value="'+state+'"]').attr('checked',true);
        openLayerContent('贷款审核', 500, 300, $(".layer-edit"));
    }

    $("#btn-save").click(function(){
        if($('input[name="state"]:checked').val() == null){
            showMsg("请选择一项",2);
            return;
        }
        Ajax.ajax({
            url:"admin/loan/loanAppr.do",
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
