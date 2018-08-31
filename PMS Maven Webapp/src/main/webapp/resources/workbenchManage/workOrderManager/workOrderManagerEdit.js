/*
 *  @Description：	工作单新增/编辑/查看界面JS
 *  @author：               zlshi
 *  @date：                   2018年8月14日
 */
workOrderEdit={
	initWorkOrderEdit:function () {
        //绩效信息保存
    	$("#saveWorkOrderEditId").click(function(){
    		$("#workOrderEditFormId").submit();
    	});
    	
    	//绩效信息验证
    	$("#workOrderEditFormId").validator({
    		valid:function(from){
    			$("#workOrderEditFormId #changeDetails").val(getModifiedField($("#workOrderEditFormId").serializeFormJson(),reimburseBaseInfoOldVal,reimburseBaseInfoField));
    			$.ajax({
    				url:basePath+'/performanceManage/savePerformanceContract',
    				type: 'POST',
    				data: $("#workOrderEditFormId").serialize(),
    				success:function(event){
    					$("#closeWorkOrderEditId").click();
						$("#searchWorkOrderBtn").click();
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
	
	workOrderEdit.initWorkOrderEdit();
});