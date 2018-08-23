/*
 *  @Description：绩效编辑界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
performanceContractManagerEdit={
	initPerformanceContractEdit:function () {
        //绩效信息保存
    	$("#savePerformanceContractId").click(function(){
    		$("#performanceContractEditFormId").submit();
    	});
    	
    	//绩效信息验证
    	$("#performanceContractEditFormId").validator({
    		valid:function(from){
    			$("#performanceContractEditFormId #changeDetails").val(getModifiedField($("#performanceContractEditFormId").serializeFormJson(),reimburseBaseInfoOldVal,reimburseBaseInfoField));
    			$.ajax({
    				url:basePath+'/performanceManage/savePerformanceContract',
    				type: 'POST',
    				data: $("#performanceContractEditFormId").serialize(),
    				success:function(event){
    					$("#closePerformanceContractEdit").click();
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
	
	performanceContractManagerEdit.initPerformanceContractEdit();
});