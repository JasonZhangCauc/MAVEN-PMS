/*
 *  @Description：绩效合约编辑界面JS
 *  @author：               zlshi
 *  @date：                    2018年8月12日
 */
performanceContractManagerAudit={
		initPerformanceContractAudit:function () {
        //绩效信息保存
    	$("#auditPerformanceContractId").click(function(){
    		$("#performanceContractAuditFormId").submit();
    	});
    	
    	//绩效信息验证
    	$("#performanceContractAuditFormId").validator({
    		valid:function(from){
    			$("#performanceContractAuditFormId #changeDetails").val(getModifiedField($("#performanceContractAuditFormId").serializeFormJson(),reimburseBaseInfoOldVal,reimburseBaseInfoField));
    			$.ajax({
    				url:basePath+'/performanceManage/auditPerformanceContract',
    				type: 'POST',
    				data: $("#performanceContractAuditFormId").serialize(),
    				success:function(event){
    					$("#closePerformanceContractAudit").click();
						$("#searchPerformanceContractBtn").click();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
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
	$('.date-picker').datepicker({
		rtl: App.isRTL(),
		autoclose: true
	});
	
	$(".form_datetime").datetimepicker({
		language: 'zh-CN',//显示中文
	    autoclose: true,
	    isRTL: App.isRTL(),
	    format: "hh:ii",
	    fontAwesome: true,
	    pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left")
	});
	
	performanceContractManagerAudit.initPerformanceContractAudit();
});
