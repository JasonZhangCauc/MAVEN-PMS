/*
 *  @Description：收款节点编辑/新增界面JS
 *  @author：               raomingyi
 *  @date：                    2018年3月7日
 */
receiveNodeEdit={
	initNodeEdit:function () {
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
        
        //收款节点信息保存
    	$("#saveNodeId").click(function(){
    		$("#nodeEditFormId").submit();
    	});
    	
    	//收款节点信息验证
    	$("#nodeEditFormId").validator({
    		valid:function(from){
    			$("#nodeEditFormId #changeDetails").val(getModifiedField($("#nodeEditFormId").serializeFormJson(),receiveNodeVal,receiveNodeColumn));
    			$.ajax({
    				url:basePath+'/contractmanage/saveReceiveNode',
    				type: 'POST',
    				data: $("#nodeEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#nodeEditFormId #closeNodeEditId").click();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    					gridReceiveNode.getDataTable().ajax.reload();
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
	receiveNodeEdit.initNodeEdit();
});