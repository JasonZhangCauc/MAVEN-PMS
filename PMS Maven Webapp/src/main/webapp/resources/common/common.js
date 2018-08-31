/*
 * Datatable初始化赋值
 *  @param grid：dataTable对象，调用时序新建如var grid=new Datatable()
 *  @param jq：table对象，如 $("#tableId") 
 *  @param url：table数据加载地址
 *  @param columns：table数据列
 *  @param columnDefs：设置，某一列为超链接
 *  @param pageLength：设置每页显示条数 （当pageLength=-1时，不分页）
 */
function TableAjax(grid,jd,url,columns,columnDefs,bInfo,bPaginate,pageLength,fnRowCallback){
     grid.init({
    	src: jd,
        onSuccess: function (grid, response) {
        },
        onError: function (grid) {
        },
        onDataLoad: function(grid) {
        },
        loadingMessage: 'Loading...',
        dataTable: { 
        	"language": {
        		"aria": {
		            "sortAscending": ": activate to sort column ascending",
		            "sortDescending": ": activate to sort column descending"
		        },
		        "emptyTable": "空",
		        "info": "第 _START_ 条至 _END_ 条 <span class='seperator'>|</span> 共 _TOTAL_ 条",
		        "infoEmpty": "",
		        "infoFiltered": "(filtered1 from _MAX_ total entries)",
		        "lengthMenu": "Show _MENU_",
		        "search": "Search:",
		        "zeroRecords": "No matching records found"
            },
            "ajax": {
                "url": url, // ajax source
            },
            "bAutoWidth": false,                    //不自动计算列宽度 
            "bFilter": false,                       //不使用过滤功能   
            "bLengthChange": false,                 //用户不可改变每页显示数量   
            "processing": false,
            "pageLength": pageLength,               //每页10条数据   
            "columns":columns,						//列名
            "columnDefs":columnDefs,				//行绑定事件
            "bInfo":bInfo,
            "bPaginate":bPaginate,
            "pagingType": "bootstrap_full_number",
            "fnRowCallback" : fnRowCallback
        }
    });
    
    // handle datatable custom tools
     $('#sample_tools > li > a.tool-action').on('click', function() {
        var action = $(this).attr('data-action');
        
        grid.getDataTable().button(action).trigger();
    });
}
/**
 * 菜单点击的时候会触发onclick事件，将 url传入该函数，该函数调用loadPage()方法请求服务器 服务器返回片段页面到前台
 * 正文部分的div加载返回的页面 同时被点击的菜单背景变色其他未被点击的菜单颜色还原为默认
 */
function loadPageMenu(url, jqObj) {
	$("#syssidebar .active").removeClass('active');
	$("#syssidebar .open").removeClass('open');
	$(jqObj).parent("li").addClass('active');
	$(jqObj).parent("li").parent("ul").parent("li").addClass('active');
	$(jqObj).parent("li").parent("ul").parent("li").addClass('open');
	loadPage(url);
}
/**
 * 刷新一部分div调用方法 id：要刷新div的id url：请求页面的url data:传递到后台的值{key:value}
 */
function loadDiv(id, url, data) {
	$("#" + id).empty();
	showLoading(id);
	$("#" + id).load(basePath + "/" + url, data,
			function(response, status, xhr) {
				if (status == 'success') {
					$('#loader').remove();
				}
			});
}
// 报错提示消息modal
function showError(message) {
	if (!message) {
		message = btnCommonOperateFail;
	}
	bootbox.alert(message);
	
}

function showLoading(id) {
	var loaderdiv = '<div id="loader" style="width: 100%; height: 100%；position: fixed; margin-top:300px; ';
	loaderdiv += '  top: 0;';
	loaderdiv += 'left: 0;  ';
	loaderdiv += 'z-index:1001;  ';
	loaderdiv += '-moz-opacity: 0.8;  ';
	loaderdiv += ' opacity:.80;  ';
	loaderdiv += '  filter: alpha(opacity=80);  "></div>';
	$("#" + id).append(loaderdiv);
	document.getElementById("loader").style = 'block';
}
/**
 * 刷新页面统一调用方法
 */
function loadPage(url) {
	try {
		loadDiv('contextLoadDiv', url, null);
	} catch (e) {
		showError(btnCommonOperateFail);
	}
}
/**
 * ajax upload file formId 包含上传文件input的form id fileSelectBtnId 上传文件用的input id
 * 必须使用dom方式获取，jquery 无效 uploadSubmitBtnId 提交上传文件form的button 的id url 接收文件上传的url
 * callback 文件上传成功后的回调方法
 */
