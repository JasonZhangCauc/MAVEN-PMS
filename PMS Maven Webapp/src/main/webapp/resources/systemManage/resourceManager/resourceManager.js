/*
 *  @Description：资源选择界面
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var resourceManager={
	/**
	 * 初始化资源列表
	 */
	initResourceTree:function(){
		var zNodes=[];
		var setting =
		{
	    	edit: {
				drag: {
					autoExpandTrigger: true
				},
				enable: true,
				showRemoveBtn: false,
				showRenameBtn: false
			},
			data : {
				simpleData : {
					enable : true,
					idKey : "id",
					pIdKey : "pId",
					rootPId : -1
				}
			},
			view : {
				fontCss : {
					color : "black"
				},
				addHoverDom: addResourceDom,
				removeHoverDom: removeResourceDom,
				selectedMulti: false
			},
			callback: {
				beforeDrop: zTreeBeforeDrop
			}
		};
		
		//添加按钮
		function addResourceDom(treeId, treeNode) {
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
			var	enableStr = "";
			var disableStr= "";
			
			if(treeNode.resourceType=='0' || treeNode.resourceType==null || treeNode.resourceType==""){
				//新增
				if(hasAddAuth){
					addStr = "<span style='width:60px;' class='button add' id='addBtn_" + treeNode.tId
					+ "' title='"+addtraintype+"' onfocus='this.blur();' data-target='#newResourceModalId' data-toggle='modal' >"+addtraintype+"</span>";
					sObj.after(addStr);
				}
			}
			//编辑
			if(hasEditAuth){
				editStr = "<span style='width:60px;' class='button edit' id='editBtn_" + treeNode.tId
				+ "' title='"+edittraintype+"' onfocus='this.blur();' data-target='#newResourceModalId' data-toggle='modal' >"+edittraintype+"</span>";
				if(treeNode.id > 0){
					sObj.after(editStr);
				}
			}
			if(treeNode.resourceIsshow=='0'){
				//禁用
				if(hasDisableAuth){
					disableStr = "<span style='width:60px;' class='button remove' id='disableBtn_" + treeNode.tId
					+ "' title='"+disabletraintype+"' onfocus='this.blur();' >"+disabletraintype+"</span>";
				}
				if(treeNode.id > 0){
					sObj.after(disableStr);
				}
			}else{
				//启用
				if(hasEnableAuth){
					enableStr = "<span style='width:60px;' class='button remove' id='enableBtn_" + treeNode.tId
					+ "' title='"+enabletraintype+"' onfocus='this.blur();' >"+enabletraintype+"</span>";
				}
				if(treeNode.id > 0){
					sObj.after(enableStr);
				}
			}
			 
			var addBtn = $("#addBtn_"+treeNode.tId);
			var editBtn = $("#editBtn_"+treeNode.tId);
			var enableBtn = $("#enableBtn_"+treeNode.tId);
			var disableBtn = $("#disableBtn_"+treeNode.tId);
			var parentNode=treeNode.getParentNode();
			
			//添加
			if (addBtn) {
				addBtn.bind("click", function(){
					var param = {resourcePid:treeNode.id,resourcePName:treeNode.id=="0"?"根目录":treeNode.name,operate:"add"};
					loadDiv("resourceEditId","/systemManage/resourceEdit",param);
				});
			}
			
			//编辑
			if (editBtn) {
				editBtn.bind("click", function(){
					var param = {resourceId:treeNode.id,resourcePid:parentNode.id,resourcePName:parentNode.name,operate:"edit"};
					loadDiv("resourceEditId","/systemManage/resourceEdit",param);
				});
			}
			
			//启用
			if(enableBtn){
				enableBtn.bind("click", function(){
					resourceDisableOrEnable(treeNode.id,enableResourceMsg,"1");
				});
			}
			
			//禁用
			if(disableBtn){
				disableBtn.bind("click", function(){
					resourceDisableOrEnable(treeNode.id,disableResourceMsg,"0");
				});
			}
			
		};
		
		//移除按钮
		function removeResourceDom(treeId, treeNode) {
			$("#addBtn_"+treeNode.tId).unbind().remove();
			$("#editBtn_"+treeNode.tId).unbind().remove();
			$("#enableBtn_"+treeNode.tId).unbind().remove();
			$("#disableBtn_"+treeNode.tId).unbind().remove();
		};
		
		/**
		 * 停用/启用资源
		 * @param resourceId
		 */
		function resourceDisableOrEnable(value,mag,resourceFlag){
			initAttasConfirmWal({
				sa_title: mag,
				sa_message: importantOperatingWarn,
				sa_type: "info",
				sa_showCancelButton: true,
				sa_confirmButtonText: commonIConfirmBtn,
				sa_cancelButtonText: commonWrongOperationBtn,
				sa_closeOnConfirm: false,
				sa_closeOnCancel: false,
				sa_confirmButtonClass: "btn-success",
				sa_cancelButtonClass: "btn-danger",
				sa_ajaxFuntion:function(){
					$.ajax({
		        		url: basePath+'/systemManage/resourceDisableOrEnable',
		        		type: 'POST',
		        		dataType: 'json',
		        		data: {resourceId:value,resourceFlag:resourceFlag},
		        	})
		        	.done(function(data) {
		        		if(resourceFlag=='0'){
		        			initAttasInfoWal({sa_title:disableSuccess, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		        		}else{
		        			initAttasInfoWal({sa_title:enableSuccess, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		        		}
		        		initTree();
		        	})
		        	.fail(function(data) {
		        		showError(data.responseText);
		        	});
				}
			});
		};
		
		//移动资源后出发修改操作
		function zTreeBeforeDrop(treeId, treeNodes, targetNode, moveType) {
			var retBool=false;
			var resourceId=treeNodes[0].id;
			var targetId=targetNode.id;
			$.ajax({
				url : basePath + "/systemManage/resourceMobile",
				dataType : "json",
				type : 'POST',
				data : {
					resourceId : resourceId,
					targetId: targetId
				},
				async : false,
				success : function(data) {
					retBool = true;
				},
				error : function(data) {
					retBool = false;
				}
			});
			
		    return retBool;
		};
		//初始化
		function initTree(){
			$.ajax({
				url:basePath+"/systemManage/loadResourceTree",
				type:"POST",
				dataType:"json",
				async:false,
				
				data : {},
				success:function(data){
					zNodes=data;
				},
				error:function(data){
					showError(data.responseText);
				}
			});
			
			$.fn.zTree.init($("#resourceTreeId"), setting, zNodes);
			var zTree = $.fn.zTree.getZTreeObj("resourceTreeId");
			//默认展开所有结点
			zTree.expandAll(true);
		}
		
		initTree();
	}
	
};

//加载页面
jQuery(document).ready(function() {
	resourceManager.initResourceTree();
});