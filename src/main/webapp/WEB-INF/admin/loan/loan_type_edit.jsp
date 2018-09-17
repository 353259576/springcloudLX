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
<body>

<div class="ibox-content">
    <form class="form-horizontal" id="categoryForm">
        <c:if test="${add }">
            <div class="form-group">
                <label class="col-sm-2 control-label">父分类：</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${pname }</p>
                </div>
            </div>
        </c:if>
        <div class="form-group">
            <label class="col-sm-2 control-label">分类名：</label>
            <div class="col-sm-9">
                <input type="text" id="loanName" name="loanName" value="${loanType.loanName }" class="form-control" placeholder="分类名">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-3 col-sm-offset-2">
                <input type="hidden" id="id" name="id" value="${loanType.id }">
                <input type="hidden" id="parentId" name="parentId" value="${parentId }">
                <button class="btn btn-info btn-block" type="button" id="btn-edit">保存</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(function () {
        $("#btn-edit").click(function(){
            if(checkString("#loanName",2,8)){ toast(2, "", "名称长度2-8位");return; }
            Ajax.ajax({
                url: "admin/loan/LoanTypeEdit.do",
                params: $("#categoryForm").serialize(),
                success: function(data) {
                    if(data.code==0) {
                        showMsg(data.msg,1,function(){parent.location.reload();});
                    } else {showMsg(data.msg,2);}
                }
            });
        });
    });
</script>
</body>
</html>
