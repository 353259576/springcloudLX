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
    <meta charset="utf-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
    <script src="http://malsup.github.io/min/jquery.form.min.js"></script>

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
                        <form action="/backcompany/userExamine.do" method="post" class="form-inline" id="queryForm">
                            <label> 手机号:<input type="text" name="userphone" id="userphone" value="${userphone}"
                                               class="form-control input-sm"></label>
                            <label> 状态:
                                <select class="form-control input-sm" name="status" id="status">
                                    <option value="99" ${99 eq status? 'selected':'' }>全部</option>
                                    <option value="0" ${0 eq status? 'selected':'' }>认证中</option>
                                    <option value="1" ${1 eq status? 'selected':'' }>已认证</option></td>
                                    <option value="2" ${2 eq status? 'selected':'' }>未通过</option></td>
                                </select>
                            </label>
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
                            <input type="hidden" name="pageNo">
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">
                        <th>序号</th>
                        <th>用户名</th>
                        <th>手机号</th>
                        <th>身份证</th>
                        <th>所属企业</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pagination.list}" var="v" varStatus="vs">
                            <td>${vs.index+1 }</td>
                            <td>${v.userId.name}<input type="hidden" value="${v.userId.id}" class="userid"></td>
                            <td>${v.userId.userphone}</td>
                            <td>${v.userId.idCode}</td>
                        <td>${v.companyId.name}</td>
                                <%-- ${}--%>
                            <td>
                                <select class="form-control input-sm" name="status" disabled="true" >
                                   <%-- <option value="" ${99 eq v.status?'selected':''  }>全部</option>--%>
                                    <option value="0" ${0 eq v.status?'selected':'' }>认证中</option>
                                    <option value="1" ${1 eq v.status?'selected':'' }>已认证</option>
                                    <option value="2" ${2 eq v.status?'selected':'' }>未通过</option>
                                 </select>
                            <td>
                                <a class="btn btn-sm btn-circle btn-warning" title=""
                                   onclick="examine(${v.id})"><i class="fa fa-info-circle"></i></a>
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
                            <mytag:Pagination pagination="${pagination}" queryForm="queryForm"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="layer-win layer-edit">
    <form class="form-horizontal" id="apprForm" action="/backcompany/updateExamine.do">
        <div class="form-group">
            <label class="col-sm-4 control-label">选项：</label>
            <div class="col-sm-8">
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="agree" value="1" name="agree"
                           class="hide_radio hide_radio1" checked="value">
                    <label for="agree">同意认证</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="disagree" value="2" name="agree"
                           class="hide_radio hide_radio1">
                    <label for="disagree">不同意</label>
                </div>
            </div>
        </div>
        <div class="form-group" id="comment">
            <label class="col-sm-4 control-label">备注：</label>
            <div class="col-sm-9">
                <textarea name="question" id="question" rows="4" class="form-control"
                          placeholder="备注"></textarea>
            </div>
        </div>
        <input type="hidden" id="examineid" value="" name="examineid">
        <div class="form-group car-button">
            <div class="col-sm-6 col-sm-offset-3">
                <button type="submit" class="btn btn-primary" id="agreebutton"
                        style="display:block; margin:30px auto;">确定
                </button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    function examine(obj) {
        //openLayerContent('审核', 500, 400, $(".layer-win"));
        $("#examineid").val(obj);
        layer.open({
            type: 1,
            title: "认证",
            closeBtn: 0,
            area: '516px',
            shadeClose: true,
            content: $('.layer-edit')
        });
    }

    $(function(){
        /** 验证文件是否导入成功  */
        $("#apprForm").ajaxForm(function(data){
            if(data.data=="1"){
                alert("提交成功！");
                location.reload();
            }
        });
    });
</script>
</body>
</html>