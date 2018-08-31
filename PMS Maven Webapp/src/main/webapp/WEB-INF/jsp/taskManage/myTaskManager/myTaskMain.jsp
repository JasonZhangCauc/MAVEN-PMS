<!-- 我的任务主界面  ZHOUMIN 20180305 -->
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
                        <span class="caption-subject font-green sbold uppercase">我的任务</span>
                    </div>
                </div>
                <div>
                	<div class="row">
                		<div class="col-md-12">
							<div class="portlet light portlet-fit bordered query">
						         <div class="portlet-body form">
							         <div class="form-body">
							         	<div class="input-group">
                                            <div class="md-checkbox-inline">
						                        <div class="md-checkbox">
						                            <input type="checkbox" id="myTaskStatus0" value="1" name="myTaskStatus" class="md-check">
						                            <label for="myTaskStatus0">
						                                <span></span>
						                                <span class="check"></span>
						                                <span class="box"></span>新建
						                            </label>
						                        </div>
						                        <div class="md-checkbox">
						                            <input type="checkbox" id="myTaskStatus1" value="2" name="myTaskStatus" class="md-check">
						                            <label for="myTaskStatus1">
						                                <span></span>
						                                <span class="check"></span>
						                                <span class="box"></span>进行中
													</label>
						                        </div>
						                        <div class="md-checkbox">
						                            <input type="checkbox" id="myTaskStatus2" value="3" name="myTaskStatus" class="md-check">
						                            <label for="myTaskStatus2">
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
                        <div class="col-md-12 col-sm-12">
                        	<input type="hidden" value="" id="selectId" />
                        	<a style="display: none;" href="" data-target="#myTaskIssued-modal" data-toggle="modal" id="myTaskIssuedBtn" />
                        	<div id="myCalendar" class="has-toolbar"> </div>
                        </div>
                    </div>
                </div>
            </div>
	    </div>
	</div>
</div>
<!-- 弹出框 --> 
<div id="myTaskIssued-modal" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div> 
<style>
    /* 日历 */
    #myCalendar {
        margin: 40px auto;
        padding: 0 10px;
    }
    .fc-time{
    	display:none;
    }
</style>
<script type="text/javascript">
	
	$(document).ready(function(){
		initFullcalendar();
		refetchMyTaskView();
		
		$("input[name='myTaskStatus']").on("click",function(){
			refetchMyTaskView();
		});
	});
	
	//初始化日历
	function initFullcalendar(taskEvent){
        $('#myCalendar').fullCalendar({
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
            dayClick : function(date){},
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
				$("#myTaskIssuedBtn").attr("href",basePath+"/taskManage/myTaskEdit?taskId="+event.id);
				$("#myTaskIssuedBtn").click();
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
            editable: false,
            //Event被拖动时的不透明度
            dragOpacity: 0.5,
            eventDrop : function( event, dayDelta, revertFunc ) {
            },
            eventResize : function( event, dayDelta, revertFunc ) {
            },
            events: []
        });
	};
	
	//刷新任务视图
	function refetchMyTaskView(){
		var taskStatuslist = [];
		$("input[name='myTaskStatus']").each(function(index, el) {
			if ($(el).prop("checked") == true) {
				taskStatuslist.push($(el).val());
			}
		});
		//根据用户或部门查询任务信息
    	var taskEvent=[];
    	$.ajax({
			url : basePath + '/taskManage/queryMyTask',
			type : 'POST',
			dataType : 'json',
			async:false ,
			data : {taskStatus: taskStatuslist+''}
		}).done(function(data) {
			$.each(data,function(index,item){
				taskEvent.push({
                   id: item.id,
                   title: "任务:"+item.theme+"   工时："+item.expectedTime,
                   start: item.taskBeginDate+' 09:00' ,
                   end: item.taskEndDate+' 18:00',
                   backgroundColor:item.backgroundColor
				})
			});
		});
        //清空原任务
        $("#myCalendar").fullCalendar("removeEvents");
           //添加当前用户任务信息
    	$("#myCalendar").fullCalendar("addEventSource",taskEvent);
    	$("#myCalendar").fullCalendar('refetchResources');
	}
</script>