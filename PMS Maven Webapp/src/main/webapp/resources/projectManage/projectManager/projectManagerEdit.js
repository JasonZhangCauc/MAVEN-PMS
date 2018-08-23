/*
 *  @Description：项目新增/编辑页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var projectManagerEdit ={
	initProjectEdit:function(){
		//合同选择选择
    	$("#projectEditFormId #contractNoSelect").on("click",function(){
    		//获取已选择合同id
    		var contractId = $("#projectEditFormId #contractIdSelect").val();
    		$(this).attr("href",basePath+"/contractmanage/contractSelectMain?showId=contractNoSelect&hiddenId=contractIdSelect&contractId="+contractId);
    	});	
    	
    	//项目基本信息保存
    	$("#projectEditFormId #saveProjectId").on("click",function(){
    		//去除下拉框disabled属性
    		$("#projectEditFormId #belongCustomerid").removeAttr("disabled");
    		$("#projectEditFormId #belongProduct").removeAttr("disabled");
    		$("#projectEditFormId").submit();
    	});
    	
    	//基本信息验证
    	$("#projectEditFormId").validator({
    		valid:function(from){
    			$("#projectEditFormId #changeDetails").val(getModifiedField($("#projectEditFormId").serializeFormJson(),projectOldVal,projectField));
    			$.ajax({
    				url:basePath+'/projectManager/saveProject',
    				type: 'POST',
    				data: $("#projectEditFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    					$("#refurbishProjectId").attr("addtabs","R00401_01");
    					$("#refurbishProjectId").attr("url","/projectManager/projectManagerEdit?operate=edit&id="+event.attachObj);
    					$("#refurbishProjectId").attr("title",projectEdit_projectEdit);
    					$("#refurbishProjectId").click();
    				}
    			});
    		}
    	});
    	
    	/**
    	 * 项目提交
    	 */
    	$("#submitProjectId").on("click",function(){
    		initAttasConfirmWal({
    			sa_title: projectEdit_submitMsg,
    			sa_message: importantOperatingWarn,
    			sa_type: "info",
    			sa_showCancelButton: true,
    			sa_confirmButtonText: commonIConfirmBtn,
    			sa_cancelButtonText: commonWrongOperationBtn,
    			sa_closeOnConfirm: false,
    			sa_closeOnCancel: false,
    			sa_confirmButtonClass: "btn-success",
    			sa_cancelButtonClass: "btn-danger",
    			sa_ajaxFuntion:function(){
    	        	$.ajax({
    	        		url: basePath+'/projectManager/submitProject',
    	        		type: 'POST',
    	        		dataType: 'json',
    	        		data: {id:$("#projectEditFormId #projectId").val()},
    	        	})
    	        	.done(function(data) {
    	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    	        		$("#refurbishProjectId").attr("addtabs","R00401_01");
    					$("#refurbishProjectId").attr("url","/projectManager/projectManagerEdit?operate=edit&id="+$("#projectEditFormId #projectId").val());
    					$("#refurbishProjectId").attr("title",projectEdit_projectEdit);
    					$("#refurbishProjectId").click();
    	        	})
    	        	.fail(function(data) {
    	        		showError(data.responseText);
    	        	});
    	        }
    	    }); 
    	});
    	
    	/**
    	 * 关闭
    	 */
    	$("#projectEditFormId #closeProjectId").on("click",function(){
    		closeTab("tab_R00401_01");
    	});
	},
	
	/**
	 * 里程碑数据初始化
	 */
	initMilepost:function(){
		//里程碑Table
		var $milepostGridId = $("#milepostMianTableId");
		//里程碑信息URL
		var $urlMilepost = basePath + '/projectManager/queryMilepostInfoByParam?projectId='+$("#projectId").val();
		//里程碑显示信息
		var $milepostColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "50","data": "milepostName","sTitle":milepostAdd_milepostName},
			{"orderable": true,"sWidth": "50","data": "planCompletedate","sTitle":milepostAdd_planCompletedate},
			{"orderable": true,"sWidth": "50","data": "correspondingPhase","sTitle":milepostAdd_correspondingPhase,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.projectStage);
			}},
			{"orderable": true,"sWidth": "50","data": "milepostStatus","sTitle":milepostAdd_milepostStatus,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.milepostStatus);
			}},
			{"orderable": true,"sWidth": "50","data": "whetherDelay","sTitle":milepostAdd_whetherDelay,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.yesOrNo);
			}},
			{"orderable": true,"sWidth": "50","data": "adjustDate","sTitle":milepostAdd_adjustDate},
			{"orderable": true,"sWidth": "50","data": "deviationDay","sTitle":milepostAdd_deviationDay},
			{"orderable": true,"sWidth": "50","data": "milepostDescribe","sTitle":milepostAdd_milepostDescribe},
			{"orderable": true,"sWidth": "50","data": "remark","sTitle":milepostAdd_remark},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		
		//操作列
		var $milepostColumnDefs=[{"targets":[11],"data":"id","render":projectManagerEdit.grid_milepost_operation}];
		
		//里程碑列表初始化
		TableAjax(gridMilepost,$milepostGridId,$urlMilepost,$milepostColumns,$milepostColumnDefs,true,true,commonPageLength);
	},
	
	/**
	 * 交付物数据初始化
	 */
	initDeliveries:function(){
		//交付物Table
		var $deliveriesGridId = $("#deliveriesMianTableId");
		//交付物信息URL
		var $urlDeliveries = basePath + '/projectManager/queryDeliveriesInfoByParam?projectId='+$("#projectId").val();
		//交付物显示信息
		var $deliveriesColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "50","data": "deliveriesName","sTitle":deliveriesAdd_deliveriesName},
			{"orderable": true,"sWidth": "50","data": "planDeliveriesDate","sTitle":deliveriesAdd_planDeliveriesDate},
			{"orderable": true,"sWidth": "50","data": "whetherContract","sTitle":deliveriesAdd_whetherContract,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.yesOrNo);
			}},
			{"orderable": true,"sWidth": "50","data": "personLiableName","sTitle":deliveriesAdd_personLiable},
			{"orderable": true,"sWidth": "50","data": "whetherDeliver","sTitle":deliveriesAdd_whetherDeliver,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.yesOrNo);
			}},
			{"orderable": true,"sWidth": "50","data": "actualDeliveriesDate","sTitle":deliveriesAdd_actualDeliveriesDate},
			{"orderable": true,"sWidth": "50","data": "remark","sTitle":deliveriesAdd_remark},
			{"orderable": false,"sWidth": "50","sTitle":deliveriesAdd_attachment,"render":function(data,type,full){
				return initAttachmentDownload({_dataId:full.id,_pageType:"R004-0203"});
			}},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		
		//操作列
		var $deliveriesColumnDefs=[{"targets":[10],"data":"id","render":projectManagerEdit.grid_deliveries_operation}];
		
		//里程碑列表初始化
		TableAjax(gridDeliveries,$deliveriesGridId,$urlDeliveries,$deliveriesColumns,$deliveriesColumnDefs,true,true,commonPageLength);
	},
	
	/**
	 * 里程碑操作列
	 */
	grid_milepost_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthMilepost){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/projectManager/milepostManagerEdit?operate=edit&id="+data+
			"&projectId="+$("#projectEditFormId #projectId").val()+"' data-target='#newMilepostModalId' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		if(hasDelAuthMilepost){
			ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"projectManagerEdit.deleteMilepost('"+data+
			"','"+milepostAdd_deleteMsg+"');\" ><i class='fa fa-trash-o'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R0040102&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i>"+commonDatalogBtn+"</a>";
		
		 $(".tooltips").tooltip();
		return ret;
	},
	
	/**
	 * 交付物操作列
	 */
	grid_deliveries_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthDeliveries){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/projectManager/deliveriesManagerEdit?operate=edit&id="+data+
			"&projectId="+$("#projectEditFormId #projectId").val()+"' data-target='#newDeliveriesModalId' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		if(hasDelAuthDeliveries){
			ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"projectManagerEdit.deleteDeliveries('"+data+
			"','"+deliveriesAdd_deleteMsg+"');\" ><i class='fa fa-trash-o'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R0040103&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i>"+commonDatalogBtn+"</a>";
		
		 $(".tooltips").tooltip();
		return ret;
	},
	
	/**
	 * 删除里程碑
	 * @param value id
	 * @param msg 提示信息
	 */
	deleteMilepost:function(value,msg){
		initAttasConfirmWal({
			sa_title: msg,
			sa_message: importantOperatingWarn,
			sa_type: "info",
			sa_showCancelButton: true,
			sa_confirmButtonText: commonIConfirmBtn,
			sa_cancelButtonText: commonWrongOperationBtn,
			sa_closeOnConfirm: false,
			sa_closeOnCancel: false,
			sa_confirmButtonClass: "btn-success",
			sa_cancelButtonClass: "btn-danger",
			sa_ajaxFuntion:function(){
	        	$.ajax({
	        		url: basePath+'/projectManager/deleteMilepost',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		gridMilepost.getDataTable().ajax.reload();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	        }
	    }); 
	},
	
	/**
	 * 删除交付物信息
	 * @param value id
	 * @param msg   删除提示信息
	 */
	deleteDeliveries:function(value,msg){
		initAttasConfirmWal({
			sa_title: msg,
			sa_message: importantOperatingWarn,
			sa_type: "info",
			sa_showCancelButton: true,
			sa_confirmButtonText: commonIConfirmBtn,
			sa_cancelButtonText: commonWrongOperationBtn,
			sa_closeOnConfirm: false,
			sa_closeOnCancel: false,
			sa_confirmButtonClass: "btn-success",
			sa_cancelButtonClass: "btn-danger",
			sa_ajaxFuntion:function(){
	        	$.ajax({
	        		url: basePath+'/projectManager/deleteDeliveries',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		gridDeliveries.getDataTable().ajax.reload();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	        }
	    }); 
	}
	
};
jQuery(document).ready(function() {
	//初始化下拉框及日期控件
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        autoclose: true
    });
    //设置开始时间不能大于结束时间
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	//基本信息
	projectManagerEdit.initProjectEdit();
	//里程碑
	projectManagerEdit.initMilepost();
	//交付物
	projectManagerEdit.initDeliveries();
});