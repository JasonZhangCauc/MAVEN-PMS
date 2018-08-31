/*
 *  @Description：跟踪表主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年07月02日
 */
var trackingManagerMain ={
	trackingManagerInit:function(){
		//跟踪表Table
		var $trackingGridId = $("#trackingMianTableId");
		//跟踪表Form
		var $trackingFormId = $("#trackingMainFormId");
		//跟踪表信息URL
		var $urlTracking = basePath + '/projectManage/queryTrackingInfoByParam';
		//跟踪表显示信息
		var trackingColumns=[
		    {"bVisible": false,"orderable": false,"data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "100","data": "requirementStatus","sTitle":trackingMain_requirementStatus,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.requirementStatus);
			}},
			{"orderable": true,"sWidth": "100","data": "demandNum","sTitle":trackingMain_demandNum},
			{"orderable": true,"sWidth": "100","data": "batchNo","sTitle":trackingMain_batchNo},
			{"orderable": true,"sWidth": "100","data": "customerName","sTitle":trackingMain_shortName},
			{"orderable": true,"sWidth": "100","data": "projectName","sTitle":trackingMain_projectName},
			{"orderable": true,"sWidth": "100","data": "putDate","sTitle":trackingMain_putDate},
			{"orderable": true,"sWidth": "100","data": "requirementType","sTitle":trackingMain_requirementType,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.isNot);
			}},
			{"orderable": true,"sWidth": "100","data": "describe","sTitle":trackingMain_describe},
			{"orderable": true,"sWidth": "100","data": "priority","sTitle":trackingMain_priority,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.priority);
			}},
			{"orderable": true,"sWidth": "100","data": "whetherPhaseIi","sTitle":trackingMain_whetherPhaseIi,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.isNot);
			}},
			{"orderable": true,"sWidth": "100","data": "whetherScope","sTitle":trackingMain_whetherScope,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.isNot);
			}},
			{"orderable": false,"sWidth":'200',"sTitle":commonOperate}
	     ];
		//操作列
		var trackingColumnDefs=[{"targets":[13],"data":"id","render":trackingManagerMain.grid_tracking_operation}];
		//跟踪表列表初始化
		TableAjax(gridTracking,$trackingGridId,$urlTracking,trackingColumns,trackingColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchTrackingBtn").on('click', function(event) {
			if(gridTracking.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridTracking.clearAjaxParams();
				gridTracking.searchFilter($trackingFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridTracking.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//跟踪表备选事件操作按钮
	grid_tracking_operation:function(data,type,full){
		var ret="";
		//编辑
		if(hasEditTrackingAuth){
			ret += "<a class='btn default btn-sm green-haze' url='projectManage/trackingManagerEdit?operate=edit&id="+data+
			"' addtabs='R004_0401' title='"+commonEditBtn+"' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		//删除
		if(hasRemoveTrackingAuth){
			ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"trackingManagerMain.trackingDelFun('"+data+
			"','"+trackingMain_deleteTrackingMsg+"');\" ><i class='fa fa-trash-o'></i></a>";
		}
		/*//处理
		if(hasDealTrackingAuth){
			//通过
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDealBtn+
			" onclick=\"trackingManagerMain.trackingDealFun('"+data+
			"','"+trackingMain_dealTrackingMsg+"','1');\" ><i class='fa fa-check'></i></a>";
		}*/
		return ret;
	},	
	
	//删除跟踪记录
	trackingDelFun:function(value,msg){
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
	        		url: basePath+'/projectManage/deleteTrackingById',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		$("#searchTrackingBtn").click();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	        }
	    }); 
	},
	
	//跟踪记录处理
	trackingDealFun:function(value,meg,status){
		 initAttasConfirmWal({
			sa_title: meg,
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
	        		url: basePath+'/projectManage/dealTrackingById',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value,status:status}
	        	})
	        	.done(function(data) {
	        		$("#searchProjectBaseInfoBtn").click();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	       }
	   });			
	},
	
};
jQuery(document).ready(function() {
	//初始化下拉框及日期控件
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        clearBtn: true,
        autoclose: true
    });
    //设置开始时间不能大于结束时间
    $("#trackingMainFormId #putBeginDate").on("changeDate",function(e){
    	$("#trackingMainFormId #putEndDate").datepicker("setStartDate",e.date);
    });
    $("#trackingMainFormId #putEndDate").on("changeDate",function(e){
    	$("#trackingMainFormId #putBeginDate").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	trackingManagerMain.trackingManagerInit();
});