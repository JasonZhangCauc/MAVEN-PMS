/*
 *  @Description：主页面Js
 *  @author：	raomingyi
 *  @date：	2018-03-05
 */
var hideCustomId;
var customerIdSale;
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
   			{"orderable": false,"sWidth": "15%","data": "customShortName","sTitle":t1,"render":function(data,type,full){
   				return "<a class='btn' data-original-title="+commonEditBtn+" href='"+basePath+"/preSalesManage/customManageLook?operate=look&id="+full.id+
   				"' data-target='#newCustomModalId' data-toggle='modal'>"+data+"</a>";
   			}},
   			{"orderable": false,"sWidth": "25%","data": "customName","sTitle":t2},
   			/*{"orderable": false,"sWidth": "15%","data": "second","sTitle":t16},*/
   			/*{"orderable": false,"sWidth": "30%","data": "customAddress","sTitle":t3},*/
   			{"orderable": false,"sWidth": "25%","data": "contactPhone","sTitle":t4},
   			{"orderable": false,"sWidth": "25%","data": "email","sTitle":t5},
   			/*{"orderable": false,"sWidth": "25%","data": "remark","sTitle":t6},*/
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
	 //用户备选事件操作按钮
	 grid_custom_operation:function(data,type,full){
		 var ret="";
			if(hasEditCustomAuth){
				ret += "<a class='btn default btn-sm green-haze tooltips' title="+commonEditBtn+" href='"+basePath+"/preSalesManage/customManageEdit?operate=edit&id="+data+
				"' data-target='#newCustomModalIdss' data-toggle='modal'><i class='fa fa-edit'></i> 编辑</a>";
			}	
			if(hasEditLinkerAuth){
				ret += "<a class='btn default btn-sm blue tooltips' title="+addActivityBtn+" href='"+basePath+"/preSalesManage/linkerManageEdit?operate=add&customerId="+data+
				"'data-target='#addLinkerModalIdss' data-toggle='modal'><i class='fa fa-plus-square'></i> 新增联系人</a>"; 
				
				
			}
			if(hasDeleteCustomAuth){  
				if(full.isShowDelete!=1){
					ret +="<a onclick=\"customManage.DeleteCustomAuth('"+data+"','"+deleteCustomerConfirmMsg+"','"+full.customName+"');\" title="+deleteInfo+" class='btn default btn-sm red'><i class='fa fa-trash-o'></i> 删除</a>";
				}
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
			var $linkerGridId = $("#linkerMianTableIdByCustom");			
			//联系人信息URL
			var $urlLinker = basePath + '/preSalesManage/linkerInfoByParam';
			//联系人列
			//字段列表 按照百分比计算 累计100%;
			var linkerColumns = [
	            {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
	            {"bVisible": false,"orderable": false,"sWidth": "10","data": "customerId"},
	   			{"orderable": true,"sWidth": "15%","data": "contactName","sTitle":"联系人姓名","render":function(data,type,full){
   				return "<a class='btn' data-original-title="+commonEditBtn+" href='"+basePath+"/preSalesManage/linkerManageLook?operate=look&linkerId="+full.id+
   				"' data-target='#LookLinkerModalId' data-toggle='modal'>"+data+"</a>";
   				}},
	   			{"orderable": true,"sWidth": "25%","data": "positionDescribe","sTitle":"职务描述"},
	   			{"orderable": true,"sWidth": "15%","data": "mobilePhone","sTitle":t10},
	   			/*{"orderable": true,"sWidth": "15%","data": "fixedPhone","sTitle":t11},
	   			{"orderable": true,"sWidth": "15%","data": "email","sTitle":t12},
	   			{"orderable": true,"sWidth": "30%","data": "remark","sTitle":t14},*/
	   			{"orderable": false,"sWidth": "15%","sTitle":commonOperate}		   
			];
			//用户操作按钮
			var linkerColumnDefs=[{"targets":[5],"data":"id","render":customManage.grid_linker_operation}];
			//用户初始化表格控件
			TableAjax(gridLinker,$linkerGridId,$urlLinker,linkerColumns,linkerColumnDefs,true,true,commonPageLength);
			//查询事件				 

			/*$("#searchCustomBtn").on('click', function(event) {
				if(gridLinker.getRowsCount() > 0){
					event.preventDefault();
					gridLinker.clearAjaxParams();
					//传FORM参数
					gridLinker.setAjaxParam();
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
			});*/
	 },		 
	 /*****************销售客户******************/
	 saleTrackLoad:function(){
			
			//联系人Table
			var $saleTrackId = $("#saleTrackId");			
			//联系人信息URL
			var $urlsaleTrackId = basePath + '/preSalesManage/saleTrackInfoByCustomeParam';
			//联系人列
			//字段列表 按照百分比计算 累计100%;
			var saleTrackColumns = [
					{"bVisible": false,"orderable": false,"data": "id"},
					{"orderable": true,"sWidth": "10%","data": "projectName","sTitle":tprojectName},
					{"orderable": true,"sWidth": "10%","data": "customerName","sTitle":t1},
					{"orderable": true,"sWidth": "10%","data": "saleResponsibleName","sTitle":tproResponser},
					{"orderable": true,"sWidth": "10%","data": "saleStatus","sTitle":tproStatus,"render":function(data,type,full){
					return initCodeText(data,codeBasicInfo.saleStatus);}},
			];
			//用户操作按钮
			var saleTrackColumnDefs=[{"targets":[4],"data":"id","render":customManage.grid_linker_operation}];
			//用户初始化表格控件
			TableAjax(gridSaleTrack,$saleTrackId,$urlsaleTrackId,saleTrackColumns,saleTrackColumnDefs,true,true,commonPageLength);
			//查询事件				 
	 },	
		//用户备选事件操作按钮
		 grid_linker_operation:function(data,type,full){
			var ret="";
			if(hasEditLinkerAuth){
			ret += "<a class='btn default btn-sm green-haze'href='"+basePath+"/preSalesManage/linkerManageEdit?operate=edit&id="+data+
				"' data-target='#addLinkerModalIdss' data-toggle='modal'><i class='fa fa-edit'></i> 编辑</a>";
			}		
			if(hasDeleteLinkerAuth){	    
		    ret += "<a class='btn default btn-sm red'onclick=\"customManage.DeleteLinkerAuth('"+data+"','"+deleteLinkerConfirmMsg+"','"+full.contactName+"');\" >" +
		    		"<i class='fa fa-trash-o'></i> 删除</a>";	    	
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
		 grid_customer_fnRowCallback: function(row, data, index) {
			 $(row).on("click",function() {
				 if ($(this).hasClass('row_selected')) {
					 $(this).removeClass('row_selected');
					 $(this).removeAttr("style");
					 hideCustomId="";//赋值选中用户ID
					 customerIdSale = "";
					 
				 } else {
					 $("#customMianTableId tr.row_selected").removeAttr("style");
					 $("#customMianTableId tr.row_selected").removeClass('row_selected');
					 $(this).addClass('row_selected');
					  hideCustomId=data.id;//赋值选中用户ID
					  customerIdSale = data.id;
				 }
				 if(gridLinker.getRowsCount() > 0){
					event.preventDefault();
					gridLinker.clearAjaxParams();
					//传FORM参数
					gridLinker.setAjaxParam("customerId", hideCustomId);
					gridLinker.getDataTable().ajax.reload();
					
					//向项目传参数
					gridSaleTrack.setAjaxParam("customerId", customerIdSale);
					gridSaleTrack.getDataTable().ajax.reload();
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
function look(data){
	window.location.href=basePath+"/preSalesManage/customManageLook?operate=look&customerId="+data;	
}
function lookPerson(data){
	window.location.href=basePath+"/preSalesManage/linkerManageEdit?operate=edit&id="+data;	
}
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    }
	customManage.initCustom();
	customManage.initlinker();
	customManage.saleTrackLoad();
});