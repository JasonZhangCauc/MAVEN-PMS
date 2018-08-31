<%--部门选择公共页面 --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<script type="text/javascript">
	//定义变量存储所有结点数据
	var zNodes=[];
	var type = '${type}'; //选择类型 radio/checkbox
	
	var check={
        enable: true,
        chkStyle:type,
        radioType:"all",
        chkboxType:  { "Y": "s", "N": "s" }
      };
	
	var setting = {
		view: {
			selectedMulti: false
		},
		edit: {
			enable: false,
			editNameSelectAll: false,
			showRemoveBtn: false,
			showRenameBtn: false
		},
		data: {
			simpleData: {
				enable: true,
				idKey: "id", 	// id编号命名 默认
				pIdKey: "pId",  // 父id编号命名 默认
				rootPid: 0
			}
		},
		check: check,
		callback: {
			onClick:zTreeOnClick,
			beforeAsync:null,
			beforeClick:null,
			beforeDblClick:null,
			beforeRightClick:null,
			beforeMouseDown:null,
			beforeMouseUp:null,
			beforeExpand:null,
			beforeCollapse:null,
			beforeRemove:null,
			onAsyncError:null,
			onAsyncSuccess:null,
			onNodeCreated:null,
			onDblClick:null,
			onRightClick:null,
			onMouseDown:null,
			onMouseUp:null,
			onExpand:null,
			onCollapse:null,
			onRemove:null
		}
	};
	
	//全部收縮/展開
	function allUnfoldDom(bool) {
		var zTree = $.fn.zTree.getZTreeObj("deptSelectTree");
		//默认展开所有结点
		zTree.expandAll(bool);
	};
	//点击事件
	function zTreeOnClick(event, treeId, treeNode) {
	    var zTree = $.fn.zTree.getZTreeObj(treeId) ;
	    zTree.checkNode(treeNode, !treeNode.checked, true, true);
	};
	//加载树状公司数据
	$(document).ready(function(){
		initTree();
		//确定
		$("#deptChooseFormId #confirmBtnId").click(function(){
			var treeObj = $.fn.zTree.getZTreeObj("deptSelectTree");
			var nodes = treeObj.getCheckedNodes(true);
			//调用返回事件
			var temp = {hiddenId:'${hiddenId}',showId:'${showId}'};
			chooseDeptCallBackFun(nodes,temp);
			//关闭当前窗口
			$("#deptChooseFormId #closeDialogWinBtnId").click();
		});
	});
	//查询
	$("#searchDeptBtn").on('click',function(event){
		initTree();
	});
	
	function initTree(){
		var deptName= $("#deptChooseFormId #selectDeptName").val();
		var url = basePath+"/systemManage/loadDeptResourceTree";
		//获取节点数据
		$.ajax({
			url: url,
			type:"POST",
			dataType:"json",
			async:false,
			data : {
				deptName :deptName,
				orgNo : null,
				id : $("#deptChooseFormId #selectDeptId").val()
			},
			success:function(data){
				zNodes=data;
			},
			error:function(data){
				showError(data.responseText);
			}
		});
		
		$.fn.zTree.init($("#deptSelectTree"), setting, zNodes);
		var zTree = $.fn.zTree.getZTreeObj("deptSelectTree");
		//默认展开所有结点
		zTree.expandAll(true);
	}
	
</script>
<div class="portlet box grey-cascade form-fit">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-cogs"></i>
			<spring:message code='common.laber.deptSelect' />
		</div>
		<div class="tools">
			<a href="javascript:;" class="collapse"> </a> <a href="javascript:;"
				class="remove" data-dismiss="modal"> </a>
		</div>
	</div>
	<div class="m-heading-1 border-green m-bordered">
		<form class="form-horizontal" id="deptChooseFormId" method="post">
			<input type="hidden" value="${deptId}" id="selectDeptId" />
	        <div class="row">
	            <div class="form-group">
	            	<!-- 部门名称 -->
	                <label class="col-md-2 control-label">
	                	<spring:message code='label.deptManager.deptName'/>:
	                </label>
	                <div class="col-md-3 text-left">
	                    <input type="text" id="selectDeptName" name="selectDeptName" class="form-control form-filter spinner" 
	                    	placeholder="<spring:message code='message.pleaseinput'/>">   
	                </div>
	                <div class="col-md-7">
	                	<a href="javascript:;" class="btn default btn-sm blue-madison" id="searchDeptBtn"> 
						    <i class="fa fa-search"></i>
						    <spring:message code='btn.common.search' /> 
					    </a>
	                	<a href="javascript:;" class="btn default btn-sm blue-madison" onclick="allUnfoldDom(true)"> 
						    <i class="glyphicon glyphicon-plus"></i>
						    <spring:message code='label.codeManager.allAn' /> 
					    </a>
					    <a href="javascript:;" class="btn default btn-sm blue-madison" onclick="allUnfoldDom(false)"> 
						    <i class="glyphicon glyphicon-minus"></i>
						    <spring:message code='label.codeManager.allRetract' /> 
					    </a>
					    <a href="javascript:;" class="btn default btn-sm blue-madison" id="confirmBtnId"> 
						    <i class="glyphicon glyphicon-minus"></i>
						    <spring:message code='btn.common.ok' />
					    </a>
					    <a href="javascript:;" class="btn default btn-sm blue-madison" data-dismiss="modal" id="closeDialogWinBtnId">
						    <i class="glyphicon glyphicon-minus"></i>
						    <spring:message code='btn.common.close' /> 
					    </a>
					</div>
	            </div>
	        </div>
	    </form>
	</div>

	<div class="row">
	    <div class="col-md-12">
	        <div class="portlet light bordered">
	        	<ul id="deptSelectTree" class="ztree" style="height:80%;overflow:auto; border-style: none;" ></ul>
	        </div>
	    </div>
	</div>
</div>
