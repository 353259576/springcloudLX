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

<form class="ibox-content" id="metForm">
    <div class="alert alert-info">每类材料最多上传<span class="color-red">5</span>张</div>
    <c:forEach items="${types}" var="v" varStatus="vs">
        <c:forEach items="${list}" var="v2" varStatus="vs2">
            <c:if test="${vs.index == vs2.index}">
                <div class="panel panel-default">
                    <div class="panel-heading">${vs.index + 1}.${v.loanName}</div>
                    <div class="panel-body">
                        <input type="hidden" name="material${vs.index + 1}" id="material${vs.index + 1}" value="${v2}">
                        <div img-area-id="material${vs.index + 1}">
                            <c:forTokens items="${v2}" delims="," var="img">
                                <a class="img-area"><img data-open="img" src="${img}" /><span onclick="uploadDel(this,'material${vs.index + 1}')">x</span></a>
                            </c:forTokens>
                            <a class="img-area-btn" onclick="uploadImg(5,'material${vs.index + 1}')"></a>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </c:forEach>

    <div class="text-center">
        <input type="hidden" name="id" value="${mid}">
        <button id="btnSub" type="button" class="btn btn-danger">确认无误,补全资料</button>
    </div>
</form>

<script>
    $(function () {
        var index = parent.layer.getFrameIndex(window.name);

        $("#btnSub").click(function () {
            Ajax.ajax({
                url: "admin/loan/updateMet.do",
                params: $("#metForm").serialize(),
                success: function(data) {
                    if(data.code==0){
                        showMsg(data.msg, 1, function () {
                            parent.layer.close(index);
                        });
                    }else{
                        showMsg(data.msg, 2);
                    }
                }
            });
        });
    });
</script>

</body>
</html>
