/*
 *  @Description：任务编辑/新增界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
taskAssignManagerEdit={
	initTaskAssignEdit:function () {
        //任务信息保存
    	$("#saveTaskAssignId").click(function(){
    		$("#taskAssignEditFormId").submit();
    	});
    	
    	//任务信息验证
    	$("#taskAssignEditFormId").validator({
    		valid:function(from){
    			$("#taskAssignEditFormId #changeDetails").val(getModifiedField($("#taskAssignEditFormId").serializeFormJson(),taskAssignOldVal,taskAssignField));
    			$.ajax({
    				url:basePath+'/taskManager/saveTask',
    				type: 'POST',
    				data: $("#taskAssignEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#taskAssignEditFormId #closeTaskAssignId").click();
    					gridTaskAssign.getDataTable().ajax.reload();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    				}
    			});
    		}
    	});
    	
		
     },
	 /**
	  * 任务发送及退回
	  * @param status
	  */
	 sendOrBankTask:function(status){
		$.ajax({
			url:basePath+'/taskManager/updateSendStatus',
			type: 'POST',
			data: {
				id:$("#taskAssignEditFormId #taskId").val(),
				sendStatus:status
			},
			dataType: 'json',
			success:function(event){
				$("#taskAssignEditFormId #closeTaskAssignId").click();
				gridTaskAssign.getDataTable().ajax.reload();
				initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
			}
		});
	}
};
//加载页面
jQuery(document).ready(function() {
	//初始化下拉框及日期控件
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        clearBtn: true,
        autoclose: true
    });
    //设置开始时间不能大于结束时间
    $("#reqFinitionDate").on("changeDate",function(e){
    	$("#closeDate").datepicker("setStartDate",e.date);
    });
    $("#closeDate").on("changeDate",function(e){
    	$("#reqFinitionDate").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	if (!jQuery().dataTable) {
        return;
    }
	taskAssignManagerEdit.initTaskAssignEdit();
});