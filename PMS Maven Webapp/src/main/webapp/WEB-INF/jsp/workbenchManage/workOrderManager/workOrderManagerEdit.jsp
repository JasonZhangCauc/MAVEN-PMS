<!-- 工作单新增界面 zlshi 20180814 -->
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
			                       <font style="vertical-align: inherit;"><spring:message code='label.workOrderManager' /></font>
			                 </font>
		                 </span>
		             </div>
		             <div class="tools">
		                 <a href="javascript:;" class="collapse"> </a>
		                 <a href="javascript:;" class="reload"> </a>
		             </div>
		         </div>
		         <div class="portlet-body form">
					<form class="form-horizontal form-bordered" id="workOrderEditFormId" autocomplete="off" 
						enctype="multipart/form-data" data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}" >
						<input type="hidden" value="${vo.id}" name="id"/>
						<input type="hidden" value="" name="changeDetails" id="changeDetails" />
						<div class="form-body">
							<div class="form-group">
								<!-- 创建人 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.workOrderManager.createBy' /> 
									<span class="required">* </span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id="putForwardBy"
										name="putForwardBy" 
										readonly="readonly"
										value="${vo.loginUserName}"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
								<!-- 创建时间 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.workOrderManager.createDate' /> 
									<span class="required">*</span>
								</label>
								<div class="col-md-4">
									<input 
										class="form-control" 
										id="putForwardDate" 
										name="putForwardDate"
										readonly="readonly"
										value="${vo.currentTime}"
										placeholder="<spring:message code='common.laber.mustInputData'/>"/>
								</div>
							</div>
							<div class="form-group">
								<!-- 所属单位 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.workOrderManager.belongUnit' /> 
									<span class="required">* </span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id="belongUnit"
										name="belongUnit"
										value="${vo.belongUnit}"
										readonly="readonly"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
								<!-- 批次号 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.workOrderManager.workNumber' /> 
									<span class="required">* </span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id="workOrderNum"
										name="workOrderNum" 
										value="${vo.workOrderNum}" 
										readonly="readonly"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
							</div>
							<div class="form-group">
								<!-- 项目类别 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.workOrderManager.projectType' /> 
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control"
										data-size="10"  id="projectType"
										name="projectType"
									title="<spring:message code='message.pleaseselect' />">
									</select>
								</div>
							</div>		
							<div class="form-actions">
								<div class="modal-footer">
									<div class="col-md-offset-2 col-md-9">
									<button type="button" class="btn blue" id="saveWorkOrderEditId">
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
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeWorkOrderEditId"><spring:message code='btn.common.close'/></button>
    </div>
</div>	
<!-- 参数列表 -->
<script type="text/javascript">

	$("#workOrderEditFormId #projectType").initRecordProjectInfo('${vo.projectType}');//项目名称
	var reimburseBaseInfoOldVal=$("#reimburseBaseInfoEditFormId").serializeFormJson();
 	var reimburseBaseInfoField = {

	}; 
</script>
<!-- 引用配置JS -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/workbenchManage/workOrderManager/workOrderManagerEdit.js"></script>