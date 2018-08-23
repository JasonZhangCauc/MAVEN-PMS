/*
 *  @Description：用户编辑/新增界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
updateLogEdit={
	initUpdateLogEdit:function () {
        //角色信息保存
    	$("#saveUpdateLogId").click(function(){
    		$("#updateLogEditFormId").submit();
    	});
    	
    	//角色信息验证
    	$("#updateLogEditFormId").validator({
    		valid:function(from){
    			$.ajax({
    				url:basePath+'/systemManage/saveUpdateLog',
    				type: 'POST',
    				data: $("#updateLogEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#clearUpdateLogId").click();
    					initAlertsAppendWal({ap_type:'success',ap_message:commonSuccessMsg,ap_icon:'fa fa-check'});
    					gridUpdateLog.getDataTable().ajax.reload();
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
	updateLogEdit.initUpdateLogEdit();
});