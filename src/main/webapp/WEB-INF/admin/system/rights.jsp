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
<link href="static/library/plugins/zTree/metroStyle/metroStyle.css" rel="stylesheet">
    <script type="text/javascript" src="static/library/plugins/zTree/jquery.ztree.all.min.js"></script>
	<script>
		$(document).ready(function () {
            $("#btn-permit").click(function(){
                var str = "";
                var treeObj = $.fn.zTree.getZTreeObj("tree");
                var nodes = treeObj.getCheckedNodes(true);
                for(var i=0;i<nodes.length;i++){
                    str += nodes[i].id+",";
                }
                var rid=$("#rid").val();
                if(rid==""){
                    toast(2, "", "未选择组");
                    return;
                }
                Ajax.ajax({
                    url:'admin/system/permit',
                    params:{roleId:	rid, params: str},
                    success:function(data){
                        if(data.code==0) {
                            showMsg(data.msg,1,function(){layer.close(zindex);});
                        } else {showMsg(data.msg,2);}
                    }
                });
        });

        });
        function getGroupId(groupId){
            $("#groupId").val(groupId);
        }
        function deleteVendor(groupId,vendorId,mode,idname) {
            Ajax.ajax({
                url:'admin/system/deletevendor',
                params:{"groupId":groupId,"vendorId":vendorId,"mode":mode},
                success:function(data){
                    layer.alert('删除成功');
                    location.reload(this);
                }
            });
        }
        function deleteAdmin(groupId,adminId,idname) {
            Ajax.ajax({
                url:'admin/system/deleteadmingroup',
                params:{"groupId":groupId,"adminId":adminId},
                success:function(data){
                    layer.alert('删除成功');
                    location.reload(this);
                }
            });
        }
        function dealData(vendor){
            var groupId =  $("#groupId").val();
            Ajax.ajax({
                url:'admin/system/insertvendor',
                params:{"groupId":groupId, "vendorId": vendor.id,"mode":vendor.mode},
                success:function(data){
                    if(data.code==0) {
                        showMsg(data.msg,1,function(){location.reload(this);});
                    } else {showMsg(data.msg,2);}
                }
            });


        }
        function insertAdmin(id) {
            Ajax.ajax({
                url:'admin/system/rolePerm',
                params:{"id":id},
                success:function(data){

                }
            });
        }

        var zindex;
        var tree = "";
        var setting = {
            check : {
                chkboxType : {"Y" : "p", "N" : "ps"},// 勾选checkbox对于父子节点的关联关系
                chkStyle : "checkbox",
                enable : true // 是否复选框
            },
            data : {
                simpleData : {
                    enable : true
                }
            }
        };
        function getModules(roleId,roleName){
            $("#rid").val(roleId);
            Ajax.ajax({
                url:'admin/system/rolePerm',
                params:{"roleId":roleId},
                success:function(data){
                    tree = $.fn.zTree.init($("#tree"), setting, data);
                    tree.expandAll(true);
                    zindex = openLayerContent('编辑权限【'+roleName+'】', "450px", "500px", $(".layer-tree"));
                }
            });
        }
	</script>
</head>

<body class="gray-bg">
<div class="row">
    <div class="col-sm-12">
        <form action="admin/system/rights" method="post" class="form-inline" id="queryForm">
            <label> 组名:<input type="text" name="groupName"  class="form-control input-sm"></label>
            <button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
        </form>
    </div>
