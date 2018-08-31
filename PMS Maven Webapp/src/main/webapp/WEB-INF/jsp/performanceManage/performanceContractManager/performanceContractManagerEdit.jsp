<!-- 绩效合约编辑界面 zlshi 20180810 -->
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
	<div class="row">
		<div class="col-md-12">
			<div class="portlet light portlet-fit bordered">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-info-circle font-red"></i> <span
							class="caption-subject font-red sbold uppercase"> <font
							style="vertical-align: inherit;"> <font
								style="vertical-align: inherit;"> <spring:message
										code='label.performanceContractManager.detail' /> </font> </font> </span>
					</div>
					<div class="tools">
						<a href="javascript:;" class="collapse"> </a> <a
							href="javascript:;" class="reload"> </a>
					</div>
				</div>
				<div class="portlet-body form">
					<form class="form-horizontal form-bordered"
						id="performanceContractEditFormId" autocomplete="off"
						enctype="multipart/form-data"
						data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${vo.id}" name="id" id="userId" /> <input
							type="hidden" value="" name="changeDetails" id="changeDetails" />
						<div class="form-body">
							<div class="form-group">
								<!--姓名 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.performanceContractManager.userName' /> <span
									class="required">* </span> </label>
								<div class="col-md-4">
									<input type="text" class="form-control" id="pcName"
										name="pcName" value="${vo.loginUserName}"
										data-rule="required;length[~25];" readonly="readonly" />
								</div>
								<!-- 创建时间 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.performanceContractManager.createTime' /> <span
									class="required">* </span> </label>
								<div class="col-md-4">
									<input type="text" class="form-control" id="pcCreateDate"
										readonly="readonly" name="pcCreateDate"
										data-rule="required;length[~25];" value="${vo.pcCreateDate}"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
							</div>
							<div class="form-group">
								<!-- 指标类别 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.performanceContractManager.targetType' /><span
									class="required">* </span> </label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control"
										data-size="10" id="pcTargettype" name="pcTargettype"
										data-rule="required;"
										title="<spring:message code='message.pleaseselect' />">
									</select>
								</div>
								<!-- 指标内容 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.performanceContractManager.targetContent' /> <span
									class="required">* </span> </label>
								<div class="col-md-4">
									<input type="text" class="form-control" id="pcTargetcontent"
										name="pcTargetcontent" value="${vo.pcTargetcontent}"
										data-rule="required;length[~20];"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
							</div>
							<div class="form-group">
								<!-- 权重 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.performanceContractManager.weight' /> <span
									class="required">* </span> </label>
								<div class="col-md-4">
									<input type="text" class="form-control" id="pcWeight"
										name="pcWeight" data-rule="positiveNum;length[~4];required;"
										value="${vo.pcWeight}"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
								<!-- 频度 -->
								<label class="control-label col-md-2"> <spring:message
										code='label.performanceContractManager.frequency' /> <span
									class="required">* </span> </label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control"
										data-size="10" id="pcFrequency" name="pcFrequency"
										data-rule="required;"
										title="<spring:message code='message.pleaseselect' />">
									</select>
								</div>
							</div>
							<div class="form-group">
								<!-- 考核内容 -->
								<label class="control-label col-md-2"> 
								<spring:message
										code='label.performanceContractManager.checkContent' /> <span
									class="required">* </span> </label>
								<div class="col-md-10">
									<textarea class="form-control" rows="2" id="pcCheckcontent"
										name="pcCheckcontent" data-rule="length[~2000];required;"
										value="${vo.pcCheckcontent}">${vo.pcCheckcontent}</textarea>
								</div>
							</div>
							<div class="form-group">
								<!-- T1指标（B）-->
								<label class="control-label col-md-2"> <spring:message
										code='label.performanceContractManager.t1' /> </label>
								<div class="col-md-10">
									<textarea class="form-control" rows="4" id="pcTone"
										name="pcTone" data-rule="length[~4000];" value="${vo.pcTone}">${vo.pcTone}</textarea>
								</div>
							</div>
							<div class="form-group">
								<!-- T2指标（A） -->
								<label class="control-label col-md-2"> <spring:message
										code='label.performanceContractManager.t2' /> </label>
								<div class="col-md-10">
									<textarea class="form-control" rows="4" id="pcTwo" name="pcTwo"
										data-rule="length[~4000];" value="${vo.pcTwo}">${vo.pcTwo}</textarea>
								</div>
							</div>
							<div class="form-group">
								<!-- T3指标（S） -->
								<label class="control-label col-md-2"> <spring:message
										code='label.performanceContractManager.t3' /> </label>
								<div class="col-md-10">
									<textarea class="form-control" rows="4" id="pcThree"
										name="pcThree" data-rule="length[~4000];"
										value="${vo.pcThree}">${vo.pcThree}</textarea>
								</div>
							</div>
						</div>
						<div class="form-actions">
							<div class="modal-group">
								<div class="col-md-offset-2 col-md-9">
									<button type="button" class="btn blue"
										id="savePerformanceContractId">
										<i class="fa fa-check"></i>
										<spring:message code='btn.common.save' />
									</button>
									
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal-footer">
	<div class="col-md-offset-11 col-md-1">
		<button class="btn default" data-dismiss="modal" aria-hidden="true"
			id="closePerformanceContractEdit">
			<spring:message code='btn.common.close' />
		</button>
	</div>
</div>

<script type="text/javascript">
	$("#performanceContractEditFormId #pcTargettype").initDic('${vo.pcTargettype}',codeBasicInfo.performanceContractType);
	$("#performanceContractEditFormId #pcFrequency").initDic('${vo.pcFrequency}',codeBasicInfo.performanceContractFrequency);
	
	var reimburseBaseInfoOldVal=$("#reimburseBaseInfoEditFormId").serializeFormJson();
 	var reimburseBaseInfoField = {
		
	}; 
</script>
<!-- 引用js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>\resources\performanceManager\performanceContractManager\performanceContractManagerEdit.js"></script>
