/*
 *  @Description：项目维护主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年07月02日
 */
var projectBaseInfoManager ={
	projectBaseInfoInit:function(){
		//项目立项Table
		var $projectApprovalGridId = $("#projectApprovalMianTableId");
		//项目立项Form
		var $projectApprovalFormId = $("#projectApprovalMainFormId");
		//项目立项信息URL
		var $urlProjectBaseInfo = basePath + '/projectManage/queryProjectApprovalByParam';
		//项目立项显示信息
		var projectBaseInfoColumns=[
		    {"bVisible": false,"orderable": false,"data": "id"},
		    {"orderable": false,"sWidth": '60',"data": "projectPhase","sTitle":projectBaseInfoMain_projectPhase,"render":function(data,type,full){
				var rel = "";
				if(data==0){
					rel = "<span class='label label-primary'> "+initCodeText(data,codeBasicInfo.projectPhase)+"</span>";
				}else{
					rel = "<span class='label label-default'> "+initCodeText(data,codeBasicInfo.projectPhase)+"</span>";
				}
		    	return rel;
			}},
			{"orderable": false,"sWidth": "200","data": "projectName","sTitle":projectBaseInfoMain_projectName,"render":function(data,type,full){
				var html = "<a  url='projectManage/projectApprovalDetail?operate=edit&id="+full.id+ 
				"' addtabs='R004_01_OPERATION_AUTH' title='"+projectManagerMian_projectEdit+"'>"+data+"</a><br/><small>"+full.workTime+"</small>";
				return html;
				
			}},
			{"orderable": false,"sWidth": "180","data": "projectResourceName","sTitle":projectBaseInfoMain_projectResource},
			{"orderable": false,"sWidth": "100","data": "projectManagerName","sTitle":projectBaseInfoMain_projectManager},
			
			{"orderable": false,"sWidth":'200',"sTitle":commonOperate}
	     ];
		//操作列
		var projectBaseInfoColumnDefs=[{"targets":[5],"data":"id","render":projectBaseInfoManager.grid_projectBaseInfo_operation}];
		//项目立项列表初始化
		TableAjax(gridProjectBaseInfo,$projectApprovalGridId,$urlProjectBaseInfo,projectBaseInfoColumns,projectBaseInfoColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchProjectBaseInfoBtn").on('click', function(event) {
			if(gridProjectBaseInfo.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridProjectBaseInfo.clearAjaxParams();
				gridProjectBaseInfo.searchFilter($projectApprovalFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridProjectBaseInfo.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//项目立项备选事件操作按钮
	grid_projectBaseInfo_operation:function(data,type,full){
		var ret="";
		//编辑
		if(hasEditProjectBaseInfoAuth){
			ret += "<a class='btn default btn-sm green-haze' href='"+basePath+"/projectManage/projectApprovalEdit?operate=edit&id="+data+
			"' data-target='#project-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		if(full.auditStatus=="0"){
			//删除
			if(hasRemoveProjectBaseInfoAuth){
				ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"projectBaseInfoManager.deleteProjectBaseInfo('"+data+
				"','"+projectBaseInfoMain_deleteProjectMsg+"');\" ><i class='fa fa-trash-o'></i></a>";
			}
			//审核
			if(hasAuditProjectBaseInfoAuth && full.projectHead != full.loginUserId){
				//通过
				ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+projectBaseInfoMain_passBtn+
				" onclick=\"projectBaseInfoManager.projectCheckAuth('"+data+
				"','"+projectBaseInfoMain_surePassMsg+"','1');\" ><i class='fa fa-check'></i></a>";
			}
		}
		return ret;
	},	
	
	//删除项目
	deleteProjectBaseInfo:function(value,msg){
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
	        		url: basePath+'/projectManage/deleteProjectApproval',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
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
	
	//工时对登记审批
	projectCheckAuth:function(value,meg,auditStatus){
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
	        		url: basePath+'/projectManage/updateProjectApprovalStatus',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value,auditStatus:auditStatus}
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
    $("#projectApprovalMainFormId #beginTime").on("changeDate",function(e){
    	$("#projectApprovalMainFormId #endTime").datepicker("setStartDate",e.date);
    });
    $("#projectApprovalMainFormId #endTime").on("changeDate",function(e){
    	$("#projectApprovalMainFormId #beginTime").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	
	$('[data-toggle="popover"]').popover();
	
	projectBaseInfoManager.projectBaseInfoInit();
});