/*
 *  @Description：销售跟踪编辑/新增界面JS
 *  @author：               raomingyi
 *  @date：                    2018年3月7日
 */
saleTrackEdit={
	initSaleTrackEdit:function () {
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
        
    	//销售跟踪信息验证
    	$("#TrackEditFormIdLook").validator({
    		valid:function(from){
    			$("#TrackEditFormIdLook #changeDetails").val(getModifiedField($("#TrackEditFormIdLook").serializeFormJson(),saleTrackOldVal,saleTrackField));
    			$.ajax({
    				url:basePath+'/preSalesManage/saveSaleTrack',
    				type: 'POST',
    				data: $("#TrackEditFormIdLook").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#TrackEditFormIdLook #closeTrackEditId").click();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    					gridProInfo.getDataTable().ajax.reload();
    				}
    			});
    		}
    	});
    	
    	
    	$("#TrackEditFormIdLook #customerId").on("change",function(){
    		var parma=$("#TrackEditFormIdLook #customerId").val();//公司id    		
    		$("#TrackEditFormIdLook #decisionMaker").initCusLinker(null,parma);   		
			$("#TrackEditFormIdLook #decisionMaker").selectpicker('refresh');
			$("#TrackEditFormIdLook #stakeholder").initCusLinker(null,parma);   		
			$("#TrackEditFormIdLook #stakeholder").selectpicker('refresh');
			$("#TrackEditFormIdLook #linker").initCusLinker(null,parma);   		
			$("#TrackEditFormIdLook #linker").selectpicker('refresh');			    		
    	});
    	
    	
     }
	
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    }
	saleTrackEdit.initSaleTrackEdit();
});
