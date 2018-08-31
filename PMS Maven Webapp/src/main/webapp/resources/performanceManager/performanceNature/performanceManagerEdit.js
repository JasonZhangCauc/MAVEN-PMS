/*
 *  @Description：绩效编辑界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
performanceManagerEdit={
	initPerformanceEdit:function () {
		if(performanceEdit_operate=='view'){
			$("#savePerformanceId").attr("disabled","disabled");
		}
        //绩效信息保存
    	$("#savePerformanceId").click(function(){
    		$("#performanceEditFormId").submit();
    	});
    	
    	//绩效信息验证
    	$("#performanceEditFormId").validator({
    		valid:function(from){
    			$("#performanceEditFormId #changeDetails").val(getModifiedField($("#performanceEditFormId").serializeFormJson(),performanceEditVal,performanceEditColumn));
    			$.ajax({
    				url:basePath+'/performanceManager/savePerformance',
    				type: 'POST',
    				data: $("#performanceEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#performanceEditFormId #closePerformanceId").click();
    					gridPerformanceNatrue.getDataTable().ajax.reload();
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
	performanceManagerEdit.initPerformanceEdit();
});