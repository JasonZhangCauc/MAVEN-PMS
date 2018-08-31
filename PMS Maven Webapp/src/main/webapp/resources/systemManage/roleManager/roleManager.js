/*
 *  @Description：角色管理主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var rowRoleIdSelected;
var roleManager ={
	//初始日期控件和下拉框控件
	initPickers:function () {
        $('.bs-select').selectpicker({
            iconBase: 'fa',
            tickIcon: 'fa-check'
        });
    },
	roleInit:function(){
		//角色管理Table
		var $roleGridId = $("#roleMianTableId");
		//用户管理Form
		var $roleFormId = $("#roleMianFormId");
		//角色信息URL
		var $urlRole = basePath + '/systemManage/queryRoleInfoByParam';
		//角色显示信息
		var roleColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "5%","data": "id"},
			{"orderable": true,"sWidth": "25%","data": "roleCname","sTitle":r1},
			{"orderable": true,"sWidth": "25%","data": "roleCname","sTitle":r2},
			{"orderable": true,"sWidth": "20%","data": "roleDesc","sTitle":r3},
			{"orderable": false,"sWidth": "20%","sTitle":commonOperate}
	     ];
		//操作列
		var roleColumnDefs=[{"targets":[4],"data":"id","render":roleManager.grid_role_operation}];
		//角色列表初始化
		TableAjax(gridRole,$("#roleMianTableId"),$urlRole,roleColumns,roleColumnDefs,true,true,commonPageLength,roleManager.grid_role_fnRowCallback);
		
		//查询
		$("#searchRoleBtn").on('click', function(event) {
			if(gridRole.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridRole.clearAjaxParams();
				gridRole.searchFilter($roleFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridUser.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
		//查询
		$("#assignRoleResourceBtn").on('click', function(event) {
            var assignRoleResourceBtn = $(this);
			
			//禁用按钮，防止重复提交
			$(this).attr("disabled",true);
			
			//初始变量 resourceId：资源ID
			var resourceId=[];
			
			//判断是否选中角色
			if(rowRoleIdSelected==null || rowRoleIdSelected=="null"){
				//恢复按钮使用
				$(this).removeAttr("disabled");
				initAttasInfoWal({sa_title:atlestchooseonerole, sa_type:"warning", sa_confirmButtonClass:"btn-warning"});
				return;
			}
			
			var treeObj = $.fn.zTree.getZTreeObj("roleResourceTree");
			var nodes = treeObj.getCheckedNodes(true);
			
			$(nodes).each(function(index, element) {
				resourceId.push(element.id);
			});
			if(resourceId.length>0){
				$.ajax({
					url: basePath + '/systemManage/assignRoleResources',
					type:"POST",
					dataType : 'json',
					data:{
						roleId:rowRoleIdSelected,
						resourceId:resourceId+""
					},
					success:function(data){
						//恢复按钮使用
						assignRoleResourceBtn.removeAttr("disabled");
						//提示分配成功
						initAttasInfoWal({sa_title:setResourceSuccess, sa_type:"success", sa_confirmButtonClass:"btn-success"});
					}
				});
			}else{
				//恢复按钮使用
				$(this).removeAttr("disabled");
				initAttasInfoWal({sa_title:atlestChooseOneResource, sa_type:"success", sa_confirmButtonClass:"btn-success"});
				return false;
			}
		});
	},
	grid_role_fnRowCallback: function(row, data, index) {
		 $(row).on("click",function() {
			 if ($(this).hasClass('row_selected')) {
				 $(this).removeClass('row_selected');
				 $(this).removeAttr("style");
				 rowRoleIdSelected=null;
			 } else {
				 $("#roleMianTableId tr.row_selected").removeAttr("style");
				 $("#roleMianTableId tr.row_selected").removeClass('row_selected');
				 $(this).addClass('row_selected');
				 rowRoleIdSelected=data.id;
			 }
			 assignResource.initRoleResource(data.id); 
		 });
	},
	//用户备选事件操作按钮
	grid_role_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthRole){
			ret += "<a class='btn default btn-sm green-haze' href='"+basePath+"/systemManage/roleManagerEdit?operate=edit&roleId="+data+
			"' data-target='#role-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		if(hasRoleDisableAuth){
			if(full.roleFlag=="0"){
				ret+="<a class='btn default btn-sm red tooltips' onclick=\"roleManager.changeRoleDisableAuth('"+data+"','"+disableConfirmMsg+"','"+full.roleFlag+"');\" ><i class='fa fa-trash-o'></i></a>";
			}else if(full.roleFlag=="1"){
				ret+="<a class='btn default btn-sm grey-cascade' onclick=\"roleManager.changeRoleDisableAuth('"+data+"','"+enableConfirmMsg+"','"+full.roleFlag+"');\" ><i class='fa fa-lock'></i></a>";
			}
		}
		return ret;
	},
	//转换方法
	render_rotate_fun:function(data,type,full){
		if(data=='1'){
			return commonInvalid;
		}
		if(data=='0'){
			return commonValid;
		}
	},
	//启用、禁用角色
	changeRoleDisableAuth:function(value,mag,roleFlag){
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
	        		url: basePath+'/systemManage/roleDisable',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {roleId:value,roleFlag:roleFlag},
	        	})
	        	.done(function(data) {
	        		$("#searchRoleBtn").click();
	        		if(roleFlag=='0'){
	        			initAttasInfoWal({sa_title:roledisablesuccess, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        		}else{
	        			initAttasInfoWal({sa_title:roleenablefail, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        		}
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
			}
		});
	}
};
jQuery(document).ready(function() {
	roleManager.initPickers();
	roleManager.roleInit();
});