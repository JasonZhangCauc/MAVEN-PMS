/*
 *  @Description：任务编辑/新增界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
myTaskEdit={
	initMyTaskEdit:function () {
		//初始化下拉框及日期控件
        $('.date-picker').datepicker({
            rtl: App.isRTL(),
            autoclose: true
        });
        $('.bs-select').selectpicker({
            iconBase: 'fa',
            tickIcon: 'fa-check'
        });
        
        //任务信息保存
    	$("#saveMyTaskId").click(function(){
    		$("#myTaskEditFormId").submit();
    	});
    	
    	//任务信息验证
    	$("#myTaskEditFormId").validator({
    		valid:function(from){
    			$("#myTaskEditFormId #changeDetails").val(getModifiedField($("#myTaskEditFormId").serializeFormJson(),myTaskOldVal,myTaskField));
    			$.ajax({
    				url:basePath+'/taskManage/saveMyTask',
    				type: 'POST',
    				data: $("#myTaskEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#closeMyTaskId").click();
    					refetchMyTaskView();
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
	myTaskEdit.initMyTaskEdit();
});