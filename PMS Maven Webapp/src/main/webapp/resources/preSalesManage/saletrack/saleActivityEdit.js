/*
 *  @Description：销售活动编辑/新增界面JS
 *  @author：               raomingyi
 *  @date：                    2018年3月7日
 */
saleActivityEdit={
			    
	initActivityEdit:function () { 
				
		//初始化下拉框及日期控件
	    $('.bs-select').selectpicker({  
	        iconBase: 'fa', 
	        tickIcon: 'fa-check'
	    });
	    $('.date-picker').datepicker({
	        rtl: App.isRTL(),
	        clearBtn: true,
	        autoclose: true
	    });     
	    
	    //设置开始时间不能大于结束时间
	    $("#activityEditFormId #activityBegindate").on("changeDate",function(e){ 
	    	$("#activityEditFormId #activityEnddate").datepicker("setStartDate",e.date);
	    });
	    $("#activityEditFormId #activityEnddate").on("changeDate",function(e){
	    	$("#activityEditFormId #activityBegindate").datepicker("setEndDate",e.date);
	    });
        
        //销售活动信息保存
    	$("#saveActivityId").click(function(){
    		$("#activityEditFormId").submit();
    	});
    	
    	//销售活动信息验证
    	$("#activityEditFormId").validator({
    		valid:function(from){
    			$("#activityEditFormId #changeDetails").val(getModifiedField($("#activityEditFormId").serializeFormJson(),saleActivityOldVal,saleActivityField));
    			$.ajax({
    				url:basePath+'/preSalesManage/saveSalesActivity',
    				type: 'POST',
    				data: $("#activityEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){ 
    					$("#closeCustomBaseInfoEditIdACT").click();  
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    					gridActivity.getDataTable().ajax.reload();
    					SaleTrack.search_sale_activity($("#salesprojectId").val()); 
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
	saleActivityEdit.initActivityEdit();
});