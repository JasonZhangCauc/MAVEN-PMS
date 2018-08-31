<%--  主页面 RAOMINGYI 2018-07-02  --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- BEGIN PAGE BASE CONTENT -->
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			 <div class="portlet-title">
	             <div class="caption">
	                 <i class="fa fa-filter font-red"></i>
	                 <span class="caption-subject font-red sbold uppercase">
	                 	<font style="vertical-align: inherit;">
		                 	<font style="vertical-align: inherit;">
		                 	<spring:message code='label.queryTerm'/>
		                 	</font>
		                 </font>
		             </span>
	             </div>
	             <div class="tools">
	                 <a href="javascript:;" class="collapse"> </a>
	                 <a href="javascript:;" class="reload"> </a>
	             </div>
	         </div>
	         <div class="portlet-body form">
				<form class="form-horizontal" id="workHoursRecordFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
						    <!--员工姓名-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.workhoursRecord.workerName'/>:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="workerName" class="form-control form-filter spinner" 
			                       placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
						    <!--日期-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.workhoursRecord.workDate'/>:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" 
										id="workDate"
										name="workDate" 							
										class="date-picker form-control dateSelect" 
										data-date-format="yyyy-mm-dd">
			                </div>				
			                <!--当日总工时-->	
			                <%-- <label class="col-md-1 control-label">
			                	<spring:message code='label.workhoursRecord.workHoursTotal'/>:
			                </label>
							<div class="col-md-2 text-left">
								 <input type="text" name="workingHours" id="workingHours" class="form-control form-filter spinner"                     	 
			                     readonly />
			                </div> --%>
			                <!-- 项目名称-->
							<label class="control-label col-md-1">
							  <spring:message code='label.workhoursRecord.projectName' />							
							</label>
							<div class="col-md-2">
								<select class="bs-select form-filter form-control" 
									multiple
							    	data-size="10" 
									id="projectId"
									name="projectId"
									title="<spring:message code='message.pleaseselect' />" >
			                    </select>
							</div>
			                <div class="col-md-2">
								<button type="button" class="btn btn-primary mt-ladda-btn ladda-button" 
			                    	data-style="slide-left" id="searchWorkHoursBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>	
                                <button type="button" data-target="#workHoursRecordHide" data-toggle="collapse" 
                                	aria-expanded="false" class="btn default" data-style="slide-left" >
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>									    
							</div>				
						</div> 
						<div class="line_p collapse" id="workHoursRecordHide" aria-expanded=false>
							<div class="form-group">
								<!-- 状态 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.workhoursRecord.status' />:
				                </label>
				                <div class="col-md-2 text-left">
				                	<select class="bs-select form-filter form-control" 
										multiple 
										data-size="10" 
										id="status"
										name="status"
										title="<spring:message code='label.allitem'/>" >
				                    </select> 
				                </div>
				            </div>
				        </div>
					 </div>			                 
			    </form>
			</div>
		</div>   
	</div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="mt-element-ribbon bg-grey-steel">
            <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
                 <div class="ribbon-sub ribbon-clip"></div> 
                 <span class="caption-subject bold uppercase"><spring:message code='label.workhoursRecord.workHoursTable'/></span> 
	        </div>
	        <!-- Begin: life time stats -->
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">	                
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
                           <auth:auth resourceCode="R007_04_OPERATION_EDIT">
								<a href="<%=request.getContextPath()%>/taskManage/workhoursRecordEdit?operate=add" data-target="#workhours-modal" 
								data-toggle="modal" class="btn btn-circle green-haze">
								<i class="fa fa-plus"></i></a> 
							</auth:auth>						   
	                    </div>
	                    <div class="btn-group">
	                        <a class="btn red btn-sm btn-circle" href="javascript:;" data-toggle="dropdown">
	                            <i class="fa fa-print"></i>
	                        </a>
	                        <ul class="dropdown-menu pull-right" id="sample_tools">
	                            <li>
	                                <a href="javascript:;" data-action="0" class="tool-action">
	                                    <i class="icon-printer"></i> Print</a>
	                            </li>
	                            <li>
	                                <a href="javascript:;" data-action="1" class="tool-action">
	                                    <i class="icon-check"></i> Copy</a>
	                            </li>
	                            <li>
	                                <a href="javascript:;" data-action="2" class="tool-action">
	                                    <i class="icon-doc"></i> PDF</a>
	                            </li>
	                            <li>
	                                <a href="javascript:;" data-action="3" class="tool-action">
	                                    <i class="icon-paper-clip"></i> Excel</a>
	                            </li>
	                            <li>
	                                <a href="javascript:;" data-action="4" class="tool-action">
	                                    <i class="icon-cloud-upload"></i> CSV</a>
	                            </li>
	                            <li class="divider"> </li>
	                            <li>
	                                <a href="javascript:;" data-action="5" class="tool-action">
	                                    <i class="icon-refresh"></i> Reload</a>
	                            </li>
	                        </ul>
	                    </div>                  
	                </div>
	            </div>
	            <div class="portlet-body">
	                <div class="table-container">
	                    <table class="table table-striped table-bordered table-hover" id="workhoursRecordTableId"></table>
	                </div>
	            </div>
	         </div>           
        </div>
        <!-- End: life time stats -->
    </div>     
