/*
 *  @Description：服务单主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年07月02日
 */
var serviceTicketMian ={
	serviceTicketInit:function(){
		//服务单Table
		var $serviceTicketGridId = $("#serviceTicketMianTableId");
		//服务单Form
		var $serviceTicketFormId = $("#serviceTicketMainFormId");
		//服务单信息URL
		var $urlServiceTicket = basePath + '/systemManage/queryServiceTicketByParam';
		//服务单显示信息
		var serviceTicketColumns=[
		    {"bVisible": false,"orderable": false,"data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "200","data": "uploadbyName","sTitle":serviceTicketMain_uploadby},
			{"orderable": true,"sWidth": "200","data": "uploaddate","sTitle":serviceTicketMain_uploaddate},
			{"orderable": true,"sWidth": "200","data": "filename","sTitle":serviceTicketMain_filename},
			{"orderable": false,"sWidth":'200',"sTitle":commonOperate}
	     ];
		//操作列
		var serviceTicketColumnDefs=[{"targets":[5],"data":"id","render":serviceTicketMian.grid_serviceTicket_operation}];
		//服务单列表初始化
		TableAjax(gridServiceTicket,$serviceTicketGridId,$urlServiceTicket,serviceTicketColumns,serviceTicketColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchServiceTicket").on('click', function(event) {
			if(gridServiceTicket.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridServiceTicket.clearAjaxParams();
				gridServiceTicket.searchFilter($serviceTicketFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridServiceTicket.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	},
	//服务单备选事件操作按钮
	grid_serviceTicket_operation:function(data,type,full){
		var ret="";
		//删除
		ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"serviceTicketMian.deleteServiceTicket('"+data+
		"','"+serviceTicketMain_removeServiceTickMsg+"');\" ><i class='fa fa-trash-o'></i></a>";
		
		//下载
		ret+="<a class='btn default btn-sm red tooltips' data-original-title="+commonDownload+" onclick=\"serviceTicketMian.serviceTicketDownload('"+full.id+
		"');\" ><i class='fa fa-cloud-download'></i></a>";
		return ret;
	},	
	
	//删除服务单
	deleteServiceTicket:function(value,msg){
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
	        		url: basePath+'/systemManage/deleteServiceTicket',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {
	        		$("#searchServiceTicket").click();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	        }
	    }); 
	},
	
	//服务单下载
	serviceTicketDownload:function(id){
		window.location.href=basePath+"/systemManage/downloadServiceTicket?id="+id+"&t="+new Date();
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
    $("#serviceTicketMainFormId #uploadBeginDate").on("changeDate",function(e){
    	$("#serviceTicketMainFormId #uploadEndDate").datepicker("setStartDate",e.date);
    });
    $("#serviceTicketMainFormId #uploadEndDate").on("changeDate",function(e){
    	$("#serviceTicketMainFormId #uploadBeginDate").datepicker("setEndDate",e.date);
    });
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	serviceTicketMian.serviceTicketInit();
});