function ajaxFileUpload(formId, fileSelectBtnId, uploadSubmitBtnId, url,
		callback) {
	/**
	 * First of all you need to create three variables that hold references to
	 * the <form>, <input>, and <button> elements in your HTML markup.
	 * 
	 */
	var form = $("#" + formId);
	var fileSelect = document.getElementById(fileSelectBtnId);
	;
	var uploadButton = $("#" + uploadSubmitBtnId);
	/**
	 * Next you need to attach an event listener to the form’s onsubmit event
	 * 
	 */
	form.onsubmit = function(event) {
		event.preventDefault();
		// Update button text.
		uploadButton.innerHTML = 'Uploading...';
		// The rest of the code will go here...

	};
	/**
	 * Inside the event listener you start by calling preventDefault() on the
	 * event object passed into the handler. This will prevent the browser from
	 * submitting the form, allowing us to handle the file upload using AJAX
	 * instead.
	 * 
	 * Next you update the innerHTML property on the uploadButton to
	 * Uploading.... This just provides a bit of feedback to the user so they
	 * know the files are uploading.
	 * 
	 * Your next job is to retrieve the FileList from the <input> element and
	 * store this in a variable. You can do this by accessing the files
	 * property.
	 * 
	 */
	// Get the selected files from the input.
	var files = fileSelect.files;
	/**
	 * You then create a new FormData object. This is used to construct the
	 * key/value pairs which form the data payload for the AJAX request.
	 * 
	 */
	// Create a new FormData object.
	var formData = new FormData();
	/**
	 * Your next job is to loop through each of the files in the files array and
	 * add them to the formData object you just created. You’ll also want to
	 * check that the user has selected the type of file you’re expecting.
	 */
	// Loop through each of the selected files.
	for ( var i = 0; i < files.length; i++) {
		var file = files[i];
		// Add the file to the request.
		formData.append('files', file, file.name);
	}
	/**
	 * Here you’re first fetching the current file from the files array and then
	 * checking to make sure it’s an image. The file’s type property will return
	 * the file type as a string. You can therefore use the JavaScript match()
	 * method to ensure that this string matches the desired type. If the file
	 * type does not match, you skip the file by calling continue.
	 * 
	 * You then use the append method on the formData object to add this file to
	 * the data payload. The FormData.append() method is used to handle Files,
	 * Blobs, or Strings.
	 *  // Files formData.append(name, file, filename);
	 *  // Blobs formData.append(name, blob, filename);
	 *  // Strings formData.append(name, value);
	 * 
	 * The first parameter specifies the name of the data entry. This will form
	 * the key in the data payload. The second parameter specifies either a
	 * File, Blob, or String that will be used as the value for the data entry.
	 * When appending a File or Blob you can also specify a filename, but this
	 * isn’t required.
	 */

	/**
	 * Next you need to set up the XMLHttpRequest that is responsible for
	 * communicating with the server. To do this you first need to create a new
	 * XMLHttpRequest object.
	 */
	// Set up the request.
	var xhr = new XMLHttpRequest();
	/**
	 * You now need to create a new connection to the server. You do this using
	 * the open method. This method takes three parameters. The HTTP method, the
	 * url that will handle the request, and a boolean value that determines
	 * whether the request should be dealt with asynchronously.
	 */
	// Open the connection.
	xhr.open('POST', basePath + url, true);
	xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
	/**
	 * Next you need to set up an event listener that will be triggered when the
	 * onload event is fired. Examining the status property of the xhr object
	 * will tell you if the request completed successfully.
	 */
	// Set up a handler for when the request finishes.
	xhr.onload = function() {
		if (xhr.status === 200) {
			// File(s) uploaded.
			uploadButton.innerHTML = 'Upload';
			// 回调函数
			callback(xhr.responseText);
		} else {
			bootbox.alert(xhr.responseText);
		}
	};
	/**
	 * All that’s left to do now is send the request. Pass the formData object
	 * to the send method which is available on the xhr object.
	 */
	// Send the Data.
	xhr.send(formData);
	/**
	 * That’s everything you need to know to start uploading files using AJAX.
	 * Your server-side code will need to extract the files from the request and
	 * process them as desired.
	 */
}
//对Date的扩展，将 Date 转化为指定格式的String
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
//例子： 
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==&gt; 2006-07-02 08:09:04.423 
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==&gt; 2006-7-2 8:9:4.18 
Date.prototype.Format = function (fmt) { //author: meizz 
 var o = {
     "M+": this.getMonth() + 1, //月份 
     "d+": this.getDate(), //日 
     "h+": this.getHours(), //小时 
     "m+": this.getMinutes(), //分 
     "s+": this.getSeconds(), //秒 
     "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
     "S": this.getMilliseconds() //毫秒 
 };
 if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
 for (var k in o)
 if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
 return fmt;
};
$.ajaxSetup({
	complete : function(XMLHttpRequest, textStatus) {
		var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus"); // 通过XMLHttpRequest取得响应头,sessionstatus，

		if (sessionstatus == 'timeout') {
			// alert('登录超时, 请重新登录.');
			location.href = basePath + "/login.jsp"; // 跳转到登陆页面
		}
	}
});

