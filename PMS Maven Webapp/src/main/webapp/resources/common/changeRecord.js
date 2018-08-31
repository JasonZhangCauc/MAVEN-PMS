/*
 *  @Description：数据变更页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var changekRecordManager ={
	changekRecordInit:function(){
		//我的任务Table
		var $changeRecordGridId = $("#changeRecordTableId");
		//我的任务信息URL
		var $urlChangeRecord = basePath + '/common/changeRecordByParam?changeId='+changeRecord_changeId+'&changeType='+changeRecord_changeType;
		//我的任务显示信息
		var changeRecordColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
		    {"orderable": false,"sWidth": "50","data": "changeByName","sTitle":changeRecord_changeBy},
			{"orderable": false,"sWidth": "50","data": "changeDate","sTitle":changeRecord_changeDate},
			{"orderable": false,"sWidth": "400","data": "changeContent","sTitle":changeRecord_changeContent}
	     ];
		//操作列
		var changeRecordColumnDefs=[{}];
		//我的任务列表初始化
		TableAjax(changeRecordGrid,$changeRecordGridId,$urlChangeRecord,changeRecordColumns,changeRecordColumnDefs,true,true,commonPageLength);
	}
	
};
jQuery(document).ready(function() {
	changekRecordManager.changekRecordInit();
});