<!-- 项目维护新增/编辑界面 zm 20180703 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
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
					style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">${vo.currentTime}</font>
				</font>
				</span>
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
			                       <font style="vertical-align: inherit;"><spring:message code='label.overseeManager' /></font>
			                 </font>
		                 </span>
		             </div>
		             <div class="tools">
		                 <a href="javascript:;" class="collapse"> </a>
		                 <a href="javascript:;" class="reload"> </a>
		             </div>
		         </div>
		         <div class="portlet-body form">
					<form class="form-horizontal form-bordered" id="projectSuperviseEditFormIdsq"
						autocomplete="off" enctype="multipart/form-data"
						data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${vo.id}" name="id"/>
						<input type="hidden" value="" name="changeDetails" id="changeDetails" />
						<input type="hidden" value="${vo.status}" id="status" name="status" />
						<input type="hidden" value="${vo.requiredDate}" name="requiredDateOld" />
						<div class="form-body">
							<div class="form-group">
								<!-- 要求完成时间-->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.requiredDate' /> 
									<span class="required">*</span>  
								</label>
								<div class="col-md-4">
									<input type="text" 
								   class="date-picker form-control dateSelect" 
								   id="requiredDate" 
								   name="requiredDate"
								   data-rule="required;"
								   data-date-format="yyyy-mm-dd"
								   readonly="readonly"
								   value="${vo.requiredDate}"/>
								</div>
							</div>
							<div class="form-group">
								<!-- 调整原因 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.actualDateWhy' />
								</label>
								<div class="col-md-9">
									<textarea class="form-control" rows="3" style="width: 100%;" id=adjustReason 
										data-rule="length[~1000];"
										name="adjustReason">${vo.adjustReason}</textarea>
								</div>
							</div>
							
							<div class="form-actions">
								<div class="modal-footer">
									<div class="col-md-offset-2 col-md-9">
									<button type="button" class="btn blue" id="saveSuperviseInfoIds">
										<i class="fa fa-check"></i>
										<spring:message code='btn.common.save' />
									</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<c:if test="${vo.id !='' && vo.id !=null}">
			<%-- <div class="portlet light portlet-fit bordered">
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
			</div> --%>
			</c:if>
		</div>
	</div>
</div>   
<div class="modal-footer">
	<div class="col-md-offset-11 col-md-1">
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeProjectBaseInfoEditIdES"><spring:message code='btn.common.close'/></button>
    </div>
</div>	
<!-- 参数列表 -->
<script type="text/javascript">
	
	$("#projectSuperviseEditFormIdsq #responsibilityDepartment").initDic('${vo.responsibilityDepartment}',codeBasicInfo.toDivision); 
	$("#projectSuperviseEditFormIdsq #taskSource").initDic('${vo.taskSource}',codeBasicInfo.taskSource); 
	$("#projectSuperviseEditFormIdsq #relevanceProject").initRecordProjectInfo('${vo.relevanceProject}');
	$("#projectSuperviseEditFormIdsq #priority").initDic('${vo.priority}',codeBasicInfo.priorityonly); 
	$("#projectSuperviseEditFormIdsq #conclusion").initDic(null,codeBasicInfo.conclusion);  
	$("#projectSuperviseEditFormIdsq #accepter").responsibleSecondary('${vo.accepter}'); 
	$("#projectSuperviseEditFormIdsq #responsibleMain").projectPeople('${vo.responsibleMain}');
	$("#projectSuperviseEditFormIdsq #responsibleSecondary").responsibleSecondary('${vo.responsibleSecondary}');

	var projectBaseInfoOldVal=$("#projectSuperviseEditFormIdsq").serializeFormJson();
	var projectBaseInfoField = {
		projectName:"<spring:message code='lable.projectBaseinfo.projectName' />",
		toDivision:"<spring:message code='lable.projectBaseinfo.toDivision' />",
		projectHeadName:"<spring:message code='lable.projectBaseinfo.projectHead' />", 
		businessPeopleName:"<spring:message code='lable.projectBaseinfo.businessPeople' />", 
		projectResourceName:"<spring:message code='lable.projectBaseinfo.projectResource' />", 
		beginTime:"<spring:message code='label.workHoursManager.beginDate' />", 
		endTime:"<spring:message code='label.workHoursManager.endDate' />", 
		projectManagerName:"<spring:message code='lable.projectBaseinfo.projectManager' />", 
		expiredHours:"<spring:message code='lable.projectBaseinfo.expiredHours' />", 
		estimatedWorkload:"<spring:message code='lable.projectBaseinfo.estimatedWorkload' />", 
		contractAmount:"<spring:message code='lable.projectBaseinfo.contractAmount' />", 
		profitTargets:"<spring:message code='lable.projectBaseinfo.profitTargets' />", 
		projectPhase:"<spring:message code='lable.projectBaseinfo.projectPhase' />", 
		naturallyCost:"<spring:message code='lable.projectBaseinfo.naturallyCost' />", 
		projectStatus:"<spring:message code='lable.projectBaseinfo.projectStatus' />"	
	};
</script>
<!-- 引用配置JS -->
<script type="text/javascript"
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/taskManage/superviseWorkInfoList/superviseWorkInfoAuthEdit.js"></script>