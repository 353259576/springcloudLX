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
    <script>
        function insertorder(departmentId) {
                layer.open({
                    type: 2,
                    title: '订单添加',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['40%', '90%'],
                    content: 'admin/order/openupdateorder?departmentId='+departmentId //iframe的url
                });
            }

        function openExcel(departmentId) {
            layer.open({
                type: 2,
                title: 'excel查看',
                shadeClose: true,
                shade: 0.8,
                area: ['90%', '90%'],
                content: 'admin/company/selectexcel?departmentId='+departmentId //iframe的url
            });
        }
        
        function insertUserMsg(id) {
            layer.open({
                type: 2,
                title: '补增数据',
                shadeClose: true,
                shade: 0.8,
                area: ['90%', '90%'],
                content: 'admin/company/insertusermsgpage?departmentId='+id //iframe的url
            });

        }
        


        function uploadExcel(departmentId) {
            //var departmentId = $("#departmentId").val();
            var formData = new FormData();
            var uploadTime = $("#"+departmentId+"uploadTime").val();
            formData.append("departmentId",departmentId);
            formData.append("uploadTime",uploadTime);
            formData.append("excelFile",document.getElementById(departmentId+"excelFile").files[0]);


            $.ajax({
                type:"post",
                url:"admin/company/insertexcelusermsg",
                processData:false,
                contentType: false,
                data:formData,
                async:true,
                success:function (data) {
                    if(data.code==1){
                        window.location.reload();
                    }else {
                        layer.msg(data.data);
                    }

                }
            });
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
                        <form action="/admin/company/selectdepartment" method="post" class="form-inline" id="queryForm">
                            <label> 网点名称:<input type="text" name="companyName" value="" class="form-control input-sm"></label>
                            <input type="hidden" id="companyId" name="companyId" value="${companyId}">
                            <button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">
                        <th>序号</th>
                        <th>网点名称</th>
                        <th>联系方式</th>
                        <th>所属区域</th>
                        <th>地址</th>
                        <th>EXCEL</th>
                        <th>上传</th>
                        <th>补增</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pagination.list}" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1}</td>
                            <td>${v.name}</td>
                            <td>${v.phone}</td>
                            <td>${v.area}</td>
                            <td>${v.address}</td>
                            <td><a onclick="openExcel(${v.id})">打开</a></td>
                            <td>
                                <form enctype="multipart/form-data" method="post">
                                    <input type="file" name="excelFile" id="${v.id}excelFile">
                                    <label>上传时间:
                                        <select class="form-control input-sm" name="uploadTime"
                                                id="${v.id}uploadTime">
                                            <option value="0">今天</option>
                                            <option value="1">昨天</option>
                                            <option value="2">前天</option>
                                        </select>
                                    </label>
                                    <button type="button" onclick="uploadExcel(${v.id})">上传</button>
                                </form>
                            </td>
                            <td>
                                <button type="button" onclick="insertUserMsg(${v.id})">补增数据</button>
                            </td>
                            <td>
                            <a class="btn btn-sm btn-info" title="修改网点" data-open="modal"
                           href="/admin/company/opendatedepartment?id=${v.id}" data-width="800px" data-height="500px"><i class="fa fa-plus"></i>修改网点</a>
                                <div class="col-sm-4">
                                    <a title="创建订单" onclick="insertorder(${v.id})">创建订单</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-4">
                        <a class="btn btn-sm btn-info" title="新增网点" data-open="modal"
                           href="/admin/company/opendatedepartment?companyId=${companyId}" data-width="800px" data-height="500px"><i class="fa fa-plus"></i>新增网点</a>
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
<script type="text/javascript">
    $(function () {
        $(".btn-enable").click(function () {
            var title = $(this).attr("title") == "" ? $(this).attr("data-original-title") : $(this).attr("title");
            layerConfirm('确定要'+ title +'吗',
                "backcompany/deletecompany.do", {"adminId":$(this).attr('data-id')});
        });
    });
</script>
</body>
</html>
