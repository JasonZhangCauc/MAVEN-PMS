/*
 *  @Description：报销基本信息编辑/新增界面JS
 *  @author：              zlshi
 *  @date：                    2018年8月7日
 */
taxiApplyEdit={
		initTaxiApplyEdit:function () {
			//打车报销信息保存
			$("#taxiApplyEditAdd").click(function(){
				$("#taxiApplyEditFormId").submit();
			});

			//打车报销信息验证
			$("#taxiApplyEditFormId").validator({
				valid:function(from){
					$("#taxiApplyEditFormId #changeDetails").val(getModifiedField($("#taxiApplyEditFormId").serializeFormJson(),reimburseBaseInfoOldVal,reimburseBaseInfoField));
					$.ajax({
						url:basePath+'/applyManage/saveTaxiBill',
						type: 'POST',
						data: $("#taxiApplyEditFormId").serialize(),
						success:function(event){
							$("#closetaxiApplyEdit").click();
							$("#searchTaxiApplyBtn").click();
							initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
						}
					});
				}
			});
		},
};

//选择日期不能超过当前日期
$("#taxiApplyEditFormId #reimburseDate").datepicker("setEndDate",new Date());


//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
		return;
	}
	//初始化下拉框及日期控件
	$('.bs-select').selectpicker({
		iconBase: 'fa',
		tickIcon: 'fa-check'
	});
	$('.date-picker').datepicker({
		rtl: App.isRTL(),
		autoclose: true
	});
	
	$(".form_datetime").datetimepicker({
		language: 'zh-CN',//显示中文
	    autoclose: true,
	    isRTL: App.isRTL(),
	    format: "hh:ii",
	    fontAwesome: true,
	    pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left")
	});
	
	taxiApplyEdit.initTaxiApplyEdit();
});

