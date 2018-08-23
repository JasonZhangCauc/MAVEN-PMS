/*
 *  @Description：操作日志主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var logerOperate ={
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
	logerOperateInit:function(){
		//角色管理Table
		var $logerOperateGridId = $("#logerOperateMianTableId");
		//用户管理Form
		var $logerOperateFormId = $("#logerOperateMianFormId");
		//角色信息URL
		var $urlLogerOperate = basePath + '/systemManage/queryLogerOperateByParam';
		//角色显示信息
		var logerOperateColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
			{"orderable": true,"sWidth": "100","data": "operateName","sTitle":o1},
			{"orderable": true,"sWidth": "100","data": "operateTime","sTitle":o2},
			{"orderable": true,"sWidth": "100","data": "operateCategory","sTitle":o3},
			{"orderable": true,"sWidth": "200","data": "operateContent","sTitle":o4}
	     ];
		//角色列表初始化
		TableAjax(gridLogOperate,$("#logerOperateMianTableId"),$urlLogerOperate,logerOperateColumns,null,true,true,commonPageLength);
		
		//查询
		$("#searchLogerOperateBtn").on('click', function(event) {
			if(gridLogOperate.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridLogOperate.clearAjaxParams();
				gridLogOperate.searchFilter($logerOperateFormId);
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
	logerOperate.initPickers();
	logerOperate.logerOperateInit();
});