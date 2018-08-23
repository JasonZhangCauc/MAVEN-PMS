/*
 *  @Description：工时统计编辑/新增界面JS
 *  @author：               jczou
 *  @date：                    2018年3月15日
 */
WorkhoursManagementEdit={
	initWorkhoursEdit:function () {
        //用户信息保存
    	$("#saveWorkHoursId").click(function(){
    		$("#workhoursEditFormId").submit();
    	});
    	
    	//用户信息验证
    	$("#workhoursEditFormId").validator({
    		valid:function(from){
    			$("#workhoursEditFormId #changeDetails").val(getModifiedField($("#workhoursEditFormId").serializeFormJson(),workhoursOldVal,workhoursField));
    			$.ajax({
    				url:basePath+'/projectManage/saveWorkHours',
    				type: 'POST',
    				data: $("#workhoursEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					gridWorkhours.getDataTable().ajax.reload();
    					initAlertsAppendWal({ap_type:'success',ap_message:commonSuccessMsg,ap_icon:'fa fa-check'});
    				}
    			});
    		}
    	});
     }
	
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    }
	 //初始化下拉框及日期控件
    $('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
    //设置开始时间不能大于结束时间
    $("#workhoursEditFormId #beginDate").on("changeDate",function(e){
    	$("#workhoursEditFormId #endDate").datepicker("setStartDate",e.date);
    });
    $("#workhoursEditFormId #endDate").on("changeDate",function(e){
    	$("#workhoursEditFormId #beginDate").datepicker("setEndDate",e.date);
    });
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        autoclose: true
    });
	WorkhoursManagementEdit.initWorkhoursEdit();
});