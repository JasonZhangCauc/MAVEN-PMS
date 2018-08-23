/*
 *  @Description：编辑页面Js
 *  @author：	${author}
 *  @date：	${nowDate?string("yyyy-MM-dd")}
 */
var ${objectNameLower}Edit = {
	init:function(){
		//保存事件
		$.CurrentNavtab.find("#save${objectNameLower}Btn").on('click', function(event) {
			BJUI.ajax('ajaxform',{
				url:basePath + '/${objectNameLower}/save${objectName}',
				type:"POST",
				form:$.CurrentNavtab.find("#${objectNameLower}EditFormId"),
				validate:true,
				loadingmask:true,
				okCallback:function(json,options){
					$(this).alertmsg('ok',commonSuccessMsg);
					$.CurrentNavtab.find(".btn-close").click();
				}
			});
		});
	}
};