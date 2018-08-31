<%--  任务控制台主页面 2018-07-02  --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- BEGIN PAGE BASE CONTENT -->
<div class="portlet box grey-cascade form-fit">
	<div class="row">
	    <div class="col-md-12">
	    	<div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="caption">
                        <i class=" icon-layers font-green"></i>
                        <span class="caption-subject font-green sbold uppercase">任务控制台</span>
                    </div>
                </div>
                <div>
                	<!-- <div class="row">
                		<div class="col-md-12">
							<div class="portlet light portlet-fit bordered query">
						         <div class="portlet-body form">
							         <div class="form-body">
							         	<div class="input-group">
                                                <div class="md-checkbox-inline">
						                        <div class="md-checkbox">
						                            <input type="checkbox" id="taskStatus0" value="1" name="taskStatus" class="md-check">
						                            <label for="taskStatus0">
						                                <span></span>
						                                <span class="check"></span>
						                                <span class="box"></span>新建
						                            </label>
						                        </div>
						                        <div class="md-checkbox">
						                            <input type="checkbox" id="taskStatus1" value="2" name="taskStatus" class="md-check">
						                            <label for="taskStatus1">
						                                <span></span>
						                                <span class="check"></span>
						                                <span class="box"></span>进行中
													</label>
						                        </div>
						                        <div class="md-checkbox">
						                            <input type="checkbox" id="taskStatus2" value="3" name="taskStatus" class="md-check">
						                            <label for="taskStatus2">
						                                <span></span>
						                                <span class="check"></span>
						                                <span class="box"></span>已关闭
													</label>
						                        </div>
						                    </div>
						                 </div>
							         </div>
						         </div>
							</div>   
						</div>
                	</div> -->
                    <div class="row">
                        <div class="col-md-3 col-sm-12">
                        	<div class="portlet box grey-cascade form-fit" style="margin: 20px auto;">
	                        	<div class="portlet-body" style="height: 650px;">
	                            	<ul id="taskDeptManagerTree" class="ztree" style="height:100%;overflow:auto; border-style: none;" ></ul>
	                            </div>
	                        </div>
                        </div>
                        <div class="col-md-9 col-sm-12">
                        	<div class="row">
                        		<div class="col-md-12">
									<div class="portlet light portlet-fit bordered query">
								         <div class="portlet-body form">
									         <div class="form-body">
									         	<div class="input-group">
		                                                <div class="md-checkbox-inline">
								                        <div class="md-checkbox">
								                            <input type="checkbox" id="taskStatus0" value="1" name="taskStatus" class="md-check">
								                            <label for="taskStatus0">
								                                <span></span>
								                                <span class="check"></span>
								                                <span class="box"></span>新建
								                            </label>
								                        </div>
								                        <div class="md-checkbox">
								                            <input type="checkbox" id="taskStatus1" value="2" name="taskStatus" class="md-check">
								                            <label for="taskStatus1">
								                                <span></span>
								                                <span class="check"></span>
								                                <span class="box"></span>进行中
															</label>
								                        </div>
								                        <div class="md-checkbox">
								                            <input type="checkbox" id="taskStatus2" value="3" name="taskStatus" class="md-check">
								                            <label for="taskStatus2">
								                                <span></span>
								                                <span class="check"></span>
								                                <span class="box"></span>已关闭
															</label>
								                        </div>
								                    </div>
								                 </div>
									         </div>
								         </div>
									</div>   
								</div>
                        	</div>
                        	<div class="row">
                        		<div class="col-sm-12">
                        			<input type="hidden" value="" id="selectId" />
		                        	<a style="display: none;" href="" data-target="#taskIssued-modal" data-toggle="modal" id="taskIssuedBtn" />
		                        	<div id="calendar" class="has-toolbar"> </div>
                        		</div>
                        	</div>
                        	
                        </div>
                    </div>
                </div>
            </div>
	    </div>
	</div>
</div>
<!-- 弹出框 --> 
<div id="taskIssued-modal" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div> 
<style>
    /* 日历 */
    #calendar {
        margin: 40px auto;
        padding: 0 10px;
    }
    .fc-time{
    	display:none;
    }

