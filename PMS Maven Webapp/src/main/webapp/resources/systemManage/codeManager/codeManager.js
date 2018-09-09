/*
 *  @Description：基础信息维护管理主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var codeManager ={
	codeInit:function(){
		//基础信息维护Table
		var $codeGridId = $("#codeMianTableId");
		//基础信息维护Form
		var $codeFormId = $("#codeMianFormId");
		//基础信息维护信息URL
		var $urlCode = basePath + '/systemManage/queryCodeInfoByParam';
		//基础信息维护显示信息
		var codeColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
		    {"orderable": false,"sWidth": "50","data": "codeTypeName","sTitle":codeManagerMain_codeTypeName},
			{"orderable": false,"sWidth": "50","data": "codeZh","sTitle":codeManagerMain_codeZh},
			{"orderable": true,"sWidth": "50","data": "codeFlag","sTitle":codeManagerMain_codeFlag,"render":codeManager.render_rotate_fun},
			{"orderable": false,"sWidth": "200","data": "codeRemark","sTitle":codeManagerMain_codeRemark},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		//操作列
		var codeColumnDefs=[{"targets":[6],"data":"id","render":codeManager.grid_code_operation}];
		//基础信息维护列表初始化
		TableAjax(gridCode,$("#codeMianTableId"),$urlCode,codeColumns,codeColumnDefs,true,true,commonPageLength);
		
		//查询
		$("#searchCodeBtn").on('click', function(event) {
			if(gridCode.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridCode.clearAjaxParams();
				gridCode.searchFilter($codeFormId);
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
	},
	//用户备选事件操作按钮
	grid_code_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthCode){
			ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonEditBtn+" href='"+basePath+"/systemManage/codeManagerEdit?operate=edit&codeId="+data+
			"' data-target='#code-modal' data-toggle='modal'><i class='fa fa-edit'></i> 编辑</a>";
		}
		if(hasCodeDisableAuth){
			if(full.codeFlag=="0"){
				ret+="<a class='btn default btn-sm red tooltips' data-original-title="+codeManagerMain_disable+" onclick=\"codeManager.changeCodeDisableAuth('"+data+"','"+codeManagerMain_disableMsg+"','"+full.codeFlag+"');\" ><i class='fa fa-trash-o'></i> 停用</a>";
			}else if(full.codeFlag=="1"){
				ret+="<a class='btn default btn-sm grey-cascade tooltips' data-original-title="+codeManagerMain_enable+" onclick=\"codeManager.changeCodeDisableAuth('"+data+"','"+codeManagerMain_enableMsg+"','"+full.codeFlag+"');\" ><i class='fa fa-lock'></i> 启用</a>";
			}
		}
		$(".tooltips").tooltip();
		return ret;
	},
	//转换方法
	render_rotate_fun:function(data,type,full){
		if(data=='1'){
			return commonInvalid;
		}
		if(data=='0'){
			return commonValid;
		}
	},
	//启用、禁用基础信息
	changeCodeDisableAuth:function(value,mag,codeFlag){
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
	        		url: basePath+'/systemManage/codeDisable',
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {codeId:value,codeFlag:codeFlag},
	        	})
	        	.done(function(data) {
	        		$("#searchCodeBtn").click();
	        		if(codeFlag=='0'){
	        			initAttasInfoWal({sa_title:codeManagerMain_disablesuccess, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        		}else{
	        			initAttasInfoWal({sa_title:codeManagerMain_enablefail, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	        		}
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
	codeManager.codeInit();
});