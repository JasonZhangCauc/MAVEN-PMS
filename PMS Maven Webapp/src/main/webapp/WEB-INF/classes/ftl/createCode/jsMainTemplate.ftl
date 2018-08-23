/*
 *  @Description：主页面Js
 *  @author：	${author}
 *  @date：	${nowDate?string("yyyy-MM-dd")}
 */
var ${objectNameLower}Main = {
	init:function(){
		/**************** table列表 ***************/
		//字段列表 按照百分比计算 累计100%;
		var ${objectNameLower}MainColumns = [
		<#list fieldList as var>
			{name:'${var.reColName}',label:${objectNameLower}Main_${var.reColName},width:'10%',align:'center'},    
		</#list>
			{name:'id',label:commonOperate,width:'10%',align:'center',quicksort:false,menu:false,render:${objectNameLower}Main.${objectNameLower}Main_operation}
		];
		
		//初始化DataGrid赋值
		TableAjax({
			grid_title:${objectNameLower}MainTableTile,
			grid_tableId:"#${objectNameLower}MianTableId", 	
			grid_dataUrl:basePath + '/${objectNameLower}/${objectNameLower}InfoByParam',			 
			grid_showTool:false,
			grid_ispage:commonPageLength,
			grid_columns:${objectNameLower}MainColumns,         
			grid_toolHtml:false
		});
		
		//查询
		$.CurrentNavtab.find("#${objectNameLower}SearchBtn").on('click', function(event) {
			$.CurrentNavtab.find(".moreView").css("display","none");
			$.CurrentNavtab.find("#${objectNameLower}MianTableId").datagrid('filter',serializeObject($.CurrentNavtab.find("#userMianTableId"))); 
		});
		//新增
		$.CurrentNavtab.find("#${objectNameLower}AddBtn").on('click', function(event) {
			${objectNameLower}Main.edit${objectNameLower}NavtabFun();
		});
	},
	//主信息主事件操作按钮
	${objectNameLower}Main_operation:function(value, row){
		var html="";
		    html +='<button class="btn btn-blue" data-icon="fa-edit" onclick=\"${objectNameLower}Main.edit${objectNameLower}NavtabFun(\''+ row.id + '\',\'edit\')">'+commonAddBtn+'</button>';
		    html +='<button class="btn btn-red" data-icon="times" onclick=\"${objectNameLower}Main.delete${objectNameLower}Fun(\''+ row.id + '\')">'+commonDelBtn+'</button>';
		return  html;
	},
	//新增、编辑用户事件
	edit${objectNameLower}NavtabFun:function(id,operate){
		//tab页面Title名称
		var pageTitle;
		var tabId = "${objectNameLower}";
		//编辑
		if(operate == "edit"){
			pageTitle = ${objectName}Title+"-"+commonEditBtn;
		}else if(operate == "view"){//查看
			pageTitle = ${objectName}Title+"-"+commonQueryBtn;
		}else{//新增
			pageTitle = ${objectName}Title+"-"+commonAddBtn;
		}
		//弹框地址获取数据源
		var url=basePath + '/${objectNameLower}/${objectNameLower}Edit';
		var params={
			id:id,
			operate:operate
		};
		
		//打开tab页
		$(this).navtab({
			id : tabId,
			url : url,
			title : pageTitle,
			data : params,
			type : 'POST'
		});
	},
	// 删除数据信息
	delete${objectNameLower}Fun : function(id){
		BJUI.ajax('doajax', {
			url : basePath + "/${objectNameLower}/delete${objectName}",
			type : "POST",
			data : {
				id : id
			},
			loadingmask : true,
			confirmMsg : commonConfirmTodelete,
			okCallback : function(json, options) {
				$(this).alertmsg('ok', commonSuccessMsg);
				${objectNameLower}Main.${objectNameLower}dataGridRefresh();
			}
		});
	},
	//刷新数据列表
	${objectNameLower}dataGridRefresh:function(){
		$.CurrentNavtab.find("#${objectNameLower}MianTableId").datagrid('refresh'); 
	}
};