/**主页 初始菜单数据源、初始主页参数 HuangPeng 2017年8月1日*/
var menu = function () {

    return {
        init: function () {
        	//登出
        	$("#menuLogoutId").click(function(){
        		window.location.href=basePath+"/common/logout";	
        	});
        	
        	//在页面加载完成之后 请求加载菜单的url 服务器根据当前session用户权限 查询应该显示的菜单 拼接成应该显示的html代码返回
        	$.ajax({
        		url : basePath + '/common/loadMenu?date=' + new Date(),
        		type : 'post',
        		dataType : 'json',
        		success : function(data) {
        			$("#syssidebar").append(data);
        		}
        	});
        	
        	//初始化码表数据
        	$.ajax({
                type: "GET",
                url: basePath+"/systemManage/initCodeInfo",
                dataType: "json",
                async:false,
                success: function(data){
               	   codeBasicInfo = data;
                }
           });
        	
        	//初始化部门数据
        	$.ajax({
        		url: basePath+'/systemManage/initDeptData',
        		type:"POST",
        		dataType:"json",
        		async:false
        	}).done(function(data) {
        		deptJson = data;
        	});
        	
        	//初始化人员数据
        	$.ajax({
        		url: basePath+'/systemManage/initUserInfo',
        		type:"POST",
        		dataType:"json",
        		async:false
        	}).done(function(data) {
        		userBasicInfo = data;
        	});
        	
        	//初始化销售人员数据
        	$.ajax({
        		url: basePath+'/systemManage/initUserInfoSale',
        		type:"POST",
        		dataType:"json",
        		async:false
        	}).done(function(data) { 
        		initUserInfoSale = data;
        	});
        	//初始化商务人员
        	$.ajax({
        		url: basePath+'/systemManage/businessPeople',
        		type:"POST",
        		dataType:"json",
        		async:false
        	}).done(function(data) {
        		businessPeople = data;
        	});
        	//初始项目负责人
        	$.ajax({
        		url: basePath+'/systemManage/projectPeople',
        		type:"POST",
        		dataType:"json",
        		async:false
        	}).done(function(data) {
        		projectPeople = data;
        	});
        	//初始产品经理
        	$.ajax({
        		url: basePath+'/systemManage/productManager',
        		type:"POST",
        		dataType:"json",
        		async:false
        	}).done(function(data) {
        		productManager = data;
        	});
        	//初始次要负责人
        	$.ajax({
        		url: basePath+'/systemManage/responsibleSecondary',
        		type:"POST",
        		dataType:"json",
        		async:false
        	}).done(function(data) {
        		responsibleSecondary = data;
        	});
        	
        	/*//初始化客户数据
        	$.ajax({
        		url: basePath+'/presalemanage/initCustomerInfo',
        		type:"POST",
        		dataType:"json",
        		async:false
        	}).done(function(data) {
        		customerBasicInfo = data;
        	});*/
        	
        	$('.mt-sweetalert').each(function(){
        		var sa_title = $(this).data('title');
        		var sa_message = $(this).data('message');
        		var sa_type = $(this).data('type');	
        		var sa_allowOutsideClick = $(this).data('allow-outside-click');
        		var sa_showConfirmButton = $(this).data('show-confirm-button');
        		var sa_showCancelButton = $(this).data('show-cancel-button');
        		var sa_closeOnConfirm = $(this).data('close-on-confirm');
        		var sa_closeOnCancel = $(this).data('close-on-cancel');
        		var sa_confirmButtonText = $(this).data('confirm-button-text');
        		var sa_cancelButtonText = $(this).data('cancel-button-text');
        		var sa_popupTitleSuccess = $(this).data('popup-title-success');
        		var sa_popupMessageSuccess = $(this).data('popup-message-success');
        		var sa_popupTitleCancel = $(this).data('popup-title-cancel');
        		var sa_popupMessageCancel = $(this).data('popup-message-cancel');
        		var sa_confirmButtonClass = $(this).data('confirm-button-class');
        		var sa_cancelButtonClass = $(this).data('cancel-button-class');
        	
        		$(this).click(function(){
        			//console.log(sa_btnClass);
        			swal({
					  title: sa_title,//标题（文本）
					  text: sa_message,//提示信息（文本）
					  type: sa_type,//显示的图标类型（成功/错误/警告/信息）
					  allowOutsideClick: sa_allowOutsideClick,//
					  showConfirmButton: sa_showConfirmButton,//显示确认按钮（true / false）
					  showCancelButton: sa_showCancelButton,//显示取消按钮（真/假）
					  confirmButtonClass: sa_confirmButtonClass,
					  cancelButtonClass: sa_cancelButtonClass,
					  closeOnConfirm: sa_closeOnConfirm,//单击确认按钮时，定义Sweet Alert是否关闭（true / false）
					  closeOnCancel: sa_closeOnCancel,//点击取消按钮时是否关闭（true / false）
					  confirmButtonText: sa_confirmButtonText,//确认按钮文本（文本）
					  cancelButtonText: sa_cancelButtonText,//提醒取消按钮文本（文本）
					},
					function(isConfirm){
				        if (isConfirm){
				        	swal(sa_popupTitleSuccess, sa_popupMessageSuccess, "success");
				        } else {
							swal(sa_popupTitleCancel, sa_popupMessageCancel, "error");
				        }
					});
        		});
        	});  
    	}
    }

}();

jQuery(document).ready(function() {
	menu.init();
});
