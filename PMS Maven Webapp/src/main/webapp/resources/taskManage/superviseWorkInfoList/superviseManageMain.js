/*
 *  @Description：项目维护主页面JS
 *  @author：               zhangm
 *  @date：                    2018年07月27日
 */
var superviseInfoManager ={
		superviseInfoInit:function(){
		//项目立项Table
		var $projectBaseInfoGridId = $("#superviseInfoMianTableId"); 
		//项目立项Form
		var $projectBaseInfoFormId = $("#superviseBaseInfoMainFormIdss");
		//项目立项信息URL
		var $urlProjectBaseInfo = basePath + '/taskManage/querySuperviseBaseInfoByParam';
		//项目立项显示信息
		var projectBaseInfoColumns=[
		    {"bVisible": false,"orderable": false,"data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": false,"sWidth": "100","data": "responsibleMain","sTitle":overseeManagerResponsibleMain},//主要负责人
			
			{"orderable": true,"sWidth": "200","data": "relevanceProjectName","sTitle":overseeManagerRelevanceProject,"render":function(data,type,full){
   				return "<a class='btn' data-original-title="+commonEditBtn+" href='"+basePath+"/taskManage/superviseWorkInfoLook?operate=look&id="+full.id+
   				"' data-target='#newCustomModalIdsq' data-toggle='modal'>"+superviseInfoManager.isNull(data)+"</a>";
   			}},
   			
			{"orderable": false,"sWidth": '200',"data": "taskDefinition","sTitle":overseeManagerTaskDefinition},//任务内容
			{"orderable": false,"sWidth": '200',"data": "priorityName","sTitle":overseeManagerPriority},//优先级
			{"orderable": false,"sWidth": '200',"data": "statusCode","sTitle":overseeManagerStatus},//状态
			{"orderable": false,"sWidth": '200',"data": "requiredDateShow","sTitle":overseeManagerRequiredDate},//要求完成时间 
			{"orderable": false,"sWidth": '200',"data": "actualDate","sTitle":overseeManagerActualDate},//实际完成时间
			{"orderable": false,"sWidth":'200',"sTitle":commonOperate}
	     ];
		//操作列
		var projectBaseInfoColumnDefs=[{"targets":[9],"data":"id","render":superviseInfoManager.grid_projectBaseInfo_operation}];
		//项目立项列表初始化
		TableAjax(gridSuperviseInfo,$projectBaseInfoGridId,$urlProjectBaseInfo,projectBaseInfoColumns,projectBaseInfoColumnDefs,true,true,commonPageLength,superviseInfoManager.grid_customer_fnRowCallback);
		
		//查询
		$("#searchProjectBaseInfoBtn").on('click', function(event) {
			if(gridSuperviseInfo.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridSuperviseInfo.clearAjaxParams();
				gridSuperviseInfo.searchFilter($projectBaseInfoFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridSuperviseInfo.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	isNull:function(value){
		var val = "";
		if(value==null){
			val = "";
		}else{
			val = value;
		}
		return val;
	},
	//项目立项备选事件操作按钮
	grid_projectBaseInfo_operation:function(data,type,full){
		var ret="";
		//编辑
		if(hasEditProjectBaseInfoAuth && full.status=="0"){
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+addActivityBtnEdit+" href='"+basePath+"/taskManage/superviseWorkInfoEdit?operate=edit&id="+data+
			"' data-target='#project-modalss' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		} 
		//领导调整
		if(hasCheckclLD){
			ret += "<a class='btn default btn-sm green-haze' data-original-title="+addActivityBtnDD+" href='"+basePath+"/taskManage/superviseWorkInfoAuthEdit?operate=edit&id="+data+
			"' data-target='#project-modalAuths' data-toggle='modal'><i class='fa icon-tag'></i></a>";
		}
		//责任人处理 并且结论为空的时候才能操作 
		if(hasCheckcl && full.status=="1" && full.conclusion ==null){
			ret += "<a class='btn default btn-sm green-haze' data-original-title="+addActivityBtnCL+" href='"+basePath+"/taskManage/superviseWorkInfoAuthAdjust?operate=TZ&id="+data+
			"' data-target='#project-modalAuthss' data-toggle='modal'><i class='fa icon-wrench'></i></a>";
		}
		
		if(full.status=="0"){
			//删除
			if(hasDeleteRecordAuth){	    
				ret += "<a class='btn default btn-sm red tooltips' data-original-title="+addActivityBtnDEL+" data-original-title="+commonDelBtn+" onclick=\"superviseInfoManager.deleteSuperviseInfo('"+data+"','"+deleteRecordMsg+"');\" ><i class='fa fa-trash-o'></i></a>";	    	
			}	
			//审核
			if(hasCheckRecordAuth  && full.responsibleMainId != full.loginUserId){
				//通过
				ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+addActivityBtnAUTH+" data-original-title="+workhoursRecordMain_passBtn+
				" onclick=\"superviseInfoManager.superviseCheckAuth('"+data+
				"','"+projectBaseInfoMain_surePassMsg+"','1');\" ><i class='fa fa-check'></i></a>";
			}
		}
		
		return ret;
	},	
	grid_customer_fnRowCallback: function(row, data, index) {
		 $(row).on("click",function() {
			 if ($(this).hasClass('row_selected')) {
				 $(this).removeClass('row_selected');
				 $(this).removeAttr("style");
				 hideCustomId="";//赋值选中用户ID
				 
			 } else {
				 $("#superviseInfoMianTableId tr.row_selected").removeAttr("style");
				 $("#superviseInfoMianTableId tr.row_selected").removeClass('row_selected');
				 $(this).addClass('row_selected');
				  hideCustomId=data.id;//赋值选中用户ID
			 }
			 if(gridLinker.getRowsCount() > 0){
				event.preventDefault();
				gridLinker.clearAjaxParams(); 
				//传FORM参数
				gridLinker.setAjaxParam("id", hideCustomId);
				gridLinker.getDataTable().ajax.reload();
			 }else{
				App.alert({
                   type: 'danger',
                   icon: 'warning',
                   message: 'Please select an action',
                   container: gridLinker.getTableWrapper(),
                   place: 'prepend'
               });
		     }
		 });
  }, 
	/**************** 调整记录列表 ***************/
	 initlinker:function(){
			
			//联系人Table
			var $linkerGridId = $("#linkerMianTableId");			
			//联系人信息URL
			var $urlLinker = basePath + '/taskManage/queryAdjustRecordVoByParam';
			//联系人列
			//字段列表 按照百分比计算 累计100%;
			var linkerColumns = [
	            {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
	            {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
	   			{"orderable": true,"sWidth": "15%","data": "adjustOldTime","sTitle":"调整前时间"},
	   			{"orderable": true,"sWidth": "15%","data": "adjustLastTime","sTitle":"调整后时间"},
	   			{"orderable": true,"sWidth": "15%","data": "adjustPersonName","sTitle":"调整人"},
	   			{"orderable": true,"sWidth": "15%","data": "adjustWhy","sTitle":"调整原因"},
	   			{"orderable": true,"sWidth": "15%","data": "adjustTime","sTitle":"调整时间"}
	   			
	   			
			];
			//用户操作按钮
			var linkerColumnDefs=[{"targets":[7],"data":"id","render":superviseInfoManager.grid_linker_operation}];
			//用户初始化表格控件
			TableAjax(gridLinker,$linkerGridId,$urlLinker,linkerColumns,linkerColumnDefs,true,true,commonPageLength);
			//查询事件				 

			$("#searchCustomBtn").on('click', function(event) {
				if(gridLinker.getRowsCount() > 0){
					event.preventDefault();
					gridLinker.clearAjaxParams();
					//传FORM参数
					gridLinker.setAjaxParam();
					gridLinker.getDataTable().ajax.reload();		
				}else{
					App.alert({
	                    type: 'danger',
	                    icon: 'warning',
	                    message: 'Please select an action',
	                    container: gridLinker.getTableWrapper(),
	                    place: 'prepend'
	                });
				}
			});
	 },	//用户备选事件操作按钮
	 grid_linker_operation:function(data,type,full){
			var ret="";
			return ret;
		 },
	
	//删除项目
	deleteSuperviseInfo:function(value,msg){
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
	        		url: basePath+'/taskManage/deleteSuperviseInfo',
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
	superviseCheckAuth:function(value,meg,auditStatus){
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
	        		url: basePath+'/taskManage/updateSuperviseInfoStatus',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value,status:auditStatus}
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
    $("#superviseBaseInfoMainFormIdss #beginTime").on("changeDate",function(e){
    	$("#superviseBaseInfoMainFormIdss #endTime").datepicker("setStartDate",e.date);
    });
    $("#superviseBaseInfoMainFormIdss #endTime").on("changeDate",function(e){
    	$("#superviseBaseInfoMainFormIdss #beginTime").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	superviseInfoManager.superviseInfoInit();
	superviseInfoManager.initlinker();
});