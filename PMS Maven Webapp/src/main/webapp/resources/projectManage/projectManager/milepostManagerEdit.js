milepostManagerEdit={
	//初始化里程碑编辑界面
	initMilepostEdit:function(){
		//保存里程碑信息
		$("#milepostEditFormId #saveMilepostId").on("click",function(){
			var proId=$("#milepostEditFormId #milepostProjectId").val();
			var proStadge=$("#milepostEditFormId #correspondingPhase").val();			
			$.ajax({
				url:basePath+'/projectManager/getMilepostProjectStadgeCounts',
				type: 'POST',
				data: {projectId:proId,projectStadge:proStadge},
				dataType: 'json',
				success:function(result){
					if(operation=='add' && result>=1){
					   bootbox.alert(errCountMeg);
					}else{
						$("#milepostEditFormId").submit();
					}
				}
			});		   
		});
		
		//里程碑信息验证
		$("#milepostEditFormId").validator({
    		valid:function(from){
    			$("#milepostEditFormId #changeDetails").val(getModifiedField($("#milepostEditFormId").serializeFormJson(),milepostAddOldVal,milepostAddField));
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