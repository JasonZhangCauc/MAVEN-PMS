/*
 *  @Description：	工作单问题编辑界面JS
 *  @author：               zlshi
 *  @date：                   2018年8月14日
 */
workOrderQuestionEdit={
	initWorkOrderQuestionEdit:function () {
        //绩效信息保存
    	$("#saveWorkOrderQuestionId").click(function(){
    		$("#workOrderQuestionFormId").submit();
    	});
    	
    	//绩效信息验证
    	$("#workOrderQuestionFormId").validator({
    		valid:function(from){
    			$("#workOrderQuestionFormId #changeDetails").val(getModifiedField($("#workOrderQuestionFormId").serializeFormJson(),reimburseBaseInfoOldVal,reimburseBaseInfoField));
    			$.ajax({
    				url:basePath+'/workbenchManage/saveWorkOrderQuestion',
    				type: 'POST',
    				data: $("#workOrderQuestionFormId").serialize(),
    				success:function(event){
    					$("#closeWorkOrderQuestionId").click();
						$("#searchWorkOrderDetailBtn").click();
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
	
	workOrderQuestionEdit.initWorkOrderQuestionEdit();
});