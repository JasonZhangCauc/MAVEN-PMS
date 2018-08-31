/*
 *  @Description：项目维护主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年07月02日
 */
var projectBaseInfoManager ={
	projectBaseInfoInit:function(){
		//项目立项Table
		var $projectBaseInfoGridId = $("#projectBaseInfoMianTableId");
		//项目立项Form
		var $projectBaseInfoFormId = $("#projectBaseInfoMainFormId");
		//项目立项信息URL
		var $urlProjectBaseInfo = basePath + '/projectManage/queryProjectBaseInfoByParam';
		//项目立项显示信息
		var projectBaseInfoColumns=[
		    {"bVisible": false,"orderable": false,"data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "100","data": "projectName","sTitle":projectBaseInfoMain_projectName,"render":function(data,type,full){
				if(full.projectStatus==0){
					return data;
				}else{
					return '<span style="text-decoration:underline;color:red;cursor:pointer">'+data+'</span>';
				}
			}},
			{"orderable": true,"sWidth": "200","data": "toDivision","sTitle":projectBaseInfoMain_toDivision,"render":function(data,type,full){
				return getDeptByIds(data);
			}},
			{"orderable": true,"sWidth": "200","data": "workTime","sTitle":projectBaseInfoMain_workTime},
			{"orderable": true,"sWidth": "200","data": "projectResourceName","sTitle":projectBaseInfoMain_projectResource},
			{"orderable": true,"sWidth": "200","data": "projectHeadName","sTitle":projectBaseInfoMain_projectHead},
			{"orderable": true,"sWidth": "200","data": "businessPeopleName","sTitle":projectBaseInfoMain_businessPeople},
			{"orderable": true,"sWidth": "200","data": "projectManagerName","sTitle":projectBaseInfoMain_projectManager},
			{"orderable": true,"sWidth": "200","data": "productManagerName","sTitle":projectBaseInfoMain_productManager},
			{"orderable": true,"sWidth": "50","data": "estimatedWorkload","sTitle":projectBaseInfoMain_estimatedWorkload},
			{"orderable": true,"sWidth": "50","data": "expiredHours","sTitle":projectBaseInfoMain_expiredHours},
			{"orderable": true,"sWidth": '50',"data": "profitTargets","sTitle":projectBaseInfoMain_profitTargets},
			{"orderable": false,"sWidth": '200',"data": "projectPhase","sTitle":projectBaseInfoMain_projectPhase,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.projectPhase);
			}},
			{"orderable": false,"sWidth": '200',"data": "projectStatus","sTitle":projectBaseInfoMain_projectStatus,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.projectState);
			}},
			{"orderable": false,"sWidth": '200',"data": "auditStatus","sTitle":projectBaseInfoMain_auditStatus,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.auditStatus);
			}},
			{"orderable": false,"sWidth": '200',"data": "naturallyCost","sTitle":projectBaseInfoMain_naturallyCost},
			{"orderable": false,"sWidth": '200',"data": "expirationDate","sTitle":projectBaseInfoMain_expirationDate,"render":function(data,type,full){
				if(full.projectStatus==0){
					return data;
				}else{
					return '<span style="text-decoration:underline;color:red;cursor:pointer">'+data+'</span>';
				}
			}},
			{"orderable": false,"sWidth":'200',"sTitle":commonOperate}
	     ];
		//操作列
		var projectBaseInfoColumnDefs=[{"targets":[18],"data":"id","render":projectBaseInfoManager.grid_projectBaseInfo_operation}];
		//项目立项列表初始化
		TableAjax(gridProjectBaseInfo,$projectBaseInfoGridId,$urlProjectBaseInfo,projectBaseInfoColumns,projectBaseInfoColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchProjectBaseInfoBtn").on('click', function(event) {
			if(gridProjectBaseInfo.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridProjectBaseInfo.clearAjaxParams();
				gridProjectBaseInfo.searchFilter($projectBaseInfoFormId);
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
			ret += "<a class='btn default btn-sm green-haze' href='"+basePath+"/projectManage/projectBaseInfoEdit?operate=edit&id="+data+
			"' data-target='#project-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		if(full.auditStatus=="0"){
			//删除
			if(hasRemoveProjectBaseInfoAuth){
				ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"projectBaseInfoManager.deleteProjectBaseInfo('"+data+
				"','"+projectBaseInfoMain_deleteProjectMsg+"');\" ><i class='fa fa-trash-o'></i></a>";
			}
			//审核
			if(hasAuditProjectBaseInfoAuth){
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
	        		url: basePath+'/projectManage/deleteProjectBaseInfo',
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
	        		url: basePath+'/projectManage/updateProjectBaseInfoStatus',
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
    $("#projectBaseInfoMainFormId #beginTime").on("changeDate",function(e){
    	$("#projectBaseInfoMainFormId #endTime").datepicker("setStartDate",e.date);
    });
    $("#projectBaseInfoMainFormId #endTime").on("changeDate",function(e){
    	$("#projectBaseInfoMainFormId #beginTime").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	projectBaseInfoManager.projectBaseInfoInit();
});