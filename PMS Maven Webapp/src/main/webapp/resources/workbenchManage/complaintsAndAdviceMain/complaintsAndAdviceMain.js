/*
 *  @Description：投诉建议主页面JS
 *  @author：               zhangm
 *  @date：                    2018年08月13日
 */
var complaninManager ={
	workOrderInit:function(){
		//工作单Table
		var $workOrderGridId = $("#complanintsAndAdviceTableId");
		//工作单Form
		var $workOrderFormId = $("#complanintsAndAdviceFormId");
		//工作单信息URL
		var $urlWorkOrder = basePath + '/workbenchManage/complaintsAndAdviceInfoByParam';
		//工作单显示信息
		var workOrderColumns=[
		    {"bVisible": false,"orderable": false,"data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": false,"sWidth": "200","data": "advicesContent","sTitle":complainContent,"render":function(data,type,full){
   				return "<a class='btn' data-original-title="+commonEditBtn+" href='"+basePath+"/workbenchManage/complaintsAndAdviceLook?operate=look&id="+full.id+
   				"' data-target='#lookComplain' data-toggle='modal'>"+data+"</a>";
   			}},
			{"orderable": false,"sWidth": "200","data": "advicesTypeStr","sTitle":complainType},
			{"orderable": false,"sWidth": "200","data": "createByStr","sTitle":complainName},
			{"orderable": false,"sWidth": "200","data": "createDate","sTitle":createDate},
			{"orderable": false,"sWidth":'200',"sTitle":commonOperate} 
	     ];
		//操作列
		var workOrderColumnDefs=[{"targets":[6],"data":"id","render":complaninManager.grid_workOrder_operation}];
		//工作单列表初始化
		TableAjax(gridComplain,$workOrderGridId,$urlWorkOrder,workOrderColumns,workOrderColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchComplainBtn").on('click', function(event) {
			if(gridComplain.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridComplain.clearAjaxParams();
				gridComplain.searchFilter($workOrderFormId);
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
		//编辑
		if(complaintsEdit){
			ret += "<a class='btn default btn-sm green-haze' href='"+basePath+"/workbenchManage/complaintsAndAdviceEdit?operate=edit&id="+data+
			"' data-target='#addComplan' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		//删除
		if(complaintsDel){
			ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"complaninManager.deleteWorkOrder('"+data+
			"','"+addActivityBtnDEL+"');\" ><i class='fa fa-trash-o'></i></a>";
		}
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
	        		url: basePath+'/workbenchManage/deleteComplaintsAndAdvice',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		$("#searchComplainBtn").click();
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
    $("#complanintsAndAdviceFormId #beginTime").on("changeDate",function(e){
    	$("#complanintsAndAdviceFormId #createDateEnd").datepicker("setStartDate",e.date);
    });
    $("#complanintsAndAdviceFormId #createDateEnd").on("changeDate",function(e){
    	$("#complanintsAndAdviceFormId #beginTime").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	complaninManager.workOrderInit();
});