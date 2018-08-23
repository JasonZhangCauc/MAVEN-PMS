/*
 *  @Description：主页面Js
 *  @author：	raomingyi
 *  @date：	2018-03-05
 */
var userSelect = {
	initUserSelect:function(){
		
		/**************** Contracttable列表 ***************/
		//合同信息Table
		var $userSelectGridId = $("#userSelectTableId");
		//用户管理Form
		var $userSelectFormId = $("#userSelectFormId");
		//用户信息URL
		var $urlUserSelect = basePath + '/systemManage/queryUserSelectByParam?userFlag=0&userType=0&userPosition='+userPosition+'&deptId='+deptId+'&radio='+radio;
		//用户列
		//字段列表 按照百分比计算 累计100%;
		var userSelectColumns = [
            {"orderable": false,"sWidth": "10","data": "id"},
   			{"orderable": true,"sWidth": "40%","data": "userAccount","sTitle":userSelect_workNumber},
   			{"orderable": true,"sWidth": "50%","data": "userName","sTitle":userSelect_userName}
		];
		var userSelectColumnDefs=[{
		    "orderable": false,
	     	"targets":[0],
	    	"data":"id",
	    	"render":function(data,type,full){
	    		var html="";
	    		if(userSelect_userId.indexOf(data) > -1){
	    			if(yesSelectUserId.indexOf(data) == -1){
	    				yesSelectUserId.push(data);
	    			}
	    			if(yesSelectUserName.indexOf(full.userName) == -1){
	    				yesSelectUserName.push(full.userName);
	    			}
	    			if(radio=="1"){ 
	    				html='<label class="mt-radio">'+
	        			'<input type="radio" name="userCheckBox" onchange="userSelect.userChangeFun(this)" value="'+data+'" userName="'+full.userName+'">'+
	        			'<span></span>'+
	        		'</label>';
	    			}else{
	    				html= '<label class="mt-checkbox">'+
	        			'<input type="checkbox" name="userCheckBox" onchange="userSelect.userChangeFun(this)" checked value="'+data+'" userName="'+full.userName+'">'+
	        			'<span></span>'+
	        		'</label>';
	    			} 
	    		}else{
	    			if(radio=="1"){
	    				html='<label class="mt-radio">'+
	        			'<input type="radio" name="userCheckBox" onchange="userSelect.userChangeFun(this)" value="'+data+'" userName="'+full.userName+'">'+
	        			'<span></span>'+
	        		'</label>';
	    			}else{
	    				html='<label class="mt-checkbox">'+
	        			'<input type="checkbox" name="userCheckBox" onchange="userSelect.userChangeFun(this)" value="'+data+'" userName="'+full.userName+'">'+
	        			'<span></span>'+
	        		'</label>';
	    			}
	    		}
	    		return html;
	    	}
		}];
		//用户初始化表格控件
		TableAjax(gridUserSelect,$userSelectGridId,$urlUserSelect,userSelectColumns,userSelectColumnDefs,true,true,commonMaxPageLength);
		
		//用户查询事件
		$("#searchUserSelectBtn").on('click', function(event) {
			if(gridUserSelect.getRowsCount() > 0){
				userSelect_userId=yesSelectUserId;
				event.preventDefault();
				//传FORM参数
				gridUserSelect.clearAjaxParams();
				gridUserSelect.searchFilter($userSelectFormId);
			}else{
				App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: gridUserSelect.getTableWrapper(),
                    place: 'prepend'
                });
			}
		});
		
		//保存
		$("#userSelectBtn").on('click', function(event) {
			if(yesSelectUserId.length>0){
				$("#"+userSelect_hideId).val(yesSelectUserId.join(","));
				$("#"+userSelect_showId).val(yesSelectUserName.join(","));
				$("#closeUserSelectBtn").click();
			}else{
				bootbox.alert(userSelect_pleaseSelectRecord);
			}
		});
	},
	
	//勾选框事件
	userChangeFun:function(event){
		if(radio=="1"){  
			yesSelectUserName=[];
			yesSelectUserId=[];
			if($(event).is(':checked')){
	        	yesSelectUserId.push($(event).val());
	        	yesSelectUserName.push($(event).attr("userName"));
	        }
		}else{
			//点击之后如果变成打钩时触发
			if($(event).is(':checked')){
	        	yesSelectUserId.push($(event).val());
	        	yesSelectUserName.push($(event).attr("userName"));
	        }
	        //点击之后变为不是打钩时触发
	        else
	        {
	        	var idIndex= yesSelectUserId.indexOf($(event).val());
	        	var nameIndex= yesSelectUserName.indexOf($(event).attr("userName"));
	        	yesSelectUserId.splice(idIndex, 1);
	        	yesSelectUserName.splice(nameIndex, 1);
	        }
		}
	}
};
//加载页面
jQuery(document).ready(function() {
	if (!jQuery().dataTable) {
        return;
    };
	userSelect.initUserSelect();
});