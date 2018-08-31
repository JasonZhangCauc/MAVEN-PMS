/*
 *  @Description：项目基本信息编辑/新增界面JS
 *  @author：               jczou
 *  @date：                    2018年3月15日
 */
trackingManagerEdit={
	initTrackingEdit:function () {
        //项目基本信息保存
    	$("#saveTrackId").click(function(){
    		$("#trackingEditFormId").submit();
    	});
    	
    	//项目基本信息验证
    	$("#trackingEditFormId").validator({
    		valid:function(from){
    			$.ajax({
    				url:basePath+'/projectManage/saveTrackingManager',
    				type: 'POST',
    				data: $("#trackingEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#refurbishTrackId").attr("url","projectManage/trackingManagerEdit?operate=edit&id="+event.attachObj.id);
    					$("#refurbishTrackId").click();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
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
	 //初始化下拉框及日期控件
    $('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        autoclose: true
    });
    
    trackingManagerEdit.initTrackingEdit();
});