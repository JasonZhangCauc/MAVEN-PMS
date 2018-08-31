/*
 *  @Description：组织架构编辑/新增界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
deptManagerEdit={
	initDeptEdit:function () {
        //组织架构信息保存
    	$("#saveDeptId").click(function(){
    		$("#deptEditFormId").submit();
    	});
    	
    	//组织架构信息验证
    	$("#deptEditFormId").validator({
    		valid:function(from){
    			$.ajax({
    				url:basePath+'/systemManage/saveDept',
    				type: 'POST',
    				data: $("#deptEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					initDeptTree();
    					$("#deptEditFormId #closeDeptId").click();
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
	deptManagerEdit.initDeptEdit();
});