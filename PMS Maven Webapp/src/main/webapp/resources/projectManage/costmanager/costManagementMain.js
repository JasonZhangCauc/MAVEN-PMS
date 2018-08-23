/*
 *  @Description：单价管理主页面Js
 *  @author：	jczou
 *  @date：	2018-02-28
 */

var costManagementMain = {	
     //单价列表
	 costInit:function(){
	    //单价管理Table
		var $costManagementMianGridId = $("#costManagementMianTableId");
		//单价管理Form
		var $costManagementMianFormId = $("#costManagementMianFormId");
		//单价信息URL
		var $urlCostManagementMian = basePath + '/projectManagement/costManagementInfoByParam';
		//单价列
		var costManagementMainColumns=[
				{"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
				{"bVisible": true,"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
				{"orderable": true,"sWidth": "50","data": "supplierId","sTitle":costManagement_suppliername,"render":function(data,type,full){
					return initCodeText(data,codeBasicInfo.suppliername);
				}},
				{"orderable": true,"sWidth": "50","data": "priceType","sTitle":costManagement_priceType,"render":function(data,type,full){
					return initCodeText(data,codeBasicInfo.pricetype);
				}},
				{"orderable": true,"sWidth": "50","data": "price","sTitle":costManagement_price},
				{"orderable": true,"sWidth": "50","data": "currency","sTitle":costManagement_currency,"render":function(data,type,full){
					return initCodeText(data,codeBasicInfo.currency);
				}},
				{"orderable": true,"sWidth": "50","data": "beginDate","sTitle":costManagement_beginDate},
				{"orderable": true,"sWidth": "50","data": "endDate","sTitle":costManagement_endDate},
				{"orderable": true,"sWidth": "50","data": "remark","sTitle":costManagement_remark},
				{"orderable": false,"sWidth": "200","sTitle":commonOperate}
				];
		//单价操作按钮
		var costManagementMainColumnDefs=[{"targets":[9],"data":"id","render":costManagementMain.grid_cost_operation}];
		//单价初始化表格控件
		TableAjax(gridCost,$costManagementMianGridId,$urlCostManagementMian,costManagementMainColumns,costManagementMainColumnDefs,true,true,commonPageLength,null);
		//单价查询事件
		$("#costManagementSearchBtn").on('click', function(event) {
			if(gridCost.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridCost.clearAjaxParams();
				gridCost.searchFilter($costManagementMianFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridCost.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	 },
	 //单价备选事件操作按钮
	 grid_cost_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthCost){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/projectManagement/costManagementEdit?operate=edit&id="+data+
			"' data-target='#todo-task-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		if(hasDeleteCostAuth){
		    ret += "<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"costManagementMain.DeleteCostAuth('"+data+"','"+deleteCostConfirmMsg+"','"+full.supplierId+"');\" >" +
		    		"<i class='fa fa-trash-o'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R00403&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		$(".tooltips").tooltip();
		return ret;
	 },
	 
	 //删除单价
	 DeleteCostAuth:function(value,mag,userFlag){
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
	        		url: basePath+'/projectManagement/deleteCostManagement',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		$("#costManagementSearchBtn").click();	 
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
     };
 	 //初始化下拉框及日期控件
     $('.date-picker').datepicker({
         rtl: App.isRTL(),
         clearBtn: true,
         autoclose: true
     });
     $('.bs-select').selectpicker({
         iconBase: 'fa',
         tickIcon: 'fa-check'
     });
     //设置开始时间不能大于结束时间
     $("#costManagementMianFormId #startTime").on("changeDate",function(e){
     	$("#costManagementMianFormId #endTime").datepicker("setStartDate",e.date);
     });
     $("#costManagementMianFormId #endTime").on("changeDate",function(e){
     	$("#costManagementMianFormId #startTime").datepicker("setEndDate",e.date);
     });
 	costManagementMain.costInit();
});