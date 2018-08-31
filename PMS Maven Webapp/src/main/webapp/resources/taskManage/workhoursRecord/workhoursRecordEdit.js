/*
 *  @Description：工时登记编辑/新增界面JS
 *  @author：               raomingyi
 *  @date：                    2018年7月03日
 */
WorkhoursRecordEdit={
	initWorkhoursRecordEdit:function () {
        //用户信息保存
    	$("#saveWorkhoursRecordId").click(function(){
    		$("#workhoursRecordEditFormId").submit();
    	});
    	//初始化下拉框及日期控件
	    $('.date-picker').datepicker({
	    	format: 'yyyy-mm-dd',
		    clearBtn: true,
		    autoclose: true
	    });
    	//用户信息验证
    	$("#workhoursRecordEditFormId").validator({
    		valid:function(from){
    			$("#workhoursRecordEditFormId #changeDetails").val(getModifiedField($("#workhoursRecordEditFormId").serializeFormJson(),workhoursOldVal,workhoursField));
    			$.ajax({
    				url:basePath+'/taskManage/saveWorkhoursRecord',
    				type: 'POST',
    				data: $("#workhoursRecordEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#closeWorkhoursRecordId").click();
    					gridWorkhoursRecord.getDataTable().ajax.reload();
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
	WorkhoursRecordEdit.initWorkhoursRecordEdit();
});