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
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <form action="${ctx}/admin/activity/activitylist.do" method="post" class="form-inline" id="queryForm">
                            <label> 用户名/手机号:<input type="text" name="name" value="${activity.name}" class="form-control input-sm"></label>
                            <label> 活动时间:<input type="text" class="form-control input-sm" id="sstartTime" name="sstartTime"  value="${activity.startTime}">
                                <input type="text" class="form-control input-sm" id="sendTime" name="sendTime"  value="${activity.endTime}"> </label>
                            <button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">
                        <th>序号</th>
                        <th>活动名称</th>
                        <th>图片</th>
                        <th>活动地址</th>
                        <th>活动开始时间</th>
                        <th>活动结束时间</th>
                        <th>活动类型</th>
                        <th>活动创建时间</th>
                        <th>最后修改时间</th>
                        <td>创建人</td>
                        <th>修改人</th>

                       <%-- &lt;%&ndash;<th>排序<i class="fa fa-question-circle" title="序号越小排名越靠前" data-toggle="tooltip" data-placement="bottom"></i></th>&ndash;%&gt;--%>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pagination.list}" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1 }</td>
                            <td>${v.name }</td>
                            <td><img src="${v.imgUrl }" class="img-thumbnail" width="100"></td>
                            <td>${v.toUrl}</td>
                            <%--<td>${v.startTime }</td>
                            <td>${v.endTime }</td>--%>
                            <td><fmt:formatDate value="${v.startTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td><fmt:formatDate value="${v.endTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td>${v.status}</td>
                            <td><fmt:formatDate value="${v.createTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td><fmt:formatDate value="${v.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td>${v.createUser.adminName}</td>
                            <td>${v.updateUser.adminName}</td>
                            <td><a class="btn btn-sm btn-circle btn-warning" href="${ctx}/admin/activity/openEditpage.do?id=${v.id }" title="编辑"
                                   data-open="modal" data-toggle="tooltip" data-placement="top"><i class="fa fa-info-circle"></i></a>
                                <a class="btn btn-sm btn-circle btn-danger btn-enable" title="删除" data-id="${v.id }"
                                   data-toggle="tooltip" data-placement="top"><i class="fa fa-times"></i></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-4 clearfix">
                        <a class="btn btn-sm btn-info" href="admin/activity/openEditpage.do" title="添加活动"
                           data-open="modal"><i class="fa fa-plus"></i>添加活动</a>
                    </div>
                    <c:if test="${activity == null}">
                    <div class="col-sm-8 clearfix" style="text-align: right;margin-top: -25px">
                        <nav aria-label="Page navigation">
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
                                <li onclick="tiaozhuan(${pagination.totalPage})"><a>末页</a></lion>
                            </ul>
                        </nav>

                    </div>
                    </c:if>
                </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
        $(function(){
            datePicker('#sstartTime,#sendTime',"yyyy-mm-dd HH:mm:ss",2);
        });
    function tiaozhuan(pagenum) {
        window.location.href = "${ctx}/admin/activity/activitylist.do?pageNo="+pagenum;
    }
    $(function () {
        $(".btn-enable").click(function () {
            var title = $(this).attr("title") == "" ? $(this).attr("data-original-title") : $(this).attr("title");
            layerConfirm('确定要'+ title +'该活动吗',
                "${ctx}/admin/activity/deleteActivity.do", {"id":$(this).attr('data-id')});
        });
    });
</script>
</body>
</html>
