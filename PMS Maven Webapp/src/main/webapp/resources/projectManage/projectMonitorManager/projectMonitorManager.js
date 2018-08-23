/*
 *  @Description：项目管理主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var projectMonitorMain ={
	projectMonitorInit:function(){
		//项目立项Table
		var $projectMonitorGridId = $("#projectMonitorMianTableId");
		//项目立项Form
		var $projectMonitorFormId = $("#projectMonitorMianFormId");
		//项目立项信息URL
		var $urlProjectMonitor = basePath + '/projectMonitorManager/queryProjectMonitorByParam';
		//项目立项显示信息
		var projectMonitorColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "50","data": "projectNo","sTitle":projectMonitorMain_projectNo},
			{"orderable": true,"sWidth": "50","data": "projectName","sTitle":projectMonitorMain_projectName},
			{"orderable": true,"sWidth": "50","data": "belongCustomerName","sTitle":projectMonitorMain_belongCustomer},
			{"orderable": true,"sWidth": "50","data": "belongProduct","sTitle":projectMonitorMain_belongProduct,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.PRODUCT);
			}},
			{"orderable": true,"sWidth": "50","data": "projectDate","sTitle":projectMonitorMain_projectDate},
			{"orderable": true,"sWidth": "50","data": "implementHeadName","sTitle":projectMonitorMain_implementHead},
			{"orderable": true,"sWidth": "50","data": "exploitHeadName","sTitle":projectMonitorMain_exploitHead},
			{"orderable": true,"sWidth": "50","data": "planWorkHours","sTitle":projectMonitorMain_planWorkHours},
			{"orderable": true,"sWidth": "50","data": "projectStage","sTitle":projectMonitorMain_projectStage,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.	projectStage);
			}},
			{"orderable": true,"sWidth": "50","data": "projectStatus","sTitle":projectMonitorMain_projectStatus,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.projectStatus);
			}},
			{"orderable": false,"sWidth": "50","sTitle":projectMonitorMain_attachment,"render":function(data,type,full){
				return initAttachmentDownload({_dataId:full.id,_pageType:"R004-0201"});
			}},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		//操作列
		var projectMonitorColumnDefs=[{"targets":[13],"data":"id","render":projectMonitorMain.grid_projectMonitor_operation}];
		//项目立项列表初始化
		TableAjax(gridProjectMonitor,$projectMonitorGridId,$urlProjectMonitor,projectMonitorColumns,projectMonitorColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchProjectMonitorBtn").on('click', function(event) {
			if(gridProjectMonitor.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridProjectMonitor.clearAjaxParams();
				gridProjectMonitor.searchFilter($projectMonitorFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridProject.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//项目立项备选事件操作按钮
	grid_projectMonitor_operation:function(data,type,full){
		var ret="";
		if(hasMonitorProjectAuth){
			ret += "<a class='btn default btn-sm blue' addtabs='R00402_01' title='"+
			projectMonitorMain_projectMonitorBtn+"' url='/projectMonitorManager/projectMonitor?id="+data+
			"'><i class='fa fa-circle-o-notch'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R0040101&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i>"+commonDatalogBtn+"</a>";
		$(".tooltips").tooltip();
		return ret;
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
    $("#projectMonitorMianFormId #projectBeginDate").on("changeDate",function(e){
    	$("#projectMonitorMianFormId #projectEndDate").datepicker("setStartDate",e.date);
    });
    $("#projectMonitorMianFormId #projectEndDate").on("changeDate",function(e){
    	$("#projectMonitorMianFormId #projectBeginDate").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	projectMonitorMain.projectMonitorInit();
});