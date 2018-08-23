/*
 *  @Description：报销申请维护主页面JS
 *  @author：lanjunjie
 *  @date：2018年08月03日
 */
var reimbursetBaseInfoManager ={
		reimburseBaseInfoInit:function(){
		//差旅报销Table
		var $reimburseBaseInfoGridId = $("#reimburseBaseInfoMianTableId");
		//差率报销Form
		var $reimburseBaseInfoFormId = $("#reimburseBaseInfoMainFormId");
		//差旅报销信息URL
		var $urlReimburseBaseInfo = basePath + '/applyManage/queryReimburseVoInfoByParam';
		//报销申请显示信息
		var reimburseBaseInfoColumns=[
		    {"bVisible": false,"orderable": false,"data": "id"},
		    {"orderable": false,"sWidth": "50","data": "applyNo","sTitle":commonNumber},
			{"orderable": true,"sWidth": "100","data": "reimburseType","sTitle":reimburseBaseInfoMain_applyType,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.applyType);
			}},
			{"orderable": true,"sWidth": "200","data": "departPlace","sTitle":reimburseBaseInfoMain_departPlace},
			{"orderable": true,"sWidth": "200","data": "arrivePlace","sTitle":reimburseBaseInfoMain_arrivePlace},
			{"orderable": true,"sWidth": "200","data": "applyTime","sTitle":reimburseBaseInfoMain_applyTime},
			{"orderable": true,"sWidth": "200","data": "userName","sTitle":reimbursetBaseInfoMain_userName},
			{"orderable": true,"sWidth": "200","data": "amount","sTitle":reimburseBaseInfoMain_amount},
			{"orderable": true,"sWidth": "200","data": "projectName","sTitle":reimburseBaseInfoMain_projectName},
			{"orderable": true,"sWidth": "50","data": "status","sTitle":reimburseBaseInfoMain_status,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.applyStatus);
			}},
			{"orderable": false,"sWidth":'200',"sTitle":commonOperate}  
	     ];
		//操作列   
		var reimburseBaseInfoColumnDefs=[{"targets":[10],"data":"id","render":reimbursetBaseInfoManager.grid_ReimburseBaseInfo_operation}];
		//差旅报销列表初始化
		TableAjax(gridReimburseBaseInfo,$reimburseBaseInfoGridId,$urlReimburseBaseInfo,reimburseBaseInfoColumns,reimburseBaseInfoColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchReimburseBaseInfoBtn").on('click', function(event) {
			if(gridReimburseBaseInfo.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				 gridReimburseBaseInfo.clearAjaxParams();
                gridReimburseBaseInfo.searchFilter($reimburseBaseInfoFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridReimburseBaseInfo.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//差旅报销备选事件操作按钮
	grid_ReimburseBaseInfo_operation:function(data,type,full){
		var ret="";
		if(full.status<4){
			//编辑
			if(hasEditReimburseBaseInfoAuth){
				ret += "<a class='btn default btn-sm green-haze' href='"+basePath+"/applyManage/evectionApplyEdit?operate=edit&id="+data+
				"' data-target='#reimburse-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";			
			}
			//删除
			if(hasRemoveReimburseBaseInfoAuth&&full.status==1){
				ret+="<a class='btn default btn-sm red tooltips' data-original-title='"+commonDelBtn+"' onclick=\"reimbursetBaseInfoManager.deleteReimburseBaseInfo('"+data+
				"','"+reimburseBaseInfoMain_deleteReimburseMsg+"');\" ><i class='fa fa-trash-o'></i></a>";			
			} 
			//提交
			if(hasCommitReimburseBaseInfoAuth&&full.status==1){
				ret+="<a class='btn default btn-sm blue tooltips' data-original-title='"+commonDelBtn+"' onclick=\"reimbursetBaseInfoManager.commitReimburse('"+data+
				"','"+reimburseBaseInfoMain_commitReimburseMsg+"');\" ><i class='fa fa-check'></i></a>";			
			}
			//审核
			if(hasAuditReimburseBaseInfoAuth&&full.status==2){
				ret += "<a class='btn default btn-sm green tooltips' data-original-title="+commonDelBtn+
				" onclick=\"reimbursetBaseInfoManager.auditReimburse('"+data+
				"','"+reimburseBaseInfoMain_auditReimburseMsg+"','1');\" ><i class='fa fa-check'></i></a>";
				//驳回
				if(hasAuditReimburseBaseInfoAuth&&full.status>1){
					ret += "<a class='btn default btn-sm yellow tooltips' data-original-title="+commonDelBtn+
					" onclick=\"reimbursetBaseInfoManager.applyBack('"+data+
					"','"+reimburseBaseInfoMain_applyBackMsg+"','1');\" ><i class='fa fa-remove'></i></a>";
				}
			}
			//批准
			if(hasRatifyReimburseBaseInfoAuth&&full.status==3){
				ret += "<a class='btn default btn-sm green tooltips' data-original-title="+commonDelBtn+
				" onclick=\"reimbursetBaseInfoManager.RatifyReimburse('"+data+
				"','"+reimburseBaseInfoMain_applyRatifyMsg+"','1');\" ><i class='fa fa-check'></i></a>";
				//驳回
				if(hasAuditReimburseBaseInfoAuth&&full.status>1){
					ret += "<a class='btn default btn-sm yellow tooltips' data-original-title="+commonDelBtn+
					" onclick=\"reimbursetBaseInfoManager.applyBack('"+data+
					"','"+reimburseBaseInfoMain_applyBackMsg+"','1');\" ><i class='fa fa-remove'></i></a>";
				}
			}

		}
		return ret;
	},
	//驳回
	applyBack:function(value,msg){
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
		    		url: basePath+'/applyManage/auditReimburse',
		    		type: 'POST',
		    		data: {id:value,status:1}
		    	})
		    	.done(function(data) {
		    		$("#searchReimburseBaseInfoBtn").click();
		    		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		    	})
		    	.fail(function(data) {
		    		showError(data.responseText);
		    	});
	        }
	    }); 
		
	},
	//批准
	RatifyReimburse:function(value,msg){
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
		    		url: basePath+'/applyManage/ratifyReimburse',
		    		type: 'POST',
		    		data: {id:value}
		    	})
		    	.done(function(data) {
		    		$("#searchReimburseBaseInfoBtn").click();
		    		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		    	})
		    	.fail(function(data) {
		    		showError(data.responseText);
		    	});
	        }
	    }); 
		
	},
	//审核
	auditReimburse:function(value,msg){
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
		    		url: basePath+'/applyManage/auditReimburse',
		    		type: 'POST',
		    		data: {id:value}
		    	})
		    	.done(function(data) {
		    		$("#searchReimburseBaseInfoBtn").click();
		    		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		    	})
		    	.fail(function(data) {
		    		showError(data.responseText);
		    	});
	        }
	    }); 
		
	},
	//提交
	commitReimburse:function(value,msg){
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
		    		url: basePath+'/applyManage/commitReimburse',
		    		type: 'POST',
		    		data: {id:value}
		    	})
		    	.done(function(data) {
		    		$("#searchReimburseBaseInfoBtn").click();
		    		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		    	})
		    	.fail(function(data) {
		    		showError(data.responseText);
		    	});
	        }
	    }); 
		
	},
	//删除差旅报销项
	deleteReimburseBaseInfo:function(value,msg){
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
	        		url: basePath+'/applyManage/deleteReimburseInfoById',
	        		type: 'POST',
	        		data: {id:value}
	        	})
	        	.done(function(data) {
	        		$("#searchReimburseBaseInfoBtn").click();
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
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	reimbursetBaseInfoManager.reimburseBaseInfoInit();
});