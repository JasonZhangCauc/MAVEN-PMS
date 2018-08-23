/*
 *  @Description：报销申请信息编辑/新增界面JS
 *  @author：               lanjunjie
 *  @date：                  2018年8月3日
 */
reimburseBaseinfoEdit={
	initReimburseBaseInfoEdit:function () {
        //报销申请信息保存
    	$("#saveReimburseBaseInfoId").click(function(){
    		$("#reimburseBaseInfoEditFormId").submit();
    	});
    	
    	//报销申请信息验证
    	$("#reimburseBaseInfoEditFormId").validator({
    		
    		valid:function(from){
    			$("#reimburseBaseInfoEditFormId #changeDetails").val(getModifiedField($("#reimburseBaseInfoEditFormId").serializeFormJson(),reimburseBaseInfoOldVal,reimburseBaseInfoField));
    			$.ajax({
    				url:basePath+'/applyManage/saveReimburse',
    				type: 'POST',
    				data: $("#reimburseBaseInfoEditFormId").serialize(),
    				success:function(event){
    					$("#closeReimburseBaseInfoEditId").click();
    					$("#searchReimburseBaseInfoBtn").click();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    				}
    			});
    		}
    	});
     }
	
};
//加载页面
jQuery(document).ready(function() {
	if('${vo.status}'>1){
		$("#saveReimburseBaseInfoId").hide();
	}
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
	reimburseBaseinfoEdit.initReimburseBaseInfoEdit();
});