/*
 *  @Description：月报管理主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var dailyReportManager ={
	dailyReportInit:function(){
		//月报管理Table
		var $dailyReportGridId = $("#dailyReportMianTableId");
		//月报管理Form
		var $dailyReportFormId = $("#dailyReportMianFormId");
		//月报信息URL
		var $urlDailyReport = basePath + '/dailyReportManager/dailyReportInfoByParam';
		//月报显示信息
		var dailyReportColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "50","data": "proNum","sTitle":dailyReportManager_proNum},
			{"orderable": true,"sWidth": "50","data": "belongCustomer","sTitle":dailyReportManager_belongCustomer},
			{"orderable": true,"sWidth": "50","data": "belongProduct","sTitle":dailyReportManager_belongProduct},
			{"orderable": true,"sWidth": "50","data": "proReporterName","sTitle":dailyReportManager_proReporter},
			{"orderable": true,"sWidth": "50","data": "reportDate","sTitle":dailyReportManager_reportDate},
			{"orderable": true,"sWidth": "50","data": "reportType","sTitle":dailyReportManager_reportType,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.emergency);
			}},
			{"orderable": true,"sWidth": "300","data": "taskToday","sTitle":dailyReportManager_taskToday},
			{"orderable": true,"sWidth": "300","data": "questionToday","sTitle":dailyReportManager_questionToday},
			{"orderable": true,"sWidth": "300","data": "conclusionToday","sTitle":dailyReportManager_conclusionToday},
			{"orderable": true,"sWidth": "300","data": "planTomorrow","sTitle":dailyReportManager_planTomorrow},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		//操作列
		var dailyReportColumnDefs=[{"targets":[12],"data":"id","render":dailyReportManager.grid_dailyReport_operation}];
		//月报列表初始化
		TableAjax(gridDailyReport,$("#dailyReportMianTableId"),$urlDailyReport,dailyReportColumns,dailyReportColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchDailyReportBtn").on('click', function(event) {
			if(gridDailyReport.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridDailyReport.clearAjaxParams();
				gridDailyReport.searchFilter($dailyReportFormId);
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
	//月报备选事件操作按钮
	grid_dailyReport_operation:function(data,type,full){
		var ret="";
		//编辑
		if(hasEditAuthDailyReport){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/dailyReportManager/dailyReportEdit?operate=edit&id="+data+
			"' data-target='#todo-task-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		//删除
		if(hasRemoveAuthDailyReport){
			ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"dailyReportManager.deleteDailyReport('"+data+
			"','"+dailyReportManager_deleteDailyReportMsg+"');\" ><i class='fa fa-trash-o'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R00602&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		
		$(".tooltips").tooltip();
		return ret;
	},
	//删除日报信息 删除为逻辑删除
	deleteDailyReport:function(value,msg){
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
	        		url: basePath+'/dailyReportManager/deleteDailyReport',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		gridDailyReport.getDataTable().ajax.reload();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	        }
	    }); 
	}
	
};
jQuery(document).ready(function() {
	//初始化下拉框及日期控件
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        clearBtn: true,
        autoclose: true
    }); 
    //设置开始时间不能大于结束时间
    $("#reportBeginDate").on("changeDate",function(e){
    	$("#closeDate").datepicker("setStartDate",e.date);
    });
    $("#closeDate").on("changeDate",function(e){
    	$("#reportBeginDate").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	dailyReportManager.dailyReportInit();
});