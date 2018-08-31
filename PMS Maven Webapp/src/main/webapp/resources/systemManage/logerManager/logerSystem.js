/*
 *  @Description：系统日志主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var logerSystem ={
	//初始日期控件和下拉框控件
	 initPickers:function () {
        //init date pickers
        $('.date-picker').datepicker({
            rtl: App.isRTL(),
            autoclose: true
        });
        $('.bs-select').selectpicker({
            iconBase: 'fa',
            tickIcon: 'fa-check'
        });
    },
	logerSystemInit:function(){
		//用户管理Form
		var $logerSystemFormId = $("#logerSystemMianFormId");
		//角色信息URL
		var $urlLogerSystem = basePath + '/systemManage/querySystemLogByParam';
		//角色显示信息
		var logerSystemColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "30","data": "row_id","sTitle":s1},
			{"orderable": true,"sWidth": "100","data": "operateName","sTitle":s2},
			{"orderable": true,"sWidth": "100","data": "operateTime","sTitle":s3},
			{"orderable": true,"sWidth": "100","data": "functionModuleName","sTitle":s4},
			{"orderable": true,"sWidth": "100","data": "operateClass","sTitle":s5},
			{"orderable": true,"sWidth": "300","data": "operateMethod","sTitle":s6}
	     ];
		//角色列表初始化
		TableAjax(gridLogSystem,$("#logerSystemMianTableId"),$urlLogerSystem,logerSystemColumns,null,true,true,commonPageLength);
		
		//查询
		$("#searchLogerSystemBtn").on('click', function(event) {
			if(gridLogSystem.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridLogSystem.clearAjaxParams();
				gridLogSystem.searchFilter($logerSystemFormId);
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
	}
};
jQuery(document).ready(function() {
	logerSystem.initPickers();	
	logerSystem.logerSystemInit();	
	//设置查询条件开始时间不能大于结束时间
    $("#logerSystemMianFormId #operateBeginDate").on("changeDate",function(e){
    	$("#logerSystemMianFormId #operateEndDate").datepicker("setStartDate",e.date);
    });
    $("#logerSystemMianFormId #operateEndDate").on("changeDate",function(e){
    	$("#logerSystemMianFormId #operateBeginDate").datepicker("setEndDate",e.date);
    });		
});