</style>
<script type="text/javascript">
	var treeNodeCopy;//复制树
	
	//定义变量存储所有结点数据
	var zNodes=[];
	var setting = {
		view: {
			selectedMulti: false,
			dblClickExpand: false 
		},
		edit: {
			enable: false,
			editNameSelectAll: false,
			showRemoveBtn: false,
			showRenameBtn: false
		},
		data: {
			simpleData: {
				enable: true,
				idKey: "id", 	// id编号命名 默认
				pIdKey: "pId",  // 父id编号命名 默认
				rootPid: 0
			}
		},
		callback: {
			beforeAsync:null,
			beforeClick:null,
			beforeDblClick:null,
			beforeRightClick:null,
			beforeMouseDown:null,
			beforeMouseUp:null,
			beforeExpand:null,
			beforeCollapse:null,
			beforeRemove:null,
			onAsyncError:null,
			onAsyncSuccess:null,
			onNodeCreated:null,
			onClick:deptUserClick,
			onDblClick:null,
			onRightClick:null,
			onMouseDown:null,
			onMouseUp:null,
			onExpand:null,
			onCollapse:null,
			onRemove:null,
		}
	};
	
	//单击事件，收缩子节点
	function deptUserClick(e,treeId, treeNode){
    	$("#selectId").val(treeNode.id);//给用户ID赋值
    	//根据用户或部门查询任务信息
    	refetchTaskView();
	};
	
	$(document).ready(function(){
		initDeptTree();
		initFullcalendar();
		
		$("input[name='taskStatus']").on("click",function(){
			refetchTaskView();
		});
	});
	
	function initDeptTree(){
		//获取节点数据
		$.ajax({
			url:basePath+"/taskManage/loadDeptUserTree",
			type:"POST",
			dataType:"json",
			async:false,
			data : {
			},
			success:function(data){
				zNodes=data;
			},
			error:function(data){
				showError(data.responseText);
			}
		});
		
		$.fn.zTree.init($("#taskDeptManagerTree"), setting, zNodes);
		var zTree = $.fn.zTree.getZTreeObj("taskDeptManagerTree");
		//默认展开所有结点
		zTree.expandAll(true);
	}
	
	//初始化日历
	function initFullcalendar(taskEvent){
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },  //设置日历头部信息。
            weekends: true, //是否显示周末，设为false则不显示周六和周日。
            height:620, //设置日历的高度，包括header日历头部
            weekMode: 'liquid',
            defaultView: 'month',
            allDayText: '全天',
            businessHours: true,
            firstDay:1, //设置一周中显示的第一天是哪天，周日是0，周一是1
            defaultEventMinutes: 120,
            eventLimit: true,
            dayClick : dataTrClick,
            //设置是否可被单击或者拖动选择
            selectable: true,
            //点击或者拖动选择时，是否显示时间范围的提示信息，该属性只在agenda视图里可用
            selectHelper: true,
            //点击或者拖动选中之后，点击日历外的空白区域是否取消选中状态 true为取消 false为不取消，只有重新选择时才会取消
            unselectAuto: true,
            select: function( start, end ){
                console.log('select触发的开始时间为：', start.format());
                console.log('select触发的结束时间为：', end.format());
            },
            eventClick : function( event ){
				var selectId= $("#selectId").val();
				if(selectId!=null && selectId!="" && selectId!=undefined){
					$("#taskIssuedBtn").attr("href",basePath+"/taskManage/taskConsoleEdit?id="+event.id+"&responsible="+selectId);
					$("#taskIssuedBtn").click();
				}
            },
            eventMouseover:function(calEvent, jsEvent, view){
               var mydiv = document.createElement("div"); 

                  mydiv.setAttribute("id","hint"); 

                  mydiv.style.position="absolute";

                  mydiv.style.width="240px"; 

                  mydiv.style.display="none"; 

                  document.getElementById("timmerDlg").appendChild(mydiv); 
                  
                  var myhint = document.getElementById("hint");

                  myhint.style.display= "block";

                  myhint.style.left= (jsEvent.clientX-90)+"px";

                  
                  myhint.style.top= (jsEvent.clientY-40)+"px";
                  
                  myhint.style.color="white";
                  
                  $("#hint").css("z-index","99");
                  $("#hint").css("background-color","#B2B104");
                  $("#hint").css("padding-left","20px");
                  $("#hint").css("height","20px");
                  $("#hint").css("line-height","150%");
                  myhint.innerHTML=calEvent.title
        	},
            eventMouseover : function( event ) {
                console.log('鼠标经过 ...');
                console.log('eventMouseover被执行，选中Event的title属性值为：', event.title);
            },
            eventMouseout : function( event ) {
                console.log('eventMouseout被执行，选中Event的title属性值为：', event.title);
                console.log('鼠标离开 ...');
            },
            //Event是否可被拖动或者拖拽
            editable: true,
            //Event被拖动时的不透明度
            dragOpacity: 0.5,
            eventDrop : function( event, dayDelta, revertFunc ) {
            	$.ajax({
					url : basePath + '/taskManage/updateTaskIssuedDateOne',
					type : 'POST',
					dataType : 'json',
					async:false ,
					data : {
						selectId : event.id,
						dayDelta : dayDelta._days
					},
				}).done(function(data) {
					refetchTaskView();
				});
            	
            },
            eventResize : function( event, dayDelta, revertFunc ) {
            	$.ajax({
					url : basePath + '/taskManage/updateTaskIssuedDateTwo',
					type : 'POST',
					dataType : 'json',
					async:false ,
					data : {
						selectId : event.id,
						dayDelta : dayDelta._days
					},
				}).done(function(data) {
					refetchTaskView();
				});
            },
            events: []
        });
	};
	
	//日历框单击事件
	function dataTrClick(date){
		var selectId= $("#selectId").val();
		if(selectId!=null && selectId!="" && selectId!=undefined){
			$("#taskIssuedBtn").attr("href",basePath+"/taskManage/taskConsoleEdit?responsible="+selectId+"&taskBeginDate="+moment(date).format("YYYY-MM-DD"));
			$("#taskIssuedBtn").click();
		}
	};
	
	//刷新任务视图
	function refetchTaskView(){
		var selectId= $("#selectId").val();
		var taskStatuslist = [];
		$("input[name='taskStatus']").each(function(index, el) {
			if ($(el).prop("checked") == true) {
				taskStatuslist.push($(el).val());
			}
		});
		//根据用户或部门查询任务信息
    	var taskEvent=[];
    	$.ajax({
			url : basePath + '/taskManage/queryTaskIssendByDpetOrUser',
			type : 'POST',
			dataType : 'json',
			async:false ,
			data : {
				selectId : selectId,
				taskStatus: taskStatuslist+''
			},
		}).done(function(data) {
			$.each(data,function(index,item){
				taskEvent.push({
                   id: item.id,
                   title: "【"+item.expectedTime+"】"+item.theme,
                   start: item.taskBeginDate+' 09:00' ,
                   end: item.taskEndDate+' 18:00',
                   backgroundColor:item.backgroundColor
				})
			});
		});
        //清空原任务
        $("#calendar").fullCalendar("removeEvents");
           //添加当前用户任务信息
    	$("#calendar").fullCalendar("addEventSource",taskEvent);
    	$("#calendar").fullCalendar('refetchResources');
	}
</script>
