/*
 *  @Description：任务分派主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var taskAssignManager ={
	taskAssignInit:function(){
		//任务分派Table
		var $taskAssignGridId = $("#taskAssignMianTableId");
		//任务分派Form
		var $taskAssignFormId = $("#taskAssignMianFormId");
		//任务信息URL
		var $urlTaskAssign = basePath + '/taskManager/queryTaskInfoByParam';
		//任务显示信息
		var taskAssignColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"bVisible": false,"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
		    {"orderable": true,"sWidth": "50","data": "originatorName","sTitle":taskAssign_originator},
			{"orderable": true,"sWidth": "50","data": "recipientName","sTitle":taskAssign_recipient},
			{"orderable": true,"sWidth": "50","data": "reqFinitionDate","sTitle":taskAssign_reqFinitionDate},
			{"orderable": true,"sWidth": "300","data": "emergency","sTitle":taskAssign_emergency,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.emergency);
			}},
			{"orderable": true,"sWidth": "300","data": "taskDesc","sTitle":taskAssign_taskDesc},
			{"orderable": true,"sWidth": "300","data": "feedback","sTitle":taskAssign_feedback},
			{"orderable": true,"sWidth": "300","data": "isClose","sTitle":taskAssign_isClose,"render":taskAssignManager.render_yesNo_fun},
			{"orderable": true,"sWidth": "300","data": "closeDate","sTitle":taskAssign_closeDate},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		//操作列
		var taskAssignColumnDefs=[{"targets":[10],"data":"id","render":taskAssignManager.grid_taskAssign_operation}];
		//任务列表初始化
		TableAjax(gridTaskAssign,$taskAssignGridId,$urlTaskAssign,taskAssignColumns,taskAssignColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchTaskAssignBtn").on('click', function(event) {
			if(gridTaskAssign.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridTaskAssign.clearAjaxParams();
				gridTaskAssign.searchFilter($taskAssignFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridUser.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//任务备选事件操作按钮
	grid_taskAssign_operation:function(data,type,full){
		var ret="";
		//编辑
		if(hasEditAuthTaskAssign){
			if(full.isClose=='1'){
				ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/taskManager/taskEdit?operate=edit&id="+data+
				"' data-target='#todo-task-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
			}
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonViewBtn+" href='"+basePath+"/taskManager/taskEdit?operate=view&id="+data+
			"' data-target='#todo-task-modal' data-toggle='modal'><i class='fa fa-eye'></i></a>";
		}
		//发送 退回
		if(hasSendAuthTaskAssign){
			//已关闭不能退回发送
			if(full.isClose=='1'){
				if(full.sendStatus=='0'){
					ret += "<a class='btn default btn-sm red tooltips' data-original-title="+taskAssign_send+" onclick=\"taskAssignManager.sendTask('"+data+
					"','"+taskAssign_sendTaskMsg+"','"+full.sendStatus+"');\" ><i class='fa fa-arrow-circle-right'></i></a>";
				}else if(full.sendStatus=='1'){
					ret += "<a class='btn default btn-sm red tooltips' data-original-title="+taskAssign_sendBack+" onclick=\"taskAssignManager.sendTask('"+data+
					"','"+taskAssign_sendTaskMsg+"','"+full.sendStatus+"');\" ><i class='fa fa-arrow-circle-left'></i></a>";
				}
			}
		}
		//删除
		if(hasRemoveAuthTaskAssign){
			ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"taskAssignManager.deleteTask('"+data+
			"','"+taskAssign_deleteTaskMsg+"');\" ><i class='fa fa-trash-o'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R00501&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		
		$(".tooltips").tooltip();
		return ret;
	},
	
	/**
	 * 删除任务
	 * @param value 任务id
	 * @param msg   删除提示
	 */
	deleteTask:function(value,msg){
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
	        		url: basePath+'/taskManager/deleteTask',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		gridTaskAssign.getDataTable().ajax.reload();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	        }
	    }); 
	},
	
	/**
	 * 发送/退回任务
	 * @param value 任务id
	 * @param msg   发送提示
	 * @param status 发送状态
	 */
	sendTask:function(value,msg,status){
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
	        		url: basePath+'/taskManager/updateSendStatus',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {
	        			id:value,
	        			sendStatus:status
	        		}
	        	})
	        	.done(function(data) {
	        		gridTaskAssign.getDataTable().ajax.reload();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	        }
	    }); 
	},
	
	//状态转换
	render_yesNo_fun:function(data,type,full){
		var ret="";
		if(data=='0'){
			ret+=commonYes;
		}else if(data=='1'){
			ret+=commonNo;
		}
		return ret;
	}
};
jQuery(document).ready(function() {
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	$('.date-picker').datepicker({
        rtl: App.isRTL(),
        clearBtn: true,
        autoclose: true
    });
	//设置开始时间不能大于结束时间
    $("#reqFinitionBeginDate").on("changeDate",function(e){
    	$("#reqFinitionEndDate").datepicker("setStartDate",e.date);
    });
    $("#reqFinitionEndDate").on("changeDate",function(e){
    	$("#reqFinitionBeginDate").datepicker("setEndDate",e.date);
    });
	if (!jQuery().dataTable) {
        return;
    }
	taskAssignManager.taskAssignInit();
});