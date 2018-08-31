/*
 *  @Description：客户编辑/新增界面JS
 *  @author：               raomingyi
 *  @date：                    2018年3月7日
 */
customManageEdits={
	initCustomEdits:function () {
        //客户信息保存
    	$("#saveCustomIds").click(function(){
    		$("#CustomEditFormIds").submit();
    	});
    	
    	//客户信息验证
    	$("#CustomEditFormIds").validator({
    		valid:function(from){
    			$("#CustomEditFormIds #changeDetails").val(getModifiedField($("#CustomEditFormIds").serializeFormJson(),objectVal,customColumn));
    			$.ajax({
    				url:basePath+'/projectMoniInfo/saveProjectMoniInfo',
    				type: 'POST',
    				data: $("#CustomEditFormIds").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#closeCustomBaseInfoEditId").click();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    					gridCustomer.getDataTable().ajax.reload();
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
	//初始化下拉框及日期控件
    $('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        autoclose: true
    });
    
    //设置开始时间不能大于结束时间
    $("#CustomEditFormIds #moniStartDate").on("changeDate",function(e){
    	$("#CustomEditFormIds #moniEndDate").datepicker("setStartDate",e.date);
    });
    $("#CustomEditFormIds #moniEndDate").on("changeDate",function(e){
    	$("#CustomEditFormIds #moniStartDate").datepicker("setEndDate",e.date);
    });
    
	customManageEdits.initCustomEdits();
});