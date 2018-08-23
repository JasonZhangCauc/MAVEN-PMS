/*
 *  @Description：成本报表主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var costReportMain ={
	costReportInit:function(){
		//成本报表Table
		var $costReportGridId = $("#costReportMianTableId");
		//成本报表Form
		var $costReportFormId = $("#costReportMianFormId");
		//成本报表URL
		var $urlCostReport = basePath + '/statisticsAnalyze/queryCostReprotByParam';
		//成本报表显示信息
		var costReportColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "150","data": "projectName","sTitle":costReport_projectName},
			{"orderable": true,"sWidth": "50","data": "projectPhase","sTitle":costReport_projectPhase,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.projectPhase);
			}},
			{"orderable": true,"sWidth": "50","data": "projectStatus","sTitle":costReport_projectStatus,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.projectState);
			}},
			/*{"orderable": true,"sWidth": "50","data": "estimatedWorkload","sTitle":costReport_estimatedWorkload},
			{"orderable": true,"sWidth": "50","data": "workTime","sTitle":costReport_workTime},
			{"orderable": true,"sWidth": "50","data": "periodWorkHours","sTitle":costReport_periodWorkHours},
			{"orderable": true,"sWidth": "300","data": "cumulativeWorkHours","sTitle":costReport_cumulativeWorkHours},
			{"orderable": true,"sWidth": "300","data": "periodCost","sTitle":costReport_periodCost},*/
			{"orderable": true,"sWidth": "30","data": "cumulativeCost","sTitle":costReport_cumulativeCost},
			/*{"orderable": true,"sWidth": "300","data": "profitTargets","sTitle":costReport_profitTargets},*/
			{"orderable": true,"sWidth": "30","data": "profitMargin","sTitle":costReport_profitMargin,"render":function(data,type,full){
				if(full.costReport_profitMargin>=full.profitMargin){
					return data;
				}else{
					return '<span style="text-decoration:underline;color:red;cursor:pointer">'+data+'</span>';
				}
			}},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		//操作列
		var costReportColumnDefs=[{"targets":[7],"data":"id","render":costReportMain.grid_costReport_operation}];
		//月报列表初始化
		TableAjax(gridCostReport,$costReportGridId,$urlCostReport,costReportColumns,costReportColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchCostReportBtn").on('click', function(event) {
			if(gridCostReport.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridCostReport.clearAjaxParams();
				gridCostReport.searchFilter($costReportFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridCostReport.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//备选事件操作按钮
	grid_costReport_operation:function(data,type,full){
		var beginTime=$("#costReportMianFormId #beginTime").val();
		var endTime=$("#costReportMianFormId #endTime").val();
		var ret="";
		if(hasViewCostReportAuth){
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonViewBtn+
			" href='"+basePath+"/statisticsAnalyze/viewCostDetail?projectId="+full.id+'&beginWorkDate='+beginTime+'&endWorkDate='+endTime+
			"'data-target='#view_cost_model' data-toggle='modal'><i class='fa fa-plus-square'></i></a>";
		}
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
    $("#costReportMianFormId #beginTime").on("changeDate",function(e){
    	$("#costReportMianFormId #endTime").datepicker("setStartDate",e.date);
    });
    $("#costReportMianFormId #endTime").on("changeDate",function(e){
    	$("#costReportMianFormId #beginTime").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	costReportMain.costReportInit();
});