/*
 *  @Description：组织架构编辑/新增界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
resourceManagerEdit={
	initResourceEdit:function () {
        //组织架构信息保存
    	$("#saveResourceId").click(function(){
    		$("#resourceEditFormId #resourceType").removeAttr("disabled");
    		$("#resourceEditFormId").submit();
    	});
    	
    	//组织架构信息验证
    	$("#resourceEditFormId").validator({
    		valid:function(from){
    			$.ajax({
    				url:basePath+'/systemManage/saveResource',
    				type: 'POST',
    				data: $("#resourceEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#resourceEditFormId #resourceType").attr("disabled");
    					$("#resourceEditFormId #closeResourceId").click();
    					resourceManager.initResourceTree();
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
	resourceManagerEdit.initResourceEdit();
});