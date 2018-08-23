/*
 *  @Description：主页面Js
 *  @author：	raomingyi
 *  @date：	2018-03-05
 */
var hideCustomId;
var customManage = {
	 
	initCustom:function(){
		/**************** Customtable列表 ***************/
		//客户管理Table
		var $customGridId = $("#customMianTableIdA"); 
		//客户管理Form
		var $customFormId = $("#customMianFormIdA");
		//客户信息URL
		var $urlCustom = basePath + '/projectMoniInfo/projectMoniInfoInfoByParam?projectBaseinfoId='+projectId;
		//客户列
		//字段列表 按照百分比计算 累计100%; 
		var customColumns = [
            {"bVisible": false,"orderable": false,"data": "id"},
   		    {"bVisible": false,"orderable": false,"sWidth": "5%","data": "row_id","sTitle":commonNumber}, 
   			{"orderable": false,"sWidth": "100","data": "moniStatusStr","sTitle":t1,"render":function(data,type,full){
		    	return rel = "<span class='label label-danger'> "+full.moniStatusStr+"</span>";
			}},
   			{"orderable": false,"sWidth": "150","data": "moniTitle","sTitle":t2},
   			{"orderable": false,"sWidth": "100","data": "moniStartDate","sTitle":t3},
   			{"orderable": false,"sWidth": "100","data": "moniEndDate","sTitle":t4},
   			{"orderable": false,"sWidth": "150","data": "moniInstruction","sTitle":t5},
   			{"orderable": false,"sWidth": "100","sTitle":commonOperate}		   
		];
		//clickToSelect: true;
		//用户操作按钮
		var customColumnDefs=[{"targets":[7],"data":"id","render":customManage.grid_custom_operation}];
		//用户初始化表格控件
		TableAjax(gridCustomer,$customGridId,$urlCustom,customColumns,customColumnDefs,false,false,commonPageLength,customManage.grid_customer_fnRowCallback);
		//用户查询事件
		$("#searchCustomBtn").on('click', function(event) {
			if(gridCustomer.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridCustomer.clearAjaxParams();
				gridCustomer.searchFilter($customFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridCustomer.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	 },	
	 isNull:function(val){
		 var rel = "";
		 if(val==null){
			 rel = "";
		 }else{
			 rel = val;
		 }
		 return rel;
	 },
	 //用户备选事件操作按钮
	 grid_custom_operation:function(data,type,full){
		var ret="";
		if(hasEditCustomAuth){
			ret += "<a class='btn default btn-sm green-haze tooltips' href='"+basePath+"/projectMoniInfo/projectMoniInfoEdit?id="+data+
			"' data-target='#addProjectApproval' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}
		
		
		return ret;
	 },
	//删除客户
	 DeleteCustomAuth:function(value,msg,userFlag){
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
	        		url: basePath+'/preSalesManage/deleteCustom',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value}
	        	})
	        	.done(function(data) {
	        		$("#searchCustomBtn").click();
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	       }
	   });				
	},
	//通过项目监控id查询文档信息
	search_sale_activity:function(id){
		$("#dndArea").show();
		$("#dndAreas").hide();
		//附件初始化
		var milepostEdit_operate='edit';
		$(function(){
			if(milepostEdit_operate=='edit'){
				//初始化上传插件
				initWebUploaderUI({
		        	_webUploaderId:'#milepostUploaderDivId',
		        	_fileAddId:'#milepostFilePicker',
		        	_fileAddIdContinue:'#milepostFilePicker2',
		        	_dataId:id,
		        	_pageType:'R004_01',
		        	_editFileId:'#milepostModuleGallery'});
		        //初始化历史数据
				initEidtUploaderUI({
					_editFileId:'#milepostModuleGallery',
					_dataId:id,
					_pageType:'R004_01',
					_canDelete:true
					});
			}
		});
		
		
		/*$.ajax({
			url:basePath+'/projectMoniInfo/searchDoucmentList',
			type: 'POST',
			data: {moniDucId:id},
			dataType: 'json',
			success:function(event){
				
				
				
				
				var html ="";
				$("#html_jj").empty();
				for ( var i = 0; i < 1; i++) {
					html +='<dl class="dl-horizontal">';
					html +='<dt>文件：</dt>';
					html +='<dd><span class="label">"<a class="btn default btn-sm tooltips" data-original-title='+commonDownload+' onclick=\"serviceTicketMian.serviceTicketDownload('+event[i].id+
					');\" >'+event[i].moniFilename+'</a>"</span>';
					html +='</dd>';
				}
				$("#html_jj").append(html);
			}
		});*/
		
		
	},
	 
		 grid_customer_fnRowCallback: function(row, data, index) {
			 $(row).on("click",function() {
				 if ($(this).hasClass('row_selected')) {
					 $(this).removeClass('row_selected');
					 $(this).removeAttr("style");
					 hideCustomId="";//赋值选中用户ID
					 $("#statusBar").hide();
				 } else {
					 $("#statusBar").show();
					 $("#moniDucId").val(data.id); 
					 customManage.search_sale_activity(data.id);
					 $("#customMianTableIdA tr.row_selected").removeAttr("style");
					 $("#customMianTableIdA tr.row_selected").removeClass('row_selected');
					 $(this).addClass('row_selected');
					  hideCustomId=data.id;//赋值选中用户ID
				 }
			 });
	   }, 
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    }
	customManage.initCustom();
	/*customManage.initlinker();*/
	/*customManage.initCustomEdit();
	customManage.initlinkerEdit();*/
});