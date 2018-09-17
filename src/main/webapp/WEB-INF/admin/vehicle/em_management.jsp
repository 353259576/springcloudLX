<!--车况管理-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String path = request.getContextPath();
String port=request.getServerPort()==80?"":":"+request.getServerPort();
String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>
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
</head>
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
                            <label> 单车ID:<input type="text" name="veid" value="" class="form-control input-sm"></label>
                            <label> 电量:<input type="text" name="veele" value="" placeholder="输入最大电量" class="form-control input-sm"></label>
                            <label> 所属企业:<input type="text" name="vecompany" value="" class="form-control input-sm"></label>
                            <label> 所属维修部门:<input type="text" class="form-control input-sm"  name="verep"  value=""></label>
                            <button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
                            <input type="hidden" name="pageNo">
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr role="row">
                            <th>序号</th>
                            <th>单车ID</th>
                            <th>用户名</th>
                            <th>手机号</th>
                            <th>剩余电量</th>
                            <th>所属企业</th>
                            <th>所属维修部门</th>
                            <th>位置</th>
                            <th>可行驶路程(km)</th>
                            <th>状态</th> 
                            <th>操作</th>                          
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                                <td>1</td>
                                <td>1</td>
                                <td>Ary气宇非凡</td>
                                <td>18949816048</td>
                                <td>12%</td>
                                <td>安徽去扑网络科技有限企业</td>
                                <td>安徽去扑网络科技有限企业</td>
                                <td>127.223,32.145725</td>
                                <td>8.0</td>
                                <td>良好</td>
                                <td>
                                    <a class="btn btn-sm btn-circle btn-warning" title="" href="userdetial.jsp" data-open="modal" data-toggle="tooltip" data-placement="top" data-original-title="详情"><i class="fa fa-info-circle"></i></a>
                                </td>
                            </tr>       
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-4">
                        
                    </div>
                    <div class="col-sm-8">
                        <div class="pagination-ul">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        datePicker('#startDate,#endDate',"yyyy-mm-dd",2);
        $(".btn-enable").click(function () {
            var title = $(this).attr("title") == "" ? $(this).attr("data-original-title") : $(this).attr("title");
            layerConfirm('确定要'+ title +'该用户吗',
                    "admin/user/userEnable.do", {"userId":$(this).attr('data-id')});
        });
    });
</script>
</body>
</html>