/*
 *  @Description：合同审批主页面Js
 *  @author：	raomingyi
 *  @date：	2018-03-05
 */
var ContractApproval = {
	 
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
		var $ContractGridId = $("#contractMianTableId");
		//合同管理Form
		var $ContractFormId = $("#approvalMianFormId");
		//合同信息URL
		var $urlContract = basePath + '/pactManage/contractAppInfoByParam';
		//合同表列
		//字段列表 按照百分比计算 累计100%;
		var ContractColumns = [
            {"bVisible":  false,"orderable": false,"sWidth": "10","data": "id"},
   		    {"bVisible":  true,"orderable": false,"sWidth": "20","data": "row_id","sTitle":commonNumber},
   			{"orderable": true,"sWidth": "50","data": "contractNo","sTitle":t1},
   			{"orderable": true,"sWidth": "50","data": "contractTitle","sTitle":t2},
   			{"bVisible":  true,"orderable": true,"sWidth": "50","data": "customName","sTitle":t3},
   			{"orderable": true,"sWidth": "50","data": "belongProduct","sTitle":t4,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.PRODUCT);}},
   			{"orderable": true,"sWidth": "50","data": "signedDate","sTitle":t5},
   			{"orderable": true,"sWidth": "50","data": "contractAmount","sTitle":t6},
   			{"orderable": true,"sWidth": "50","data": "currency","sTitle":t7,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.currency);}},
   			{"orderable": true,"sWidth": "50","data": "freeLimit","sTitle":t8},
   			{"orderable": true,"sWidth": "50","data": "giveDay","sTitle":t9},
   			{"orderable": true,"sWidth": "50","data": "effectiveDate","sTitle":t10},
			{"orderable": true,"sWidth": "50","data": "contractStatus","sTitle":t11,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.contractStatus);}},
			{"bVisible":  true,"sWidth": "50","data": "createByName","sTitle":t12},
			{"bVisible":  true,"orderable": false,"sWidth": "80","sTitle":attachment,"render":function(data,type,full){
				return initAttachmentDownload({_dataId:full.id,_pageType:"R003-0101"});}},
   			{"orderable": false,"sWidth": "200","sTitle":commonOperate}		   
		];
		//用户操作按钮
		var ContractColumnDefs=[{"targets":[15],"data":"id","render":ContractApproval.grid_Contract_operation}];
		//用户初始化表格控件
		TableAjax(gridContractApp,$ContractGridId,$urlContract,ContractColumns,ContractColumnDefs,true,true,commonPageLength);
		//用户查询事件
		$("#searchContractAppBtn").on('click', function(event) {
			if(gridContractApp.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridContractApp.clearAjaxParams();
				gridContractApp.searchFilter($ContractFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridContractApp.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	 },		
	 //用户备选事件操作按钮
	 grid_Contract_operation:function(data,type,full){
		 var ret="";	 
		//查看合同信息
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+lookoverBtn+" href='"+basePath+"/contractmanage/contractApprovalDetail?operate=view&id="+data+
			"' data-target='#newContractAppModalId' data-toggle='modal'><i class='fa fa-eye'></i></a>";		
		//预览
		//ret += "<a class='btn default btn-sm yellow' href='"+basePath+"/contractmanage/contractApprovalDetail?operate=view&id="+data+
		//"' data-target='#newContractAppModalId' data-toggle='modal'><i class='fa fa-desktop'></i>"+previewBtn+"</a>";		
		//审批
		if(full.contractStatus=='1'& hasContractAppAuth==true){			
		ret += "<a class='btn default btn-sm green tooltips' data-original-title="+passBtn+" onclick=\"ContractApproval.contractAuthCheck('"+data+"','"+passMsg+"','"+
		"pass"+"');\" ><i class='fa fa-forward'></i></a>";
		ret += "<a class='btn default btn-sm red tooltips' data-original-title="+backBtn+" onclick=\"ContractApproval.contractAuthCheck('"+data+"','"+backMsg+"','"+
		"back"+"');\" ><i class='fa fa-backward'></i></a>";	    		   				
	  }
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R00301&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		$(".tooltips").tooltip();
		return ret;
	 },
	//合同审批
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
	        		url: basePath+'/contractmanage/updateContractStatus',
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
				  
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    }
	//设置查询条件开始时间不能大于结束时间
    $("#approvalMianFormId #signStartDate").on("changeDate",function(e){
    	$("#approvalMianFormId #signEndDate").datepicker("setStartDate",e.date);
    });
    $("#approvalMianFormId #signEndDate").on("changeDate",function(e){
    	$("#approvalMianFormId #signStartDate").datepicker("setEndDate",e.date);
    });
	ContractApproval.initPickers();
	ContractApproval.initContract();
});