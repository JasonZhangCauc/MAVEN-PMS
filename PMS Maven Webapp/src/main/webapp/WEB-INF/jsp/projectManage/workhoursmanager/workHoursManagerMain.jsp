<%--  工时统计主页面 jczou 2018-03-15  --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- BEGIN PAGE BASE CONTENT -->
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-filter font-red"></i> <span
						class="caption-subject font-red sbold uppercase"><font
						style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">查询条件</font>
					</font>
					</span>
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> <a
						href="javascript:;" class="reload"> </a>
				</div>
			</div>
			<div class="portlet-body form">
				<form class="form-horizontal" id="workhoursManagementMianFormId" method="post" 
					action="<%=request.getContextPath()%>/projectManage/exportWorkHoursInfo">
			        <div class="form-body">
			            <div class="form-group">
				        	<!-- 项目编号 -->
							<label class="control-label col-md-1">
							<spring:message code='label.workHoursManager.projectId' />
							</label>
							<div class="col-md-2">
						     	<input type="text" class="form-control" id="projectNo" name="projectNo"
										placeholder="<spring:message code='message.pleaseinput'/>"> 
							</div>
							<!-- 项目标题 -->
							<label class="control-label col-md-1">
							<spring:message code='label.workHoursManager.projectName' />
							</label>
							<div class="col-md-2">
						     	<input type="text" class="form-control" id="projectName" name="projectName"
										placeholder="<spring:message code='message.pleaseinput'/>"> 
							</div>
							<!-- 工时类型 -->
							<label class="control-label col-md-1">
							<spring:message code='label.workHoursManager.workingType' />
							</label>
							<div class="col-md-2">
								<select class="bs-select form-filter form-control" 
										data-size="20" 
										data-width="100%"
										title="<spring:message code='label.allitem' />" 
										id="workingType"
										multiple
										name="workingType">
				                 </select>
						   </div>
					        <div class="col-md-2">
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="WorkhoursManagementSearchBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
                                <button type="button" data-target="#workhoursHide" data-toggle="collapse" aria-expanded="false" class="btn default" data-style="slide-left" id="WorkhoursManagementSearchBtn">
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>
							</div>
						</div>
						<div class="form-group line_p collapse" id="workhoursHide" aria-expanded=false>
							<!-- 有效期 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.workHoursManager.date'/>:
			                </label>
			                <div class="col-md-2">
			                	<div class="input-group input-large">
				                	<input type="text" 
										id="startTime" 
										name="startTime" 
										data-width="48%"
										class="date-picker form-control dateSelect"
										placeholder="<spring:message code='common.label.from'/>">
								    <span class="input-group-addon">to </span>
								    <input type="text" 
								    	id="endTime" 
								    	name="endTime" 
								    	data-width="48%"
								    	class="date-picker form-control dateSelect"
								    	placeholder="<spring:message code='common.label.to'/>">
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
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">  
	                <div class="caption">
		                <i class="fa fa-info-circle font-dark"></i>
		                <span class="caption-subject bold uppercase">工时列表</span>
			        </div>               
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
	                    	<auth:auth resourceCode="R004_0401">
								<a href="<%=request.getContextPath()%>/projectManage/workHoursEdit?operate=add" data-target="#todo-task-modal"
								data-toggle="modal" class="btn btn-circle green-haze">
								<i class="fa fa-plus"></i></a> 
							</auth:auth>
							<auth:auth resourceCode="R004_0403">
								<a class="btn btn-circle blue" id="workHoursExport">
								<i class="fa fa-download"></i></a> 
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
	                            </li>
	                        </ul>
	                    </div>                   
	                </div>
	            </div>
	            <div class="portlet-body">
	                <div class="table-container">
	                    <table class="table table-striped table-bordered table-hover" id="WorkhoursManagementMianTableId"></table>
	                </div>
	            </div>
	        </div>
        <!-- End: life time stats -->
    </div>
</div>
<!-- 新增编辑弹出框 --> 
<div id="todo-task-modal" class="modal fade" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div>
<!-- 参数列表 -->
<script type="text/javascript">
	var workHoursManager_projectId = "<spring:message code='label.workHoursManager.projectId' />"; //项目编号
	var workHoursManager_projectName = "<spring:message code='label.workHoursManager.projectName' />"; //项目标题
	var workHoursManager_workingType = "<spring:message code='label.workHoursManager.workingType' />"; //工时类型
	var workHoursManager_workingHours = "<spring:message code='label.workHoursManager.workingHours' />"; //工时总计
	var workHoursManager_involvingResource = "<spring:message code='label.workHoursManager.involvingResource' />"; //涉及资源
	var workHoursManager_beginDate = "<spring:message code='label.workHoursManager.beginDate' />"; //开始时间
	var workHoursManager_endDate = "<spring:message code='label.workHoursManager.endDate' />"; //结束时间
	var workHoursManager_createByName = "<spring:message code='label.workHoursManager.createByName' />"; //操作人
	var workHoursManager_createDate = "<spring:message code='label.workHoursManager.createDate' />"; //操作时间
	var date = "<spring:message code='label.workHoursManager.date' />"; //日期范围
	var deleteWorkhoursConfirmMsg = "<spring:message code='label.workHoursManager.deleteWorkhoursConfirmMsg' />";  //确定删除工时统计信息吗？
	var gridWorkhours = new Datatable();//工时统计Datatable
	var hasEditAuthWorkhours = isUserHasAuth("R004_0401"); //编辑权限
	var hasDeleteWorkhoursAuth = isUserHasAuth("R004_0402"); //删除权限
	//下拉框初始化
	$("#workhoursManagementMianFormId #workingType").initDic(null,codeBasicInfo.workHoursType); 
</script>

<!-- 引用配置JS --> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManage/workhoursmanager/workHoursManagerMain.js"></script>