/*
 *  @Description：工作单主页面JS
 *  @author：               zlshi
 *  @date：                    2018年08月14日
 */
var workOrderManager ={
	workOrderInit:function(){
		//工作单Table
		var $workOrderGridId = $("#workOrderMianTableId");
		//工作单Form
		var $workOrderFormId = $("#workOrderMainFormId");
		//工作单信息URL
		var $urlWorkOrder = basePath + '/workbenchManage/queryWorkOrderByParam';
		//工作单显示信息
		var workOrderColumns=[
		    {"bVisible": false,"orderable": false,"data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "150","data": "projectResourceName","sTitle":workOrderManagerMain_createBy},
			{"orderable": true,"sWidth": "150","data": "projectHeadName","sTitle":workOrderManagerMain_putForwardDate},
			{"orderable": true,"sWidth": "150","data": "workOrderNum","sTitle":workOrderManagerMain_workNumber},
			{"orderable": true,"sWidth": "150","data": "workTime","sTitle":workOrderManagerMain_projectType},
			{"orderable": true,"sWidth": "150","data": "belongUnit","sTitle":workOrderManagerMain_belongUnit},
			{"orderable": true,"sWidth": "100","data": "estimatedWorkload","sTitle":workOrderManagerMain_priority},
			{"orderable": true,"sWidth": "100","data": "expiredHours","sTitle":workOrderManagerMain_workStatus},
			{"orderable": false,"sWidth":'200',"sTitle":commonOperate}
	     ];
		//操作列
		var workOrderColumnDefs=[{"targets":[9],"data":"id","render":workOrderManager.grid_workOrder_operation}];
		//工作单列表初始化
		TableAjax(gridWorkOrder,$workOrderGridId,$urlWorkOrder,workOrderColumns,workOrderColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchWorkOrderBtn").on('click', function(event) {
			if(gridWorkOrder.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridWorkOrder.clearAjaxParams();
				gridWorkOrder.searchFilter($workOrderFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridWorkOrder.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//工作单备选事件操作按钮
	grid_workOrder_operation:function(data,type,full){
		
		var ret="";
		//编辑（进入工作单详情页面）
		
		//提交
		
		//接收
		return ret;
	},	
	
	//删除工作单
	deleteWorkOrder:function(value,msg){
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
	        		url: basePath+'/workbenchManage/deleteWorkOrderById',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		$("#searchWorkOrderBtn").click();
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
    $("#workOrderMainFormId #putForwardBeginDate").on("changeDate",function(e){
    	$("#workOrderMainFormId #putForwardEndDate").datepicker("setStartDate",e.date);
    });
    $("#workOrderMainFormId #putForwardEndDate").on("changeDate",function(e){
    	$("#workOrderMainFormId #putForwardBeginDate").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	workOrderManager.workOrderInit();
});