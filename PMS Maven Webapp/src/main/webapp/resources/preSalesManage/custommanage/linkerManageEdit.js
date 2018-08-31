/*
 *  @Description：客户编辑/新增界面JS
 *  @author：               raomingyi
 *  @date：                    2018年3月7日
 */
linkerManageEdits={
	initlinkerEdits:function () {
        //客户信息保存
    	$("#linkerEditFormIdss #saveLinkerBtnIdss").click(function(){
    		$("#linkerEditFormIdss").submit();
    	});
    	
    	//客户信息验证
    	$("#linkerEditFormIdss").validator({
    		valid:function(from){
    			$("#linkerEditFormIdss #changeDetails").val(getModifiedField($("#linkerEditFormIdss").serializeFormJson(),linkerOldVal,linkerField));
    			$.ajax({
    				url:basePath+'/preSalesManage/saveLinker',
    				type: 'POST',
    				data: $("#linkerEditFormIdss").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#closeLinkBaseInfoEditId").click();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    					gridCustomer.getDataTable().ajax.reload();
    					gridLinker.getDataTable().ajax.reload();
    					
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