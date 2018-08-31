/*
 *  @Description：收款节点主页面Js
 *  @author：	raomingyi
 *  @date：	2018-03-05
 */
var hideContractId;
var receiveNodeManage = {
		
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
	 
	initContractInfo:function(){
		/**************** ContractInfotable列表 ***************/
		//合同信息Table
		var $contractGridId = $("#contractMianTableId");
		//节点管理Form
		var $contractNodeFormId = $("#contractNodeFormId");
		//合同信息URL
		var $urlContract = basePath + '/contractmanage/contractNodeInfoByParam';
		//合同表列
		//字段列表 按照百分比计算 累计100%;
		var ContractColumns = [
            {"bVisible":  false,"orderable": false,"sWidth": "10","data": "id"},
   		    {"bVisible":  true,"orderable": false,"sWidth": "20","data": "row_id","sTitle":commonNumber},
   			{"orderable": true,"sWidth": "50","data": "contractNo","sTitle":contractNo},
   			{"orderable": true,"sWidth": "50","data": "contractTitle","sTitle":title},
   			{"bVisible":  true,"orderable": true,"sWidth": "50","data": "customName","sTitle":custom},
   			{"orderable": true,"sWidth": "50","data": "belongProduct","sTitle":product,"render":function(data,type,full){
   			return initCodeText(data,codeBasicInfo.PRODUCT);}},
   			{"orderable": true,"sWidth": "50","data": "signedDate","sTitle":signDate},
   			{"orderable": true,"sWidth": "50","data": "contractAmount","sTitle":price},
   			{"orderable": true,"sWidth": "50","data": "currency","sTitle":coinType,"render":function(data,type,full){
   			return initCodeText(data,codeBasicInfo.currency);}},
   			{"orderable": true,"sWidth": "50","data": "freeLimit","sTitle":freeTime},
   			{"orderable": true,"sWidth": "50","data": "giveDay","sTitle":sendDays},
   			{"orderable": true,"sWidth": "50","data": "effectiveDate","sTitle":expiryDate},
   		    {"orderable": true,"sWidth": "50","data": "contractStatus","sTitle":status,"render":function(data,type,full){
   			return initCodeText(data,codeBasicInfo.contractStatus);}},
   			{"bVisible":  true,"orderable": false,"sWidth": "80","sTitle":attachment,"render":function(data,type,full){
				return initAttachmentDownload({_dataId:full.id,_pageType:"R003-0101"});}},
   			{"orderable": false,"sWidth": "200","sTitle":commonOperate}		   
		];
		//clickToSelect: true;
		//用户操作按钮
		var contractColumnDefs=[{"targets":[14],"data":"id","render":receiveNodeManage.grid_contractInfo_operation}];
		//用户初始化表格控件
		TableAjax(gridContractInfo,$contractGridId,$urlContract,ContractColumns,contractColumnDefs,true,true,commonPageLength,receiveNodeManage.grid_receiveNode_fnRowCallback);
		//用户查询事件
		$("#searchContractBtn").on('click', function(event) {
			if(gridContractInfo.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridContractInfo.clearAjaxParams();
				gridContractInfo.searchFilter($contractNodeFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridContractInfo.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	 },		
	 //用户备选事件操作按钮
	 grid_contractInfo_operation:function(data,type,full){
		var ret="";
		//查看合同信息
		ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+lookoverBtn+" href='"+basePath+"/contractmanage/contractApprovalDetail?operate=view&id="+data+
			"' data-target='#newContractNodeModalId' data-toggle='modal'><i class='fa fa-eye'></i></a>";		
		if(hasEditNodeAuth){
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+addNodeBtn+" href='"+basePath+"/contractmanage/receiveNodeEdit?operate=add&contractId="+full.id+
		"&belongCustomerid="+full.belongCustomerid+"'data-target='#addNodeModalId' data-toggle='modal'><i class='fa fa-plus-square'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R00301&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		$(".tooltips").tooltip();
		return ret;
	 },
	
	/**************** ReceiveNode列表 ***************/
	 initReceiveNode:function(){
			
			//收款节点Table
			var $nodeGridId = $("#nodeMianTableId");			
			//收款节点信息URL
			var $urlNode = basePath + '/contractmanage/receiveNodeInfoByParam';
			//收款节点列
			//字段列表 按照百分比计算 累计100%;
			var nodeColumns = [
	            {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
	            {"bVisible": false,"orderable": false,"sWidth": "10","data": "contractId"},
	   		    {"bVisible": true,"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
	   			{"orderable": true,"sWidth": "50","data": "receivablesNo","sTitle":receivablesNo},
	   			{"orderable": true,"sWidth": "50","data": "receivablesName","sTitle":receivablesName},
	   			{"orderable": true,"sWidth": "50","data": "projectStage","sTitle":projectStage,"render":function(data,type,full){
	   	   			return initCodeText(data,codeBasicInfo.projectStage);}},
	   			{"orderable": true,"sWidth": "50","data": "receivableAmount","sTitle":receivableAmount},
	   			{"orderable": true,"sWidth": "50","data": "receivableDate","sTitle":receivableDate},
	   			{"orderable": true,"sWidth": "50","data": "receivableStatus","sTitle":receivableStatus,"render":function(data,type,full){
	   	   			return initCodeText(data,codeBasicInfo.receiveNodeStatus);}},	   				
	   			{"orderable": true,"sWidth": "50","data": "paymentRemark","sTitle":paymentRemark},
				{"orderable": true,"sWidth": "50","data": "responsibleName","sTitle":responsibleBy},
				{"orderable": true,"sWidth": "50","data": "billingDate","sTitle":billingDate},
				{"orderable": true,"sWidth": "50","data": "billingBy","sTitle":billingBy},
	   			{"orderable": false,"sWidth": "200","sTitle":commonOperate}		   
			];
			//用户操作按钮
			var nodeColumnDefs=[{"targets":[13],"data":"id","render":receiveNodeManage.grid_node_operation}];
			//用户初始化表格控件
			TableAjax(gridReceiveNode,$nodeGridId,$urlNode,nodeColumns,nodeColumnDefs,true,true,commonPageLength);
			//查询事件				 

			
	 },		 
		//用户备选事件操作按钮
		 grid_node_operation:function(data,type,full){
			var ret="";
			if(hasEditNodeAuth){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/contractmanage/receiveNodeEdit?operate=edit&id="+data+
				"' data-target='#addNodeModalId' data-toggle='modal'><i class='fa fa-edit'></i></a>";
			}		
			if(hasDeleteNodeAuth){	    
		    ret += "<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"receiveNodeManage.DeleteNodeAuth('"+data+"','"+deleteNodeConfirmMsg+"','"+full.receivablesName+"');\" >" +
		    		"<i class='fa fa-trash-o'></i></a>";	    	
			}
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R0030301&changeId="+full.id+
			"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i>"+commonDatalogBtn+"</a>";
			$(".tooltips").tooltip();
			return ret;
		 },
	 
		//删除收款节点
		 DeleteNodeAuth:function(value,mag,userFlag){
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
		        		url: basePath+'/contractmanage/deleteReceiveNode',
		        		type: 'POST',
		        		dataType: 'json',
		        		data: {id:value}
		        	})
		        	.done(function(data) {
		        		gridReceiveNode.getDataTable().ajax.reload();
		        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		        	})
		        	.fail(function(data) {
		        		showError(data.responseText);
		        	});
		       }
		   });  
		},
		 grid_receiveNode_fnRowCallback: function(row, data, index) {
			 $(row).on("click",function() {
				 if ($(this).hasClass('row_selected')) {
					 $(this).removeClass('row_selected');
					 $(this).removeAttr("style");
					 hideContractId="";//赋值选中用户ID
					 
				 } else {
					 $("#contractMianTableId tr.row_selected").removeAttr("style");
					 $("#contractMianTableId tr.row_selected").removeClass('row_selected');
					 $(this).addClass('row_selected');
					  hideContractId=data.id;//赋值选中用户ID
				 }
				 if(gridReceiveNode.getRowsCount() > 0){
					event.preventDefault();
					gridReceiveNode.clearAjaxParams();
					//传FORM参数
					gridReceiveNode.setAjaxParam("contractId", hideContractId);
					gridReceiveNode.getDataTable().ajax.reload();
				 }else{
					App.alert({
	                    type: 'danger',
	                    icon: 'warning',
	                    message: 'Please select an action',
	                    container: gridReceiveNode.getTableWrapper(),
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
    };
	//设置查询条件开始时间不能大于结束时间
    $("#contractNodeFormId #signStartDate").on("changeDate",function(e){
    	$("#contractNodeFormId #signEndDate").datepicker("setStartDate",e.date);
    });
    $("#contractNodeFormId #signEndDate").on("changeDate",function(e){
    	$("#contractNodeFormId #signStartDate").datepicker("setEndDate",e.date);
    });
	receiveNodeManage.initPickers();
	receiveNodeManage.initContractInfo();
	receiveNodeManage.initReceiveNode();
});