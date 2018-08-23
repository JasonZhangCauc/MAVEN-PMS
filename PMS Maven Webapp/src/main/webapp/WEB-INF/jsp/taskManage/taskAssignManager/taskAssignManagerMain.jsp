<!-- 任务分派主界面  ZHOUMIN 20180305 -->
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
				<form class="form-horizontal" id="taskAssignMianFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			                <!-- 任务发起人 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.taskManager.originator' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="originatorName" class="form-control form-filter spinner" 
			                    	placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <!-- 任务接送人 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.taskManager.recipient' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="recipientName" class="form-control form-filter spinner" 
			                    	placeholder="<spring:message code='message.pleaseinput'/>">
			                </div>
			                <!-- 紧急状态 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.taskManager.emergency' />:
			                </label>
			                <div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control" 
									multiple 
									data-size="10" 
									title="<spring:message code='label.allitem' />"  
									id="emergency"
									name="emergency">
			                    </select>
			                </div>
			                <div class="col-md-2">
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchTaskAssignBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
                                <button type="button" data-target="#taskAssignHide" data-toggle="collapse" aria-expanded="false" class="btn default" data-style="slide-left" id="searchTaskAssignBtn">
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>
							</div>
			            </div>
			            <div class="form-group line_p collapse" id="taskAssignHide" aria-expanded=false>
			            	<div class="form-group">
				            	<!-- 任务描述 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.taskManager.taskDesc' />:
				                </label>
				                <div class="col-md-2 text-left">
				                    <input type="text" name="taskDesc" class="form-control form-filter spinner" 
				                    	placeholder="<spring:message code='message.pleaseinput'/>">
				                </div>
				                <!-- 是否关闭 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.taskManager.isClose' />:
				                </label>
				                <div class="col-md-2 text-left">
				                	<div class="md-checkbox-inline">
				                        <div class="md-checkbox">
				                            <input type="checkbox" id="isClose0" value="0" name="isClose" class="md-check">
				                            <label for="isClose0">
				                                <span></span>
				                                <span class="check"></span>
				                                <span class="box"></span><spring:message code='common.label.yes' /></label>
				                        </div>
				                        <div class="md-checkbox has-error">
				                            <input type="checkbox" id="isClose1" value="1" name="isClose" class="md-check">
				                            <label for="isClose1">
				                                <span></span>
				                                <span class="check"></span>
				                                <span class="box"></span><spring:message code='common.label.no' /></label>
				                        </div>
				                    </div>
				                  </div>
			                </div>
			                <div class="form-group">
				                <!-- 要求完成日期 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.taskManager.reqFinitionDate'/>:
				                </label>
				                <div class="col-md-2 text-left">
					                <div class="input-group input-large">
										<input type="text" 
											id="reqFinitionBeginDate" 
											name="reqFinitionBeginDate" 
											placeholder="<spring:message code='common.label.from'/>" 
											class="date-picker form-control dateSelect" 
											data-date-format="yyyy-mm-dd">
									    <span class="input-group-addon">to </span>
									    <input type="text" 
									    	id="reqFinitionEndDate" 
									    	name="reqFinitionEndDate" 
									    	placeholder="<spring:message code='common.label.to'/>" 
									    	class="date-picker form-control dateSelect" 
									    	data-date-format="yyyy-mm-dd">
									</div>
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
		                <span class="caption-subject bold uppercase">任务列表</span>
			    </div>             
                <div class="actions">
                    <div class="btn-group btn-group-devided" data-toggle="buttons">
                    	<auth:auth resourceCode="R005_0101">
							<a href="<%=request.getContextPath()%>/taskManager/taskEdit?operate=add" data-target="#todo-task-modal" 
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
                    <table class="table table-striped table-bordered table-hover" id="taskAssignMianTableId"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 任务新增/编辑弹出框 -->
<div id="todo-task-modal" class="modal fade" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var taskAssign_recipient="<spring:message code='label.taskManager.recipient' />";//任务接收人
	var taskAssign_originator="<spring:message code='label.taskManager.originator' />";//任务发起人
	var taskAssign_reqFinitionDate="<spring:message code='label.taskManager.reqFinitionDate' />";//要求完成日期
	var taskAssign_emergency="<spring:message code='label.taskManager.emergency' />";//紧急程度
	var taskAssign_taskDesc="<spring:message code='label.taskManager.taskDesc' />";//任务描述
	var taskAssign_feedback="<spring:message code='label.taskManager.feedback' />";//反馈情况
	var taskAssign_isClose="<spring:message code='label.taskManager.isClose' />";//是否关闭
	var taskAssign_closeDate="<spring:message code='label.taskManager.closeDate' />";//关闭日期
	var taskAssign_deleteTaskMsg="<spring:message code='label.taskManager.deleteTaskMsg' />";//确认删除该任务吗？
	var taskAssign_sendTaskMsg="<spring:message code='label.taskManager.sendTaskMsg' />";//确认发送该任务吗？
	var taskAssign_send="<spring:message code='label.taskManager.send' />";//发送
	var taskAssign_sendBack="<spring:message code='label.taskManager.sendBack' />";//退回
	var gridTaskAssign = new Datatable();//任务分派Datatable
	var hasEditAuthTaskAssign = isUserHasAuth("R005_0101");//编辑权限
	var hasRemoveAuthTaskAssign = isUserHasAuth("R005_0102");//删除权限
	var hasSendAuthTaskAssign = isUserHasAuth("R005_0103");//发送权限
	$("#taskAssignMianFormId #emergency").initDic(null,codeBasicInfo.emergency);
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/taskManage/taskAssignManager/taskAssignManager.js"></script>