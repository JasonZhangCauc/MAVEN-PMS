/*
 *  @Description：合同执行情况主页面Js
 *  @author：	raomingyi
 *  @date：	2018-03-05
 */
var ContractExecuInfo = {
	 
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
		/**************** ContractTable列表 ***************/
		//合同执行信息Table
		var $ContractGridId = $("#contractMianTableId");
		//合同执行信息Form
		var $contractExecuMianFormId = $("#contractExecuMianFormId");
		//合同执行信息URL
		var $urlContract = basePath + '/contractmanage/contractExecuInfoByParam';
		//合同执行信息列
		//字段列表 按照百分比计算 累计100%;
		var ContractColumns = [
            {"bVisible":  false,"orderable": false,"sWidth": "10","data": "id"},
   		    {"bVisible":  true,"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
   			{"orderable": true,"sWidth": "50","data": "contractNo","sTitle":contractNo},
   			{"orderable": true,"sWidth": "50","data": "contractTitle","sTitle":title},
   			{"bVisible":  true,"orderable": true,"sWidth": "50","data": "customName","sTitle":custom},
   			{"orderable": true,"sWidth": "50","data": "belongProduct","sTitle":product,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.PRODUCT);}},
   			{"orderable": true,"sWidth": "50","data": "contractAmount","sTitle":price},
   			{"orderable": true,"sWidth": "50","data": "receivedMoney","sTitle":receivedMoney},
   			{"orderable": true,"sWidth": "50","data": "restEffectivedays","sTitle":restEffectiveDays},
   			{"orderable": true,"sWidth": "50","data": "restSenddays","sTitle":restSendDays},
			{"bVisible":  true,"sWidth": "50","data": "effectiveDate","sTitle":expiryDate},
			{"orderable": true,"sWidth": "50","data": "contractStatus","sTitle":status,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.contractStatus);}},			
   			{"orderable": false,"sWidth": "200","sTitle":commonOperate}		   
		];
		//用户操作按钮
		var ContractColumnDefs=[{"targets":[12],"data":"id","render":ContractExecuInfo.grid_Contract_operation}];
		//用户初始化表格控件
		TableAjax(gridContractExecuInfo,$ContractGridId,$urlContract,ContractColumns,ContractColumnDefs,true,true,commonPageLength);
		//用户查询事件
		$("#searchContractBtn").on('click', function(event) {
			if(gridContractExecuInfo.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridContractExecuInfo.clearAjaxParams();
				gridContractExecuInfo.searchFilter($contractExecuMianFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridContractExecuInfo.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	 },		
	 //用户备选事件操作按钮
	 grid_Contract_operation:function(data,type,full){
		var ret="";		
		//合同跟踪
		if(hasContractTrackAuth){			
		ret += "<a addtabs='R00304_01' title='"+contractTrackBtn+"' class='btn default btn-sm blue' style='cursor:pointer;' " +
		"url='/contractmanage/contractTrackMain?contractId="+full.id+
		"' ><i class='fa fa-paper-plane-o'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R00301&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		$(".tooltips").tooltip();
		return ret;
	 },
	 
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    };
	//设置查询条件开始时间不能大于结束时间
    $("#contractExecuMianFormId #signStartDate").on("changeDate",function(e){
    	$("#contractExecuMianFormId #signEndDate").datepicker("setStartDate",e.date);
    });
    $("#contractExecuMianFormId #signEndDate").on("changeDate",function(e){
    	$("#contractExecuMianFormId #signStartDate").datepicker("setEndDate",e.date);
    });
	ContractExecuInfo.initPickers();
	ContractExecuInfo.initContract();
});