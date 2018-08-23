/*
 *  @Description：用户编辑/新增界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
codeManagerEdit={
	initCodeEdit:function () {
        //角色信息保存
    	$("#saveCodeId").click(function(){
    		$("#codeEditFormId").submit();
    	});
    	
    	//角色信息验证
    	$("#codeEditFormId").validator({
    		valid:function(from){
    			$.ajax({
    				url:basePath+'/systemManage/saveCode',
    				type: 'POST',
    				data: $("#codeEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#clearCodeId").click();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    					gridCode.getDataTable().ajax.reload();
    					/*initAlertsAppendWal({ap_type:'success',ap_message:commonSuccessMsg,ap_icon:'fa fa-check'});*/
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
	codeManagerEdit.initCodeEdit();
});