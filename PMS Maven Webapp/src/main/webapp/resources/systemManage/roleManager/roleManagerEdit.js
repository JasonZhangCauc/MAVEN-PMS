/*
 *  @Description：角色编辑/新增界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
roleManagerEdit={
	initRoleEdit:function () {
        //角色信息保存
    	$("#saveRoleId").click(function(){
    		$("#roleEditFormId").submit();
    	});
    	
    	//角色信息验证
    	$("#roleEditFormId").validator({
    		valid:function(from){
    			$("#roleEditFormId #changeDetails").val(getModifiedField($("#roleEditFormId").serializeFormJson(),roleOldVal,roleField));
    			$.ajax({
    				url:basePath+'/systemManage/saveRole',
    				type: 'POST',
    				data: $("#roleEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#clearRoleId").click();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    					gridRole.getDataTable().ajax.reload();
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
	roleManagerEdit.initRoleEdit();
});