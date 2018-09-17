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
</head>

<body class="gray-bg">
<div class="wrapper-content">
	<div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>分类管理</h5>
        </div>
        <div class="alert alert-warning mb0">
			<p><i class="fa fa-exclamation-circle"></i>右键可编辑或添加分类，不可添加一级分类；二级分类可拖动进行编辑。</p>
		</div>
        <div class="ibox-content">
        	<div class="row">
        		<div class="col-md-8">
	       			<ul id="tree" class="ztree"></ul>
        		</div>
       		</div>
    	</div>
    </div>
</div>

<div id="rMenu">
	<ul>
		<li id="m_add" onclick="addTreeNode();"><i class="fa fa-plus"></i>添加分类</li>
		<li id="m_edit" onclick="editTreeNode();"><i class="fa fa-pencil-square"></i>编辑分类</li>
	</ul>
</div>

<script type="text/javascript" src="static/library/plugins/zTree/jquery.ztree.all.min.js"></script>
<script type="text/javascript">
	var zTree, rMenu;
	var setting = {
		data : {
			simpleData : { // 数据绑定
				enable : true,
				idKey : "id",
				pIdKey : "pId",
				rootPId : 0
			}
		},
		edit : {
			enable: true,
			showRemoveBtn: false,
			showRenameBtn: false,
			drag : {
				isCopy : false,
				isMove : true,
				prev : false,
				inner : true,
				next : false
			}
		},
		view : { // 关闭双击展开
			dblClickExpand : false
		},
		callback: { // 事件
			onRightClick: zTreeOnRightClick,
			beforeDrag: beforeDrag,
			beforeDrop: beforeDrop,
			onDrop: onDrop
		}
	};
	
	function beforeDrag(treeId, treeNodes) {
		for (var i=0,l=treeNodes.length; i<l; i++) {
			if (treeNodes[i].drag === false) {
				return false;
			}
		}
		return true;
	}
	function beforeDrop(treeId, treeNodes, targetNode, moveType) {
        var cn=treeNodes[0].getParentNode().id;
        var tn=targetNode.getParentNode().id;
        if(cn == tn){
            toast(2,"","不可拖动到同级分类下");
            return false;
        }
		return targetNode ? targetNode.drop !== false : true;
	}
    /* 拖动编辑 */
	function onDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {
		if(targetNode){
			var parentId=targetNode.id;
			var l=treeNodes.length;
			if(l != 1){
				showMsg("一次只能拖动一个分类", 2);
				return;
			}
			var categoryId=treeNodes[0].id;
			Ajax.ajax({
				url: "admin/loan/LoanTypeEdit.do",
				params: {"parentId":parentId,"id":categoryId},
				success: function(data) {
					if(data.code!=0) {
						showMsg(data.msg,2);
					}
				}
			});
		}
	}
	
	function zTreeOnRightClick(event, treeId, treeNode) {
		if (treeNode && !treeNode.noR) {
            var level = treeNode.level;
			if(level == 0){
				// 只新增二级分类 [treeNode.pId或treeNode.level]
				$("#m_add").show();
			}else{
				$("#m_add").hide();
			}
			zTree.selectNode(treeNode); // 选中该节点
			showRMenu(event.clientX, event.clientY+$(document).scrollTop()); // 显示右键菜单
		}
	}
	function showRMenu(x, y) {
		$("#rMenu ul").show();
		rMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});
	
		$("body").bind("mousedown", onBodyMouseDown); // body事件
	}
	function hideRMenu() {
		if (rMenu) rMenu.css({"visibility": "hidden"});
		$("body").unbind("mousedown", onBodyMouseDown);
	}
	function onBodyMouseDown(event){
		if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length > 0)) {
			rMenu.css({"visibility" : "hidden"});
		}
	}
	
	function editTreeNode(){
		$("#adBox").hide(function(){ $("#edBox").show()});
		hideRMenu();
		if (zTree.getSelectedNodes()[0]) { // 获取选择的节点属性
            var param = {
                id: zTree.getSelectedNodes()[0].id
            };
            openLayerFrame('编辑分类', 400, 400, "admin/loan/loanTypeEditPage.do?" + parseParam(param), false);
		}
	}
	function addTreeNode(){
		$("#edBox").hide(function(){ $("#adBox").show()});
		hideRMenu();
		if (zTree.getSelectedNodes()[0]) { // 获取选择的节点属性
            var param = {
                parentId: zTree.getSelectedNodes()[0].id,
                pname: zTree.getSelectedNodes()[0].name
            };
            openLayerFrame('新增分类', 400, 400, "admin/loan/loanTypeEditPage.do?" + parseParam(param), false);
		}
	}
	
	$(function(){
		Ajax.ajax({
			url: "admin/loan/getAllLoanType.do",
			params: null,
			success: function(data) {
				zTree = $.fn.zTree.init($("#tree"), setting, data);
				zTree.expandAll(false);
		        rMenu = $("#rMenu");
			}
		});
	});
</script>
</body>
</html>