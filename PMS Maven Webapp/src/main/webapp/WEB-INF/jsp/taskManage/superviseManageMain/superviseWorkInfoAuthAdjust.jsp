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
					<form class="form-horizontal form-bordered" id="projectSuperviseEditFormIdsqw"
						autocomplete="off" enctype="multipart/form-data"
						data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${vo.id}" name="id"/>
						<input type="hidden" value="" name="changeDetails" id="changeDetails" />
						<input type="hidden" value="${vo.status}" id="status" name="status" />
						<input type="hidden" value="${vo.requiredDate}" name="requiredDateOld" />
						<input type="hidden" value="1" name="adjustPerson" />
						<div class="form-body">
							<div class="form-group">
								<!-- 发起人 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.initiateBy' /> 
								</label>
								<div class="col-md-4">
									<input type="hidden" name="initiateBy" value="${vo.initiateBy}" />
									<input type="text" 
										class="form-control" 
										id="initiateBy"
										readonly="readonly"
										value="${vo.initiateByName}"
										data-rule="required;length[~50];" />
								</div>
								<!-- 发起时间 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.numberDate' /> 
								</label>
								<div class="col-md-4">
									<input type="text" 
								   class="form-control dateSelect" 
								   id="numberDate"  readonly="readonly"
								   name="numberDate"
								   data-rule="required;"
								   data-date-format="yyyy-mm-dd"
								   value="${vo.numberDate}"/>
								</div>
							</div>
							<div class="form-group">
								<!-- 主要责任人 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.responsibleMainZ' /> 
									<span class="required">* </span> 
								</label>
								<div class="col-md-4">
									<%-- <select class="bs-select form-filter form-control" 								
										data-live-search="true" 
										data-size="10"
										data-rule="required;" 
										multiple="multiple"
										title="<spring:message code='message.pleaseselect' />"
										value="${vo.responsibleMain}"
										name="responsibleMain"
										id="responsibleMain">
				                      </select> --%>
				                      <select class="bs-select form-filter form-control" 								
										data-live-search="true" 
										data-size="10"
										data-rule="required;" 
										title="<spring:message code='message.pleaseselect' />"
										value="${vo.responsibleMain}"
										name="responsibleMain"
										id="responsibleMain">
				                      </select>
								</div>
								<!-- 次要责任人 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.responsibleMainC' /> 
									<span class="required">* </span> 
								</label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control" 								
										data-live-search="true" 
										data-size="10"
										data-rule="required;" 
										multiple="multiple"
										title="<spring:message code='message.pleaseselect' />"
										value="${vo.responsibleSecondary}"
										name="responsibleSecondary"
										id="responsibleSecondary">
				                      </select>
								</div>
							</div>
							
							<div class="form-group">
								<!-- 责任部门 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.department' /> 
								</label>
								<div class="col-md-4">
										<select class="bs-select form-filter form-control" 
											data-size="10"
											title="<spring:message code='message.pleaseselect' />"
											id="responsibilityDepartment" 
											name="responsibilityDepartment">
										</select>
								</div>
								<!-- 任务来源 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.taskSource' /> 
								</label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control"
										id="taskSource" 
										name="taskSource"
										data-size="10" 
										title="<spring:message code='message.pleaseselect'/>">
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<!-- 项目 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.relevanceProject' /> 
									<span class="required">* </span> 
								</label>
								<div class="col-md-4">
					                    <select class="bs-select form-filter form-control" 
									    	data-size="10" 
											id="relevanceProject"
											name="relevanceProject"
											data-rule="required;"
											title="<spring:message code='message.pleaseselect' />" >
					                    </select>
								</div>
								<!-- 优先级 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.priority' /> 
									<span class="required">*</span>  
								</label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control" 
										id="priority" 
										name="priority"
										data-size="10" 
										data-rule="required;"
										title="<spring:message code='message.pleaseselect'/>">
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<!-- 任务内容 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.taskDefinition' />
									<span class="required">*</span>  
								</label>
								<div class="col-md-10">
									<textarea class="form-control" rows="3" style="width: 100%;" id="taskDefinition" 
										data-rule="required;length[~1000];"
										placeholder="<spring:message code='common.laber.mustInputData'/>"
										name="taskDefinition">${vo.taskDefinition}</textarea>
								</div>
							</div>
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
								   value="${vo.requiredDate}"/>
								</div>
								
							</div>
							
							<div class="form-group">
								<!-- 结论-->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.conclusion' /> 
									<span class="required">*</span>  
								</label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control"
										id="conclusion" 
										name="conclusion"
										data-size="10" 
										data-rule="required;" value="4"
										title="<spring:message code='message.pleaseselect'/>">
									</select>
								</div>
								<!-- 验收人 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.accepter' /> 
									<span class="required">*</span>  
								</label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control" 								
										data-live-search="true" 
										data-size="10"
										data-rule="required;" 
										multiple="multiple"
										title="<spring:message code='message.pleaseselect' />"
										value="${vo.accepter}" 
										name="accepter"
										id="accepter">
				                      </select>
								</div>
							</div>
							
							<div class="form-group">
								<!-- 奖惩绩效 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.performance' />
								</label>
								<div class="col-md-10">
									<textarea class="form-control" rows="3" style="width: 100%;" id=performance 
										data-rule="length[~1000];"
										name="performance">${vo.performance}</textarea>
								</div>
							</div>
							
							<div class="form-group">
								<!-- 申请延长前截止日期 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.overseeManager.delayTime' />
								</label>
								<div class="col-md-4">
									<input type="text" 
									   class="date-picker form-control dateSelect" 
									   id="delayTime" 
									   name="delayTime"
									   data-date-format="yyyy-mm-dd"
									   value="${vo.delayTime}"/>
								</div>
							</div>
							
							
							
							<div class="form-actions">
								<div class="modal-footer">
									<div class="col-md-offset-2 col-md-9">
									<button type="button" class="btn blue" id="saveSuperviseInfoIdsq">
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
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeProjectBaseInfoEditIdss"><spring:message code='btn.common.close'/></button>
    </div>
