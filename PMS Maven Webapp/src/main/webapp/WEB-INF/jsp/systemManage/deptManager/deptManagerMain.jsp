<!-- 组织架构维护主界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- Begin: Query conditions -->
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			 <div class="portlet-title">
	             <div class="caption">
	                 <i class="fa fa-filter font-red"></i>
	                 <span class="caption-subject font-red sbold uppercase"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">查询条件</font></font></span>
	             </div>
	             <div class="tools">
	                 <a href="javascript:;" class="collapse"> </a>
	                 <a href="javascript:;" class="reload"> </a>
	             </div>
	         </div>
	         <div class="portlet-body form">
		         <form class="form-horizontal" id="userMianFormId" method="post">
			         <div class="form-body">
				         <div class="form-group">
			            	<!-- 部门名称 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.deptManager.deptName'/>:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" id="deptName" name="deptName" class="form-control form-filter spinner" 
			                    	placeholder="<spring:message code='message.pleaseinput'/>">
			                </div>
			                <div class="col-md-4">
			                	<button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchDeptBtn">
			                       <span class="ladda-label"><i class="fa fa-search"></i><spring:message code='btn.common.search' /> </span>
			                       <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
			                    </button>
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" onclick="allUnfoldDom(true)">
			                       <span class="ladda-label"><i class="glyphicon glyphicon-plus"></i><spring:message code='label.codeManager.allAn' /></span>
			                       <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
			                    </button>
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" onclick="allUnfoldDom(false)">
			                       <span class="ladda-label"><i class="glyphicon glyphicon-minus"></i><spring:message code='label.codeManager.allRetract' /> </span>
			                       <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
			                    </button>
							</div>
			            </div>
			         </div>
		         </form>  
	         </div>
		</div>   
	</div>
</div>
<!-- End: Query conditions -->
<!-- Begin: The query results -->
<div class="row">
    <div class="col-md-12">
        <div class="portlet light portlet-fit portlet-datatable bordered">
        	<div class="mt-element-ribbon bg-grey-steel">
	           <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
	                <div class="ribbon-sub ribbon-clip"></div> 
	                <span class="caption-subject bold uppercase"><spring:message code='label.deptManager.deptBaseInfo'/></span> 
		       </div>
		    </div>
            <div class="portlet-title">
                
            </div>
            <div class="portlet-body">
                <ul id="deptManagerTree" class="ztree" style="overflow:auto;" ></ul>
            </div>
         </div>
    </div>
</div>
<!-- End: The query results -->
<!-- 组织架构新增/编辑弹出框 -->
<div id="newDeptModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:40%;" >
		<div class="modal-content" id="deptEditId">
		</div>
	</div>
