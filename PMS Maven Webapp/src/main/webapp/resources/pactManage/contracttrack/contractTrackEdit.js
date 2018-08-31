/*
 *  @Description：合同跟踪编辑/新增界面JS
 *  @author：               raomingyi
 *  @date：                 2018年3月22日
 */
ContractTrackEdit={
	initContractTrackEdit:function () {
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
        
        //合同跟踪信息保存
    	$("#saveContractTrackId").click(function(){
    		$("#ContractTrackEditFormId").submit();
    	});
    	
    	//合同跟踪信息验证
    	$("#ContractTrackEditFormId").validator({   		
    		valid:function(from){
    			$("#ContractTrackEditFormId #changeDetails").val(getModifiedField($("#ContractTrackEditFormId").serializeFormJson(),contractTrackVal,contractTrackColumn));
    			$.ajax({
    				url:basePath+'/contractmanage/saveContractTrack',
    				type: 'POST',
    				data: $("#ContractTrackEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#ContractTrackEditFormId #closeContractTrackEditId").click();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    					gridContractTrack.getDataTable().ajax.reload();
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
	ContractTrackEdit.initContractTrackEdit();
});