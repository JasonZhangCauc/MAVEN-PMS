/*
 *  @Description：用户编辑/新增界面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
userManagerEdit={
	initUserEdit:function () {
        //初始化下拉框及日期控件
        $('.date-picker').datepicker({
            rtl: App.isRTL(),
            autoclose: true
        });
        $('.bs-select').selectpicker({
            iconBase: 'fa',
            tickIcon: 'fa-check'
        });
        
        //用户信息保存
    	$("#saveUserId").click(function(){
    		$("#userEditFormId").submit();
    	}); 
    	//用户信息验证
    	$("#userEditFormId").validator({
    		valid:function(from){
    			$("#userEditFormId #changeDetails").val(getModifiedField($("#userEditFormId").serializeFormJson(),userOldVal,userField));
    			var options = {
		            url:basePath+'/systemManage/saveUserData',
		            type:'POST',
		            dataType: 'json',
		            success: function(data){
		            	$("#closeUserEditId").click();
    					gridUser.getDataTable().ajax.reload();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		            	/*initAlertsAppendWal({ap_type:'success',ap_message:commonSuccessMsg,ap_icon:'fa fa-check'});*/
		            }
		        };
		        $("#userEditFormId").ajaxSubmit(options); 
		        return false;
    		}
    	});
    	
    	//部门选择
    	$("#deptTwo").on("click",function(){
    		var deptId = $("#deptOne").val();
			$(this).attr("href",basePath+"/common/getDeptList?type=checkbox&showId=deptTwo&hiddenId=deptOne&deptId="+deptId);
    	});
     }
	
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    }
	userManagerEdit.initUserEdit();
});
function getBirthDay(){
	var Idcard = $("#userIdcard").val();
	var birthday = "";
	if(Idcard.length==15){
		birthday="19"+Idcard.substring(6,8)+"-"+Idcard.substring(8,10)+"-"+Idcard.substring(10,12);
	}else if(Idcard.length==18){
		birthday = Idcard.substring(6,10)+"-"+Idcard.substring(10,12)+"-"+Idcard.substring(12,14);
	}
	if(birthday!=""){
		$("#userBirth").val(birthday);
		$("#userEditFormId #entryDate").datepicker("setStartDate",birthday);
    	$("#userEditFormId #diplomaDate").datepicker("setStartDate",birthday);
	}
}