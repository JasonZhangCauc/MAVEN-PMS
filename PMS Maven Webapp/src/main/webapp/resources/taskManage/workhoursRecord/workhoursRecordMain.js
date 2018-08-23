/*
 *  @Description：主页面Js
 *  @author：	RAOMINGYI
 *  @date：	2018-07-02
 */
var workhoursRecordMain = {
	//初始日期控件和下拉框控件
	 initPickers:function () {
		//初始化下拉框及日期控件
	    $('.date-picker').datepicker({
	    	format: 'yyyy-mm-dd',
		    clearBtn: true,
		    autoclose: true
	    });
		$('.bs-select').selectpicker({
	        iconBase: 'fa',
	        tickIcon: 'fa-check'
	    });
     },	
			
	init:function(){
		/**************** table列表 ***************/
		//合同信息Table
		var $workhoursRecordTableId = $("#workhoursRecordTableId");
		//用户管理Form
		var $workHoursRecordFormId = $("#workHoursRecordFormId");
		//用户信息URL
		var $urlWorkHoursRecord = basePath + '/taskManage/workhoursRecordInfoByParam';
		
		//字段列表 按照百分比计算 累计100%;
		var workhoursRecordMainColumns = [
			{"data":'id',"bVisible": false, align:'center'},    
			{"data":'workerName',"sTitle":workhoursRecordMain_workerName,"sWidth":'10%'},    
			{"data":'projectName',"sTitle":workhoursRecordMain_projectName,"sWidth":'10%'},    
			{"data":'workingType',"sTitle":workhoursRecordMain_workingType,"sWidth":'10%',"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.workHoursType);
			}},    
			{"data":'workingHours',"sTitle":workhoursRecordMain_workingHours,"sWidth":'10%'},
			{"data":'workDate',"sTitle":workhoursRecordMain_workDate,"sWidth":'15%'}, 
			{"data":'workDesc',"sTitle":workhoursRecordMain_workDesc,"sWidth":'15%'},
			{"data":'status',"sTitle":workhoursRecordMain_status,"sWidth":'10%',"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.workHoursStatus);
			}},            
			//{"data":'remark',"sTitle":workhoursRecordMain_remark,"sWidth":'10%'},    			    
			{"orderable": false,"sWidth": "20%","sTitle":commonOperate}
		];
		//用户操作按钮
		var commonColumnDefs=[{"targets":[8],"data":"id","render":workhoursRecordMain.grid_workhoursRecord_operation}];
		TableAjax(gridWorkhoursRecord,
				$workhoursRecordTableId,
				$urlWorkHoursRecord,
				workhoursRecordMainColumns,
				commonColumnDefs,
				true,
				true,
				commonPageLength);
				
		$("#searchWorkHoursBtn").on('click', function(event) {
			workhoursRecordMain.workhourCount();
			if(gridWorkhoursRecord.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridWorkhoursRecord.clearAjaxParams();	
				gridWorkhoursRecord.searchFilter($workHoursRecordFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridWorkhoursRecord.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});		
	},
	//主事件操作按钮
	grid_workhoursRecord_operation:function(data,type,full){
		var ret="";
		if(full.status=='0' && full.workerId == full.loginUserId){
		  if(hasEditRecordAuth){
			 //编辑
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/taskManage/workhoursRecordEdit?operate=edit&id="+data+
				"' data-target='#workhours-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
			//提交工时登记
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+sendBtn+" onclick=\"workhoursRecordMain.RecordCheckAuth('"+data+"','"+sureSendMsg+"','send');\" ><i class='fa fa-plane'></i></a>";
		  }	
		  //删除
		  if(hasDeleteRecordAuth){	    
			  ret += "<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"workhoursRecordMain.DeleteRecordAuth('"+data+"','"+deleteRecordMsg+"');\" ><i class='fa fa-trash-o'></i></a>";	    	
		  }			
			
		 }if(full.status=='1'){
		   if(hasCheckRecordAuth && full.workerId != full.loginUserId){
			//审核工时登记--通过
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+workhoursRecordMain_passBtn+" onclick=\"workhoursRecordMain.RecordCheckAuth('"+data+"','"+workhoursRecordMain_surePassMsg+"','pass');\" ><i class='fa fa-check'></i></a>";
			//审核工时登记--拒绝
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+workhoursRecordMain_backBtn+" onclick=\"workhoursRecordMain.RecordCheckAuth('"+data+"','"+workhoursRecordMain_sureBackMsg+"','back');\" ><i class='fa fa-close'></i></a>";
		   } 			  
		  }
			$(".tooltips").tooltip();
			return ret;
		 },
		//工时对登记审批
		 RecordCheckAuth:function(value,meg,operate){
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
		        		url: basePath+'/taskManage/updateRecordStatus',
		        		type: 'POST',
		        		dataType: 'json',
		        		data: {id:value,operate:operate}
		        	})
		        	.done(function(data) {
		        		$("#searchWorkHoursBtn").click();
		        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		        	})
		        	.fail(function(data) {
		        		showError(data.responseText);
		        	});
		       }
		   });			
		},
		//删除工时记录		 
		DeleteRecordAuth:function(value,msg){
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
		        		url: basePath+'/taskManage/deleteWorkhoursRecord',
		        		type: 'POST',
		        		dataType: 'json',
		        		data: {id:value}
		        	})
		        	.done(function(data) {
		        		$("#searchWorkHoursBtn").click();
		        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		        	})
		        	.fail(function(data) {
		        		showError(data.responseText);
		        	});
		        }
		    }); 
		},
		workhourCount:function(){
			$.ajax({
				url: basePath+'/taskManage/queryWorkhoursTotalByParam',
        		type: 'POST',
        		dataType: 'json',
        		data:$("#workHoursRecordFormId").serialize(),
        		success: function(result){
    				$("#workingHours").val(result);
                 }       		
			});						
		}		
	};
	//加载页面
	jQuery(document).ready(function() {
		if (!jQuery().dataTable) {
	        return;
	    }		
		workhoursRecordMain.initPickers();
		workhoursRecordMain.init();
	});