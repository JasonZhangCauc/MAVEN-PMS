deliveriesManagerEdit={
	//初始化里程碑编辑界面
	initDeliveriesEdit:function(){
		//保存里程碑信息
		$("#deliveriesEditFormId #saveDeliveriesId").on("click",function(){
			$("#deliveriesEditFormId #planDeliveriesDate").removeAttr("disabled");
			$("#deliveriesEditFormId #whetherContract").removeAttr("disabled");
			$("#deliveriesEditFormId #personLiable").removeAttr("disabled");
			$("#deliveriesEditFormId").submit();
		});
		
		//里程碑信息验证
		$("#deliveriesEditFormId").validator({
    		valid:function(from){
    			$("#deliveriesEditFormId #changeDetails").val(getModifiedField($("#deliveriesEditFormId").serializeFormJson(),deliveriesEditOldVal,deliveriesEditField));
    			$.ajax({
    				url:basePath+'/projectManager/saveDeliveries',
    				type: 'POST',
    				data: $("#deliveriesEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#deliveriesEditFormId #planDeliveriesDate").attr("disabled");
    					$("#deliveriesEditFormId #whetherContract").attr("disabled");
    					$("#deliveriesEditFormId #belongCustomerid").attr("disabled");
    					$("#deliveriesEditFormId #personLiable").click();
    					gridMilepost.getDataTable().ajax.reload();
    					gridDeliveries.getDataTable().ajax.reload();
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
	deliveriesManagerEdit.initDeliveriesEdit();
});