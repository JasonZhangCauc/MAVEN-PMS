/*
 *  @Description：任务编辑/新增界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
taskIssuedManagerEdit={
	initTaskIssuedEdit:function () {
        //初始化下拉框及日期控件
        $('.date-picker').datepicker({
            rtl: App.isRTL(),
            autoclose: true
        });
        $('.bs-select').selectpicker({
            iconBase: 'fa',
            tickIcon: 'fa-check'
        });
        //设置开始时间不能大于结束时间
        $("#taskIssuedEditFormId #taskBeginDate").on("changeDate",function(e){
        	$("#taskIssuedEditFormId #taskEndDate").datepicker("setStartDate",e.date);
        });
        $("#taskIssuedEditFormId #taskEndDate").on("changeDate",function(e){
        	$("#taskIssuedEditFormId #taskBeginDate").datepicker("setEndDate",e.date);
        });

    	//任务信息保存
    	$("#saveTaskIssuedId").click(function(){
    		$("#taskIssuedEditFormId").submit();
    	});
    	
    	//任务信息验证
    	$("#taskIssuedEditFormId").validator({
    		valid:function(from){
    			$("#taskIssuedEditFormId #changeDetails").val(getModifiedField($("#taskIssuedEditFormId").serializeFormJson(),taskIssuedOldVal,taskIssuedField));
    			$.ajax({
    				url:basePath+'/taskManage/saveTaskIssued',
    	            type:'POST',
    	            dataType: 'json',
    	            data: $("#taskIssuedEditFormId").serialize(),
    	            success: function(data){
    	            	$("#clearTaskIssuedId").click();
    	            	refetchTaskView();
    	            	initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    	            }
    			});
    		}
    	});	
    	
    	//删除
    	$("#delTaskIssuedId").click(function(){
    		var taskId= $("#taskIssuedEditFormId #taskId").val();
    		$.ajax({
				url:basePath+'/taskManage/deleteTaskIssuedById',
	            type:'POST',
	            dataType: 'json',
	            data:{id:taskId},
	            success: function(data){
	            	$("#clearTaskIssuedId").click();
	            	refetchTaskView();
	            	initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	            }
			});
    	});
     }
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    }
	taskIssuedManagerEdit.initTaskIssuedEdit();
});