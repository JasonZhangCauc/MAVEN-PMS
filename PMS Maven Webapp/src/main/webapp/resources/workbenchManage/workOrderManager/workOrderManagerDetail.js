/*
 *  @Description：工作单详细页面JS
 *  @author：               zlshi
 *  @date：                    2018年08月14日
 */
var workOrderManagerDetail ={
	workOrderInitDetail:function(){
		//工作单Table
		var $workOrderGridId = $("#workOrderDetailTableId");
		//工作单Form
		var $workOrderFormId = $("#workOrderDetailFormId");
		//工作单信息URL
		var $urlWorkOrder = basePath + '/workbenchManage/queryWorkOrderByParam';
		//工作单显示信息
		var workOrderColumns=[
		    {"bVisible": false,"orderable": false,"data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "150","data": "questionStatus","sTitle":workOrderManagerMain_questionStatus},
			{"orderable": true,"sWidth": "150","data": "questionNumber","sTitle":workOrderManagerMain_questionNumber},
			{"orderable": true,"sWidth": "150","data": "putForwardBy","sTitle":workOrderManagerMain_putForwardBy},
			{"orderable": true,"sWidth": "150","data": "putForwardDate","sTitle":workOrderManagerMain_putForwardDate},
			{"orderable": true,"sWidth": "150","data": "questionContent","sTitle":workOrderManagerMain_questionContent},
			{"orderable": true,"sWidth": "100","data": "questionType","sTitle":workOrderManagerMain_questionType},
			{"orderable": true,"sWidth": "100","data": "questionPriority","sTitle":workOrderManagerMain_questionPriority},
			{"orderable": false,"sWidth":'200',"sTitle":commonOperate}
	     ];
		//操作列
		var workOrderColumnDefs=[{"targets":[9],"data":"id","render":workOrderManagerDetail.grid_workOrder_operation}];
		//工作单列表初始化
		TableAjax(gridWorkOrderDetail,$workOrderGridId,$urlWorkOrder,workOrderColumns,workOrderColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchWorkOrderDetailBtn").on('click', function(event) {
			if(gridWorkOrderDetail.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridWorkOrderDetail.clearAjaxParams();
				gridWorkOrderDetail.searchFilter($workOrderFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridWorkOrderDetail.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//工作单问题备选事件操作按钮
	grid_workOrder_operation:function(data,type,full){
		var ret="";
		//查看
		
			
		//编辑
		
		
		//删除
		
		
		//处理
		
		return ret;
	},	
	
	//删除问题
	deleteWorkOrderDetail:function(value,msg){
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
	        		$("#searchWorkOrderDetailBtn").click();
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
    
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	workOrderManagerDetail.workOrderInitDetail();
});