</div>
<table class="table table-striped">
	<tr>
		<th>ID</th>
		<th>组名</th>
		<th>是否为全局管理员</th>
		<th>组成员</th>
		<th>父组</th>
		<th>子组</th>
		<th>组权限</th>
        <th>组状态</th>
		<th>组编辑</th>
	</tr>
	<tbody id="mytablebody">
    <input type="hidden" value="" id="groupId"/>
	<c:forEach items="${groups}" var="g">
		<tr>
            <td>${g.groupId}</td>
            <td>${g.groupName}</td>
            <td>${g.overall}<c:if test="${g.overall==false}">
                <a  data-toggle="modal" data-target="#${g.groupId}sj">
                    查看
                </a>
                <div class="modal fade" id = "${g.groupId}sj" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel1">${g.groupName}所支持的商家</h4>
                            </div>
                            <div class="modal-body" >
                                <c:if test="${g.companies.size()>0}">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            运营商家名称
                                        </div>
                                        <div class="panel-body">
                                            <c:set var="z" value="0"></c:set>
                                            <table class="table table-hover">
                                                <th>商家编号</th>
                                                <th>商家名称</th>
                                                <c:if test="${overall}"><th>商家移除</th></c:if>
                                                <tbody id = "${g.groupId}sjbody">
                                                <c:forEach var="j" items="${g.companies}">
                                                    <tr>
                                                        <td>${j.id}</td>
                                                        <td>${j.name}</td>
                                                        <td><a onclick="deleteVendor(${g.groupId},${j.id},'1','${g.groupId}sjbody' )">删除</a></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${g.departments.size()>0}">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            网点名称
                                        </div>
                                        <div class="panel-body">
                                            <c:set var="z" value="0"></c:set>
                                            <table class="table table-hover">
                                                <th>网点编号</th>
                                                <th>网点名称</th>
                                                <c:if test="${overall}"><th>网点移除</th></c:if>
                                                <tbody id = "${g.groupId}sjbody">
                                                <c:forEach var="j" items="${g.departments}">
                                                    <tr>
                                                        <td>${j.id}</td>
                                                        <td>${j.name}</td>
                                                        <td><a onclick="deleteVendor(${g.groupId},${j.id},'2','${g.groupId}sjbody' )">删除</a></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <span class="input-group-btn">
                       <a class="btn btn-info" data-open="modal" onclick="getGroupId(${g.groupId})" href="/admin/system/vendorList?mode=1&groupId=${g.groupId}">选择网点</a>
                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:if></td>
            <td>
                <a  data-toggle="modal" data-target="#${g.groupId}cy">
                查看
                </a>
                <div class="modal fade" id = "${g.groupId}cy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">${g.groupName}组成员</h4>
                            </div>
                            <div class="modal-body">
                                <c:if test="${g.admins.size()>0}">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            组成员
                                        </div>
                                        <div class="panel-body">
                                            <c:set var="z" value="0"></c:set>
                                            <table class="table table-hover">
                                                <th>管理员ID</th>
                                                <th>管理员名称</th>
                                                <th>管理员实际名称</th>
                                                <th>管理员号码</th>
                                                <th>管理员移除</th>
                                                <tbody>
                                                <c:forEach var="k" items="${g.admins}">
                                                    <tr>
                                                        <td>${k.id}</td>
                                                        <td>${k.adminName}</td>
                                                        <td>${k.adminRealname}</td>
                                                        <td>${k.adminPhone}</td>
                                                        <td><a onclick="deleteAdmin(${g.groupId},${k.id},'${g.groupId}cybody' )">删除</a></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <span class="input-group-btn">
                        <a class="btn btn-info" data-open="modal" onclick="getGroupId(${g.groupId})" href="admin/system/openaddadminpage?groupId=${g.groupId}">选择</a>
                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td><a <c:if test="${g.fatherGroup!=null}"> href="admin/system/rights?id=${g.groupId}&type=1" </c:if>>查看</a></td>
            <td><a <c:if test="${g.childGroups!=null}"> href="admin/system/rights?id=${g.groupId}&type=2" </c:if> >查看</a></td>
            <td><a onclick="getModules(${g.groupId },'${g.groupName }')">查看</a></td>
            <td><c:if test="${g.status==true}">活动中</c:if><c:if test="${g.status==false}">关闭中</c:if></td>
            <td><a class="btn btn-sm btn-circle btn-warning" title="编辑" href="admin/system/openinsertgrouppage?thisGroupId=${g.groupId }"
                   data-open="modal" data-width="400px" data-height="300px"
                   data-toggle="tooltip" data-placement="top"><i class="fa fa-pencil-square"></i></a>
                <a class="btn btn-sm btn-circle btn-warning" title="为该组添加一个子组" href="admin/system/openinsertgrouppage?fatherGroupId=${g.groupId }"
                   data-open="modal" data-width="400px" data-height="300px"
                   data-toggle="tooltip" data-placement="top"><i class="fa fa-pencil-square"></i></a>
            <a class="btn btn-sm btn-circle btn-danger btn-enable" title="关闭或激活该组及其子组" data-id="${g.groupId }"
               data-toggle="tooltip" data-placement="top"><i class="fa fa-times"></i></a></td>
		</tr>
	</c:forEach>


	</tbody>
</table>


<div class="layer-win layer-edit">
    <form class="form-horizontal" id="roleForm">
        <div class="form-group">
            <label class="col-sm-3 control-label">组名：</label>
            <div class="col-sm-9">
                <input type="text" name="roleName" id="roleName" class="form-control" placeholder="组名">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-6">
                <input type="hidden" name="roleId" id="roleId">
                <button type="button" class="btn btn-primary" id="btn-edit">确定</button>
            </div>
        </div>
    </form>
</div>

<div class="layer-win layer-tree">
    <ul id="tree" class="ztree"></ul>
    <input type="hidden" id="rid" value="">
    <a class="btn btn-sm btn-success btn-block btn-rounded" id="btn-permit">对该组授权</a>
</div>
<script>
    $(function () {
        $(".btn-enable").click(function () {
            var title = $(this).attr("title") == "" ? $(this).attr("data-original-title") : $(this).attr("title");
            layerConfirm('确定要'+ title +'组',
                "${ctx}/admin/system/roleEnable", {"roleId":$(this).attr('data-id')});
        });
    });
</script>
</body>
</html>