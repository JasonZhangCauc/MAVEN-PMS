/*
 *  @Description：打卡记录主页面JS
 *  @author：              ZHANGJIAMING
 *  @date：                    2018年08月02日
 */
var chickinBaseInfoManager ={
	chickinBaseInfoInit:function(){
		//打卡记录Table
		var $chickinBaseInfoGridId = $("#chickinBaseInfoMianTableId");
		//打卡记录Form
		var $chickinBaseInfoFormId = $("#chickinBaseInfoMainFormId");
		//打卡记录信息URL
		var $urlchickinBaseInfo = basePath + '/checkinginManage/querychickinBaseInfoByParam';
		
		//打卡记录显示信息
		var chickinBaseInfoColumns=[
		    {"bVisible": false,"orderable": false,"data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "200","data": "chickinStateStr","sTitle":chickinBaseInfoMain_state},
			{"orderable": true,"sWidth": "200","data": "userName","sTitle":chickinBaseInfoMain_name},
			{"orderable": true,"sWidth": "200","data": "chickinTime","sTitle":chickinBaseInfoMain_time},
			{"orderable": true,"sWidth": "200","data": "chickinTypeStr","sTitle":chickinBaseInfoMain_type},
			{"orderable": true,"sWidth": "200","data": "chickinReason","sTitle":chickinBaseInfoMain_reason}
	     ];
		//操作列
		var chickinBaseInfoColumnDefs=[{"targets":[6],"data":"id","render":chickinBaseInfoManager.grid_chickinBaseInfo_operation}];
		//打卡记录列表初始化
		TableAjax(gridchickinBaseInfo,$chickinBaseInfoGridId,$urlchickinBaseInfo,chickinBaseInfoColumns,chickinBaseInfoColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchChickinBaseInfoBtn").on('click', function(event) {
			if(gridchickinBaseInfo.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridchickinBaseInfo.clearAjaxParams();
				gridchickinBaseInfo.searchFilter($chickinBaseInfoFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridchickinBaseInfo.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//打卡记录备选事件操作按钮
	grid_chickinBaseInfo_operation:function(data,type,full){ 
		var ret="";
		//编辑 
		if(full.chickinState==1){
			if(hasEditChickinBaseInfoAuth){//拥有编辑操作权限
				ret += "<a class='btn default btn-sm green-haze' href='"+basePath+"/checkinginManage/chickinBaseInfoEdit?operate=edit&id="+full.id+
				"' data-target='#project-modal' data-toggle='modal'><i class='fa fa-edit'></i></a>";
			}
		}
		
		
		if(full.chickinState==1){//full.auditStatus=="0"
			//删除
			if(hasRemoveChickinBaseInfoAuth){//hasRemoveChickinBaseInfoAuth
				ret+="<a  class='btn default btn-sm red tooltips' data-original-title="
					+commonDelBtn+" onclick=\"chickinBaseInfoManager.deletechickinBaseInfo('"+full.id+
				"','"+chickinBaseInfoMain_deleteProjectMsg+"');\" ><i class='fa fa-trash-o'></i></a>";
			}
			//审核
			if(hasAuditChickinBaseInfoAuth){//hasAuditChickinBaseInfoAuth
				//通过
				ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+chickinBaseInfoMain_passBtn+
				" onclick=\"chickinBaseInfoManager.chickinCheckAuth('"+full.id+
				"','"+chickinBaseInfoMain_surePassMsg+"','2');\" ><i class='fa fa-check'></i></a>";
			}
		}
		return ret;
	},	
	
	//工时对登记审批
	chickinCheckAuth:function(value,meg,auditStatus){
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
	        		url: basePath+'/checkinginManage/updatechickinStatus',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value,auditStatus:auditStatus}
	        	})
	        	.done(function(data) {
	        		gridchickinBaseInfo.getDataTable().ajax.reload();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	       }
	   });			
	},
	
	//删除项目
	deletechickinBaseInfo:function(value,msg,userFlag){
		
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
		        		url: basePath+'/checkinginManage/deleteChickin',
		        		type: 'POST',
		        		dataType: 'json',
		        		data: {id:value}
		        	})
		        	.done(function() {
		        		//$("#searchChickinBaseInfoBtn").click();
		        		gridchickinBaseInfo.getDataTable().ajax.reload();
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
	        		url: basePath+'/checkinginManage/updatechickinStatus',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value,auditStatus:auditStatus}
	        	})
	        	.done(function(data) {
	        		$("#searchchickinBaseInfoBtn").click();
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
    $("#chickinBaseInfoMainFormId #beginTime").on("changeDate",function(e){
    	$("#chickinBaseInfoMainFormId #endTime").datepicker("setStartDate",e.date);
    });
    $("#chickinBaseInfoMainFormId #endTime").on("changeDate",function(e){
    	$("#chickinBaseInfoMainFormId #beginTime").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	chickinBaseInfoManager.chickinBaseInfoInit();
});