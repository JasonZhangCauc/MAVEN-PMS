/*
 *  @Description：主页面Js
 *  @author：	raomingyi
 *  @date：	2018-03-05
 */
var ContractSelect = {
	//初始日期控件和下拉框控件
	 initPickers:function () {
		//初始化下拉框及日期控件
	    $('.date-picker').datepicker({
	    	format: 'yyyy-mm-dd',
		    clearBtn: true,
		    autoclose: true
	    });
		$('.bs-select').selectpicker({
	        iconBase: 'fa',
	        tickIcon: 'fa-check'
	    });
     },
    
	initContractSelect:function(){
		/**************** Contracttable列表 ***************/
		//合同信息Table
		var $ContractSelectGridId = $("#contractSelectTableId");
		//用户管理Form
		var $ContractSelectFormId = $("#contractSelectFormId");
		//用户信息URL
		var $urlContractSelect = basePath + '/contractmanage/contractInfoByParam?contractStatus=2';
		//用户列
		//字段列表 按照百分比计算 累计100%;
		var ContractSelectColumns = [
            {"orderable": false,"sWidth": "10","data": "id"},
   			{"orderable": true,"sWidth": "50","data": "contractNo","sTitle":contractSelect_contractNo},
   			{"orderable": true,"sWidth": "50","data": "contractTitle","sTitle":contractSelect_title},
   			{"bVisible":  true,"orderable": true,"sWidth": "50","data": "customName","sTitle":contractSelect_custom},
   			{"orderable": true,"sWidth": "50","data": "belongProduct","sTitle":contractSelect_product,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.PRODUCT);}},
   			{"orderable": true,"sWidth": "50","data": "signedDate","sTitle":contractSelect_signDate},
   			{"orderable": true,"sWidth": "50","data": "contractAmount","sTitle":contractSelect_price},
   			{"orderable": true,"sWidth": "50","data": "currency","sTitle":contractSelect_coinType,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.currency);}},
   			{"orderable": true,"sWidth": "50","data": "freeLimit","sTitle":contractSelect_freeTime},
   			{"orderable": true,"sWidth": "50","data": "giveDay","sTitle":contractSelect_sendDays},
   			{"orderable": true,"sWidth": "50","data": "effectiveDate","sTitle":contractSelect_expiryDate},
			{"orderable": true,"sWidth": "50","data": "contractStatus","sTitle":contractSelect_status,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.contractStatus);}},
			{"bVisible":  true,"sWidth": "50","data": "remark","sTitle":contractSelect_attachment}
		];
		var contractSelectColumnDefs=[{
		    "orderable": false,
	     	"targets":[0],
	    	"data":"id",
	    	"render":function(data,type,full){
	    		if(data==contractSelect_contractId){
	    			return '<label class="mt-radio mt-radio-outline">'+
                    			'<input type="radio" name="contractRadios" value="'+data+'" checked>'+
                    			'<span></span>'+
                    		'</label>'+
                    		'<input type="hidden" id="belongProduct'+data+'" value="'+full.belongProduct+'"/>'+
                    		'<input type="hidden" id="contractTitle'+data+'" value="'+full.contractTitle+'"/>'+
                    		'<input type="hidden" id="belongCustomerid'+data+'" value="'+full.belongCustomerid+'"/>';
	    		}else{
	    			return '<label class="mt-radio mt-radio-outline">'+
			        			'<input type="radio" name="contractRadios" value="'+data+'">'+
			        			'<span></span>'+
			        		'</label>'+
			        		'<input type="hidden" id="contractNo'+data+'" value="'+full.contractNo+'"/>'+
                    		'<input type="hidden" id="belongProduct'+data+'" value="'+full.belongProduct+'"/>'+
                    		'<input type="hidden" id="contractTitle'+data+'" value="'+full.contractTitle+'"/>'+
                    		'<input type="hidden" id="belongCustomerid'+data+'" value="'+full.belongCustomerid+'"/>';
	    		}
	    	}
		}];
		
		//用户初始化表格控件
		TableAjax(gridContractSelect,$ContractSelectGridId,$urlContractSelect,ContractSelectColumns,contractSelectColumnDefs,true,true,commonPageLength);
		//用户查询事件
		$("#searchContractSelectBtn").on('click', function(event) {
			if(gridContractSelect.getRowsCount() > 0){
				event.preventDefault();
				//传FORM参数
				gridContractSelect.clearAjaxParams();
				gridContractSelect.searchFilter($ContractSelectFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridContract.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
		
		//保存
		$("#contractSelectBtn").on('click', function(event) {
			var contractRadios= $("input[name='contractRadios']:checked").val();
			if(contractRadios!=null && contractRadios!= "" && contractRadios!=undefined){
				var contractNoVal=$("#contractNo"+contractRadios).val();
				var belongCustomeridVal=$("#belongCustomerid"+contractRadios).val();
				var belongProductVal=$("#belongProduct"+contractRadios).val();
				var contractTitleVal=$("#contractTitle"+contractRadios).val();
				$("#projectEditFormId #contractIdSelect").val(contractRadios);
				$("#projectEditFormId #contractNoSelect").val(contractNoVal);
				$('#projectEditFormId #belongCustomerid').selectpicker('val',belongCustomeridVal);
				$("#projectEditFormId #belongProduct").selectpicker('val',belongProductVal);
				$("#projectEditFormId #projectName").val(contractTitleVal);
				$("#closeContractSelectBtn").click();
			}else{
				bootbox.alert(contractSelect_pleaseSelectRecord);
			}
		});
	}
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    };
	ContractSelect.initPickers();
	ContractSelect.initContractSelect();
	//设置查询条件开始时间不能大于结束时间
    $("#contractSelectFormId #signStartDate").on("changeDate",function(e){
    	$("#contractSelectFormId #signEndDate").datepicker("setStartDate",e.date);
    });
    $("#contractSelectFormId #signEndDate").on("changeDate",function(e){
    	$("#contractSelectFormId #signStartDate").datepicker("setEndDate",e.date);
    });
});