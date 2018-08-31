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
    	$("#saveLeaveId").click(function(){
    		$("#leaveEditFormId").submit();
    	});
    	
    	//合同信息验证
    	$("#leaveEditFormId").validator({
    		valid:function(from){
    			$("#leaveEditFormId #changeDetails").val(getModifiedField($("#leaveEditFormId").serializeFormJson(),contractVal,contractColumn));
    			$.ajax({
    				url:basePath+'/checkinginManage/saveLeave',
    				type: 'POST',
    				data: $("#leaveEditFormId").serialize(),
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
	//设置条件开始时间不能大于结束时间
    $("#leaveEditFormId #beginTime").on("changeDate",function(e){
    	$("#leaveEditFormId #endTime").datetimepicker("setStartDate",e.date);
    });
    $("#leaveEditFormId #endTime").on("changeDate",function(e){
    	$("#leaveEditFormId #beginTime").datetimepicker("setEndDate",e.date);
    });
	ContractEdit.initContractEdit();
});