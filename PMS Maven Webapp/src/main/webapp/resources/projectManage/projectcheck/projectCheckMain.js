/*
 *  @Description：项目审批主页面JS
 *  @author：               raomingyi
 *  @date：                    2018年3月26日
 */
var projectCheck ={
	projectInit:function(){
		//项目立项Table
		var $projectGridId = $("#projectCheckTableId");
		//项目立项Form
		var $projectCheckMianFormId  = $("#projectCheckMianFormId");
		//项目立项信息URL
		var $urlProject = basePath + '/projectManager/queryProjectCheckInfoByParam';
		//项目立项显示信息
		var projectCheckColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "40","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "50","data": "projectNo","sTitle":projectManagerMain_projectNo},
			{"orderable": true,"sWidth": "50","data": "projectName","sTitle":projectManagerMain_projectName},
			{"orderable": true,"sWidth": "50","data": "belongCustomerName","sTitle":projectManagerMain_belongCustomer},
			{"orderable": true,"sWidth": "50","data": "belongProduct","sTitle":projectManagerMain_belongProduct,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.PRODUCT);}},
			{"orderable": true,"sWidth": "50","data": "projectDate","sTitle":projectManagerMain_projectDate},
			{"orderable": true,"sWidth": "50","data": "implementHeadName","sTitle":projectManagerMain_implementHead},
			{"orderable": true,"sWidth": "50","data": "exploitHeadName","sTitle":projectManagerMain_exploitHead},
			{"orderable": true,"sWidth": "50","data": "planWorkHours","sTitle":projectManagerMain_planWorkHours},
			{"orderable": true,"sWidth": "50","data": "projectStage","sTitle":projectManagerMain_projectStage,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.	projectStage);}},
			{"orderable": true,"sWidth": "50","data": "projectStatus","sTitle":projectManagerMain_projectStatus,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.projectStatus);}},
			{"orderable": true,"sWidth": "50","sTitle":projectManagerMain_attachment,"render":function(data,type,full){
				return initAttachmentDownload({_dataId:full.id,_pageType:"R004-0201"});
			}},
			{"orderable": false,"sWidth": "110","sTitle":commonOperate}
	     ];
		//操作列
		var projectColumnDefs=[{"targets":[13],"data":"id","render":projectCheck.grid_project_operation}];
		//项目立项列表初始化
		TableAjax(gridProjectCheck,$("#projectCheckTableId"),$urlProject,projectCheckColumns,projectColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchCheckProjectBtn").on('click', function(event) {
			if(gridProjectCheck.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridProjectCheck.clearAjaxParams();
				gridProjectCheck.searchFilter($projectCheckMianFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridProjectCheck.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//项目立项备选事件操作按钮
	grid_project_operation:function(data,type,full){
		var ret="";
		//查看合同信息
		ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+lookoverBtn+" href='"+basePath+"/projectManager/projectCheckDetail?operate=view&id="+data+
		"' data-target='#newProjectCheckModalId' data-toggle='modal'><i class='fa fa-eye'></i></a>";
		if(full.projectStatus=='1' && hasApprovelAuth==true){
			//审批通过
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+passBtn+" onclick=\"projectCheck.projectAuth('"+data+"','"+projectManagerMain_surePassMsg+"'," +
			"'pass');\" ><i class='fa fa-forward'></i></a>";
			//审批不通过
			ret += "<a class='btn default btn-sm red tooltips' data-original-title="+backBtn+" onclick=\"projectCheck.projectAuth('"+data+"','"+projectManagerMain_sureBackMsg+"'," +
			"'back');\" ><i class='fa fa-backward'></i></a>";		 
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R0040101&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		$(".tooltips").tooltip();
		return ret;
	},
		
	//项目审批通过
	projectAuth:function(value,meg,operate){
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
	        		url: basePath+'/projectManager/updateProjectStatus',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value,operate:operate}
	        	})
	        	.done(function(data) {
	        		$("#searchCheckProjectBtn").click();
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
        clearBtn: true,
        autoclose: true
    });
    //设置开始时间不能大于结束时间
    $("#projectCheckMianFormId #projectBeginDate").on("changeDate",function(e){
    	$("#projectCheckMianFormId #projectEndDate").datepicker("setStartDate",e.date);
    });
    $("#projectCheckMianFormId #projectEndDate").on("changeDate",function(e){
    	$("#projectCheckMianFormId #projectBeginDate").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	projectCheck.projectInit();
});