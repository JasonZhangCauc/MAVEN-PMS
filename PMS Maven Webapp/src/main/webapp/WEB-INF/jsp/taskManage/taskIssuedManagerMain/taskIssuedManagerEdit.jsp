<!-- 任务新增/编辑界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="modal-header">
   	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <div class="form-group">
         <div class="col-md-8 col-sm-8">
             <div class="todo-taskbody-user">
                 <img class="todo-userpic pull-left" src="<%=request.getContextPath()%>/${vo.loginUserPic}" width="50px" height="50px">
                 <span class="todo-username pull-left">${vo.loginUserName}</span>
             </div>
         </div>
         <div class="col-md-4 col-sm-4">
			<div class="todo-taskbody-date pull-right">
				<span class="caption-helper"><font
					style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><spring:message
								code='common.laber.currentTime' />：</font>
				</font>
				</span> <span class="caption-subject font-green-sharp bold uppercase"><font
					style="vertical-align: inherit;"> <font
						style="vertical-align: inherit;">${vo.currentTime}</font>
				</font>
				</span>
			</div>
		</div>
    </div>
</div>
<div class="modal-body todo-task-modal-body">
	<div id="bootstrap_alerts_demo"></div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet light portlet-fit bordered">
				 <div class="portlet-title">
		             <div class="caption">
		                 <i class="fa fa-info-circle font-red"></i>
		                 <span class="caption-subject font-red sbold uppercase">
			                 <font style="vertical-align: inherit;">
			                       <font style="vertical-align: inherit;"><spring:message code='label.taskIssuedManager' /></font>
			                 </font>
		                 </span>
		             </div>
		             <div class="tools">
		                 <a href="javascript:;" class="collapse"> </a>
		                 <a href="javascript:;" class="reload"> </a>
		             </div>
		         </div>
		         <div class="portlet-body form">
					<form class="form-horizontal form-bordered" id="taskIssuedEditFormId"
						autocomplete="off" data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${vo.id}" name="id" id="taskId" />
						<input type="hidden" value="${vo.responsible}" name="responsible"/>
						<input type="hidden" value="" name="changeDetails" id="changeDetails" />
						<div class="form-group">
							<!-- 主题 -->
							<label class="control-label col-md-2"> 
								<spring:message code='label.taskIssuedManager.theme' /> 
								<span class="required">*</span>
							</label>
							<div class="col-md-10">
								<textarea class="form-control" rows="2" id="theme"
									data-rule="required;length[~50];" name="theme"
									placeholder="<spring:message code='common.laber.mustInputData'/>"
									value="${vo.theme}">${vo.theme}</textarea>
							</div>
						</div>
						<div class="form-group">
							<!-- 开始时间 -->
							<label class="control-label col-md-2">
								<spring:message code='label.taskIssuedManager.taskBeginDate' />
								<span class="required">*</span>
							</label>
							<div class="col-md-4">
								<input type="text" 
								class="date-picker form-control dateSelect"
								id="taskBeginDate"
								name="taskBeginDate" 
								data-date-format="yyyy-mm-dd"
								data-rule="required;"
								value="${vo.taskBeginDate}" 
								placeholder="<spring:message code='message.pleaseselect'/>" >
							</div>
							<!-- 结束时间 -->
							<label class="control-label col-md-2">
								<spring:message code='label.taskIssuedManager.taskEndDate' />
								<span class="required">*</span>
							</label>
							<div class="col-md-4">
								<input type="text" 
								class="date-picker form-control dateSelect"
								id="taskEndDate"
								name="taskEndDate" 
								data-date-format="yyyy-mm-dd"
								data-rule="required;"
								value="${vo.taskEndDate}" 
								placeholder="<spring:message code='message.pleaseselect'/>" >
							</div>
						</div>
						<div class="form-group">
							<!-- 状态 -->
							<label class="control-label col-md-2">
								<spring:message code='label.taskIssuedManager.status' />
								<span class="required">*</span>
							</label>
							<div class="col-md-4">
			                    <select class="bs-select form-filter form-control" 
									data-size="10" 
									data-rule="required;"
									title="<spring:message code='message.pleaseselect' />" 
									id="status"
									name="status">
			                    </select>
							</div>
							<!-- 研发类型 -->
							<label class="control-label col-md-2">
								<spring:message code='label.taskIssuedManager.tasktype' />
								<span class="required">*</span>
							</label>
							<div class="col-md-4">
			                    <select class="bs-select form-filter form-control" 
									data-size="10" 
									data-rule="required;"
									title="<spring:message code='message.pleaseselect' />" 
									id="tasktype"
									name="tasktype">
			                    </select>
							</div>
						</div>
						<div class="form-group">
							<!-- 难易度 -->
							<label class="control-label col-md-2">
								<spring:message code='label.taskIssuedManager.priority' />
								<span class="required">*</span>
							</label>
							<div class="col-md-4">
								<select class="bs-select form-filter form-control" 
									data-rule="required;"
									data-size="10" 
									title="<spring:message code='message.pleaseselect' />" 
									id="priority"
									name="priority">
			                    </select>
							</div>
							<!-- 预期工时 -->
							<label class="control-label col-md-2">
								<spring:message code='label.taskIssuedManager.expectedTime' />
								<span class="required">*</span>
							</label>
							<div class="col-md-4">
								<input type="text" 
									class="form-control" 
									id="expectedTime" 
									name="expectedTime" 
									data-rule="positiveNum;required;"
									value="${vo.expectedTime}"
									placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
							</div>
						</div>
						<div class="form-group">
							<!-- 原因类型 -->
							<label class="control-label col-md-2">
								<spring:message code='label.taskIssuedManager.whyType' />
							</label>
							<div class="col-md-4">
								<select class="bs-select form-filter form-control" 
									data-size="10" 
									title="<spring:message code='message.pleaseselect' />" 
									id="whyType"
									name="whyType">
			                    </select>
							</div>
							<!-- 实际工时 -->
							<label class="control-label col-md-2">
								<spring:message code='label.taskIssuedManager.actualHour' />
							</label>
							<div class="col-md-4">
								<input type="text" 
									class="form-control" 
									id="actualHour" 
									name="actualHour" 
									readonly="readonly"
									data-rule="positiveNum;"
									value="${vo.actualHour}"
									placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
							</div>
						</div>
						<div class="form-group">
							<!-- 完成度 -->
							<label class="control-label col-md-2">
								<spring:message code='label.taskIssuedManager.completeDegree' />
							</label>
							<div class="col-md-9">
								<input type="text" name="completeDegree" id="completeDegree" disabled="disabled" value="${vo.completeDegree}"/>
		                    </div>
						</div>
						<div class="form-group">
							<!-- 描述 -->
							<label class="control-label col-md-2"> 
								<spring:message code='label.taskIssuedManager.describe' /> 
							</label>
							<div class="col-md-10">
								<textarea class="form-control" rows="3" id="describe"
									data-rule="length[~2000];" name="describe"
									placeholder="<spring:message code='common.laber.noneMustInputData'/>"
									value="${vo.describe}">${vo.describe}</textarea>
							</div>
						</div>
						<div class="form-group">
							<!-- 说明 -->
							<label class="control-label col-md-2"> 
								<spring:message code='label.taskIssuedManager.instructions' /> 
							</label>
							<div class="col-md-10">
								<textarea class="form-control" rows="3" id="instructions"
									data-rule="length[~2000];" name="instructions" readonly="readonly"
									placeholder="<spring:message code='common.laber.noneMustInputData'/>"
									value="${vo.instructions}">${vo.instructions}</textarea>
							</div>
						</div
						<div class="form-actions">
							<div class="modal-footer">
								<div class="col-md-offset-2 col-md-9">
								<c:if test="${vo.id !='' && vo.id !=null && vo.status=='1'}" >
									<button type="button" class="btn red" id="delTaskIssuedId">
										<spring:message code='btn.common.delete' />
									</button>
								</c:if>
								<button type="button" class="btn green" id="saveTaskIssuedId">
									<spring:message code='btn.common.save' />
								</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<c:if test="${vo.id !='' && vo.id !=null}">
			<div class="portlet light portlet-fit bordered">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-tags font-red"></i> <span
							class="caption-subject font-red sbold uppercase"> <font
							style="vertical-align: inherit;"> <font
								style="vertical-align: inherit;"><spring:message code='label.operatlog' /></font> </font> </span>
					</div>
					<div class="tools">
						<a href="javascript:;" class="expand"> </a> <a
							href="javascript:;" class="reload"> </a>
					</div>
				</div>
				<div class="portlet-body" style="display: none;">
					<div class="tabbable-line">
						<ul class="nav nav-tabs ">
							<li class="active"><a href="#tab_1" data-toggle="tab">
									<spring:message code='common.laber.annotation' /> </a></li>
							<li><a href="#tab_2" data-toggle="tab"> <spring:message code='common.laber.history' /> </a></li>
						</ul>
						<div class="tab-content">
							<jsp:include page="../../common/commentLog.jsp" />
							<!--操作日志显示  -->
							<jsp:include page="../../common/dataLog.jsp" />
						</div>
					</div>
				</div>
			</div>
			</c:if>
		</div>
	</div>
