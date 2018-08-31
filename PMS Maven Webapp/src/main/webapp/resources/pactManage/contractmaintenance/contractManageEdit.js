/*
 *  @Description：合同编辑/新增界面JS
 *  @author：               raomingyi
 *  @date：                    2018年3月7日
 */
ContractEdit={
	initContractEdit:function () {
		//初始日期控件和
        $('.date-picker').datepicker({
            rtl: App.isRTL(),
            autoclose: true
        });
        //下拉框控件
        $('.bs-select').selectpicker({
            iconBase: 'fa',
            tickIcon: 'fa-check'
        });      
        //合同信息保存
    	$("#saveContractId").click(function(){
    		$("#contractEditFormId").submit();
    	});
    	
    	//合同信息验证
    	$("#contractEditFormId").validator({
    		valid:function(from){
    			$("#contractEditFormId #changeDetails").val(getModifiedField($("#contractEditFormId").serializeFormJson(),contractVal,contractColumn));
    			$.ajax({
    				url:basePath+'/contractmanage/saveContract',
    				type: 'POST',
    				data: $("#contractEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){    					
    					gridContract.getDataTable().ajax.reload();
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
    }
	ContractEdit.initContractEdit();
});