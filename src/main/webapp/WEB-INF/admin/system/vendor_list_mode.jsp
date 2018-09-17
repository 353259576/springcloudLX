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
    <link href="static/library/plugins/iCheck/custom.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <form action="admin/system/vendorList.do" method="post" class="form-inline" id="queryForm">
                            <input type="hidden" name="groupId" value="${groupId }">
                            <label> 商家名:<input type="text" name="name" value="${name}" class="form-control input-sm"></label>
                            <button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">
                            <th>选择</th>
                            <th>序号</th>
                            <th>名称</th>
                            <th>类型</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pagination.list }" var="v" varStatus="vs">
                        <tr>
                            <td>
                                <input type="radio" class="i-checks" name="val" p1="${v.id }" p2="${v.name }" p3="1" />
                            </td>
                            <td>${vs.index+1 }</td>
                            <td>${v.name }</td>
                            <td><a class="btn btn-info" data-open="modal" href="/admin/system/vendorList?companyId=${v.id}&groupId=${groupId}">运营商家</a></td>
                        </tr>
                    </c:forEach>
                    <c:forEach items="${pagination1.list }" var="v" varStatus="vs">
                        <tr>
                            <td>
                                <input type="radio" class="i-checks" name="val" p1="${v.id }" p2="${v.name }"  p3="2" />
                            </td>
                            <td>${vs.index+1 }</td>
                            <td>${v.name }</td>
                            <td>商家网点</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
               <div class="row">
                    <div class="col-sm-4">
                        <button class="btn btn-sm btn-info ml10" id="choose">确定选择</button>
                        <button class="btn btn-sm btn-warning" id="closeWin">关闭</button>
                    </div>
                    <div class="col-sm-8">
                        <nav aria-label="Page navigation" style="text-align: right">
                            <ul class="pagination">
                                <li onclick="tiaozhuan(1)" ><a>首页</a></li>
                                <c:if test="${pagination.pageNo>1}">
                                    <li onclick="tiaozhuan(${pagination.pageNo-1})"><a>上一页</a></li>
                                </c:if>

                                <c:forEach var="i" begin="1" end="${pagination.totalPage}">
                                    <c:choose>
                                        <c:when test="${pagination.pageNo==i}">
                                            <li class="active"><a>${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li onclick="tiaozhuan(${i})"><a>${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${pagination.pageNo < pagination.totalPage}">
                                    <li onclick="tiaozhuan(${pagination.pageNo+1})"><a>下一页</a></li>
                                </c:if>
                                <li onclick="tiaozhuan(${pagination.totalPage})"><a>末页</a></li>
                            </ul>
                        </nav>
                        <%--<div class="pagination-ul">
                            <mytag:Pagination pagination="${pagination}" queryForm="queryForm" />
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="static/library/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
    function tiaozhuan(pagenum) {
        window.location.href = "${ctx}/admin/system/vendorList.do?pageNo="+pagenum+"&groupId=${groupId}";
    }
    function dealData(vendor) {
        parent.dealData(vendor);
        parent.layer.close(index);
    }

    $(function(){
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green'
        });

        // 全选-全不选
        $("#chooseAll").on("ifChecked",function() {
            $("input[type=checkbox][name='val']").iCheck("check");
        });
        $("#chooseAll").on("ifUnchecked",function() {
            $("input[type=checkbox][name='val']").iCheck("uncheck");
        });

        var index = parent.layer.getFrameIndex(window.name);
        $("#closeWin").click(function(){
            parent.layer.close(index);
        });

        $("#choose").click(function(){
            var t=$("input[name='val']:checked");
            if(typeof(t.val())=="undefined"){
                toast(2, "", "请选择商家");
                return;
            }
            var js={"id":t.attr("p1"),"name":t.attr("p2"),"mode":t.attr("p3")};
            parent.dealData(js);
            parent.layer.close(index);
        });
    });
</script>
</body>
</html>
