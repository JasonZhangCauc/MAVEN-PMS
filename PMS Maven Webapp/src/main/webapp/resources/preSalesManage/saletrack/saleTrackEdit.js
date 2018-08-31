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
        
        //销售跟踪信息保存
    	$("#saveTrackId").click(function(){
    		$("#TrackEditFormIdES").submit();
    	});
    	
    	//销售跟踪信息验证
    	$("#TrackEditFormIdES").validator({
    		valid:function(from){
    			$("#TrackEditFormIdES #changeDetails").val(getModifiedField($("#TrackEditFormIdES").serializeFormJson(),saleTrackOldVal,saleTrackField));
    			$.ajax({
    				url:basePath+'/preSalesManage/saveSaleTrack',
    				type: 'POST',
    				data: $("#TrackEditFormIdES").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#closeTrackEditIdss").click();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    					gridProInfo.getDataTable().ajax.reload();
    				}
    			});
    		}
    	});
    	
    	
    	$("#TrackEditFormIdES #customerId").on("change",function(){
    		var parma=$("#TrackEditFormIdES #customerId").val();//公司id    		
    		$("#TrackEditFormIdES #decisionMaker").initCusLinker(null,parma);   		
			$("#TrackEditFormIdES #decisionMaker").selectpicker('refresh');
			$("#TrackEditFormIdES #stakeholder").initCusLinker(null,parma);   		
			$("#TrackEditFormIdES #stakeholder").selectpicker('refresh');
			$("#TrackEditFormIdES #linker").initCusLinker(null,parma);   		
			$("#TrackEditFormIdES #linker").selectpicker('refresh');			    		
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