</div>
<!-- 引用参数列表 -->
<script type="text/javascript">
	var treeNodeCopy;//复制树
	var hasAddAuth = isUserHasAuth("R014_05_OPERATION_EDIT");
	var hasEditAuth = isUserHasAuth("R014_05_OPERATION_EDIT");
	var hasDeleteAuth = isUserHasAuth("R014_05_OPERATION_DELETE");
	
	var addtraintype="<spring:message code='btn.common.add' />";//新增
	var deletetraintype="<spring:message code='btn.common.delete' />";//删除
	var edittraintype="<spring:message code='btn.common.edit' />";//编辑
	var confirmToDelLeaves="<spring:message code='message.zTreeManage.confirmToDelLeaves' />";//节点下有子节点，确定要删除该节点及其子节点吗?
	var confirmToDelete="<spring:message code='message.zTreeManage.confirmToDelete' />";//确定要删除节点
	var isRight="<spring:message code='message.zTreeManage.isRight' />";//吗?

	//定义变量存储所有结点数据
	var zNodes=[];
	var setting = {
		view: {
			addHoverDom: addHoverDom,
			removeHoverDom: removeHoverDom,
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
		callback: {
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
			onClick:null,
			onDblClick:null,
			onRightClick:null,
			onMouseDown:null,
			onMouseUp:null,
			onExpand:null,
			onCollapse:null,
			onRemove:null
		}
	};

	//添加按钮
	function addHoverDom(treeId, treeNode) {
		treeNodeCopy = treeNode;
		var sObj = $("#" + treeNode.tId + "_span");
		//当功能按钮已存在时，不重复执行
		if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0 
				|| $("#editBtn_"+treeNode.tId).length>0 
				|| $("#removeBtn_"+treeNode.tId).length>0
				|| $("#uploadBtn_"+treeNode.tId).length>0 ) {
			return;
		}
		var	addStr = "";
		var	editStr = "";
		var	removeStr = "";
		var	uploadStr = "";
		
		if(hasAddAuth){
			addStr = "<span style='width:60px;' class='button add' id='addBtn_" + treeNode.tId
			+ "' title='"+addtraintype+"' onfocus='this.blur();' data-target='#newDeptModalId' data-toggle='modal' >"+addtraintype+"</span>";
		}
		if(hasEditAuth){
			editStr = "<span style='width:60px;' class='button edit' id='editBtn_" + treeNode.tId
			+ "' title='"+edittraintype+"' onfocus='this.blur();' data-target='#newDeptModalId' data-toggle='modal' >"+edittraintype+"</span>";
		}
		if(hasDeleteAuth){
			removeStr = "<span style='width:60px;' class='button remove' id='removeBtn_" + treeNode.tId
			+ "' title='"+deletetraintype+"' onfocus='this.blur();' >"+deletetraintype+"</span>";
		}
		 
		/**
		 *	一级菜单只能做添加操作
		 *  二级菜单是航空公司
		 **/
		if(treeNode.id > 0){
			sObj.after(uploadStr);
			sObj.after(editStr);
			sObj.after(removeStr);
		}
		sObj.after(addStr);
		
		var addBtn = $("#addBtn_"+treeNode.tId);
		var editBtn = $("#editBtn_"+treeNode.tId);
		var uploadBtn = $("#uploadBtn_"+treeNode.tId);
		var removeBtn = $("#removeBtn_"+treeNode.tId);
		var parentNode=treeNode.getParentNode();
		
		//添加
		if (addBtn) {
			addBtn.bind("click", function(){
				var param = {deptPid:treeNode.id,deptPName:treeNode.id=="0"?"根目录":treeNode.name,operate:"add"};
				loadDiv("deptEditId","/systemManage/deptEdit",param);
			});
		}
		
		//编辑
		if (editBtn) {
			editBtn.bind("click", function(){
				var param = {id:treeNode.id,deptName:treeNode.name,deptPid:parentNode.id,deptPName:parentNode.name,operate:"edit"};
				loadDiv("deptEditId","/systemManage/deptEdit",param);
			});
		}
		
		//删除
		if (removeBtn) {
			removeBtn.bind("click", function(){
				deleteData(treeNode);
			});
		}
		 
	};
	
	//移除按钮
	function removeHoverDom(treeId, treeNode) {
		$("#addBtn_"+treeNode.tId).unbind().remove();
		$("#editBtn_"+treeNode.tId).unbind().remove();
		$("#removeBtn_"+treeNode.tId).unbind().remove();
	};

	//全部收縮/展開
	function allUnfoldDom(bool) {
		var zTree = $.fn.zTree.getZTreeObj("deptManagerTree");
		//默认展开所有结点
		zTree.expandAll(bool);
	};
	
	//删除结点
	function deleteData(treeNode){
		var zTree = $.fn.zTree.getZTreeObj("deptManagerTree");
		zTree.selectNode(treeNode);
		var masDelConfirm;//删除前的确认消息
		//判断是否有子节点，不同节点设置不同消息提示
		if(treeNode.isParent){
			masDelConfirm = "["+treeNode.name +"]"+ confirmToDelLeaves;//节点下有子节点，确定要删除该节点及其子节点吗?
		}else{
			masDelConfirm = confirmToDelete + "["+treeNode.name+"]" + isRight;//确定删除该节点吗?
		}
		
		//删除节点
		bootbox.confirm(masDelConfirm,function(result){
	        if(result){
	        	$.ajax({
					url:basePath+"/systemManage/updateDeptFlagById",
					type:"POST",
					dataType:"json",
					async:false,
					data : {
						id : treeNode.id,
					},
					success:function(data){
						bootbox.alert(commonSuccessMsg);
						//删除结点
						zTree.removeNode(treeNode,false);
					},
					error:function(data){
						bootbox.alert("error");
					}
				});
	        }
		});
	}
	
	$(document).ready(function(){
		initDeptTree();
	});
	
	$("#searchDeptBtn").on('click',function(event){
		initDeptTree();
	});
	
	function initDeptTree(){
		var deptName= $("#deptName").val();
		//获取节点数据
		$.ajax({
			url:basePath+"/systemManage/loadDeptResourceTree",
			type:"POST",
			dataType:"json",
			async:false,
			data : {
				deptName : deptName
			},
			success:function(data){
				zNodes=data;
			},
			error:function(data){
				showError(data.responseText);
			}
		});
		
		$.fn.zTree.init($("#deptManagerTree"), setting, zNodes);
		var zTree = $.fn.zTree.getZTreeObj("deptManagerTree");
		//默认展开所有结点
		zTree.expandAll(true);
	}
	
</script>