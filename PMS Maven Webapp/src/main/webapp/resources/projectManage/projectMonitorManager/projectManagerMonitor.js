/*
 *  @Description：项目监控页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var projectManagerMonitor ={
	initProjectMonitor:function(){
    	//项目基本信息保存
    	$("#projectMonitorFormId #saveProjectId").on("click",function(){
    		//去除下拉框disabled属性
    		$("#projectMonitorFormId #belongCustomerid").removeAttr("disabled");
    		$("#projectMonitorFormId #belongProduct").removeAttr("disabled");
    		$("#projectMonitorFormId #implementHead").removeAttr("disabled");
    		$("#projectMonitorFormId #exploitHead").removeAttr("disabled");
    		$("#projectMonitorFormId #projectStage").removeAttr("disabled");
    		$("#projectMonitorFormId").submit();
    	});
    	
    	//基本信息验证
    	$("#projectMonitorFormId").validator({
    		valid:function(from){
    			$("#projectMonitorFormId #changeDetails").val(getModifiedField($("#projectMonitorFormId").serializeFormJson(),
    					projectMonitorOldVal,projectMonitorField));
    			$.ajax({
    				url:basePath+'/projectManager/saveProject',
    				type: 'POST',
    				data: $("#projectMonitorFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    					$("#projectMonitorFormId #refurbishMonitorId").attr("addtabs","R00402_01");
    					$("#projectMonitorFormId #refurbishMonitorId").attr("url","/projectMonitorManager/projectMonitor?id="+event.attachObj);
    					$("#projectMonitorFormId #refurbishMonitorId").attr("title",projectMonitorEdit_projectMonitorBtn);
    					$("#projectMonitorFormId #refurbishMonitorId").click();
    				}
    			});
    		}
    	});
    	
    	/**
    	 * 关闭
    	 */
    	$("#projectMonitorFormId #closeProjectId").on("click",function(){
    		closeTab("tab_R00402_01");
    	});
	},
	
	/**
	 * 里程碑数据初始化
	 */
	initMilepostEdit:function(){
		//里程碑Table
		var $milepostGridId = $("#milepostEditTableId");
		//里程碑信息URL
		var $urlMilepost = basePath + '/projectManager/queryMilepostInfoByParam?projectId='+$("#projectId").val();
		//里程碑显示信息
		var $milepostColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "50","data": "milepostName","sTitle":milepostEdit_milepostName},
			{"orderable": true,"sWidth": "50","data": "planCompletedate","sTitle":milepostEdit_planCompletedate},
			{"orderable": true,"sWidth": "50","data": "correspondingPhase","sTitle":milepostEdit_correspondingPhase,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.projectStage);
			}},
			{"orderable": true,"sWidth": "50","data": "milepostStatus","sTitle":milepostEdit_milepostStatus,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.milepostStatus);
			}},
			{"orderable": true,"sWidth": "50","data": "whetherDelay","sTitle":milepostEdit_whetherDelay,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.yesOrNo);
			}},
			{"orderable": true,"sWidth": "50","data": "adjustDate","sTitle":milepostEdit_adjustDate},
			{"orderable": true,"sWidth": "50","data": "deviationDay","sTitle":milepostEdit_deviationDay},
			{"orderable": true,"sWidth": "50","data": "milepostDescribe","sTitle":milepostEdit_milepostDescribe},
			{"orderable": true,"sWidth": "50","data": "remark","sTitle":milepostEdit_remark},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		
		//操作列
		var $milepostColumnDefs=[{"targets":[11],"data":"id","render":projectManagerMonitor.grid_milepost_operation}];
		
		//里程碑列表初始化
		TableAjax(gridMilepost,$milepostGridId,$urlMilepost,$milepostColumns,$milepostColumnDefs,true,true,commonPageLength,projectManagerMonitor.grid_milepost_fnRowCallback);
	},
	
	/**
	 * 交付物数据初始化
	 */
	initDeliveriesEdit:function(){
		//交付物Table
		var $deliveriesGridId = $("#deliveriesEditTableId");
		//交付物信息URL
		var $urlDeliveries = basePath + '/projectManager/queryDeliveriesInfoByParam?projectId='+$("#projectId").val();
		//交付物显示信息
		var $deliveriesColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "50","data": "deliveriesName","sTitle":deliveriesEdit_deliveriesName},
			{"orderable": true,"sWidth": "50","data": "planDeliveriesDate","sTitle":deliveriesEdit_planDeliveriesDate},
			{"orderable": true,"sWidth": "50","data": "whetherContract","sTitle":deliveriesEdit_whetherContract,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.yesOrNo);
			}},
			{"orderable": true,"sWidth": "50","data": "personLiableName","sTitle":deliveriesEdit_personLiable},
			{"orderable": true,"sWidth": "50","data": "whetherDeliver","sTitle":deliveriesEdit_whetherDeliver,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.yesOrNo);
			}},
			{"orderable": true,"sWidth": "50","data": "actualDeliveriesDate","sTitle":deliveriesEdit_actualDeliveriesDate},
			{"orderable": true,"sWidth": "50","data": "remark","sTitle":deliveriesEdit_remark},
			{"orderable": false,"sWidth": "50","sTitle":deliveriesEdit_attachment,"render":function(data,type,full){
				return initAttachmentDownload({_dataId:full.id,_pageType:"R004-0203"});
			}},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		
		//操作列
		var $deliveriesColumnDefs=[{"targets":[10],"data":"id","render":projectManagerMonitor.grid_deliveries_operation}];
		
		//里程碑列表初始化
		TableAjax(gridDeliveries,$deliveriesGridId,$urlDeliveries,$deliveriesColumns,$deliveriesColumnDefs,true,true,commonPageLength);
	},
	
	//初始化里程碑调整信息
	initMilePostAdjust:function(){
		//里程碑调整Table
		var $milePostAdjustGridId = $("#milepostAdjustTableId");
		//里程碑调整信息URL
		var $urlMilePostAdjust = basePath + '/projectMonitorManager/queryMilepostAdjustByParam';
		//交付物显示信息
		var $milePostAdjustColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "50","data": "adjustRemark","sTitle":milepostAdjust_adjustRemark},
			{"orderable": true,"sWidth": "50","data": "adjustDate","sTitle":milepostAdjust_adjustDate},
			{"orderable": true,"sWidth": "50","data": "isComplete","sTitle":milepostAdjust_isComplete,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.yesOrNo);
			}},
			{"orderable": true,"sWidth": "50","data": "createByName","sTitle":milepostAdjust_operateBy},
			{"orderable": true,"sWidth": "50","data": "createDate","sTitle":milepostAdjust_operateTime},
			{"orderable": true,"sWidth": "50","data": "approvalByName","sTitle":milepostAdjust_approvalBy},
			{"orderable": true,"sWidth": "50","data": "approvalDate","sTitle":milepostAdjust_approvalDate},
			{"orderable": true,"sWidth": "50","data": "remark","sTitle":milepostAdjust_remark},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		//操作列
		var $milePostAdjustColumnDefs=[{"targets":[10],"data":"id","render":projectManagerMonitor.grid_milePostAdjust_operation}];
		
		//里程碑列表初始化
		TableAjax(gridMilepostAdjust,$milePostAdjustGridId,$urlMilePostAdjust,$milePostAdjustColumns,$milePostAdjustColumnDefs,true,true,commonPageLength);
	},
	
	/**
	 * 里程碑操作列
	 */
	grid_milepost_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthMilepost){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/projectMonitorManager/milepostManagerEdit?operate=edit&id="+data+
			"&projectId="+$("#projectMonitorFormId #projectId").val()+"' data-target='#editMilepostModalId' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		if(hasAdjustmentAuthMilepost){
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+milepostEdit_adjustment+" href='"+basePath+"/projectMonitorManager/milePostAdjustEdit?operate=add"+
			"&milepostId="+data+"' data-target='#newAdjustmentModalId' data-toggle='modal'><i class='fa fa-adjust'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R0040102&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		$(".tooltips").tooltip();
		return ret;
	},
	
	/**
	 * 交付物操作列
	 */
	grid_deliveries_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthDeliveries){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/projectMonitorManager/deliveriesManagerEdit?operate=edit&id="+data+
			"&projectId="+$("#projectMonitorFormId #projectId").val()+"' data-target='#editDeliveriesModalId' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R0040103&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		$(".tooltips").tooltip();
		return ret;
	},
	
	/**
	 * 里程碑调整操作列
	 */
	grid_milePostAdjust_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthMilepostAdjust){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/projectMonitorManager/milePostAdjustEdit?operate=edit&id="+data+
			"' data-target='#newAdjustmentModalId' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		$(".tooltips").tooltip();
		return ret;
	},
	
	grid_milepost_fnRowCallback: function(row, data, index) {
		 $(row).on("click",function() {
			 if ($(this).hasClass('row_selected')) {
				 $(this).removeClass('row_selected');
				 $(this).removeAttr("style");
				 hideMilepostId="";//赋值选中用户ID
			 } else {
				 $("#milepostEditTableId tr.row_selected").removeAttr("style");
				 $("#milepostEditTableId tr.row_selected").removeClass('row_selected');
				 $(this).addClass('row_selected');
				 hideMilepostId=data.id;//赋值选中用户ID
			 }
			 if(gridMilepostAdjust.getRowsCount() > 0){
				event.preventDefault();
				gridMilepostAdjust.clearAjaxParams();
				//传FORM参数
				gridMilepostAdjust.setAjaxParam("milepostId", hideMilepostId);
				gridMilepostAdjust.getDataTable().ajax.reload();
			 }else{
				App.alert({
                   type: 'danger',
                   icon: 'warning',
                   message: 'Please select an action',
                   container: gridLinker.getTableWrapper(),
                   place: 'prepend'
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
	projectManagerMonitor.initProjectMonitor();
	//里程碑
	projectManagerMonitor.initMilepostEdit();
	//交付物
	projectManagerMonitor.initDeliveriesEdit();
	//里程碑调整
	projectManagerMonitor.initMilePostAdjust();
});