/*
 *  @Description：日报编辑/新增界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
dailyReportManagerEdit={
	initDailyReportEdit:function () {
        //日报信息保存
    	$("#saveDailyReportId").click(function(){
    		$("#dailyReportEditFormId").submit();
    	});
    	
    	//日报信息验证
    	$("#dailyReportEditFormId").validator({
    		valid:function(from){
    			$("#dailyReportEditFormId #changeDetails").val(getModifiedField($("#dailyReportEditFormId").serializeFormJson(),dailyReportVal,dailyReportColumn));
    			$.ajax({
    				url:basePath+'/dailyReportManager/saveDailyReport',
    				type: 'POST',
    				data: $("#dailyReportEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					//$("#dailyReportEditFormId #closeDailyReportId").click();
    					gridDailyReport.getDataTable().ajax.reload();
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
	dailyReportManagerEdit.initDailyReportEdit();
});