</div>
<!-- 弹出框 --> 
<div id="workhours-modal" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div> 
<!-- END 弹框 --> 
<script type="text/javascript">
	$("#workHoursRecordFormId #projectId").initRecordProjectInfo('${vo.projectId}');
	var workhoursRecordMain_workerName = "<spring:message code='label.workhoursRecord.workerName' />";   //员工姓名
	var workhoursRecordMain_projectName = "<spring:message code='label.workhoursRecord.projectName' />";   //项目名称
	var workhoursRecordMain_workingType = "<spring:message code='label.workhoursRecord.workingType' />";   //工作类型
	var workhoursRecordMain_workingHours = "<spring:message code='label.workhoursRecord.workingHours' />";   //耗时
	var workhoursRecordMain_workDesc = "<spring:message code='label.workhoursRecord.workDesc' />";   //工作内容
	var workhoursRecordMain_workDate = "<spring:message code='label.workhoursRecord.workDate' />";   //日期
	var workhoursRecordMain_status = "<spring:message code='label.workhoursRecord.status' />";   //状态
	var workhoursRecordMain_remark = "<spring:message code='label.workhoursRecord.remark' />";   //备注	
	var workhoursRecordMain_passBtn = "<spring:message code='label.projectManager.passBtn' />";   //通过
	var workhoursRecordMain_backBtn = "<spring:message code='label.projectManager.backBtn' />";   //退回
	var workhoursRecordMain_surePassMsg = "<spring:message code='label.workhoursRecord.surePassMsg' />";   //确认审批通过该工时吗？
	var workhoursRecordMain_sureBackMsg = "<spring:message code='label.workhoursRecord.sureBackMsg' />";   //确认退回该工时吗？
	var WorkhoursRecordTitle = "工时登记";
	var workhoursRecordMainTableTile ="查询结果";
	var deleteRecordMsg = "确认删除该条工时记录？";
	var sureSendMsg = "确认提交？";
	var sendBtn = "发送";
	var hasEditRecordAuth = isUserHasAuth("R007_04_OPERATION_EDIT");//新增/编辑权限
	var hasDeleteRecordAuth =  isUserHasAuth("R007_04_OPERATION_DELETE");//删除权限
	var hasCheckRecordAuth =  isUserHasAuth("R007_04_OPERATION_AUDIT");//审核权限
	var gridWorkhoursRecord = new Datatable();//工时登记Datatable
	//查询条件日期输入框默认选中当天日期
	/* var a = document.getElementById("workDate");
	var b = new Date();
	a.value=b.Format('yyyy-MM-dd'); */
	$("#workHoursRecordFormId #status").initDic(null,codeBasicInfo.workHoursStatus);//项目阶段
</script>
<!--引用配置JS --> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/taskManage/workhoursRecord/workhoursRecordMain.js"></script>