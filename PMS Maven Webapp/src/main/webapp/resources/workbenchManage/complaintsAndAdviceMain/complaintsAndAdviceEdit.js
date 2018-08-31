/*
 *  @Description：客户编辑/新增界面JS
 *  @author：               raomingyi
 *  @date：                    2018年3月7日
 */
linkerManageEdits={
	initlinkerEdits:function () {
        //客户信息保存
    	$("#complainEdit #saveComplain").click(function(){
    		$("#complainEdit").submit();
    	});
    	
    	//客户信息验证
    	$("#complainEdit").validator({
    		valid:function(from){
    			$("#complainEdit #changeDetails").val(getModifiedField($("#complainEdit").serializeFormJson(),complainEditOldVal,complainEditField));
    			$.ajax({
    				url:basePath+'/workbenchManage/saveComplaintsAndAdvice',
    				type: 'POST',
    				data: $("#complainEdit").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#closeComplain").click();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    					gridComplain.getDataTable().ajax.reload();
    					
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
	linkerManageEdits.initlinkerEdits();
});