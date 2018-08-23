/*
 *  @Description：工时统计编辑/新增界面JS
 *  @author：               jczou
 *  @date：                    2018年3月15日
 */
othercostManagementEdit={
	initothercostEdit:function () {
        //用户信息保存
    	$("#saveOtherCostId").click(function(){
    		$("#othercostEditFormId").submit();
    	});
    	
    	//用户信息验证
    	$("#othercostEditFormId").validator({
    		valid:function(from){
    			$("#othercostEditFormId #changeDetails").val(getModifiedField($("#othercostEditFormId").serializeFormJson(),otherCostOldVal,otherCostField));
    			$.ajax({
    				url:basePath+'/projectManagement/saveOtherCostManager',
    				type: 'POST',
    				data: $("#othercostEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					gridothercost.getDataTable().ajax.reload();
    					initAlertsAppendWal({ap_type:'success',ap_message:commonSuccessMsg,ap_icon:'fa fa-check'});
    				}
    			});
    		}
    	});
    	
    	/**
    	 * 费用大项变更，对应小项变更
    	 */
    	$("#othercostEditFormId #costSports").on("change",function(){
    		if($(this).val()=="0"){
    			$("#othercostEditFormId #costEvents").initDic(null,codeBasicInfo.costEventsTravel);
    		}else if($(this).val()=="1"){
    			$("#othercostEditFormId #costEvents").initDic(null,codeBasicInfo.costEventsOther);
    		}else{
    			$("#othercostEditFormId #costEvents").empty();
    			$("#othercostEditFormId #costEvents").selectpicker('refresh');
    		}
    	});
     }
	
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    }
	 //初始化下拉框及日期控件
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        autoclose: true
    });
    $('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
    //设置开始时间不能大于结束时间
    $("#othercostEditFormId #beginDate").on("changeDate",function(e){
    	$("#othercostEditFormId #endDate").datepicker("setStartDate",e.date);
    });
    $("#othercostEditFormId #endDate").on("changeDate",function(e){
    	$("#othercostEditFormId #beginDate").datepicker("setEndDate",e.date);
    });
	othercostManagementEdit.initothercostEdit();
});