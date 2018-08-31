/*
 *  @Description：月报管理主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var monthReportManager ={
	monthReportInit:function(){
		//月报管理Table
		var $monthReportGridId = $("#monthReportMianTableId");
		//月报管理Form
		var $monthReportFormId = $("#monthReportMianFormId");
		//月报信息URL
		var $urlMonthReport = basePath + '/monthReportManager/monthReportInfoByParam';
		//月报显示信息
		var monthReportColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "50","data": "proNum","sTitle":monthReportManager_proNum},
			{"orderable": true,"sWidth": "50","data": "proReporterName","sTitle":monthReportManager_proReporter},
			{"orderable": true,"sWidth": "50","data": "reportMonth","sTitle":monthReportManager_reportMonth},
			{"orderable": true,"sWidth": "50","data": "belongCustomer","sTitle":monthReportManager_belongCustomer},
			{"orderable": true,"sWidth": "300","data": "belongProduct","sTitle":monthReportManager_belongProduct},
			{"orderable": true,"orderable": false,"sWidth": "300","sTitle":monthReportManager_attachment,"render":function(data,type,full){
				return initAttachmentDownload({_dataId:full.id,_pageType:"R006-02"});
			}},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		//操作列
		var monthReportColumnDefs=[{"targets":[8],"data":"id","render":monthReportManager.grid_monthReport_operation}];
		//月报列表初始化
		TableAjax(gridMonthReport,$("#monthReportMianTableId"),$urlMonthReport,monthReportColumns,monthReportColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchMonthReportBtn").on('click', function(event) {
			if(gridMonthReport.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridMonthReport.clearAjaxParams();
				gridMonthReport.searchFilter($monthReportFormId);
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
	grid_monthReport_operation:function(data,type,full){
		var ret="";
		//编辑
		if(hasEditAuthMonthReport){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/monthReportManager/monthReportEdit?operate=edit&id="+data+
			"' data-target='#todo-task-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		//删除
		if(hasRemoveAuthMonthReport){
			ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"monthReportManager.deleteMonthReport('"+data+
			"','"+monthReportManager_deleteDailyReportMsg+"');\" ><i class='fa fa-trash-o'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R00603&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		
		$(".tooltips").tooltip();
		return ret;
	},
	//删除=月报信息 删除为逻辑删除
	deleteMonthReport:function(value,msg){
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
	        		url: basePath+'/monthReportManager/deleteMonthReport',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		gridMonthReport.getDataTable().ajax.reload();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	        }
	    }); 
	},
};
jQuery(document).ready(function() {
	//初始化下拉框及日期控件
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        clearBtn: true,
        autoclose: true
    }); 
    //设置开始时间不能大于结束时间
    $("#reportBeginMonth").on("changeDate",function(e){
    	$("#reportEndMonth").datepicker("setStartDate",e.date);
    });
    $("#reportEndMonth").on("changeDate",function(e){
    	$("#reportBeginMonth").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	monthReportManager.monthReportInit();
});