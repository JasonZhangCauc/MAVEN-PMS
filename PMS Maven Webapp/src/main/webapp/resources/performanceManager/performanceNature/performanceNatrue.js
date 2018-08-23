/*
 *  @Description：绩效档案管理主页面JS
 *  @author：               ZHOUMIN
 *  @date：                    2018年2月28日
 */
var performanceNatrue ={
	performanceNatrueInit:function(){
		//绩效管理Table
		var $performanceNatrueGridId = $("#performanceNatrueMianTableId");
		//绩效信息URL
		var $urlPerformanceNatrue = basePath + '/performanceManager/performanceInfoByParam?userId='+performanceNatrue_userId;
		//绩效显示信息
		var performanceNatrueColumns=[
		    {"bVisible": false,"orderable": false,"sWidth": "10","data": "id"},
		    {"orderable": false,"sWidth": "50","data": "row_id","sTitle":commonNumber},
			{"orderable": true,"sWidth": "50","data": "month","sTitle":performanceNatrue_month},
			{"orderable": true,"sWidth": "50","data": "grade","sTitle":performanceNatrue_grade,"render":function(data,type,full){
				return initCodeText(data,codeBasicInfo.grade);
			}},
			{"orderable": true,"sWidth": "50","data": "kpiNumbers","sTitle":performanceNatrue_kpa,"render":function(data,type,full){
				var ret ="";
				if(full.kpiKind=="0"){
					ret+="+"+data;
				}else if(full.kpiKind=="1"){
					ret+="-"+data;
				}
				return ret;
			}},
			{"orderable": true,"sWidth": "50","data": "comments","sTitle":performanceNatrue_comments},
			{"orderable": true,"sWidth": "50","data": "remarks","sTitle":performanceNatrue_remarks},
			{"orderable": false,"sWidth": "100","sTitle":commonOperate}
	     ];
		//操作列
		var performanceNatrueColumnDefs=[{"targets":[7],"data":"id","render":performanceNatrue.grid_performanceNatrue_operation}];
		//绩效列表初始化
		TableAjax(gridPerformanceNatrue,$("#performanceNatrueMianTableId"),$urlPerformanceNatrue,
				performanceNatrueColumns,performanceNatrueColumnDefs,true,true,commonPageLength);
	},
	//用户备选事件操作按钮
	grid_performanceNatrue_operation:function(data,type,full){
		var ret="";
		if(hasEditAuthPerformanceNatrue){
			if(performanceNatrue_yearMonth==full.month){
				ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+performanceNatrue_performancescore+" href='"+basePath+"/performanceManager/performanceManagerEdit?operate=edit&id="+data+
				"' data-target='#newPerformanceModalId' data-toggle='modal'><i class='fa fa-paper-plane-o'>&nbsp</i></a>";
			}else{
				ret += "<a class='btn default btn-sm green-haze tooltips' data-original-title="+commonViewBtn+" href='"+basePath+"/performanceManager/performanceManagerEdit?operate=view&id="+data+
				"' data-target='#newPerformanceModalId' data-toggle='modal'><i class='fa fa-eye'>&nbsp</i></a>";
			}
		}
		ret += "<a class='btn default btn-sm blue tooltips' data-original-title="+commonDatalogBtn+" href='"+basePath+"/common/changeRecordMain?changeType=R00601&changeId="+full.id+
		"' data-target='#changeRecordModalId' data-toggle='modal'><i class='fa fa-files-o'></i></a>";
		
		$(".tooltips").tooltip();
		return ret;
	}
};
jQuery(document).ready(function() {
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
	performanceNatrue.performanceNatrueInit();
});