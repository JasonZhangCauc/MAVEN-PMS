/*
 *  @Description：主页面Js
 *  @author：	raomingyi
 *  @date：	2018-03-05
 */
var hideCustomId;
var customManage = {
	 
	initCustom:function(){
		/**************** Customtable列表 ***************/
		//客户管理Table
		var $customGridId = $("#customMianTableId");
		//客户管理Form
		var $customFormId = $("#customMianFormId");
		//客户信息URL
		var $urlCustom = basePath + '/preSalesManage/CustomInfoByParam';
		//客户列
		//字段列表 按照百分比计算 累计100%;
		var customColumns = [
            {"bVisible": false,"orderable": false,"data": "id"},
   		    {"bVisible": false,"orderable": false,"sWidth": "5%","data": "row_id","sTitle":commonNumber}, 
   		 	{"orderable": true,"sWidth": "20%","data": "userPic","sTitle":tl,"render":function(data,type,full){
				var url = basePath+data;
				return "<img  style=\"width:40px;margin-left: 17px;text-align: left;\" alt=\"\" class=\"img-circle\" src="+url+"/></div>";
			}},
   			{"orderable": true,"sWidth": "25%","data": "customName","sTitle":t2},
   			{"orderable": true,"sWidth": "30%","data": "customAddress","sTitle":t3},
   			{"orderable": true,"sWidth": "25%","data": "contactPhone","sTitle":t4,"render":function(data,type,full){
   				var str = "";
   				if(data!=null){
   					str = "<span class='fa fa-phone btn-outline green btn-sm'></span><span>"+customManage.isNull(data)+"</span>";
   				}
   				return str;
			}}, 
   			{"orderable": false,"sWidth": "15%","sTitle":commonOperate}		   
		];
		//clickToSelect: true;
		//用户操作按钮
		var customColumnDefs=[{"targets":[6],"data":"id","render":customManage.grid_custom_operation}];
		//用户初始化表格控件
		TableAjax(gridCustomer,$customGridId,$urlCustom,customColumns,customColumnDefs,true,true,commonPageLength,customManage.grid_customer_fnRowCallback);
		//用户查询事件
		$("#searchCustomBtn").on('click', function(event) {
			if(gridCustomer.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridCustomer.searchFilter($customFormId);
				gridCustomer.clearAjaxParams();
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridCustomer.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	 },	
	 initCustomEdit:function () {
	        //客户信息保存
	    	$("#saveCustomId").click(function(){
	    		$("#CustomEditFormId").submit();
	    	});
	    	
	    	//客户信息验证
	    	$("#CustomEditFormId").validator({
	    		valid:function(from){
	    			$("#CustomEditFormId #changeDetails").val(getModifiedField($("#CustomEditFormId").serializeFormJson(),objectVal,customColumn));
	    			$.ajax({
	    				url:basePath+'/preSalesManage/saveCustom',
	    				type: 'POST',
	    				data: $("#CustomEditFormId").serialize(),
	    				dataType: 'json',
	    				success:function(event){
	    					//$("#closeCustomBaseInfoEditId").click();
	    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	    					gridCustomer.getDataTable().ajax.reload();
	    				}
	    			});
	    		}
	    	});
	     },
	 isNull:function(val){
		 var rel = "";
		 if(val==null){
			 rel = "";
		 }else{
			 rel = val;
		 }
		 return rel;
	 },
	 //用户备选事件操作按钮
	 grid_custom_operation:function(data,type,full){
		var ret="";
		if(hasEditCustomAuth){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/preSalesManage/customManageEdit?operate=edit&id="+data+
			"' data-target='#newCustomModalIdss' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}	
		if(hasEditLinkerAuth){
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+addActivityBtn+" href='"+basePath+"/preSalesManage/linkerManageEdit?operate=add&customerId="+data+
			"'data-target='#addLinkerModalIdss' data-toggle='modal'><i class='fa fa-plus-square'></i></a>"; 
			
			
		}
		if(hasDeleteCustomAuth){  
			ret +="<a onclick=\"customManage.DeleteCustomAuth('"+data+"','"+deleteCustomerConfirmMsg+"','"+full.customName+"');\" class='btn default btn-sm red'><i class='fa fa-trash-o'></i></a>";
		}
		
		
		return ret;
	 },
	//删除客户
	 DeleteCustomAuth:function(value,msg,userFlag){
		 initAttasConfirmWal({
			sa_title: msg,
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
	        		url: basePath+'/preSalesManage/deleteCustom',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value}
	        	})
	        	.done(function(data) {
	        		$("#searchCustomBtn").click();
	        		gridCustomer.getDataTable().ajax.reload();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	       }
	   });				
	},
	 
	/**************** Linkertable列表 ***************/
	 initlinker:function(){
			
			//联系人Table
			var $linkerGridId = $("#linkerMianTableIds");		
			//客户管理Form
			var $customFormId = $("#customMianFormId");
			//联系人信息URL
			var $urlLinker = basePath + '/preSalesManage/linkerInfoByParam';
			//联系人列
			//字段列表 按照百分比计算 累计100%;
			var linkerColumns = [
	            {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
	            {"bVisible": false,"orderable": false,"sWidth": "5","data": "customerId"}, 
	   			{"orderable": false,"sWidth": "15%","data": "contactName","sTitle":"联系人姓名"},
	   			{"orderable": false,"sWidth": "25%","data": "customName","sTitle":t2}, 
	   			{"orderable": false,"sWidth": "25%","data": "positionDescribe","sTitle":tt},
	   			{"orderable": false,"sWidth": "15%","data": "mobilePhone","sTitle":t10,"render":function(data,type,full){
					return "<span class='fa fa-phone btn-outline green btn-sm'></span><span>"+data+"</span>";
				}}, 
	   			{"orderable": false,"sWidth": "15%","sTitle":commonOperate}		   
			];
			//用户操作按钮
			var linkerColumnDefs=[{"targets":[6],"data":"id","render":customManage.grid_linker_operation}];
			//用户初始化表格控件
			TableAjax(gridLinker,$linkerGridId,$urlLinker,linkerColumns,linkerColumnDefs,true,true,commonPageLength,customManage.grid_contact_fnRowCallback);
			
			//查询事件				 
			$("#searchCustomBtn").on('click', function(event) {
				if(gridLinker.getRowsCount() > 0){
					event.preventDefault();
					gridLinker.clearAjaxParams();
					//传FORM参数
					gridLinker.searchFilter($customFormId);
				}else{
					App.alert({
	                    type: 'danger',
	                    icon: 'warning',
	                    message: 'Please select an action',
	                    container: gridLinker.getTableWrapper(),
	                    place: 'prepend'
	                });
				}
			});
	 },		 
	 initlinkerEdit:function () {
         //客户信息保存
     	$("#linkerEditFormId #saveLinkerBtnId").click(function(){
     		$("#linkerEditFormId").submit();
     	});
     	
     	//客户信息验证
     	$("#linkerEditFormId").validator({
     		valid:function(from){
     			$("#linkerEditFormId #changeDetails").val(getModifiedField($("#linkerEditFormId").serializeFormJson(),linkerOldVal,linkerField));
     			$.ajax({
     				url:basePath+'/preSalesManage/saveLinker',
     				type: 'POST',
     				data: $("#linkerEditFormId").serialize(),
     				dataType: 'json',
     				success:function(event){
     					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
     					gridCustomer.getDataTable().ajax.reload();
     					gridLinker.getDataTable().ajax.reload();
     					
     				}
     			});
     		}
     	});
      },
		//用户备选事件操作按钮
		 grid_linker_operation:function(data,type,full){
			var ret="";
			if(hasEditLinkerAuth){
				ret += "<a class='btn default btn-sm green-haze'href='"+basePath+"/preSalesManage/linkerManageEdit?operate=edit&linkerId="+data+
					"' data-target='#addLinkerModalIdss' data-toggle='modal'><i class='fa fa-edit'></i></a>";
				}		 
			if(hasDeleteLinkerAuth){	    
			    ret += "<a class='btn default btn-sm red'onclick=\"customManage.DeleteLinkerAuth('"+data+"','"+deleteLinkerConfirmMsg+"','"+full.contactName+"');\" >" +
			    		"<i class='fa fa-trash-o'></i></a>";	    	
				}	
			
			return ret;
		 },
	 
		//删除联系人
		 DeleteLinkerAuth:function(value,msg,userFlag){
			 initAttasConfirmWal({
				sa_title: msg,
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
		        		url: basePath+'/preSalesManage/deleteLinker',
		        		type: 'POST',
		        		dataType: 'json',
		        		data: {id:value}
		        	})
		        	.done(function(data) {
		        		gridLinker.getDataTable().ajax.reload();
		        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		        	})
		        	.fail(function(data) {
		        		showError(data.responseText);
		        	});
		       }
		   });  
		},
		grid_contact_fnRowCallback: function(row, data, index) {
			 $(row).on("click",function() {
				if ($(this).hasClass('row_selected')) {
					 $(this).removeClass('row_selected');
					 $(this).removeAttr("style");
					 $("#contactName").val("");
					 $("#mobilePhone").val("");
					 $("#positionDescribe").val("");
					 $("#fixedPhone").val("");
					 $("#email").val("");
					 $("#qqCard").val(""); 
					 $("#remark").val("");
				 } else {
					 //$("#idContact").val(data.id);
					 $("#contactName").val(data.contactName); 
					 $("#mobilePhone").val(data.mobilePhone);
					 $("#positionDescribe").val(data.positionDescribe);
					 $("#fixedPhone").val(data.fixedPhone);
					 $("#emailLink").val(data.email);
					 $("#qqCard").val(data.qqCard);
					 $("#remarkLink").val(data.remark);
					 $("#linkerMianTableIds tr.row_selected").removeAttr("style");
					 $("#linkerMianTableIds tr.row_selected").removeClass('row_selected');
					 $(this).addClass('row_selected');
				 }
				 
			 });
	   },
		 grid_customer_fnRowCallback: function(row, data, index) {
			 $(row).on("click",function() {
				 if ($(this).hasClass('row_selected')) {
					 $(this).removeClass('row_selected');
					 $(this).removeAttr("style");
					 hideCustomId="";//赋值选中用户ID
					 $("#customShortName").val("");
					 $("#customName").val("");
					 $("#second").val("");
					 $("#customCode").val("");
					 $("#customAddress").val("");
					 $("#taxpayerName").val("");
					 $("#taxpayerNumber").val("");
					 $("#taxpayerPhone").val("");
					 $("#taxpayerAddress").val("");
					 $("#contactPhone").val("");
					 $("#taxpayerBank").val("");
					 $("#email").val("");
					 $("#taxpayerAccount").val("");
					 $("#remark").val("");
					 $("#id").val("");
				 } else {
					 $("#customShortName").val(data.customShortName);
					 $("#customName").val(data.customName);
					 $("#second").val(data.second);
					 $("#customCode").val(data.customCode);
					 $("#customAddress").val(data.customAddress);
					 $("#taxpayerName").val(data.taxpayerName);
					 $("#taxpayerNumber").val(data.taxpayerNumber);
					 $("#taxpayerPhone").val(data.taxpayerPhone);
					 $("#taxpayerAddress").val(data.taxpayerAddress);
					 $("#contactPhone").val(data.contactPhone);
					 $("#taxpayerBank").val(data.taxpayerBank);
					 $("#email").val(data.email);
					 $("#taxpayerAccount").val(data.taxpayerAccount);
					 $("#remark").val(data.remark);
					 $("#id").val(data.id);
					 $("#customMianTableId tr.row_selected").removeAttr("style");
					 $("#customMianTableId tr.row_selected").removeClass('row_selected');
					 $(this).addClass('row_selected');
					  hideCustomId=data.id;//赋值选中用户ID
				 }
				 if(gridLinker.getRowsCount() > 0){
					event.preventDefault();
					gridLinker.clearAjaxParams();
					//传FORM参数
					gridLinker.setAjaxParam("customerId", hideCustomId);
					gridLinker.getDataTable().ajax.reload();
				 }else{
					App.alert({
	                    type: 'danger',
	                    icon: 'warning',
	                    message: 'Please select an action',
	                    container: gridLinker.getTableWrapper(),
	                    place: 'prepend'
	                });
			     }
			 });
	   }, 
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    }
	customManage.initCustom();
	customManage.initlinker();
	customManage.initCustomEdit();
	customManage.initlinkerEdit();
});