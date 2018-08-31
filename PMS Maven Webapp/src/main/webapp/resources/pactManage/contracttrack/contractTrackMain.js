/*
 *  @Description：合同跟踪主页面JS
 *  @author：               raomingyi
 *  @date：                 2018年3月22日
 */
var ContractTrack ={
	contractTrackInit:function(){
		//合同跟踪Table
		var $contractTrackMianTableId = $("#contractTrackMianTableId");
		//合同跟踪URL
		var $urlContractTrack = basePath + '/contractmanage/contractTrackInfoByParam?contractId='+ContractTrack_contractId;
		//合同跟踪显示信息
		var contractTrackColumns=[			
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},			
			{"orderable": true,"sWidth": "50","data": "projectStage","sTitle":projectStage,"render":function(data,type,full){
			return initCodeText(data,codeBasicInfo.projectStage);}},
            {"orderable": true,"sWidth": "50","data": "persondayCounts","sTitle":persondayCounts},			
			{"orderable": true,"sWidth": "50","data": "remark","sTitle":remark},
			{"orderable": true,"sWidth": "50","data": "createBy","sTitle":createBy},
			{"orderable": true,"sWidth": "50","data": "createDate","sTitle":createDate},
			{"bVisible": true,"orderable": false,"sWidth": "50","sTitle":attachment,"render":function(data,type,full){
				return initAttachmentDownload({_dataId:full.id,_pageType:"R003-0401"});}},
   			{"orderable": false,"sWidth": "200","sTitle":commonOperate}		
	     ];
		//操作列
		var contractTrackColumnDefs=[{"targets":[8],"data":"id","render":ContractTrack.grid_contractTrack_operation}];
		//合同跟踪初始化
		TableAjax(gridContractTrack,$("#contractTrackMianTableId"),$urlContractTrack,
				contractTrackColumns,contractTrackColumnDefs,true,true,commonPageLength);
	},
	//用户备选事件操作按钮
	grid_contractTrack_operation:function(data,type,full){
		var ret="";
		if(hasEditContractTrackAuth){
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/contractmanage/contractTrackEdit?operate=edit&id="+data+
			"' data-target='#newContractTrackModalId' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		if(hasDeleteContractTrackAuth){
			ret += "<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"ContractTrack.DeleteContractTrackAuth('"+data+"','"+deleteTrackConfirmMsg+"'," +
	    		"'"+data+"');\" ><i class='fa fa-trash-o'></i></a>";
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R00304&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		$(".tooltips").tooltip();
		return ret;
	},
	 DeleteContractTrackAuth:function(value,mag,userFlag){
		 initAttasConfirmWal({
			sa_title: mag,
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
	        		url: basePath+'/contractmanage/deleteContractTrack',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value},
	        	})
	        	.done(function(data) {	        		
                   gridContractTrack.getDataTable().ajax.reload();	  
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
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	ContractTrack.contractTrackInit();
});