/*
 *  @Description：单价管理编辑/新增界面JS
 *  @author：               jczou
 *  @date：                    2018年2月28日
 */
costManagementEdit={
	initCostEdit:function () {
        
        //用户信息保存
    	$("#saveCostId").click(function(){
    		$("#costEditFormId").submit();
    	});
    	
    	//用户信息验证
    	$("#costEditFormId").validator({
    		valid:function(from){
    			$("#costEditFormId #changeDetails").val(getModifiedField($("#costEditFormId").serializeFormJson(),costOldVal,costField));
    			$.ajax({
    				url:basePath+'/projectManagement/saveCostManagement',
    				type: 'POST',
    				data: $("#costEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					gridCost.getDataTable().ajax.reload();
    					initAlertsAppendWal({ap_type:'success',ap_message:commonSuccessMsg,ap_icon:'fa fa-check'});
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
    };
	 //初始化下拉框及日期控件
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        autoclose: true
    });
    $('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	costManagementEdit.initCostEdit();
});