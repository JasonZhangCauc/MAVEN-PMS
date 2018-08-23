/*
 *  @Description：用户管理主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var hideUserId;
var userManager = {
	 //初始日期控件和下拉框控件
	 initPickers:function () {
        //init date pickers
        $('.date-picker').datepicker({
            rtl: App.isRTL(),
            autoclose: true
        });
        $('.bs-select').selectpicker({
            iconBase: 'fa',
            tickIcon: 'fa-check'
        });
     },
     //用户列表
	 userInit:function(){
	    //用户管理Table
		var $userGridId = $("#userMianTableId");
		//用户管理Form
		var $userFormId = $("#userMianFormId");
		//用户信息URL
		var $urlUser = basePath + '/systemManage/queryUserInfoByParam';
		//用户列
		var userColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": '5%',"data": "id"},
		    {"orderable": true,"sWidth": '15%',"data": "userPic","sTitle":t1,"render":userManager.render_pic_fun},
		    {"orderable": true,"sWidth": '15%',"data": "userAccount","sTitle":t2},
			{"orderable": true,"sWidth": '15%',"data": "userName","sTitle":t3},
			{"orderable": true,"sWidth": '15%',"data": "userFlag","sTitle":commonStatus,"render":userManager.render_rotate_fun},
			{"orderable": false,"sWidth": '20%',"sTitle":commonOperate}
        ];
		//用户操作按钮
		var userColumnDefs=[{"targets":[5],"data":"id","render":userManager.grid_user_operation}];
		//用户初始化表格控件
		TableAjax(gridUser,$userGridId,$urlUser,userColumns,userColumnDefs,true,true,commonPageLength,userManager.grid_user_fnRowCallback);
		//用户查询事件
		$("#searchUserBtn").on('click', function(event) {
			if(gridUser.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridUser.clearAjaxParams();
				gridUser.searchFilter($userFormId);
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
	 },
	 //角色分配列表
	 roleInit:function(){
	    //角色Table
		var $assignRoleGridId = $("#userAssignRoleTableId");
		//角色分配URL
		var $urlAssignRole = basePath + '/systemManage/queryRoleInfoByParam';
		//角色分配列
		var roleColumns=[
			{
		    "orderable": false,
		    "sWidth": "30",
		    "data": "id" ,
		    "sTitle":'<label class="userColumnsDiv mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="group-checkable"/><span></span></label>'
			},
			{"orderable": false,"sWidth": "100","data": "roleCname","sTitle":r1}
        ];
		//角色分配操作
		var roleColumnDefs=[{
		    "orderable": false,
	     	"targets":[0],
	    	"data":"id",
	    	"render":function(data,type,full){
	    		if(full.flag=='1'){
	    			return '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="checkboxes" value="'+data+'" name="roleGroup" checked /><span></span></label>';
	    		}else{
	    			return '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="checkboxes" value="'+data+'" name="roleGroup" /><span></span></label>';
	    		}
	    	}
		}];
		//角色分配初始化表格控件
		TableAjax(gridRole,$assignRoleGridId,$urlAssignRole,roleColumns,roleColumnDefs,false,false,0,null);
		
		//分配角色
		$("#assignroleBtn").on('click',function(event) {
			if(hideUserId== null || hideUserId == ""){
				initAttasInfoWal({sa_title:"请选择操作用户！", sa_type:"warning", sa_confirmButtonClass:"btn-warning"});
				return;
			}
			//选中的角色列表
			var ridlist = [];
			$("#userAssignRoleTableId").find("input[name='roleGroup']").each(function(index, el) {
				if ($(el).prop("checked") == true) {
					ridlist.push($(el).val());
				}
			});
			
			//给用户分配被选中角色的权限
			if (ridlist.length <= 0) {
				initAttasInfoWal({sa_title:"请选择操作角色！", sa_type:"warning", sa_confirmButtonClass:"btn-warning"});
				return;
			}
			
			$.ajax({
				url:basePath + '/systemManage/addUserRolePage',
				type: 'POST',
				data: 
				{
					roleId : ridlist+"",
					userId : hideUserId
				},
				dataType: 'json',
				success:function(data){
					initAttasInfoWal({sa_title:assignrolesuccess, sa_type:"success", sa_confirmButtonClass:"btn-success"});
				}
			});
		});
	 },
	 grid_user_fnRowCallback: function(row, data, index) {
		 $(row).on("click",function() {
			 if ($(this).hasClass('row_selected')) {
				 $(this).removeClass('row_selected');
				 $(this).removeAttr("style");
				 hideUserId="";//赋值选中用户ID
				 
			 } else {
				 $("#userMianTableId tr.row_selected").removeAttr("style");
				 $("#userMianTableId tr.row_selected").removeClass('row_selected');
				 $(this).addClass('row_selected');
				 hideUserId=data.id;//赋值选中用户ID
			 }
			 if(gridRole.getRowsCount() > 0){
				event.preventDefault();
				gridRole.clearAjaxParams();
				//传FORM参数
				gridRole.setAjaxParam("userId", hideUserId);
				gridRole.getDataTable().ajax.reload();
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
	 },
	 //用户备选事件操作按钮
	 grid_user_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthUser){
			ret += "<a class='btn default btn-sm green-haze' href='"+basePath+"/systemManage/userManagerEdit?operate=edit&userId="+data+
			"' data-target='#user-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		if(hasResertPsswordAuth){
			ret+="<a class='btn default btn-sm blue' onclick=\"userManager.resetPassword('"+data+"');\" ><i class='fa fa-retweet'></i></a>";
		}
		if(hasUserDisableAuth){
			if(full.userFlag=="0"){
				ret+="<a class='btn default btn-sm red' onclick=\"userManager.changeUserDisableAuth('"+data+"','"+disableConfirmMsg+"','"+full.userFlag+"');\" ><i class='fa fa-unlock-alt'></i></a>";
			}else if(full.userFlag=="1"){
				ret+="<a class='btn default btn-sm grey-cascade' onclick=\"userManager.changeUserDisableAuth('"+data+"','"+enableConfirmMsg+"','"+full.userFlag+"');\" ><i class='fa fa-lock'></i></a>";
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
	 render_pic_fun:function(data,type,full){
		 if(full.userSex=="0" && (full.userPic==null || full.userPic=="")){
			 full.userPic=basePath+"/assets/pages/media/users/avatar1.jpg";
		 }else if(full.userSex=="1" && (full.userPic==null || full.userPic=="")){
			 full.userPic=basePath+"/assets/pages/media/users/avatar2.jpg";
		 }else{
			 full.userPic=basePath+full.userPic;
		 }
		 var html = '<img style="width:40px;" alt="" class="img-circle" src="'+full.userPic+'"/>';
		 return html;
	 },
	 //密码重置
	 resetPassword:function(value){
		 initAttasConfirmWal({
			sa_title: resetPwdMessage,
			sa_type: "info",
			sa_showCancelButton: true,
			sa_confirmButtonText: commonIConfirmBtn,
			sa_cancelButtonText: commonWrongOperationBtn,
			sa_closeOnConfirm: false,
			sa_closeOnCancel: false,
			confirmButtonClass: "btn-danger",
            cancelButtonClass: "btn-info",	
			sa_ajaxFuntion:function(){
				$.ajax({
	        		url: basePath+'/systemManage/updatePasswordPage',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {userId:value},
	        	})
	        	.done(function(data) {
	        		$("#searchUserBtn").click();
	        		initAttasInfoWal({sa_title:data, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
			}
		});
	 },
	 //启用、禁用用户
	 changeUserDisableAuth:function(value,mag,userFlag){
		 initAttasConfirmWal({
			sa_title: mag,
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
	        		url: basePath+'/systemManage/userDisable',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {userId:value,userFlag:userFlag},
	        	})
	        	.done(function(data) {
	        		$("#searchUserBtn").click();
	        		if(userFlag=='0'){
	        			initAttasInfoWal({sa_title:userdisablesuccess, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        		}else{
	        			initAttasInfoWal({sa_title:userenablefail, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        		}
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
			}
		});
	 }
};
//加载页面
jQuery(document).ready(function() {
	userManager.initPickers();
	userManager.userInit();
	userManager.roleInit();
});