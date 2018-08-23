/*
 *  @Description：工时统计主页面Js
 *  @author：	jczou
 *  @date：	2018-03-15
 */

var WorkhoursManagementMain = {
     //工时统计列表
	 WorkhoursInit:function(){
	    //工时统计Table
		var $WorkhoursManagementMianGridId = $("#WorkhoursManagementMianTableId");
		//工时统计Form
		var $workhoursManagementMianFormId = $("#workhoursManagementMianFormId");
		//工时统计信息URL
		var $urlWorkhoursManagementMian = basePath + '/projectManage/workHoursInfoByParam';
		//工时统计列
		var WorkhoursManagementMainColumns=[
				{"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
				{"bVisible": true,"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
				{"orderable": true,"sWidth": "50","data": "projectNo","sTitle":workHoursManager_projectId},
				{"orderable": true,"sWidth": "50","data": "projectName","sTitle":workHoursManager_projectName},
				{"orderable": true,"sWidth": "50","data": "workingType","sTitle":workHoursManager_workingType,"render":function(data,type,full){
					return initCodeText(data,codeBasicInfo.workHoursType);
				}},
				{"orderable": true,"sWidth": "50","data": "workingHours","sTitle":workHoursManager_workingHours},
				{"orderable": true,"sWidth": "50","data": "involvingResource","sTitle":workHoursManager_involvingResource},
				{"orderable": true,"sWidth": "50","data": "beginDate","sTitle":workHoursManager_beginDate},
				{"orderable": true,"sWidth": "50","data": "endDate","sTitle":workHoursManager_endDate},
				{"orderable": true,"sWidth": "50","data": "createByName","sTitle":workHoursManager_createByName},
				{"orderable": true,"sWidth": "50","data": "createDate","sTitle":workHoursManager_createDate},
				{"orderable": false,"sWidth": "200","sTitle":commonOperate}
				];
		//工时统计操作按钮
		var WorkhoursManagementMainColumnDefs=[{"targets":[11],"data":"id","render":WorkhoursManagementMain.grid_Workhours_operation}];
		//工时统计初始化表格控件
		TableAjax(gridWorkhours,$WorkhoursManagementMianGridId,$urlWorkhoursManagementMian,WorkhoursManagementMainColumns,WorkhoursManagementMainColumnDefs,true,true,commonPageLength,null);
		//工时统计查询事件
		$("#WorkhoursManagementSearchBtn").on('click', function(event) {
			if(gridWorkhours.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridWorkhours.clearAjaxParams();
				gridWorkhours.searchFilter($workhoursManagementMianFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridWorkhours.getTableWrapper(),
                    place: 'prepend'
                });
			} 
		});
		
		//工时统计信息导出
		$("#workHoursExport").on("click",function(){
			$("#workhoursManagementMianFormId")[0].submit();
		});
	 },
	 //工时统计备选事件操作按钮
	 grid_Workhours_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthWorkhours){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/projectManage/workHoursEdit?operate=edit&id="+data+
			"' data-target='#todo-task-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		if(hasDeleteWorkhoursAuth){
		    ret += "<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"WorkhoursManagementMain.DeleteWorkhoursAuth('"+data+"','"+deleteWorkhoursConfirmMsg+"','"+full.projectId+"');\" >" +
		    		"<i class='fa fa-trash-o'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R00404&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		
		$(".tooltips").tooltip();
		return ret;
	 },
	 
	//删除工时统计
	 DeleteWorkhoursAuth:function(value,mag,userFlag){
		 initAttasConfirmWal({
			sa_title: mag,
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
	        		url: basePath+'/projectManage/deleteWorkHours',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		$("#WorkhoursManagementSearchBtn").click();	   
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	        }
	   });
	},
};

//加载页面
jQuery(document).ready(function() {
 	if (!jQuery().dataTable) {
         return;
     }
 	 //初始化下拉框及日期控件
     $('.date-picker').datepicker({
         rtl: App.isRTL(),
         clearBtn: true,
         autoclose: true
     });
     $('.bs-select').selectpicker({
         iconBase: 'fa',
         tickIcon: 'fa-check'
     });
    //设置开始时间不能大于结束时间
     $("#workhoursManagementMianFormId #startTime").on("changeDate",function(e){
     	$("#workhoursManagementMianFormId #endTime").datepicker("setStartDate",e.date);
     });
     $("#workhoursManagementMianFormId #endTime").on("changeDate",function(e){
     	$("#workhoursManagementMianFormId #startTime").datepicker("setEndDate",e.date);
     });
 	WorkhoursManagementMain.WorkhoursInit();
});