/*
 *  @Description：资源选择界面
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var assignResource={
	/**
	 * 初始化资源列表
	 */
	initResourceTree:function(){
		$.fn.zTree.destroy("roleResourceTree");
	    $.fn.zTree.init($("#roleResourceTree"),
			{
				check : {
					enable : true,
					chkDisabledInherit : true,
					chkDisabled : true,
					chkStyle : "checkbox",
					chkboxType : {
						"Y" : "ps",
						"N" : "s"
					}
				},
				data : {
					simpleData : {
						enable : true,
						idKey : "id",
						pIdKey : "pId",
						rootPId : -1
					}
				},
				view : {
					fontCss : {
						color : "black"
					}
				},
				async : {
					url : basePath+ '/systemManage/loadRoleResourceTree',
					enable : true,
					type : 'GET'
				}
			}, []
		);
	},
	/**
	 * 加载角色对应资源
	 */
	initRoleResource:function(roleId){
		var treeObj = $.fn.zTree.getZTreeObj("roleResourceTree");
		treeObj.checkAllNodes(false);
		treeObj.expandAll(false);
		$.ajax({
			url : basePath + '/systemManage/loadRoleResourceId',
			type : 'POST',
			dataType : 'json',
			data : {
				roleId : roleId
			},
			async : false
		})
		.done(function(data) {
			//根据角色回传的资源id选中该角色应该有的权限资源
			$(data).each(function(index,element) {
				var treenode = treeObj.getNodeByParam("id", element, null);
				treeObj.checkNode(treenode,true);
	            treeObj.expandNode(treenode, true, true, true);
			});
		}).fail(function(data) {
			showError(data.responseText);
		});
	} 
};

//加载页面
jQuery(document).ready(function() {
	assignResource.initResourceTree();
});