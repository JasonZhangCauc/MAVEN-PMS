/*
 *  @Description：其他成本主页面Js
 *  @author：	jczou
 *  @date：	2018-03-19
 */

var othercostManagementMain = {
     //其他成本列表
	 othercostInit:function(){
	    //其他成本Table
		var $othercostManagementMianGridId = $("#othercostManagementMianTableId");
		//其他成本Form
		var $othercostManagementMianFormId = $("#othercostManagementMianFormId");
		//其他成本信息URL
		var $urlothercostManagementMian = basePath + '/projectManagement/otherCostManagerInfoByParam';
		//其他成本列
		var othercostManagementMainColumns=[
				{"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
				{"bVisible": true,"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
				{"orderable": true,"sWidth": "50","data": "projectNo","sTitle":othercostManager_projectId},
				{"orderable": true,"sWidth": "50","data": "projectName","sTitle":othercostManager_projectName},
				{"orderable": true,"sWidth": "50","data": "costSports","sTitle":othercostManager_costSports,"render":function(data,type,full){
					return initCodeText(data,codeBasicInfo.costSports);
				}},
				{"orderable": true,"sWidth": "50","data": "costEvents","sTitle":othercostManager_costEvents,"render":function(data,type,full){
					var ret="";
					if(full.costSports=='0'){
						ret= initCodeText(data,codeBasicInfo.costEventsTravel);
					}else if(full.costSports=='1'){
						ret=  initCodeText(data,codeBasicInfo.costEventsOther);
					}
					return ret;
				}},
				{"orderable": true,"sWidth": "50","data": "totalAmount","sTitle":othercostManager_totalAmount},
				{"orderable": true,"sWidth": "50","data": "currency","sTitle":othercostManager_currency,"render":function(data,type,full){
					return initCodeText(data,codeBasicInfo.currency);
				}},
				{"orderable": true,"sWidth": "50","data": "beginDate","sTitle":othercostManager_beginDate},
				{"orderable": true,"sWidth": "50","data": "endDate","sTitle":othercostManager_endDate},
				{"orderable": true,"sWidth": "50","data": "peopleName","sTitle":othercostManager_peopleConcerned},
				{"orderable": true,"sWidth": "50","data": "costDescribe","sTitle":othercostManager_costDescribe},
				{"orderable": true,"sWidth": "50","data": "whetherInvoice","sTitle":othercostManager_whetherInvoice,"render":function(data,type,full){
					return initCodeText(data,codeBasicInfo.yesOrNo);
				}},
				{"orderable": false,"sWidth": "200","sTitle":commonOperate}
				];
		//其他成本操作按钮
		var othercostManagementMainColumnDefs=[{"targets":[13],"data":"id","render":othercostManagementMain.grid_othercost_operation}];
		//其他成本初始化表格控件
		TableAjax(gridothercost,$othercostManagementMianGridId,$urlothercostManagementMian,othercostManagementMainColumns,othercostManagementMainColumnDefs,true,true,commonPageLength,null);
		//其他成本查询事件
		$("#othercostManagementSearchBtn").on('click', function(event) {
			if(gridothercost.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridothercost.clearAjaxParams();
				gridothercost.searchFilter($othercostManagementMianFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridothercost.getTableWrapper(),
                    place: 'prepend'
                });
			} 
		});
		
		/**
    	 * 费用大项变更，对应小项变更
    	 */
    	$("#othercostManagementMianFormId #costSports").on("change",function(){
    		if($(this).val()=="0"){
    			$("#othercostManagementMianFormId #costEvents").initDic(null,codeBasicInfo.costEventsTravel);
    		}else if($(this).val()=="1"){
    			$("#othercostManagementMianFormId #costEvents").initDic(null,codeBasicInfo.costEventsOther);
    		}else{
    			$("#othercostManagementMianFormId #costEvents").empty();
    			$("#othercostManagementMianFormId #costEvents").selectpicker('refresh');
    		}
    	});
    	
    	//导出
    	$("#otherCostExport").on("click",function(){
    		$("#othercostManagementMianFormId")[0].submit();
    	});
	 },
	 //其他成本备选事件操作按钮
	 grid_othercost_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthothercost){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/projectManagement/otherCostManagerEdit?operate=edit&id="+data+
			"' data-target='#todo-task-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		if(hasDeleteothercostAuth){
		    ret += "<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"othercostManagementMain.DeleteothercostAuth('"+data+"','"+deleteothercostConfirmMsg+"','"+full.projectId+"');\" >" +
		    		"<i class='fa fa-trash-o'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R00405&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		$(".tooltips").tooltip();
		return ret;
	 },
	 
	//删除其他成本
	 DeleteothercostAuth:function(value,mag,userFlag){
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
	        		url: basePath+'/projectManagement/deleteOtherCostManager',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		$("#othercostManagementSearchBtn").click();	  
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
     $("#othercostManagementMianFormId #startTime").on("changeDate",function(e){
     	$("#othercostManagementMianFormId #endTime").datepicker("setStartDate",e.date);
     });
     $("#othercostManagementMianFormId #endTime").on("changeDate",function(e){
     	$("#othercostManagementMianFormId #startTime").datepicker("setEndDate",e.date);
     });
 	 othercostManagementMain.othercostInit();
});