</div>
<div class="modal-footer">
	<div class="col-md-offset-11 col-md-1">
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="clearTaskIssuedId"><spring:message code='btn.common.close'/></button>
    </div>
</div>	
<script type="text/javascript">
	$("#taskIssuedEditFormId #tasktype").initDic('${vo.tasktype}',codeBasicInfo.taskType);//任务类型
	$("#taskIssuedEditFormId #priority").initDic('${vo.priority}',codeBasicInfo.priority);//优先级
	$("#taskIssuedEditFormId #status").initDic('${vo.status}',codeBasicInfo.taskStatus);//状态
	$("#taskIssuedEditFormId #whyType").initDic('${vo.whyType}',codeBasicInfo.whyType);//原因类型
	
	$("#taskIssuedEditFormId #completeDegree").ionRangeSlider({min: 0,max:100,postfix: "%"});
	
	var taskIssuedOldVal=$("#taskIssuedEditFormId").serializeFormJson();
	var taskIssuedField = {
		theme:"<spring:message code='label.taskIssuedManager.theme' /> ",
		taskBeginDate:"<spring:message code='label.taskIssuedManager.taskBeginDate' />",
		taskEndDate:"<spring:message code='label.taskIssuedManager.taskEndDate' />",
		status:"<spring:message code='label.taskIssuedManager.status' />",
		tasktype:"<spring:message code='label.taskIssuedManager.tasktype' />",
		priority:"<spring:message code='label.taskIssuedManager.priority' />",
		expectedTime:"<spring:message code='label.taskIssuedManager.expectedTime' />",
		whyType:"<spring:message code='label.taskIssuedManager.whyType' />",
		describe:"<spring:message code='label.taskIssuedManager.describe' />"
	};
	
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/taskManage/taskIssuedManagerMain/taskIssuedManagerEdit.js"></script>