</div>	
<!-- 参数列表 -->
<script type="text/javascript">
	$("#projectSuperviseEditFormIdsqw #responsibilityDepartment").initDic('${vo.responsibilityDepartment}',codeBasicInfo.toDivision);
	$("#projectSuperviseEditFormIdsqw #whetherDelay").initDic('${vo.whetherDelay}',codeBasicInfo.isNot);
	 $("#projectSuperviseEditFormIdsqw #whetherAdvance").initDic('${vo.whetherAdvance}',codeBasicInfo.isNot);
	$("#projectSuperviseEditFormIdsqw #taskSource").initDic('${vo.taskSource}',codeBasicInfo.taskSource); 
	$("#projectSuperviseEditFormIdsqw #relevanceProject").initRecordProjectInfo('${vo.relevanceProject}');
	$("#projectSuperviseEditFormIdsqw #priority").initDic('${vo.priority}',codeBasicInfo.priorityonly); 
	$("#projectSuperviseEditFormIdsqw #conclusion").initDic('${vo.conclusion}',codeBasicInfo.conclusion);  
	$("#projectSuperviseEditFormIdsqw #responsibleMain").responsibleSecondary('${vo.responsibleMain}');
	$("#projectSuperviseEditFormIdsqw #responsibleSecondary").responsibleSecondary('${vo.responsibleSecondary}');
	$("#projectSuperviseEditFormIdsqw #accepter").responsibleSecondary('${vo.accepter}'); 
	
	var projectBaseInfoOldVal=$("#projectSuperviseEditFormIdsqw").serializeFormJson();
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/taskManage/superviseWorkInfoList/superviseWorkInfoAuthAdjust.js"></script>