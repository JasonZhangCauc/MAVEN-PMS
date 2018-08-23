/*
 *  @Description：客户编辑/新增界面JS
 *  @author：               raomingyi
 *  @date：                    2018年3月7日
 */
customManageEdits={
	initCustomEdits:function () {
        //客户信息保存
    	$("#saveCustomIdsing").click(function(){
    		$("#CustomEditFormIdsing").submit();
    	});
    	
    	//客户信息验证
    	$("#CustomEditFormIdsing").validator({
    		valid:function(from){
    			$("#CustomEditFormIdsing #changeDetails").val(getModifiedField($("#CustomEditFormIdsing").serializeFormJson(),objectVal,customColumn));
    			var options = {
    					url:basePath+'/preSalesManage/saveCustom',
    		            type:'POST',
    		            dataType: 'json', 
    		            success: function(data){  
    		            	debugger;
    		            	$("#closeCustomBaseInfoEditIding").click();
        					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
        					gridCustomer.getDataTable().ajax.reload();
    		            }
    		        };
    		        $("#CustomEditFormIdsing").ajaxSubmit(options); 
    		        return false;
    		}
    	});
     }
	
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    }
	customManageEdits.initCustomEdits();
});