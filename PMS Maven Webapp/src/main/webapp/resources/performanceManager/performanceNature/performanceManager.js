/*
 *  @Description：绩效档案管理主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var performanceManager ={
	performanceInit:function(){
		//绩效管理Table
		var $performanceGridId = $("#performanceMianTableId");
		//绩效管理Form
		var $performanceFormId = $("#performanceMianFormId");
		//绩效信息URL
		var $urlPerformance = basePath + '/performanceManager/performanceUserByParam';
		//绩效显示信息
		var performanceColumns=[
		    {"orderable": false,"sWidth": "15","data": "id","sTitle":
		    	'<label class="userColumnsDiv mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" checked="" class="group-checkable"/><span></span></label>'},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "50","data": "userAccount","sTitle":performanceManager_workNumber},
			{"orderable": true,"sWidth": "50","data": "userName","sTitle":performanceManager_userName},
			{"orderable": true,"sWidth": "50","data": "deptId","sTitle":performanceManager_userDept,"render":function(data,type,full){
				return getDeptByIds(data);
			}},
			{"orderable": true,"sWidth": "50","data": "entryDate","sTitle":performanceManager_entryDate},
			{"orderable": true,"sWidth": "50","data": "userNature","sTitle":performanceManager_userNature,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.userNature);
			}},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		//操作列
		var performanceColumnDefs=[{"orderable": false,"targets":[0],"data":"id","render":function(data,type,full){
						    			return '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="checkboxes" value="'+
						    			data+'" name="userId" /><span></span></label>';
						    		}
									}
		                           ,{"targets":[7],"data":"id","render":performanceManager.grid_performance_operation}];
		//绩效列表初始化
		TableAjax(gridPerformance,$("#performanceMianTableId"),$urlPerformance,performanceColumns,performanceColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchPerformanceBtn").on('click', function(event) {
			if(gridPerformance.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridPerformance.clearAjaxParams();
				gridPerformance.searchFilter($performanceFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridUser.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
		
		//生成本月绩效
		$("#generatePerformanceBtn").on('click', function(event) {
			//获取勾选用户ID
			var userIds="";
			$("input:checkbox[name='userId']:checked").each(function(){
				userIds+=$(this).val()+",";
			});
			if(userIds!=null && userIds!=""){
				userIds.substring(0, userIds.length - 1);
			}
			if(userIds!=null && userIds!="" && userIds!=undefined){
				$.ajax({
					url:basePath+'/performanceManager/generateTheSameMonthPerformance',
					type: 'POST',
					data: {userIds:userIds},
					dataType: 'json',
					success:function(d){
						initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
					}
				});
			}else{
				initAttasInfoWal({sa_title:performanceManager_pleaseSelectRecord, sa_type:"warning", sa_confirmButtonClass:"btn-warning"});
			}
		});
	},
	//用户备选事件操作按钮
	grid_performance_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthPerformance){
			ret += "<a addtabs='R00601_01' title='"+performanceManager_performanceManager+"' class='btn default btn-sm green-haze' style='cursor:pointer;' " +
				"url='/performanceManager/performanceNatrueMain?userId="+data+
				"' ><i class='fa fa-star-o'></i></a>";
		}
		return ret;
	}
};
jQuery(document).ready(function() {
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	performanceManager.performanceInit();
});