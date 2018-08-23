<!-- 打车报销新增/编辑界面 zlshi 20180803 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-hidden="true"></button>
	<div class="form-group">
		<div class="col-md-8 col-sm-8">
			<div class="todo-taskbody-user">
				<img class="todo-userpic pull-left"
					src="<%=request.getContextPath()%>/${vo.loginUserPic}" width="50px"
					height="50px"> <span class="todo-username pull-left">${vo.loginUserName}</span>
			</div>
		</div>
		<div class="col-md-4 col-sm-4">
			<div class="todo-taskbody-date pull-right">
				<span class="caption-helper"><font
					style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><spring:message
								code='common.laber.currentTime' />：</font> </font> </span> <span
					class="caption-subject font-green-sharp bold uppercase"><font
					style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">${vo.currentTime}</font> </font> </span>
			</div>
		</div>
	</div>
</div>
<div class="modal-body todo-task-modal-body">
	<div id="bootstrap_alerts_demo"></div>
	<!-- Begin: Query conditions -->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet light portlet-fit bordered">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-info-circle font-red"></i> 
						<span class="caption-subject font-red sbold uppercase"> 
							<font style="vertical-align: inherit;"> 
								<font style="vertical-align: inherit;">
									<spring:message code='label.applyManage.applyEdit' /> 
								</font> 
							</font> 
						</span>
					</div>
					<div class="tools">
						<a href="javascript:;" class="collapse"> </a> <a
							href="javascript:;" class="reload"> </a>
					</div>
				</div>
				<div class="portlet-body form">
					<form class="form-horizontal form-bordered"
						id="taxiApplyEditFormId" autocomplete="off"
						enctype="multipart/form-data"
						data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${vo.id}" name="id" id="userId" /> <input
							type="hidden" value="" name="changeDetails" id="changeDetails" />
						<div class="form-body">
							<div class="form-group">
								<!-- 项目名称 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.applyManage.projectName' /> <span
									class="required">* </span> </label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control" 
								    	data-size="10" 
										id="projectId"
										name="projectId"
										data-rule="required;"
										title="<spring:message code='message.pleaseselect' />" >
				                    </select>
								</div>
								<!-- 姓名 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.userManage.userName' /> <span class="required">*
								</span> </label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id="reimburseName"
										readonly="readonly" 
										name="reimburseName" 
										data-rule="required;length[~25];"
										value="${vo.reimburseName}"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
									<input type="hidden" value="${vo.reimburseBy}" name="reimburseBy"/> 
								</div>
							</div>
							<div class="form-group">
								<!-- 报销金额 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.applyManage.amount' /> <span class="required">*
								</span> </label>
								<div class="col-md-4">
									<input type="text" class="form-control"
										id="taxiApplyEditAccount" name="taxiAmount"
										value="${vo.taxiAmount}"
										placeholder="<spring:message code='common.laber.mustInputData'/>"
										data-rule="required;length[~10];xxx;"
										data-rule-xxx="[/^(?:0|[1-9]\d*)(?:\.\d{1,2})?$/, '请填写有效的金额']"
										/>
								</div>
								<!-- 报销日期 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.applyManage.applyTime' /> <span class="required">*
								</span> </label>
								<div class="col-md-4">
									<input type="text" 
									   class="date-picker form-control dateSelect" 
									   id="reimburseDate" 
									   name="reimburseDate"
									   data-rule="required"
									   data-date-format="yyyy-mm-dd"
									   value="${vo.reimburseDate}"/>
								</div>
							</div>
							<div class="form-group">
								<!-- 上车时间 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.applyManage.departTime' /> <span class="required">*
								</span> </label>
								<div class="col-md-4">
									<input type="text" class="form-control"
										value="${vo.departTime}" 
										id="departTime"
										name="departTime" 
										data-rule="required;length[~25];time;"
										placeholder="<spring:message code='common.laber.mustInputData'/>"/>
								</div>
								<!-- 下车时间 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.applyManage.arriveTime' /> <span class="required">*
								</span> </label>
								<div class="col-md-4">
									<input type="text" class="form-control"" 
										value="${vo.arriveTime}" 
										id="arriveTime"
										name="arriveTime"  
										data-rule="required;length[~25];time;" 
										placeholder="<spring:message code='common.laber.mustInputData'/>"/>
								</div>
							</div>
							<div class="form-group">
								<!-- 备注 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.userManage.userRemark' /><span class="required">*
								</span> </label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control" 
								    	data-size="10" 
										id="taxiMatter"
										name="taxiMatter"
										data-rule="required;"
										title="<spring:message code='message.pleaseselect' />" >
				                    </select>	
								</div>
							</div>
						</div>
						<div class="form-actions">
							<div class="modal-footer">
								<div class="col-md-offset-2 col-md-9">
									<button type="button" class="btn blue" id="taxiApplyEditAdd">
										<i class="fa fa-check"></i>
										<spring:message code='btn.common.save' />
									</button>
									<button type="buttonv" class="btn yellow hidden"
										id="taxiApplyEditAdd">
										<i class="fa fa-check"></i>
										<spring:message code='btn.common.submit' />
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
		<button class="btn default" data-dismiss="modal" aria-hidden="true"
			id="closetaxiApplyEdit">
			<spring:message code='btn.common.close' />
		</button>
	</div>
</div>
<script type="text/javascript">
	$("#taxiApplyEditFormId #projectId").initRecordProjectInfo('${vo.projectId}');
	$("#taxiApplyEditFormId #taxiMatter").initDic('${vo.taxiMatter}',codeBasicInfo.taxiApplyExpain);
	var reimburseBaseInfoOldVal=$("#reimburseBaseInfoEditFormId").serializeFormJson();
 	var reimburseBaseInfoField = {

	}; 
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/applyManage/taxiApplyManage/taxiApplyEdit.js"></script>