<%-- 编辑页  RAOMINGYI 2018-07-02  --%>
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
			                       <font style="vertical-align: inherit;"><spring:message code='label.workhoursRecord.workHoursTable' /></font>
			                 </font>
		                 </span>
		             </div>
		             <div class="tools">
		                 <a href="javascript:;" class="collapse"> </a>
		                 <a href="javascript:;" class="reload"> </a>
		             </div>
		         </div>
		         <div class="portlet-body form">
			        <form class="form-horizontal form-bordered" id="workhoursRecordEditFormId" autocomplete="off" enctype="multipart/form-data"
			              data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}"> 
			        <div class="form-body">
						<input type="hidden" value="${vo.id}" name="id" id="Id" />
						<input type="hidden" value="" name="changeDetails" id="changeDetails" />
						<div class="form-group">
							<!-- 员工姓名 -->
							<label class="control-label col-md-2">
							   <spring:message code='label.workhoursRecord.workerName' />
							</label>	 
							<div class="col-md-4">
								<input type="hidden" name="createBy" value="${vo.workerId}" />
								<input type="text" 
									   class="form-control" 
									   id="createByName" 
									   readonly="readonly"
									   name="createByName"
							 		   value="${vo.workerName}"/>
							</div>
							<!-- 日期 -->
							<label class="control-label col-md-2">
							  <spring:message code='label.workhoursRecord.workDate' />
							  <span class="required">*</span>
							</label>
							<div class="col-md-4">
								<input type="text" 
								   class="date-picker form-control dateSelect" 
								   id="workDate" 
								   name="workDate"
								   data-rule="required;"
								   data-date-format="yyyy-mm-dd"
								   value="${vo.workDate}"/>
							</div>
						</div>
						<div class="form-group">
							<!-- 项目名称-->
							<label class="control-label col-md-2">
							  <spring:message code='label.workhoursRecord.projectName' />							
							  <span class="required">*</span>
							</label>
							<div class="col-md-4">
								<select class="bs-select form-filter form-control" 
							    	data-size="10" 
									id="projectId"
									name="projectId"
									data-rule="required;"
									title="<spring:message code='message.pleaseselect' />" >
			                    </select>
							</div>
						</div>
						<div class="form-group">
							<!-- 工作分类 -->
							<label class="control-label col-md-2"> <spring:message code='label.workhoursRecord.workingType' />
								<span class="required">*</span>
							 </label>
							<div class="col-md-4">
								<select class="bs-select form-filter form-control" 
									data-size="10"
									data-rule="required;"
									title="<spring:message code='message.pleaseselect' />"
									id="workingType" 
									name="workingType">
								</select>
							</div>
							<!-- 耗时-->
							<label class="control-label col-md-2"> <spring:message code='label.workhoursRecord.workingHours' />								
								<span class="required">*</span> 
							</label>
							<div class="col-md-4">
								<input type="text" 
									class="form-control" 
									id="workingHours" 
									name="workingHours"
									data-rule="positiveNum;required;length[~10];range(0~8);"
									value="${vo.workingHours}"
									placeholder="<spring:message code='common.laber.mustInputData'/>" />
							</div>
						</div>									
						<div class="form-group">
							<!-- 工作内容 -->
							<label class="control-label col-md-2"> 
								<spring:message code='label.workhoursRecord.workDesc' />
								<span class="required">*</span>  
							</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="3" style="width: 100%;" id="workDesc" 
									data-rule="required;length[~1000];"
									placeholder="<spring:message code='common.laber.mustInputData'/>"
									name="workDesc">${vo.workDesc}</textarea>
							</div>
						</div>
						<div class="form-group last">
							<!--备注 -->
							<label class="control-label col-md-2"> 
								<spring:message code='label.workhoursRecord.remark' /> 
							</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="3" style="width: 100%;" id="remark" 
									data-rule="length[~1000];"
									placeholder="<spring:message code='common.laber.noneMustInputData'/>"
									name="remark">${vo.remark}</textarea>
							</div>
						</div>					
		            </div>
		            <div class="form-actions">
						<div class="modal-footer">
							<div class="col-md-offset-2 col-md-9">
							<button type="button" class="btn blue" id="saveWorkhoursRecordId">
								<i class="fa fa-check"></i>
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
<div class="modal-footer">
	<div class="col-md-offset-11 col-md-1">
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeWorkhoursRecordId"><spring:message code='btn.common.close'/></button>
    </div>
</div>	
<!-- 参数列表 -->
<script type="text/javascript">
	//下拉框初始化
	$("#workhoursRecordEditFormId #projectId").initRecordProjectInfo('${vo.projectId}');
	$("#workingType").initDic('${vo.workingType}',codeBasicInfo.workHoursType); 
	var workhoursOldVal=$("#workhoursRecordEditFormId").serializeFormJson();
    var workhoursField = {
		workerName:"<spring:message code='label.workhoursRecord.workerName' />",
		workDate:"<spring:message code='label.workhoursRecord.workDate' />",
		projectName:"<spring:message code='label.workhoursRecord.projectName' />",							
		workingType:"<spring:message code='label.workhoursRecord.workingType' />",
 		workingHours:"<spring:message code='label.workhoursRecord.workingHours' />	",							
		workDesc:"<spring:message code='label.workhoursRecord.workDesc' /> ",
		remark:"<spring:message code='label.workhoursRecord.remark' /> "	
	};
</script>
<!-- 引用配置JS -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/taskManage/workhoursRecord/workhoursRecordEdit.js"></script>