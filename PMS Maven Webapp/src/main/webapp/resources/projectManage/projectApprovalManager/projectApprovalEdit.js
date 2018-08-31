/*
 *  @Description：项目基本信息编辑/新增界面JS
 *  @author：               jczou
 *  @date：                    2018年3月15日
 */
projectBaseinfoEdit={
	initProjectBaseInfoEdit:function () {
        //项目基本信息保存
    	$("#saveProjectBaseInfoId").click(function(){
    		$("#projectBaseInfoEditFormId").submit();
    	});
    	
    	//项目基本信息验证
    	$("#projectBaseInfoEditFormId").validator({
    		valid:function(from){
    			$("#projectBaseInfoEditFormId #changeDetails").val(getModifiedField($("#projectBaseInfoEditFormId").serializeFormJson(),projectBaseInfoOldVal,projectBaseInfoField));
    			$.ajax({
    				url:basePath+'/projectManage/saveProjectApproval',
    				type: 'POST',
    				data: $("#projectBaseInfoEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					$("#closeProjectBaseInfoEditId").click();
    					gridProjectBaseInfo.getDataTable().ajax.reload();
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    				}
    			});
    		}
    	});
    	
    	//项目负责人选择
    	$("#projectBaseInfoEditFormId #projectHeadName").on("click",function(){
    		var toDivision=$("#projectBaseInfoEditFormId #toDivisionOne").val();
    		var projectHead = $("#projectBaseInfoEditFormId #projectHead").val();
			$(this).attr("href",basePath+"/common/userSelectMain?deptId="+toDivision+"&userPosition=4&type=checkbox&users="+projectHead+"&showId=projectHeadName&hideId=projectHead");
    	});
    	
    	//商务人员选择
    	$("#projectBaseInfoEditFormId #businessPeopleName").on("click",function(){
    		var toDivision=$("#projectBaseInfoEditFormId #toDivisionOne").val();
    		var businessPeople = $("#projectBaseInfoEditFormId #businessPeople").val();
			$(this).attr("href",basePath+"/common/userSelectMain?deptId="+toDivision+"&userPosition=5&type=checkbox&users="+businessPeople+"&showId=businessPeopleName&hideId=businessPeople");
    	});
    	
    	//项目经理选择
    	$("#projectBaseInfoEditFormId #projectManagerName").on("click",function(){
    		var toDivision=$("#projectBaseInfoEditFormId #toDivisionOne").val();
    		var projectManager = $("#projectBaseInfoEditFormId #projectManager").val();
			$(this).attr("href",basePath+"/common/userSelectMain?deptId="+toDivision+"&userPosition=2&type=checkbox&users="+projectManager+"&showId=projectManagerName&hideId=projectManager");
    	});
    	
    	//产品经理选择
    	$("#projectBaseInfoEditFormId #productManager").on("change",function(){  
    		var toDivision=$("#projectBaseInfoEditFormId #toDivisionOne").val();
    		var productManager = $("#projectBaseInfoEditFormId #productManager").val();
			$(this).attr("href",basePath+"/common/userSelectMain?deptId="+toDivision+"&userPosition=3&type=checkbox&users="+productManager+"&showId=productManagerName&hideId=productManager");
    	});
    	
    	//所属部门变更时
    	$("#projectBaseInfoEditFormId #toDivisionOne").on("change",function(){
	    	var toDivision=$(this).val();
	    	//初始产品经理
        	$.ajax({
        		url: basePath+'/systemManage/productManager',
        		type:"POST",
        		dataType:"json",
        		data:{toDivision:toDivision},
        		async:false
        	}).done(function(data) {
        		productManager = data;
        		
        		$("#productManager").empty();
        		if($("#productManager").attr("multiple")!="multiple"){
        			$("#productManager").append("<option value=''>"+pleaseselect+"</option>");
        		}
        		$.each(productManager, function(index,item){
        			var option = ""; 
        			option = "<option value='"+item.id+"'>"+item.userName+"</option>";
        			$("#productManager").append(option);
        	    }); 
        		$("#productManager").selectpicker('refresh');
        		
        	});
        	
        	//初始项目负责人
        	$.ajax({
        		url: basePath+'/systemManage/projectPeople',
        		type:"POST",
        		dataType:"json",
        		data:{toDivision:toDivision},
        		async:false
        	}).done(function(data) {
        		projectPeople = data;
        		
        		$("#projectManager").empty();
        		if($("#projectManager").attr("multiple")!="multiple"){
        			$("#projectManager").append("<option value=''>"+pleaseselect+"</option>");
        		}
        		$.each(projectPeople, function(index,item){
        			var option = ""; 
        			option = "<option value='"+item.id+"'>"+item.userName+"</option>";
        			$("#projectManager").append(option);
        	    }); 
        		$("#projectManager").selectpicker('refresh');
        	});
        	
        	//初始化商务人员
        	$.ajax({
        		url: basePath+'/systemManage/businessPeople',
        		type:"POST",
        		dataType:"json",
        		data:{toDivision:toDivision},
        		async:false
        	}).done(function(data) {
        		businessPeople = data;
        		$("#businessPeople").empty();
        		if($("#businessPeople").attr("multiple")!="multiple"){
        			$("#businessPeople").append("<option value=''>"+pleaseselect+"</option>");
        		}
        		$.each(businessPeople, function(index,item){
        			var option = ""; 
        			option = "<option value='"+item.id+"'>"+item.userName+"</option>";
        			$("#businessPeople").append(option);
        	    }); 
        		$("#businessPeople").selectpicker('refresh');
        	});
        	
        	//初始化销售人员数据
        	$.ajax({
        		url: basePath+'/systemManage/initUserInfoSale',
        		type:"POST",
        		dataType:"json",
        		data:{toDivision:toDivision},
        		async:false
        	}).done(function(data) {
        		debugger;
        		initUserInfoSale = data;
        		$("#saleResponsible").empty();
        		if($("#saleResponsible").attr("multiple")!="multiple"){
        			$("#saleResponsible").append("<option value=''>"+pleaseselect+"</option>");
        		}
        		$.each(businessPeople, function(index,item){
        			var option = ""; 
        			option = "<option value='"+item.id+"'>"+item.userName+"</option>";
        			$("#saleResponsible").append(option);
        	    }); 
        		$("#saleResponsible").selectpicker('refresh');
        	});
        	
	    	//不为空时加载项目资源
	    	if(toDivision!=null && toDivision!='' && toDivision!=undefined){
	    		//查询该部门所有人员名称及其ID
	    		$.ajax({
					url: basePath+'/systemManage/queryUserByDept',
					type: 'POST',
					dataType: 'json',
					data: {deptId:toDivision},
				}).done(function(data) {
					$("#projectBaseInfoEditFormId #projectResource").val(data.attachObj.USERIDS);
					$("#projectBaseInfoEditFormId #projectResourceName").val(data.attachObj.USERNAMES);
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
    //设置开始时间不能大于结束时间
    $("#projectBaseInfoEditFormId #beginTime").on("changeDate",function(e){
    	$("#projectBaseInfoEditFormId #endTime").datepicker("setStartDate",e.date);
    });
    $("#projectBaseInfoEditFormId #endTime").on("changeDate",function(e){
    	$("#projectBaseInfoEditFormId #beginTime").datepicker("setEndDate",e.date);
    });
	projectBaseinfoEdit.initProjectBaseInfoEdit();
});