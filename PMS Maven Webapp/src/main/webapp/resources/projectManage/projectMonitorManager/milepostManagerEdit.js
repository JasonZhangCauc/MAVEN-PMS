milepostManagerEdit={
	//初始化里程碑编辑界面
	initMilepostEdit:function(){
		//保存里程碑信息
		$("#milepostEditFormId #saveMilepostId").on("click",function(){
			$("#milepostEditFormId #correspondingPhase").removeAttr("disabled");
			$("#milepostEditFormId #milepostStatus").removeAttr("disabled");
			$("#milepostEditFormId #planCompletedate").removeAttr("disabled");
			$("#milepostEditFormId").submit();
		});
		
		//里程碑信息验证
		$("#milepostEditFormId").validator({
    		valid:function(from){
    			$("#milepostEditFormId #changeDetails").val(getModifiedField($("#milepostEditFormId").serializeFormJson(),milepostEditOldVal,milepostEditField));
    			$.ajax({
    				url:basePath+'/projectManager/saveMilepost',
    				type: 'POST',
    				data: $("#milepostEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#milepostEditFormId #closeMilepostId").click();
    					gridMilepost.getDataTable().ajax.reload();
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
	milepostManagerEdit.initMilepostEdit();
});