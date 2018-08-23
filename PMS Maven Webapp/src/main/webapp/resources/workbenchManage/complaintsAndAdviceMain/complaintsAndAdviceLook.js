/*
 *  @Description：客户编辑/新增界面JS
 *  @author：               raomingyi
 *  @date：                    2018年3月7日
 */
linkerManageEdits={
	initlinkerEdits:function () {
        //客户信息保存
    	$("#complainLook #saveComplain").click(function(){
    		$("#complainLook").submit();
    	});
    	
    	//客户信息验证
    	$("#complainLook").validator({
    		valid:function(from){
    			$("#complainLook #changeDetails").val(getModifiedField($("#complainLook").serializeFormJson(),complainLookOldVal,complainLookField));
    			$.ajax({
    				url:basePath+'/workbenchManage/saveComplaintsAndAdvice',
    				type: 'POST',
    				data: $("#complainLook").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#closeComplainLook").click();
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