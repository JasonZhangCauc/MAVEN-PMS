/*
 *  @Description：绩效合约主页面JS
 *  @author：               zlshi
 *  @date：                    2018年8月9日
 */
var performanceContractManager ={
		performanceContractInit:function(){
			//绩效合约Table
			var $performanceContractGridId = $("#performanceContractMainTableId");
			//绩效合约Form
			var $performanceContractFormId = $("#performanceContractMainFormId");
			//绩效信息URL
			var $urlPerformanceContract = basePath + '/performanceManage/getAllPreformanceContract';
			//绩效显示信息
			var performanceContractColumns=[
			                        {"bVisible": false,"orderable": false,"data": "id"},
			                        {"orderable": false,"sWidth": "5%","data": "row_id","sTitle":commonNumber},
			                        {"orderable": true,"sWidth": "50","data": "pcName","sTitle":performanceContractManager_userName},
			                        {"orderable": true,"sWidth": "50","data": "pcTargettype","sTitle":performanceContractManager_targetType,"render":function(data,type,full){
			                        	return initCodeText(data,codeBasicInfo.performanceContractType);}},
			                        {"orderable": true,"sWidth": "50","data": "pcTargetcontent","sTitle":performanceContractManager_targetContent},
			                        {"orderable": true,"sWidth": "50","data": "pcCheckcontent","sTitle":performanceContractManager_checkContent},
			                        {"orderable": true,"sWidth": "50","data": "pcWeight","sTitle":performanceContractManager_weight},
			                        {"orderable": true,"sWidth": '5%',"data": "pcStatus","sTitle":performanceContractManager_status,"render":function(data,type,full){
			                        	return initCodeText(data,codeBasicInfo.performanceContractStatus);
			                        }},
			                        {"orderable": false,"sWidth": "100","sTitle":commonOperate}
			                        ];
			//操作列
			var projectContractColumnDefs=[{"targets":[8],"data":"id","render":performanceContractManager.grid_proformanceContract_operation}];
			//绩效列表初始化
			TableAjax(gridPerformanceContract,$performanceContractGridId,$urlPerformanceContract,performanceContractColumns,projectContractColumnDefs,true,true,commonPageLength);

			//查询
			$("#searchPerformanceContractBtn").on('click', function(event) {
				if(gridPerformanceContract.getRowsCount() > 0){
					event.preventDefault();
					//传FORM参数
					gridPerformanceContract.searchFilter($performanceContractFormId);
					gridPerformanceContract.clearAjaxParams();
				}else{
					App.alert({
						type: 'danger',
						icon: 'warning',
						message: 'Please select an action',
						container: gridPerformanceContract.getTableWrapper(),
						place: 'prepend'
					});
				}
			});
		},
		grid_proformanceContract_operation:function(data,type,full){
			var ret="";
			//查看
			if(hasViewPCInfoAuth){
				ret += "<a class='btn default btn-sm yellow-haze' href='"+basePath+"/performanceManage/performanceContractView?operate=view&id="+data+
				"' data-target='#performanceContract' data-toggle='modal'><i class='fa fa-eye'></i></a>";	
			}
			if(hasEditPCInfoAuth&&full.pcStatus=="0"){
				//编辑
				ret += "<a class='btn default btn-sm green-haze' href='"+basePath+"/performanceManage/performanceContractEdit?operate=edit&id="+data+
				"' data-target='#performanceContract' data-toggle='modal'><i class='fa fa-edit'></i></a>";			
			}
			if(hasDelPCInfoAuth&&full.pcStatus=="0"){
				//删除
				ret+="<a class='btn default btn-sm purple tooltips' data-original-title="+commonDelBtn+" onclick=\"performanceContractManager.performanceContractDel('"+data+
				"','"+performanceContractManagerMain_delete+"');\" ><i class='fa fa-trash-o'></i></a>";				
			}
			if(hasSubmitPCInfoAuth&&full.pcStatus=="0"){
				//提交
				ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+performanceContractManagerMain_submit+
				" onclick=\"performanceContractManager.performanceContractSubmit('"+data+"','"+performanceContractManagerMain_submit+"','1');\" >" +
				"<i class='fa fa-check'></i></a>";
			}
			if(hasAuditPCAuth&&full.pcStatus=="1"){
				//审核
				ret += "<a class='btn default btn-sm red-haze' href='"+basePath+"/performanceManage/performanceContractAudit?operate=audit&id="+data+
				"' data-target='#performanceContract' data-toggle='modal'><i class='fa fa-exclamation-triangle'></i></a>";	
			}
			return ret;
		},
		//删除项目
		performanceContractDel:function(value,msg){
			initAttasConfirmWal({
				sa_title: msg,
				sa_message: msg,
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
						url: basePath+'/performanceManage/deletePerformanceContract',
						type: 'POST',
						dataType: 'json',
						data: {id:value},
					})
					.done(function(data) {
						$("#searchPerformanceContractBtn").click();
						initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
					})
					.fail(function(data) {
						showError(data.responseText);
					});
				}
			}); 
		},

		//提交
		performanceContractSubmit:function(value,meg,auditStatus){
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
						url: basePath+'/performanceManage/submitPerformanceContract',
						type: 'POST',
						dataType: 'json',
						data: {id:value,auditStatus:auditStatus}
					})
					.done(function(data) {
						$("#searchPerformanceContractBtn").click();
						initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
					})
					.fail(function(data) {
						showError(data.responseText);
					});
				}
			});			
		},
		//考核
		performanceContract:function(value,meg,auditStatus){
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
						url: basePath+'/performanceManage/submitPerformanceContract',
						type: 'POST',
						dataType: 'json',
						data: {id:value,auditStatus:auditStatus}
					})
					.done(function(data) {
						$("#searchPerformanceContractBtn").click();
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
	$('.bs-select').selectpicker({
		iconBase: 'fa',
		tickIcon: 'fa-check'
	});
	performanceContractManager.performanceContractInit();
});