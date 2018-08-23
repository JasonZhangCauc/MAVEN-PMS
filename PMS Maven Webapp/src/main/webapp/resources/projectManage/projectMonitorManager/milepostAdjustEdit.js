milepostAdjustEdit={
	//初始化里程碑编辑界面
	initMilepostAdjust:function(){
		//保存里程碑信息
		$("#milepostAdjustFormId #saveMilepostAdjustId").on("click",function(){
			$("#milepostAdjustFormId").submit();
		});
		
		//里程碑信息验证
		$("#milepostAdjustFormId").validator({
    		valid:function(from){
    			$("#milepostAdjustFormId #changeDetails").val(getModifiedField($("#milepostAdjustFormId").serializeFormJson(),milepostAdjustOldVal,milepostAdjustField));
    			$.ajax({
    				url:basePath+'/projectMonitorManager/saveMilepostAdjust',
    				type: 'POST',
    				data: $("#milepostAdjustFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#milepostAdjustFormId #closeMilepostAdjustId").click();
    					gridMilepostAdjust.getDataTable().ajax.reload();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    				}
    			});
    		}
    	});
	}
};

//加载页面
jQuery(document).ready(function() {
	//初始化下拉框及日期控件
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        autoclose: true
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	if (!jQuery().dataTable) {
        return;
    }
	milepostAdjustEdit.initMilepostAdjust();
});