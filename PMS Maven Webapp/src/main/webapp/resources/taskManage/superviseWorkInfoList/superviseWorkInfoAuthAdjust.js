/*
 *  @Description：工时统计编辑/新增界面JS
 *  @author：               jczou
 *  @date：                    2018年3月15日
 */
superviseBaseinfoEdit={
	initsuperviseInfoEdit:function () {
        //用户信息保存
    	$("#saveSuperviseInfoIdsq").click(function(){
    		$("#projectSuperviseEditFormIdsqw").submit();
    	});
    	
    	//用户信息验证
    	$("#projectSuperviseEditFormIdsqw").validator({
    		valid:function(from){
    			$("#projectSuperviseEditFormIdsqw #changeDetails").val(getModifiedField($("#projectSuperviseEditFormIdsqw").serializeFormJson(),projectBaseInfoOldVal,projectBaseInfoField));
    			$.ajax({
    				url:basePath+'/taskManage/saveSuperviseInfoCL',
    				type: 'POST',
    				data: $("#projectSuperviseEditFormIdsqw").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#closeProjectBaseInfoEditIdss").click();
    					gridSuperviseInfo.getDataTable().ajax.reload();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    				}
    			});
    		}
    	});
    	
    	//主要负责人选择
    	$("#responsibleMainName").on("click",function(){
    		var responsibleHead = $("#responsibleMain").val();
			$(this).attr("href",basePath+"/common/userSelectMain?type=checkbox&radio=1&users="+responsibleHead+"&showId=responsibleMainName&hideId=responsibleMain");
    	});
    	
    	//次要负责人选择
    	$("#responsibleSecondaryName").on("click",function(){
    		var responsibleSecondaryHead = $("#responsibleSecondary").val();
			$(this).attr("href",basePath+"/common/userSelectMain?type=checkbox&users="+responsibleSecondaryHead+"&showId=responsibleSecondaryName&hideId=responsibleSecondary");
    	});
    	
    	//验收人
    	$("#accepterName").on("click",function(){
    		var accepterHead = $("#accepter").val();
			$(this).attr("href",basePath+"/common/userSelectMain?type=checkbox&users="+accepterHead+"&showId=accepterName&hideId=accepter");
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
        clearBtn: true,
        autoclose: true
    });
    $("#projectSuperviseEditFormIdsqw #requiredDate").datepicker("setStartDate",new Date());
    superviseBaseinfoEdit.initsuperviseInfoEdit();
});