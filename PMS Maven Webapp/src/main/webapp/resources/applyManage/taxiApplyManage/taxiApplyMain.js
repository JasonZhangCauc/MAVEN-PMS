/*
 *  @Description：打车报销管理主页面JS
 *  @author：               zlshi
 *  @date：                 2018年8月3日
 */

var taxiApplyManager ={
		taxiApplyInit:function(){
			//打车报销单Table
			var $taxiApplyGridId = $("#taxiApplyMianTableId");
			//打车报销单Form
			var $taxiApplyFormId = $("#taxiApplyMianFormId");
			//打车报销单信息URL
			var $urlTaxiApply = basePath + '/applyManage/getAllTaxiBill';
			//打车报销单显示信息
			var taxiApplyColumns=[
			                      {"bVisible": false,"orderable": false,"data": "id"},
			                      {"orderable": false,"sWidth": "5%","data": "row_id","sTitle":commonNumber},
			                      {"orderable": true,"sWidth": "5%","data": "reimburseDate","sTitle":taxiApplyManagerMain_taxiApplyDate},
			                      {"orderable": true,"sWidth": "5%","data": "departTime","sTitle":taxiApplyManagerMain_departTime},
			                      {"orderable": true,"sWidth": "5%","data": "arriveTime","sTitle":taxiApplyManagerMain_arriveTime},
			                      {"orderable": true,"sWidth": "5%","data": "taxiAmount","sTitle":taxiApplyManagerMain_amount},
			                      {"orderable": true,"sWidth": "5%","data": "reimburseName","sTitle":taxiApplyManagerMain_userName},
			                      {"orderable": true,"sWidth": "5%","data": "projectName","sTitle":taxiApplyManagerMain_projectName},
			                      {"orderable": true,"sWidth": "5%","data": "taxiMatter","sTitle":taxiApplyManagerMain_remark,"render":function(data,type,full){
			                    	  return initCodeText(data,codeBasicInfo.taxiApplyExpain);
			                      }},
			                      {"orderable": true,"sWidth": "5%","data": "createDate","sTitle":taxiApplyManagerMain_taxiApplySubDate},
			                      {"orderable": true,"sWidth": '5%',"data": "taxibillStatus","sTitle":taxiApplyManagerMain_taxiApplyStatus,"render":function(data,type,full){
			                    	  return initCodeText(data,codeBasicInfo.taxiApplyStatus);
			                      }},
			                      {"orderable": false,"sWidth":'20%',"data": "id","sTitle":commonOperate}
			                      ];

			//操作列
			var projectColumnDefs=[{"targets":[11],"data":"id","render":taxiApplyManager.grid_taxiApply_operation}];

			//打车报销列表初始化
			TableAjax(gridTaxiApply,$taxiApplyGridId,$urlTaxiApply,taxiApplyColumns,projectColumnDefs,true,true,commonPageLength);

			//查询
			$("#searchTaxiApplyBtn").on('click', function(event) {
				if(gridTaxiApply.getRowsCount() > 0){
					event.preventDefault();
					//传FORM参数
					gridTaxiApply.clearAjaxParams();
					gridTaxiApply.searchFilter($taxiApplyFormId);
				}else{
					App.alert({
						type: 'danger',
						icon: 'warning',
						message: 'Please select an action',
						container: gridTaxiApply.getTableWrapper(),
						place: 'prepend'
					});
				}
			});
		},

		//打车报销操作按钮
		grid_taxiApply_operation:function(data,type,full){
			var ret="";
			//编辑中状态显示按钮
			if(hasEditProjectBaseInfoAuth&&full.taxibillStatus=="0"){
				//编辑
				ret += "<a class='btn default btn-sm green-haze' href='"+basePath+"/applyManage/taxiApplyEdit?operate=edit&id="+data+
				"' data-target='#project-taxiApply' data-toggle='modal'><i class='fa fa-edit'></i></a>";				
			}
			if(hasRemoveProjectBaseInfoAuth&&full.taxibillStatus=="0"){
				//删除
				ret+="<a class='btn default btn-sm purple tooltips' data-original-title="+commonDelBtn+" onclick=\"taxiApplyManager.deleteTaxiApply('"+data+
				"','"+taxiApplyManagerMain_delete+"');\" ><i class='fa fa-trash-o'></i></a>";				
			}
			if(hasSubmitProjectBaseInfoAuth&&full.taxibillStatus=="0"){
				//提交
				ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+taxiApplyManagerMain_submit+
				" onclick=\"taxiApplyManager.taxiBillSubmit('"+data+"','"+taxiApplyManagerMain_submit+"','1');\" >" +
				"<i class='fa fa-check'></i></a>";
			}
			if(hasRefusedProjectBaseInfoAuth&&full.taxibillStatus=="1"){
				//拒绝
				ret+="<a class='btn default btn-sm red tooltips' data-original-title="+taxiApplyManagerMain_refused+
				" onclick=\"taxiApplyManager.taxiBillRefused('"+data+"','"+taxiApplyManagerMain_refused+"','1');\" >" +
				"<i class='fa fa-ban'></i></a>";
			}
			if(hasAuditProjectBaseInfoAuth&&full.taxibillStatus=="1"){
				//审核
				ret += "<a class='btn default btn-sm yellow tooltips' data-original-title="+taxiApplyManagerMain_audit+
				" onclick=\"taxiApplyManager.taxiBillAudit('"+data+"','"+taxiApplyManagerMain_audit+"','1');\" >" +
				"<i class='fa fa-exclamation-triangle'></i></a>";
			}
			
			return ret;
		},

		//删除项目
		deleteTaxiApply:function(value,msg){
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
						url: basePath+'/applyManage/deleteTaxiBill',
						type: 'POST',
						dataType: 'json',
						data: {id:value},
					})
					.done(function(data) {
						$("#searchTaxiApplyBtn").click();
						initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
					})
					.fail(function(data) {
						showError(data.responseText);
					});
				}
			}); 
		},

		//提交
		taxiBillSubmit:function(value,meg,auditStatus){
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
						url: basePath+'/applyManage/submitTaxiBill',
						type: 'POST',
						dataType: 'json',
						data: {id:value,auditStatus:auditStatus}
					})
					.done(function(data) {
						$("#searchTaxiApplyBtn").click();
						initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
					})
					.fail(function(data) {
						showError(data.responseText);
					});
				}
			});			
		},
		
		//审核
		taxiBillAudit:function(value,meg,auditStatus){
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
						url: basePath+'/applyManage/auditTaxiBill',
						type: 'POST',
						dataType: 'json',
						data: {id:value,auditStatus:auditStatus}
					})
					.done(function(data) {
						$("#searchTaxiApplyBtn").click();
						initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
					})
					.fail(function(data) {
						showError(data.responseText);
					});
				}
			});			
		},
		//拒绝
		taxiBillRefused:function(value,meg,auditStatus){
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
						url: basePath+'/applyManage/refusedTaxiBill',
						type: 'POST',
						dataType: 'json',
						data: {id:value,auditStatus:auditStatus}
					})
					.done(function(data) {
						$("#searchTaxiApplyBtn").click();
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
	//初始化日期控件
	$('.date-picker').datepicker({
		rtl: App.isRTL(),
		clearBtn: true,
		autoclose: true
	});
	$('.bs-select').selectpicker({
		iconBase: 'fa',
		tickIcon: 'fa-check'
	});
	taxiApplyManager.taxiApplyInit();
});