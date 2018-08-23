/*
 *  @Description：主页面Js
 *  @author：	raomingyi
 *  @date：	2018-03-05
 */
var ContractManage = {
	 
	//初始日期控件和下拉框控件
	 initPickers:function () {
		//初始化下拉框及日期控件
	    $('.date-picker').datepicker({
	    	format: 'yyyy-mm-dd',
		    clearBtn: true,
		    autoclose: true
	    });
		$('.bs-select').selectpicker({
	        iconBase: 'fa',
	        tickIcon: 'fa-check'
	    });
     },
    
	initContract:function(){
		/**************** Contracttable列表 ***************/
		//合同信息Table
		var $ContractGridId = $("#leaveMianTableId");
		//用户管理Form
		var $ContractFormId = $("#leaveMianFormId");
		//用户信息URL
		var $urlContract = basePath + '/checkinginManage/leaveInfoByParam';
		//用户列
		//字段列表 按照百分比计算 累计100%;
		var ContractColumns = [
            {"bVisible":  false,"orderable": false,"sWidth": "50","data": "id"},
   		    {"bVisible":  true,"orderable": false,"sWidth": "170","data": "row_id","sTitle":commonNumber},
   		    {"orderable": true,"sWidth": "170","data": "leaveState","sTitle":t1,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.leaveState);}},
   			{"orderable": true,"sWidth": "170","data": "userName","sTitle":t2},
   			{"orderable": true,"sWidth": "170","data": "leaveType","sTitle":t3,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.leaveType);}},
   			
   			{"orderable": true,"sWidth": "170","data": "beginTime","sTitle":t4},
   			{"orderable": true,"sWidth": "170","data": "endTime","sTitle":t5},
   			{"orderable": false,"sWidth": "300","sTitle":commonOperate}		   
		];
		//用户操作按钮
		var ContractColumnDefs=[{"targets":[7],"data":"id","render":ContractManage.grid_Contract_operation}];
		//用户初始化表格控件
		TableAjax(gridContract,$ContractGridId,$urlContract,ContractColumns,ContractColumnDefs,true,true,commonPageLength);
		//用户查询事件
		$("#searchContractBtn").on('click', function(event) {
			if(gridContract.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridContract.searchFilter($ContractFormId);
				gridContract.clearAjaxParams();
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridContract.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	 },		
	 //用户备选事件操作按钮
	 grid_Contract_operation:function(data,type,full){
		var ret="";
		//查看操作
		 ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonViewBtn+" href='"+basePath+"/checkinginManage/leaveManageEdit?operate=look&id="+data+
			"' data-target='#todo-task-modal' data-toggle='modal'><i class='fa fa-eye'></i></a>";
		//编辑中状态
		if(full.leaveState=='1'){
		if(hasEditContractAuth){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/checkinginManage/leaveManageEdit?operate=edit&id="+data+
				"' data-target='#todo-task-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
			}	
		if(hasDeleteContractAuth){	    
	    ret += "<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"ContractManage.DeleteContractAuth('"+data+"','"+deleteContractConfirmMsg+"'," +
	    		"'"+full.ContractName+"');\" ><i class='fa fa-trash-o'></i></a>";	    	
		}
		//提交
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonPassBtn+" onclick=\"ContractManage.ContractSendAuth('"+data+"','"+passMsg+"'," +
		"'"+full.ContractName+"');\" ><i class='fa fa-external-link'></i></a>";
	 }
		//已提交状态
		if(full.leaveState=='2'){
			if(hasSendContractAuth){
				//审核拒绝
				ret += "<a class='btn default btn-sm red tooltips' data-original-title="+backBtn+" onclick=\"ContractManage.ContractBackAuth('"+data+"','"+backMsg+"'," +
				"'"+full.ContractName+"');\" ><i class='fa fa-close'></i></a>";
				//审核通过
				ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonPassBtn+" onclick=\"ContractManage.ContractPassAuth('"+data+"','"+passMsg+"'," +
				"'"+full.ContractName+"');\" ><i class='fa fa-check'></i></a>";
			   }
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R00301&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		$(".tooltips").tooltip();
		return ret;
	 },
	//提交
	 ContractSendAuth:function(value,meg,userFlag){
			initAttasConfirmWal({
				sa_title: meg,
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
		        		url: basePath+'/checkinginManage/updateLeaveSendStatus',
		        		type: 'POST',
		        		dataType: 'json',
		        		data: {id:value}
		        	})
		        	.done(function(data) {
		        		$("#searchContractBtn").click();
		        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		        	})
		        	.fail(function(data) {
		        		showError(data.responseText);
		        	});
		       }
		   });			
		},
		//拒绝
		 ContractBackAuth:function(value,meg,userFlag){
				initAttasConfirmWal({
					sa_title: meg,
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
			        		url: basePath+'/checkinginManage/updateLeaveState',
			        		type: 'POST',
			        		dataType: 'json',
			        		data: {id:value}
			        	})
			        	.done(function(data) {
			        		$("#searchContractBtn").click();
			        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
			        	})
			        	.fail(function(data) {
			        		showError(data.responseText);
			        	});
			       }
			   });			
			},
			//通过
			 ContractPassAuth:function(value,meg,userFlag){
					initAttasConfirmWal({
						sa_title: meg,
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
				        		url: basePath+'/checkinginManage/passLeaveState',
				        		type: 'POST',
				        		dataType: 'json',
				        		data: {id:value}
				        	})
				        	.done(function(data) {
				        		$("#searchContractBtn").click();
				        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
				        	})
				        	.fail(function(data) {
				        		showError(data.responseText);
				        	});
				       }
				   });			
				},
		//审批
		 contractAuthCheck:function(value,meg,operate){
			 initAttasConfirmWal({
				sa_title: meg,
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
		        		url: basePath+'/checkinginManage/updateLeaveStatus',
		        		type: 'POST',
		        		dataType: 'json',
		        		data: {id:value,operate:operate}
		        	})
		        	.done(function(data) {
		        		$("#searchContractAppBtn").click();
		        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		        	})
		        	.fail(function(data) {
		        		showError(data.responseText);
		        	});
		       }
		   });			
		},
	//删除信息
	 DeleteContractAuth:function(value,meg,userFlag){
		 initAttasConfirmWal({
			sa_title: meg,
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
	        		url: basePath+'/checkinginManage/deleteLeave',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		$("#searchContractBtn").click();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
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
	if (!jQuery().dataTable) {
        return;
    };
	//设置查询条件开始时间不能大于结束时间
    /*$("#leaveMianFormId #signStartDate").on("changeDate",function(e){
    	$("#leaveMianFormId #signEndDate").datepicker("setStartDate",e.date);
    });*/
    /*$("#leaveMianFormId #signEndDate").on("changeDate",function(e){
    	$("#leaveMianFormId #signStartDate").datepicker("setEndDate",e.date);
    });*/
	ContractManage.initPickers();
	ContractManage.initContract();
});