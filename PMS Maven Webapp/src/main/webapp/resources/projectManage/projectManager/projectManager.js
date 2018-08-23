/*
 *  @Description：项目管理主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var projectManager ={
	projectInit:function(){
		//项目立项Table
		var $projectGridId = $("#projectMianTableId");
		//项目立项Form
		var $projectFormId = $("#projectMianFormId");
		//项目立项信息URL
		var $urlProject = basePath + '/projectManager/queryProjectInfoByParam';
		//项目立项显示信息
		var projectColumns=[
		    {"bVisible": false,"orderable": false,"data": "id"},
		    {"orderable": false,"sWidth": "5%","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "10%","data": "projectNo","sTitle":projectManagerMain_projectNo},
			{"orderable": true,"sWidth": "5%","data": "projectName","sTitle":projectManagerMain_projectName},
			{"orderable": true,"sWidth": "5%","data": "belongCustomerName","sTitle":projectManagerMain_belongCustomer},
			{"orderable": true,"sWidth": "5%","data": "belongProduct","sTitle":projectManagerMain_belongProduct,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.PRODUCT);
			}},
			{"orderable": true,"sWidth": "5%","data": "projectDate","sTitle":projectManagerMain_projectDate},
			{"orderable": true,"sWidth": "5%","data": "implementHeadName","sTitle":projectManagerMain_implementHead},
			{"orderable": true,"sWidth": "5%","data": "exploitHeadName","sTitle":projectManagerMain_exploitHead},
			{"orderable": true,"sWidth": "5%","data": "planWorkHours","sTitle":projectManagerMain_planWorkHours},
			{"orderable": true,"sWidth": "5%","data": "projectStage","sTitle":projectManagerMain_projectStage,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.	projectStage);
			}},
			{"orderable": true,"sWidth": '5%',"data": "projectStatus","sTitle":projectManagerMain_projectStatus,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.projectStatus);
			}},
			{"orderable": false,"sWidth": '20%',"sTitle":projectManagerMain_attachment,"render":function(data,type,full){
				return initAttachmentDownload({_dataId:full.id,_pageType:"R004-0201"});
			}},
			{"orderable": false,"sWidth":'20%',"sTitle":commonOperate}
	     ];
		//操作列
		var projectColumnDefs=[{"targets":[13],"data":"id","render":projectManager.grid_project_operation}];
		//项目立项列表初始化
		TableAjax(gridProject,$("#projectMianTableId"),$urlProject,projectColumns,projectColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchProjectBtn").on('click', function(event) {
			if(gridProject.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridProject.clearAjaxParams();
				gridProject.searchFilter($projectFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridProject.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//项目立项备选事件操作按钮
	grid_project_operation:function(data,type,full){
		var ret="";
	 if(full.projectFlag=='0'){
		//编辑
		if(hasEditAuthProject){
			ret += "<a class='btn default btn-sm green-haze' addtabs='R00401_01' title='"+
			projectManagerMian_projectEdit+"' url='/projectManager/projectManagerEdit?operate=edit&id="+data+
			"'><i class='fa fa-edit'></i></a>";
		}
		//删除
		if(hasRemoveProjectAuth){
			if(full.projectStatus=="0"){
				ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"projectManager.deleteProject('"+data+
				"','"+projectManagerMain_deleteProjectMsg+"');\" ><i class='fa fa-trash-o'></i></a>";
			}
		}
		//提交
		if(hasSendProjectAuth){
			if(full.projectStatus=="0"){
				//提交项目立项
				ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonSubmitBtn+" onclick=\"projectManager.submitProject('"+data+"','"+projectManagerMian_submitProjectMsg+
					"');\" ><i class='fa fa-plane'></i></a>";
			}
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R0040101&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
	  }	 
	 $(".tooltips").tooltip();
	 return ret;
	},	
	
	//提交项目审批
	submitProject:function(value,msg){
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
	        		url: basePath+'/projectManager/submitProject',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		$("#searchProjectBtn").click();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	       }
	   });			
	},
	
	//删除项目
	deleteProject:function(value,msg){
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
	        		url: basePath+'/projectManager/deleteProject',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		$("#searchProjectBtn").click();
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
    $("#projectMianFormId #projectBeginDate").on("changeDate",function(e){
    	$("#projectMianFormId #projectEndDate").datepicker("setStartDate",e.date);
    });
    $("#projectMianFormId #projectEndDate").on("changeDate",function(e){
    	$("#projectMianFormId #projectBeginDate").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	projectManager.projectInit();
});