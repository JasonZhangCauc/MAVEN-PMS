/*
 *  @Description：成本详细主页面Js
 *  @author：	raomingyi
 *  @date：	2018-03-05
 */
var costDetail = {
	initCostDetail:function(){
		
		/**************** Contracttable列表 ***************/
		//成本详细信息Table
		var $costDetailGridId = $("#costDetailTableId");
		//成本详细Form
		var $costDetailFormId = $("#costDetailFormId");
		//成本详细URL
		var $urlCostDetail = basePath + '/statisticsAnalyze/queryCostDetailByParam?projectId='+costDetail_projectId;
		//用户列
		//字段列表 按照百分比计算 累计100%;
		var costDetailColumns = [
            {"bVisible": false,"orderable": false,"sWidth": "5","data": "id"},
   			{"orderable": true,"sWidth": "50","data": "workDate","sTitle":costDetail_date},
   			{"orderable": true,"sWidth": "50","data": "workerId","sTitle":costDetail_workNumber},
   			{"orderable": true,"sWidth": "50","data": "workerName","sTitle":costDetail_userName},
   			{"orderable": true,"sWidth": "50","data": "workingType","sTitle":costDetail_workingType,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.workHoursType);
			}},
   			{"orderable": true,"sWidth": "50","data": "workingHours","sTitle":costDetail_workingHours},
   			//{"orderable": true,"sWidth": "50","data": "workDesc","sTitle":costDetail_workDesc},
   			//{"orderable": true,"sWidth": "50","data": "remark","sTitle":costDetail_remark}
		];
		var costDetailColumnDefs=[{}];
		//用户初始化表格控件
		TableAjax(gridCostDetail,$costDetailGridId,$urlCostDetail,costDetailColumns,costDetailColumnDefs,true,true,commonPageLength);
		gridCostDetail.searchFilter($costDetailFormId);
		
		//用户查询事件
		$("#searchCostDetailBtn").on('click', function(event) {
			if(gridCostDetail.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridCostDetail.clearAjaxParams();
				gridCostDetail.searchFilter($costDetailFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridCostDetail.getTableWrapper(),
                    place: 'prepend'
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
  //初始化下拉框及日期控件
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        clearBtn: true,
        autoclose: true
    }); 
    //设置开始时间不能大于结束时间
    $("#costDetailFormId #beginWorkDate").on("changeDate",function(e){
    	$("#costDetailFormId #endWorkDate").datepicker("setStartDate",e.date);
    });
    $("#costDetailFormId #endWorkDate").on("changeDate",function(e){
    	$("#costDetailFormId #beginWorkDate").datepicker("setEndDate",e.date);
    });
    
	costDetail.initCostDetail();
});