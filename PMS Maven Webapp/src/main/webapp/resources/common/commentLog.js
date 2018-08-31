//注释公共界面js
var commentLog={
	initComment:function(){
		//用户信息保存
    	$("#saveComment").click(function(){
    		$("#commentFormId").submit();
    	});
    	
    	//用户信息验证
    	$("#commentFormId").validator({
    		valid:function(from){
    			$.ajax({
    				url:basePath+'/common/saveComment',
    				type: 'POST',
    				data: $("#commentFormId").serialize(),
    				dataType: 'json',
    				success:function(event){
    					initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
    				}
    			});
    		}
    	});
	}
};
//加载页面
jQuery(document).ready(function() {
	commentLog.initComment();
});