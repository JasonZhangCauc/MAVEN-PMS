/*
 *  @Description：月报编辑/新增界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
monthReportManagerEdit={
	initMonthReportEdit:function () {
        //月报信息保存
    	$("#saveMonthReportId").click(function(){
    		$("#monthReportEditFormId").submit();
    	});
    	
    	//月报信息验证
    	$("#monthReportEditFormId").validator({
    		valid:function(from){
    			$("#monthReportEditFormId #changeDetails").val(getModifiedField($("#monthReportEditFormId").serializeFormJson(),monthReportVal,monthReportColumn));
    			$.ajax({
    				url:basePath+'/monthReportManager/saveMonthReport',
    				type: 'POST',
    				data: $("#monthReportEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					//$("#monthReportEditFormId #closeMonthReportId").click();
    					gridMonthReport.getDataTable().ajax.reload();
    					initAlertsAppendWal({ap_type:'success',ap_message:commonSuccessMsg,ap_icon:'fa fa-check'});
    				}
    			});
    		}
    	});
     }

};
//加载页面
jQuery(document).ready(function() {
	//初始化日期控件
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        autoclose: true
    });
    
	if (!jQuery().dataTable) {
        return;
    }
	monthReportManagerEdit.initMonthReportEdit();
	
});