//jquery 对象方法拓展
$.fn.extend({
	/**
	 * 初始化下拉框（码表）
	 * @param selectedValue 选中值
	 * @param data 数据源
	 */
	initDic:function(selectedValue,data){
		  if (null == data || '' == data) return;
		  var jqobj = this;
		  var values = new Array();
		  $(jqobj).empty();
		  if($(jqobj).attr("multiple")!="multiple"){
			  $(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		  }
		  if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			 selectedValue = "";
		  }
		  values = selectedValue.split(",");
		  $.each(data, function(index,item){
			  var option = "";
			  for(var i = 0; i<values.length; i++) {
				  if (values[i] == item.codeValue) {
			          option = "<option selected='selected' value='"+item.codeValue+"'>"+item.codeZh+"</option>";
				  }
			  }
			  if(option=="") {
				  if(item.codeFlag==0){
					  option = "<option value='"+item.codeValue+"'>"+item.codeZh+"</option>";
				  }
			  }
			  $(jqobj).append(option);
		  });
		  if(!arguments[2]){
			  $(jqobj).selectpicker('refresh');
		  }
	},
	/**
	 * 
	 * 刷新一部分div调用方法 id：要刷新div的id url：请求页面的url data:传递到后台的值{key:value}
	 */
	loadDiv:function(id, url, data) {
		$("#" + id).empty();
		//解决返回主页的问题
		if(url == "/common/welcome"){
			location.reload();
		}
		$("#" + id).load(basePath + "/" + url, data,
		function(response, status, xhr) {
			if (status == 'success') {
				$('#loader').remove();
			}
		});
	},
	
	/**
	 * 初始化下拉框 （用户）
	 * @param selectedValue 选中值
	 */
	initUserInfo:function(selectedValue){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		if($(jqobj).attr("multiple")!="multiple"){
			$(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		}
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.each(userBasicInfo, function(index,item){
			var option = "";
			for(var i = 0; i<values.length; i++) {
				if (values[i] == item.id) {
					option = "<option selected='selected' value='"+item.id+"'>"+item.userName+"</option>";
				}
			}
			if(option=="") {
				if(item.userFlag==0){
					option = "<option value='"+item.id+"'>"+item.userName+"</option>";
				}
			}
			$(jqobj).append(option);
	    });
		if(!arguments[2]){
			$(jqobj).selectpicker('refresh');
		}
	},
	
	/**
	 * 初始化下拉框 （商务人员）
	 * @param selectedValue 选中值
	 */
	businessPeople:function(selectedValue){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		if($(jqobj).attr("multiple")!="multiple"){
			$(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		}
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.each(businessPeople, function(index,item){
			var option = "";
			for(var i = 0; i<values.length; i++) {
				if (values[i] == item.id) {
					option = "<option selected='selected' value='"+item.id+"'>"+item.userName+"</option>";
				}
			}
			if(option=="") {
				if(item.userFlag==0){
					option = "<option value='"+item.id+"'>"+item.userName+"</option>";
				}
			}
			$(jqobj).append(option);
	    });
		if(!arguments[2]){
			$(jqobj).selectpicker('refresh');
		}
	},
	/**
	 * 初始化下拉框 （项目负责人）
	 * @param selectedValue 选中值
	 */
	projectPeople:function(selectedValue){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		if($(jqobj).attr("multiple")!="multiple"){
			$(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		}
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.each(projectPeople, function(index,item){
			var option = "";
			for(var i = 0; i<values.length; i++) {
				if (values[i] == item.id) {
					option = "<option selected='selected' value='"+item.id+"'>"+item.userName+"</option>";
				}
			}
			if(option=="") {
				if(item.userFlag==0){
					option = "<option value='"+item.id+"'>"+item.userName+"</option>";
				}
			}
			$(jqobj).append(option);
	    });
		if(!arguments[2]){
			$(jqobj).selectpicker('refresh');
		}
	},
	/**
	 * 初始化下拉框 （产品经理）
	 * @param selectedValue 选中值
	 */
	productManager:function(selectedValue){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		if($(jqobj).attr("multiple")!="multiple"){
			$(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		}
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.each(productManager, function(index,item){
			var option = "";
			for(var i = 0; i<values.length; i++) {
				if (values[i] == item.id) {
					option = "<option selected='selected' value='"+item.id+"'>"+item.userName+"</option>";
				}
			}
			if(option=="") {
				if(item.userFlag==0){
					option = "<option value='"+item.id+"'>"+item.userName+"</option>";
				}
			}
			$(jqobj).append(option);
	    });
		if(!arguments[2]){
			$(jqobj).selectpicker('refresh');
		}
	},
	/**
	 * 初始化下拉框 （次要责任人）
	 * @param selectedValue 选中值
	 */
	responsibleSecondary:function(selectedValue){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		if($(jqobj).attr("multiple")!="multiple"){
			$(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		}
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.each(responsibleSecondary, function(index,item){
			var option = "";
			for(var i = 0; i<values.length; i++) {
				if (values[i] == item.id) {
					option = "<option selected='selected' value='"+item.id+"'>"+item.userName+"</option>";
				}
			}
			if(option=="") {
				if(item.userFlag==0){
					option = "<option value='"+item.id+"'>"+item.userName+"</option>";
				}
			}
			$(jqobj).append(option);
	    });
		if(!arguments[2]){
			$(jqobj).selectpicker('refresh');
		}
	},
	
	/**
	 * 初始化下拉框 （销售人员）
	 * @param selectedValue 选中值
	 */
	initUserInfoSale:function(selectedValue){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		if($(jqobj).attr("multiple")!="multiple"){
			$(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		}
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.each(initUserInfoSale, function(index,item){
			var option = "";
			for(var i = 0; i<values.length; i++) {
				if (values[i] == item.id) {
					option = "<option selected='selected' value='"+item.id+"'>"+item.userName+"</option>";
				}
			}
			if(option=="") {
				if(item.userFlag==0){
					option = "<option value='"+item.id+"'>"+item.userName+"</option>";
				}
			}
			$(jqobj).append(option);
	    });
		if(!arguments[2]){
			$(jqobj).selectpicker('refresh');
		}
	},
	/**
	 * 初始化客户信息 (名称)
	 * @param selectedValue 选中值
	 */
	initCustomerInfo:function(selectedValue){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		if($(jqobj).attr("multiple")!="multiple"){
			$(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		}
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.ajax({
			url: basePath+'/preSalesManage/initCustomerInfo',
			type:"POST",
			dataType:"json",
			async:false
		}).done(function(data) {
			$.each(data, function(index,item){
				var option = "";
				for(var i = 0; i<values.length; i++) {
					if (values[i] == item.id) {
						option = "<option selected='selected' value='"+item.id+"'>"+item.customName+"</option>";
					}
				}
				if(option=="") {
					if(item.status==0){
						option = "<option value='"+item.id+"'>"+item.customName+"</option>";
					}
				}
				$(jqobj).append(option);
		    });
			if(!arguments[2]){
				$(jqobj).selectpicker('refresh');
			}
		});
	},
	
	/**
	 * 初始化客户信息（简称） 
	 * @param selectedValue 选中值
	 */
	initCustomerShortName:function(selectedValue){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		if($(jqobj).attr("multiple")!="multiple"){
			$(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		}
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.ajax({
			url: basePath+'/preSalesManage/initCustomerInfo',
			type:"POST",
			dataType:"json",
			async:false
		}).done(function(data) {
			$.each(data, function(index,item){
				var option = "";
				for(var i = 0; i<values.length; i++) {
					if (values[i] == item.id) {
						option = "<option selected='selected' value='"+item.id+"'>"+item.customShortName+"</option>";
					}
				}
				if(option=="") {
					if(item.status==0){
						option = "<option value='"+item.id+"'>"+item.customShortName+"</option>";
					}
				}
				$(jqobj).append(option);
		    });
			if(!arguments[2]){
				$(jqobj).selectpicker('refresh');
			}
		});
	},
	
	
	
	/**
	 * 初始化销售负责人
	 * @param selectedValue 选中值
	 */
	initUserSaleInfo:function(selectedValue){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		if($(jqobj).attr("multiple")!="multiple"){
			$(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		}
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.ajax({
			url: basePath+'/preSalesManage/initUserSaleInfo',
			type:"POST",
			dataType:"json",
			async:false
		}).done(function(data) {
			$.each(data, function(index,item){
				var option = "";
				for(var i = 0; i<values.length; i++) {
					if (values[i] == item.id) {
						option = "<option selected='selected' value='"+item.id+"'>"+item.customName+"</option>";
					}
				}
				if(option=="") {
					if(item.status==0){
						option = "<option value='"+item.id+"'>"+item.customName+"</option>";
					}
				}
				$(jqobj).append(option);
		    });
			if(!arguments[2]){
				$(jqobj).selectpicker('refresh');
			}
		});
	},
	
	/**
	 * 初始化项目信息
	 * @param selectedValue 选中值
	 */
	initProjectInfo:function(selectedValue){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		if($(jqobj).attr("multiple")!="multiple"){
			$(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		}
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.ajax({
			url: basePath+'/projectManager/getAllProjectInfo',
			type:"POST",
			dataType:"json",
			async:false
		}).done(function(data) {
			$.each(data, function(index,item){
				var option = "";
				for(var i = 0; i<values.length; i++) {
					if (values[i] == item.id) {
						option = "<option selected='selected' value='"+item.id+"'>"+item.projectNo+"</option>";
					}
				}
				if(option=="") {
					if(item.projectFlag==0){
						option = "<option value='"+item.id+"'>"+item.projectNo+"</option>";
					}
				}
				$(jqobj).append(option);
		    });
			if(!arguments[2]){
				$(jqobj).selectpicker('refresh');
			}
		});
	},
	/**
	 * 工时登记项目选择
	 * @param selectedValue 选中值
	 */
	initRecordProjectInfo:function(selectedValue){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		if($(jqobj).attr("multiple")!="multiple"){
			$(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		}
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.ajax({
			url: basePath+'/projectManage/getAllRecordProjectInfo',
			type:"POST",
			dataType:"json",
			async:false
		}).done(function(data) {
			
			$.each(data, function(index,item){
				var option = "";
				for(var i = 0; i<values.length; i++) {
					if (values[i] == item.id) {
						option = "<option selected='selected' value='"+item.id+"'>"+item.projectName+"</option>";
					}
				}
				if(option=="") {					
						option = "<option value='"+item.id+"'>"+item.projectName+"</option>";
				}
				$(jqobj).append(option);
		    });
			if(!arguments[2]){
				$(jqobj).selectpicker('refresh');
			}
		});
	},
	/**
	 * 根据客户ID查询维护的联系人员
	 * @param selectedValue 选中值
	 * @param  数据源
	 */
	initCusLinker:function(selectedValue,parma){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		$(jqobj).append("<option value=''>"+pleaseselect+"</option>");
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.ajax({
			url: basePath+'/preSalesManage/initCusLinker',
			type:"POST",
			dataType:"json",
			data:{customId:parma},
			async:false
		}).done(function(data) {
			$.each(data, function(index,item){
				var option = "";
				for(var i = 0; i<values.length; i++) {
					if (values[i] == item.id) {
						option = "<option selected='selected' value='"+item.id+"'>"+item.contactName+"</option>";
					}
				}
				if(option=="") {
					if(item.status==0){
						option = "<option value='"+item.id+"'>"+item.contactName+"</option>";
					}
				}
				$(jqobj).append(option);
		    });
			if(!arguments[2]){
				$(jqobj).selectpicker('refresh');
			}
		});
	},
	
	/**
	 * 根据父级码表值
	 * @param selectedValue 选中值
	 * @param  数据源
	 */
	initParentCode:function(selectedValue){
		var jqobj = this;
		var values = new Array();
		$(jqobj).empty();
		if($(jqobj).attr("multiple")!="multiple"){
		  $(jqobj).append("<option value=''>"+pleaseselect+"</option>");
	    }
		if((selectedValue==null||selectedValue==""||selectedValue==undefined)){
			selectedValue = "";
		}
		values = selectedValue.split(",");
		$.ajax({
			url: basePath+'/systemManage/initParentCode',
			type:"POST",
			dataType:"json",
			data:{},
			async:false
		}).done(function(data) {
			$.each(data, function(index,item){
				var option = "";
				for(var i = 0; i<values.length; i++) {
					if (values[i] == item.codeType) {
						option = "<option selected='selected' value='"+item.codeType+"'>"+item.codeZh+"</option>";
					}
				}
				if(option=="") {
					option = "<option value='"+item.codeType+"'>"+item.codeZh+"</option>";
				}
				$(jqobj).append(option);
		    });
			if(!arguments[2]){
				$(jqobj).selectpicker('refresh');
			}
		});
	},
	
	//from表单内容转换成json对象
	serializeObject:function(){
		var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
	        if (o[this.name] !== undefined) {
	        	
	            if (!o[this.name].push) {
	                o[this.name] = [o[this.name]];
	            }
	            o[this.name].push(this.value || '');
	        } else {
	            o[this.name] = this.value || '';
	        }
	    });
	    return o;
	},
	
	serializeFormJson:function(){
		var o = {};
        $('textarea.form-control,input.date-picker,input.form-control,input.form-filter:not([type="radio"],[type="checkbox"])', this).each(function() {
        	if (o[$(this).attr("name")] !== undefined) {
        		if (!o[$(this).attr("name")].push) {
	                o[$(this).attr("name")] = [o[$(this).attr("name")]];
	            }
	            o[$(this).attr("name")].push($(this).val());
        	}else {
	            o[$(this).attr("name")]=$(this).val();
	        }
        });
        
        // get all select
        $('select.form-filter', this).each(function() {
        	var selectValFlag;
        	if($(this).val()!=null && $(this).val()!="" && $(this).val()!=undefined){
        		selectValFlag=true;
        	}else{
        		selectValFlag=false;
        	}
        	if (o[$(this).attr("name")] !== undefined) {
        		if (!o[$(this).attr("name")].push) {
	                o[$(this).attr("name")] = [o[$(this).attr("name")]];
	            }
	            o[$(this).attr("name")].push(selectValFlag?$(this).find("option:selected").text():'');
        	}else {
	            o[$(this).attr("name")]= selectValFlag?$(this).find("option:selected").text():'';
	        }
        });

        // get all checkboxes
        $('input[type="checkbox"]:checked', this).each(function() {
        	if (o[$(this).attr("name")] !== undefined) {
        		if (!o[$(this).attr("name")].push) {
	                o[$(this).attr("name")] = [o[$(this).attr("name")]];
	            }
	            o[$(this).attr("name")].push($(this).attr("title"));
        	}else {
	            o[$(this).attr("name")]=$(this).attr("title");
	        }
        });

        // get all radio buttons
        $('input[type="radio"]:checked', this).each(function() {
        	if (o[$(this).attr("name")] !== undefined) {
        		if (!o[$(this).attr("name")].push) {
	                o[$(this).attr("name")] = [o[$(this).attr("name")]];
	            }
	            o[$(this).attr("name")].push($(this).attr("title"));
        	}else {
	            o[$(this).attr("name")]=$(this).attr("title");
	        }
        });
        return o;
	}
	
});

/**
 * 根据字典加密ID获取字典文本(encrypedId:加密后的字典主键；data:该字典所属类型集合)
 */
function initCodeText(encrypedId,data){
  if (null == encrypedId || '' == encrypedId) return "";
  if (null == data || '' == data) return "";
  var values = encrypedId.split(",");
  var text = "";
  $.each(data, function(index,item){
	  for(var i = 0; i<values.length; i++) {
		  if (values[i] == item.codeValue) {
			  text+= item.codeZh+",";
		  }
	  }
  });
  return text.substring(0,text.length-1);
}

/**
 * 选择部门信息返回函数
 * @param nodes
 * @param param {hiddenId:hiddenId,showId:showId}
 */
function chooseDeptCallBackFun(nodes,param){
	var names = [];
	var ids = [];
	$(nodes).each(function(idx,ele){
		ids.push(ele.id);
		names.push(ele.name);
	});
	$("#"+param.showId).val(names+"");
	$("#"+param.showId).attr("title",names+"");
	$("#"+param.hiddenId).val(ids+"").change();
}

/**
 * 根据id查询公司名称(可以是单个id也可以是多个id，逗号隔开)
 * 
 * @author zhangbin
 * @param ids
 * @returns
 */
function getDeptByIds(ids) {
	if (null == ids || '' == ids){
		return "";
	}
	if (null == deptJson || '' == deptJson){
		return "";
	}
	var values = ids.split(",");
	var text = "";
	$.each(deptJson, function(index, item) {
		for ( var i = 0; i < values.length; i++) {
			if (values[i] == item.id) {
				text += item.deptName + ",";
			}
		}
	});
	return text.substring(0, text.length - 1);
}

/**
 * @param _webUploaderId 插件对应ID 必输
 * @param _fileAddId 文件新增ID
 * @param _fileAddIdContinue 文件继续新增按钮 必输
 * @param _dataId 上传文件对应数据ID 必输
 * @param _pageType 上传文件对应功能编码 必输
 * @param _extensions 上传文件格式 非必输
 * @param _editFileId 编辑框对应ID 必输
 */
function initWebUploaderUI(opt) {
    // 设置全局变量wuploader。  前三个参数对应的是jsp页面的div的id，最后一个参数，是后台的上传方法名字
    var wuploader = CommonWebUploader.initWebUploader({
    	_webUploaderId:opt._webUploaderId,
    	_fileAddId:opt._fileAddId,
    	_dataId:opt._dataId,
    	_pageType:opt._pageType,
    	_editFileId:opt._editFileId});   
}

/**
 * @param _dataId 上传文件对应数据ID 必输
 * @param _pageType 上传文件对应功能编码 必输
 * @param _editFileId 编辑框对应ID 必输
 * 
 */
function initEidtUploaderUI(opt){
	$(opt._editFileId).empty();
	$.ajax({
		url:basePath+'/common/getAllFile',
		type: 'POST',
		data: {dataId:opt._dataId,pageType:opt._pageType},
		dataType: 'json',
		success:function(event){
			$(opt._editFileId).editableGallery({
	            //此处可根据自己的需要进行修改参数，我这里第一个参数：一条数据的ID，第二个参数：这条数据的类型（不需要，可不要），第三个参数：这条数据对应的多张图片的路径集合
	            urls: event,    //2表示模块:文件类型    
	            canDelete: opt._canDelete     //这个参数定义，鼠标移动到图片上时，显示删除按钮 （查看时，不需要编辑图片，可不要这个属性）
	        });
		}
	});
}

/**
 * 附件下载链接
 * @param _dataId 上传文件对应数据ID 必输
 * @param _pageType 上传文件对应功能编码 必输
 */
function initAttachmentDownload(opt){
	var dowmLoadHtml="";
	$.ajax({
		url:basePath+'/common/getAllFile',
		type: 'POST',
		data: {dataId:opt._dataId,pageType:opt._pageType},
		dataType: 'json',
		async:false,
		success:function(event){
			$.each(event, function(index, element) {
				dowmLoadHtml+='<a onclick="downAttachment(\''+element.id+'\')">'+element.fileName+'</a>&nbsp;&nbsp;';
			});
		}
	});
	return dowmLoadHtml;
}

/**
 * 提示公共方法
 */
function initAttasConfirmWal(iniData){
	swal({
	    title: iniData.sa_title,//标题（文本）
	    text: iniData.sa_message,//提示信息（文本）
	    type: iniData.sa_type,//显示的图标类型（成功/错误/警告/信息）
	    allowOutsideClick: iniData.sa_allowOutsideClick,//
	    showConfirmButton: iniData.sa_showConfirmButton,//显示确认按钮（true / false）
	    showCancelButton: iniData.sa_showCancelButton,//显示取消按钮（真/假）
	    confirmButtonClass: iniData.sa_confirmButtonClass,
	    cancelButtonClass: iniData.sa_cancelButtonClass,
	    closeOnConfirm: iniData.sa_closeOnConfirm,//单击确认按钮时，定义Sweet Alert是否关闭（true / false）
	    closeOnCancel: iniData.sa_closeOnCancel,//点击取消按钮时是否关闭（true / false）
	    confirmButtonText: iniData.sa_confirmButtonText,//确认按钮文本（文本）
	    cancelButtonText: iniData.sa_cancelButtonText,//提醒取消按钮文本（文本）
	},
	function(isConfirm){
        if (isConfirm){
        	iniData.sa_ajaxFuntion();
        } else {
        	initAttasInfoWal({sa_title:"您取消了该操作！", sa_type:"error", sa_confirmButtonClass:"btn-danger"});
        }
	});
}

function initAttasInfoWal(iniData){
	swal({
	    title: iniData.sa_title,//标题（文本）
	    type: iniData.sa_type,//显示的图标类型（成功/错误/警告/信息）
	    confirmButtonClass: iniData.sa_confirmButtonClass,
	});
}

function initAlertsAppendWal(iniData){
	App.alert({  
		container:"#bootstrap_alerts_demo", // alerts parent container 
		place: 'append', // append or prepent in container 
		type: iniData.ap_type, // alert's type 
		message: iniData.ap_message, // alert's message
        close: true, // make alert closable 
        reset: false, // close all previouse alerts first 
        focus: true, // auto scroll to the alert after shown 
        closeInSeconds: 1, // auto close after defined seconds
        icon: iniData.ap_icon // put icon class before the message });
    });
}

/**
 * 根据附件ID下载附件
 * @param id
 */
function downAttachment(id){
	window.open(basePath+'/common/downloadFile?fileid='+id);
}

/*
 * 判断用户权限 sourceCode:资源编码code return：Boolean
 */
function isUserHasAuth(sourceCode) {
	var retBool = false;
	$.ajax({
		url : basePath + "/common/isUserHasAuth",
		dataType : "json",
		type : 'POST',
		data : {
			sourceCode : sourceCode
		},
		async : false,
		success : function(data) {
			retBool = data;
		},
		error : function(data) {
			retBool = false;
		}
	});
	return retBool;
}

/**
 * 任务处理界面
 */
function taskDispose(id,opeart){
	$("#taskTabs").click();
	var taskInterval= setInterval(function(){
		$("#taskModelIndex").attr("href",basePath+"/taskManager/myTaskEdit?operate=edit&id="+id);
		$("#taskModelIndex").click();
		clearInterval(taskInterval);
	},500);
}

/**
 * 快捷方式
 * @param type 类型
 */
function addShortcutFun(type){
	if(type==1){//客户维护
		$("#addShortcutId").attr("addtabs","R002_01");
		$("#addShortcutId").attr("url","preSalesManage/customManageMain");
		$("#addShortcutId").attr("title","客户维护");
		$("#addShortcutId").click();
		var shortcutInterval1= setInterval(function(){
			$("#customrAddId").click();
			clearInterval(shortcutInterval1);
		},500);
	}else if(type==2){ //合同维护
		$("#addShortcutId").attr("addtabs","R003_01");
		$("#addShortcutId").attr("url","contractmanage/contractManageMain");
		$("#addShortcutId").attr("title","合同维护");
		$("#addShortcutId").click();
		var shortcutInterval2= setInterval(function(){
			$("#contractAddId").click();
			clearInterval(shortcutInterval2);
		},500);
	}else if(type==3){ //项目立项
		$("#addShortcutId").attr("addtabs","R00401_01");
		$("#addShortcutId").attr("url","projectManager/projectManagerEdit?operate=add");
		$("#addShortcutId").attr("title","项目新增");
		$("#addShortcutId").click();
	}else if(type==4){ //任务分派
		$("#addShortcutId").attr("addtabs","R005_01");
		$("#addShortcutId").attr("url","taskManager/taskAssignManagerMain");
		$("#addShortcutId").attr("title","任务分派");
		$("#addShortcutId").click();
		var shortcutInterval4= setInterval(function(){
			$("#taskAddId").click();
			clearInterval(shortcutInterval4);
		},500);
	}else if(type==5){ //日报管理
		$("#addShortcutId").attr("addtabs","R006_02");
		$("#addShortcutId").attr("url","dailyReportManager/dailyReportManagerMain");
		$("#addShortcutId").attr("title","日报管理");
		$("#addShortcutId").click();
		var shortcutInterval5= setInterval(function(){
			$("#dailyReportAddId").click();
			clearInterval(shortcutInterval5);
		},500);
	}else if(type==6){ //月报管理
		$("#addShortcutId").attr("addtabs","R006_03");
		$("#addShortcutId").attr("url","monthReportManager/monthReportManagerMain");
		$("#addShortcutId").attr("title","月报管理");
		$("#addShortcutId").click();
		var shortcutInterval6= setInterval(function(){
			$("#monthReportAddId").click();
			clearInterval(shortcutInterval6);
		},500);
	}
}

/**
 * 跳转到帮助页面
 */
function toHelper(parent, child) {
	window.open(basePath+"/helper/helperMain?parent="+parent+"&child="+child, "_helper");
}

/** 
 * 获取form被修改信息 
 * 
 * @param jsonForm 对应修改的form序列化后的json数据 
 * @param row 对应修改选中的数据源 
 * @param columnJSModel 为表单form中name属性中英对照js，需在update.jsp中引用此js文件 
 * @Return 更改内容
 * 
 */
function getModifiedField(jsonForm,row,columnJSModel){ 
	 var changeVal="";
	 for(key in jsonForm){ 
		 //form中""或null，但数据源datagrid中为null或""时，不进行比较 
		 if(!((jsonForm[key] == null || jsonForm[key] == '' || jsonForm[key]== undefined) 
				 && (row[key] == null || row[key] == '' || row[key] == undefined) 
				 && columnJSModel[key] != undefined && columnJSModel[key] !="" 
			     && columnJSModel[key] !=null && columnJSModel[key] != "undefined" )){ 
			 //如果值不同，则返回true 
			 if(jsonForm[key] != row[key] && key!=null && key!='undefined' 
				 	&& key!="" && key!=undefined){ 
				 if(changeVal!=null && changeVal!="" && changeVal!=undefined){
					 changeVal+=","+columnJSModel[key]+"</span>:由（"+ row[key] + "）变更为（" + jsonForm[key]+"）";
				 }else{
					 changeVal+=columnJSModel[key]+":由（"+ row[key] + "）变更为（" + jsonForm[key]+"）";
				 }
				 
			 } 
		 } 
	 } 
	 return changeVal; 
}

/**
 * 签卡
 */
function chickinonOrdown(type) {
    $.ajax({
        type: 'POST',
        url: basePath + '/checkinginManage/doChickin',
		dataType: 'json',
		data:{
			"chickinType":type,
			"chickinBy":chickinBy,
			"bqType":1
		},
		success:function(event){
		     $("#searchChickinBaseInfoBtn").click();
		     initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
		}
    });
}
 