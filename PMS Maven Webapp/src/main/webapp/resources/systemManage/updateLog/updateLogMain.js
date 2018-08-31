/*
 *  @Description：更新日志主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年7月23日
 */
var updateLogMain ={
	updateLogInit:function(){
		//更新日志Table
		var $updateLogGridId = $("#updateLogMianTableId");
		//更新日志Form
		var $updateLogFormId = $("#updateLogMianFormId");
		//更新日志信息URL
		var $urlUpdateLog = basePath + '/systemManage/queryUpdateLogByParam';
		//更新日志显示信息
		var updateLogColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "50","data": "updateDate","sTitle":updateLogMain_updateDate},
			{"orderable": true,"sWidth": "50","data": "versionNum","sTitle":updateLogMain_versionNum},
			{"orderable": true,"sWidth": "200","data": "updateContent","sTitle":updateLogMain_updateContent},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		//操作列
		var updateLogColumnDefs=[{"targets":[5],"data":"id","render":updateLogMain.grid_updateLog_operation}];
		//更新日志列表初始化
		TableAjax(gridUpdateLog,$("#updateLogMianTableId"),$urlUpdateLog,updateLogColumns,updateLogColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchUpdateLogBtn").on('click', function(event) {
			if(gridUpdateLog.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridUpdateLog.clearAjaxParams();
				gridUpdateLog.searchFilter($updateLogFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridUpdateLog.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//用户备选事件操作按钮
	grid_updateLog_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthUpdateLog){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/systemManage/updateLogEdit?operate=edit&id="+data+
			"' data-target='#updateLog-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		if(hasRemoveAuthUpdateLog){
			ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"updateLogMain.deleteUpdateLog('"+data+
			"','"+updateLogMain_removeMsg+"');\" ><i class='fa fa-trash-o'></i></a>";
		}
		$(".tooltips").tooltip();
		return ret;
	},
	
	//删除更新日志
	deleteUpdateLog:function(value,msg){
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
	        		url: basePath+'/systemManage/deleteUpdateLog',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		$("#searchUpdateLogBtn").click();
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
    	format: 'yyyy-mm-dd',
	    clearBtn: true,
	    autoclose: true
    });
	updateLogMain.updateLogInit();
});