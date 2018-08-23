/*
 *  @Description：主页面Js
 *  @author：	raomingyi
 *  @date：	2018-03-05
 */
var hideProjectId;
var SaleTrack = {
	 
	//初始日期控件和下拉框控件
	 initPickers:function () {
        //init date pickers
        $('.date-picker').datepicker({
            rtl: App.isRTL(),
            autoclose: true
        });
        $('.bs-select').selectpicker({
            iconBase: 'fa',
            tickIcon: 'fa-check'
        });
     },
    
	initProInfo:function(){
		/**************** ProInfotable列表 ***************/
		//项目信息Table
		var $ProInfoGridId = $("#ProInfoMianTableId");
		//用户管理Form
		var $ProInfoFormId = $("#ProInfoMianFormIdParent");
		//用户信息URL
		var $urlProInfo = basePath + '/preSalesManage/saleTrackInfoByParam';
		//用户列
		//字段列表 按照百分比计算 累计100%;
		var ProInfoColumns = [
            {"bVisible": false,"orderable": false,"data": "id"},
   			{"orderable": true,"sWidth": "10%","data": "projectno","sTitle":t1,
   				 "render":function(data,type,full){
				     return "<a href='"+basePath+"/preSalesManage/saleTrackLook?operate=edit&id="+full.id+"' data-target='#newProInfoModalId' data-toggle='modal'>"+full.projectno+"</a>";
				 }
            },
   			{"orderable": true,"sWidth": "10%","data": "projectName","sTitle":t2},
   			{"orderable": true,"sWidth": "10%","data": "customerName","sTitle":t3},
   			{"orderable": true,"sWidth": "10%","data": "saleResponsibleName","sTitle":t4},
   			{"orderable": true,"sWidth": "10%","data": "saleStatus","sTitle":t6,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.saleStatus);}},
   			{"orderable": false,"sWidth": "10%","sTitle":commonOperate}		   
		];
		//用户操作按钮
		var ProInfoColumnDefs=[{"targets":[6],"data":"id","render":SaleTrack.grid_ProInfo_operation}];
		//用户初始化表格控件
		TableAjax(gridProInfo,$ProInfoGridId,$urlProInfo,ProInfoColumns,ProInfoColumnDefs,true,true,commonPageLength,SaleTrack.grid_Activity_fnRowCallback);
		//用户查询事件
		$("#ProInfoMianFormIdParent #searchProInfoBtn").on('click', function(event) {
			if(gridProInfo.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridProInfo.clearAjaxParams();
				gridProInfo.searchFilter($ProInfoFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridProInfo.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
	 },		
	 //用户备选事件操作按钮
	 grid_ProInfo_operation:function(data,type,full){
		var ret="";
		if(hasEditProInfoAuth){
		ret += "<a class='btn default btn-sm green-haze' href='"+basePath+"/preSalesManage/saleTrackEdit?operate=edit&id="+data+
			"' data-target='#newProInfoModalId' data-toggle='modal'><i class='fa fa-edit'></i></a>";
		}		
		if(hasDeleteProInfoAuth){	    
	    ret += "<a class='btn default btn-sm red' onclick=\"SaleTrack.DeleteProInfoAuth('"+data+"','"+deleteProInfoConfirmMsg+"'," +
	    		"'"+full.ProInfoName+"');\" ><i class='fa fa-trash-o'></i></a>";	    	
		}
		if(hasEditActivityAuth){
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+addActivityBtn+" href='"+basePath+"/preSalesManage/salesActivityEdit?operate=add&salesprojectId="+full.id+
			"'data-target='#addActivityModalId' data-toggle='modal'><i class='fa fa-plus-square'></i></a>";
		}
		$(".tooltips").tooltip();
		return ret;
	 },
	 //删除销售跟踪
	 DeleteProInfoAuth:function(value,mag,userFlag){
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
	        		url: basePath+'/preSalesManage/deleteSaleTrack',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:value}
	        	})
	        	.done(function(data) {
	        		$("#html_jj").empty();
					$("#html_jjs").empty();
					var htmltwo = "";
					htmltwo +='<div id="html_jjs"><div class="textAligh">';
					htmltwo +='<div class="alert alert-info">温馨提示! 无活动记录. </div> ';
					htmltwo +='</div></div>';
					$("#html_jjs").append(htmltwo);
	        		$("#searchProInfoBtn").click();	
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	       }
	   });	
	},
	//删除活动
	deleteActing:function(id,mag,saleId,index){
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
	        		url: basePath+'/preSalesManage/deleteSalesActivity',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {id:id}
	        	})
	        	.done(function(data) {
	        		$("#searchProInfoBtn").click();	
	        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        		SaleTrack.search_sale_activity(saleId,index); 
					 $("#ProInfoMianTableId tr.row_selected").removeAttr("style");
					 $("#ProInfoMianTableId tr.row_selected").removeClass('row_selected');
					 $(index).addClass('row_selected');
	        	})
	        	.fail(function(data) {
	        		showError(data.responseText);
	        	});
	       }
	   });	
	},
	
	/**************** Activitytable列表 ***************/
	 initActivity:function(){
			
			//销售活动Table
			var $ActivityGridId = $("#ActivityMianTableId");			
			//销售活动信息URL
			var $urlActivity = basePath + '/preSalesManage/salesActivityByParam';
			//销售活动列
			//字段列表 按照百分比计算 累计100%;			
			var ActivityColumns = [
	            {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
	            {"bVisible": false,"orderable": false,"sWidth": "10","data": "salesprojectId"},
	   		    {"bVisible": false,"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
	   			{"orderable": true,"sWidth": "50","data": "activityName","sTitle":t13},
	   			{"orderable": true,"sWidth": "50","data": "activityType","sTitle":t12,"render":function(data,type,full){
					return initCodeText(data,codeBasicInfo.saleStatus);}},
	   			{"orderable": true,"sWidth": "50","data": "activityBegindate","sTitle":t14},
	   			{"orderable": true,"sWidth": "50","data": "activityEnddate","sTitle":t15},
	   			{"orderable": true,"sWidth": "50","data": "salesPersonnelNames","sTitle":t16},
	   			{"orderable": true,"sWidth": "50","data": "customerBehalf","sTitle":t17},
	   			{"orderable": true,"sWidth": "50","data": "activityDescribe","sTitle":t18},
	   			{"orderable": true,"sWidth": "50","data": "activityResults","sTitle":t19},
	   			{"orderable": true,"sWidth": "50","data": "remark","sTitle":t20},
	   			{"orderable": false,"sWidth": "100","sTitle":commonOperate}		   
			];
			//用户操作按钮
			var ActivityColumnDefs=[{"targets":[12],"data":"id","render":SaleTrack.grid_Activity_operation}];
			//用户初始化表格控件
			TableAjax(gridActivity,$ActivityGridId,$urlActivity,ActivityColumns,ActivityColumnDefs,true,true,commonPageLength);	
			
			$("#searchProInfoBtn").on('click', function(event) {
				if(gridActivity.getRowsCount() > 0){
					event.preventDefault();
					gridActivity.clearAjaxParams();
					//传FORM参数
					gridActivity.getDataTable().ajax.reload();		
				}else{
					App.alert({
	                    type: 'danger',
	                    icon: 'warning',
	                    message: 'Please select an action',
	                    container: gridActivity.getTableWrapper(),
	                    place: 'prepend'
	                });
				}
			});
	 
	 },		 
		//用户备选事件操作按钮
		 grid_Activity_operation:function(data,type,full){
			var ret="";
			if(hasEditActivityAuth){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/preSalesManage/salesActivityEdit?operate=edit&id="+data+
				"' data-target='#addActivityModalId' data-toggle='modal'><i class='fa fa-edit'></i></a>";
			}		
			if(hasDeleteActivityAuth){	    
		    ret += "<a class='btn default btn-sm red tooltips' data-original-title="+commonDelBtn+" onclick=\"SaleTrack.DeleteActivityAuth('"+data+"','"+deleteActivityConfirmMsg+"'," +
		    		"'"+full.activityName+"');\" ><i class='fa fa-trash-o'></i></a>";	    	
			}	
			ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R0020203&changeId="+full.id+
			"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
			$(".tooltips").tooltip();
			return ret;
		 },
	 
		//删除销售活动
		 DeleteActivityAuth:function(value,mag,userFlag){
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
		        		url: basePath+'/preSalesManage/deleteSalesActivity',
		        		type: 'POST',
		        		dataType: 'json',
		        		data: {id:value}
		        	})
		        	.done(function(data) {		        		
		        		gridActivity.getDataTable().ajax.reload();
		        		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		        	})
		        	.fail(function(data) {
		        		showError(data.responseText);
		        	});
		       }
		   });  
		},
		//通过销售跟踪id查询活动信息
		search_sale_activity:function(id,index){
			$.ajax({
				url:basePath+'/preSalesManage/searchSalesActivityList',
				type: 'POST',
				data: {salesprojectId:id},
				dataType: 'json',
				success:function(event){
					var html ="";
					var htmltwo ="";
					$("#html_jj").empty();
					$("#html_jjs").empty();
					if(event.length>0){
						for ( var i = 0; i < event.length; i++) {
							var pic = basePath+event[i].userPic;
							html +='<div class="timeline-item" id="div_id">';
							html +='<div class="timeline-badge">';
							html +='<img class="timeline-badge-userpic" src="'+pic+'"> </div>';
							html +='<div class="timeline-body">';
							html +='<div class="timeline-body-arrow"> </div>';
							html +='<div class="timeline-body-head">';
							html +='<div class="timeline-body-head-caption">';
							html +='<a href="javascript:;" class="timeline-body-title font-blue-madison">'+event[i].activityTypeStr+'</a>';
							html +='<span class="timeline-body-time font-grey-cascade">'+event[i].activityEnddate+'</span>';
							html +='</div>';
							html +='<div class="timeline-body-head-actions">';
							html +='<div class="btn-group">';
							html +="<button class='btn btn-circle red btn-sm dropdown-toggle' onclick=\"SaleTrack.deleteActing('"+event[i].id+"','"+deleteActivityConfirmMsg+"'," +"'"+id+"'," +"'"+index+"');\">删除</button>";
							html +='</div>';
							html +='</div></div>';
							html +='<div class="timeline-body-content">';
							html +='<span class="font-grey-cascade">'+event[i].activityDescribe+'</span>';
							html +='</div></div></div>';
							
						}
					}else{
						htmltwo +='<div id="html_jjs"><div class="textAligh">';
						htmltwo +='<div class="alert alert-info">温馨提示! 无活动记录. </div> ';
						htmltwo +='</div></div>';
					}
					$("#html_jjs").append(htmltwo);
					$("#html_jj").append(html);
				}
			});
		},
		//单击选中项目信息查询销售活动
		grid_Activity_fnRowCallback: function(row, data, index) {
			 $(row).on("click",function() {
				 if ($(this).hasClass('row_selected')) {
					 $(this).removeClass('row_selected');
					 $(this).removeAttr("style");
				 } else { 
					 SaleTrack.search_sale_activity(data.id,$(this));
					 $("#ProInfoMianTableId tr.row_selected").removeAttr("style");
					 $("#ProInfoMianTableId tr.row_selected").removeClass('row_selected');
					 $(row).addClass('row_selected');
					 $('#newProInfoModalId').attr("href",basePath+"/preSalesManage/salesActivityEdit?operate=add&salesprojectId="+data.id);
					 $('#newProInfoModalId').click();
				 }
			 });
	   }, 
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    }
	SaleTrack.initActivity();
	SaleTrack.initPickers();
	SaleTrack.initProInfo();
});