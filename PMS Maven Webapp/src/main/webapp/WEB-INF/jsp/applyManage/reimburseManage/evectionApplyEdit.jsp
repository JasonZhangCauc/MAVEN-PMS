<!-- 差旅报销申请新增/编辑界面 lanjunjie 20180803 -->
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
			                       <font style="vertical-align: inherit;"><spring:message code='label.applyManage.applyInfo' /></font>
			                 </font>
		                 </span>
		             </div>
		             <div class="tools">
		                 <a href="javascript:;" class="collapse"> </a>
		                 <a href="javascript:;" class="reload"> </a>
		             </div>
		         </div>
		         <div class="portlet-body form">
					<form class="form-horizontal form-bordered" id="reimburseBaseInfoEditFormId"
						autocomplete="off" enctype="multipart/form-data"
						data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${vo.id}" name="id"/>
						<input type="hidden" value="${vo.status}" name="status" id="status"/>
						<input type="hidden" value="" name="changeDetails" id="changeDetails" />
						<div class="form-body">
							
							<div class="form-group">
								<!--姓名 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.applyManage.userName' />
									<span class="required">* </span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id="userName"
										name="userName"
										value="${vo.loginUserName}"
										data-rule="required;length[~50];"
										readonly="readonly"/>
								</div>
								<!-- 报销申请日期-->
								<label class="control-label col-md-2"> 
									<spring:message code='label.applyManage.Time' />
									<span class="required">*</span>
								</label>
								<div class="col-md-4 text-left">
									<input type="text"
										class="form-control"
										id="applyTime"
										name="applyTime"
										readonly="readonly"
										data-rule="required;"
										value="${vo.currentTime}"
										placeholder="<spring:message code='message.pleaseselect'/>" >
								</div>
							</div>
							<div class="form-group">

								<!-- 报销类型-->
								<label class="col-md-2 control-label">
									<spring:message code='label.applyManage.applyType' />:
									<span class="required">*</span>
								</label>
								<div class="col-md-4 text-left">
									<select class="bs-select form-filter form-control"
										data-size="10"
										id="reimburseType"
										name="reimburseType"
										data-rule="required;"
										title="<spring:message code='label.allitem' />" >
									</select>
									
								</div>
								<!-- 单号 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.applyManage.reimburseNo' />
								</label>
								<div class="col-md-4">
									<input type="text"
										class="form-control"
										id="reimburseNo"
										name="reimburseNo"
										value="${vo.reimburseNo}"
										placeholder="<spring:message code='common.laber.noneMustInputData'/>"
										data-rule="length[~10];"/>
								</div>
							</div>
							<div class="form-group">
								<!-- 出发地点 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.applyManage.departPlace' />
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<input type="text"
										class="form-control"
										id="departPlace"
										name="departPlace"
										value="${vo.departPlace}"
										placeholder="<spring:message code='common.laber.mustInputData'/>"
										data-rule="required;length[~10];"/>
								</div>
								<!-- 到达地点 -->
								<label class="control-label col-md-2">
									<spring:message code='label.applyManage.arrivePlace' />
									<span class="required">*</span>
								</label>
								<div class="col-md-4">
									<input type="text"
									class="form-control"
									id="arrivePlace"
									name="arrivePlace"
									value="${vo.arrivePlace}"
									placeholder="<spring:message code='common.laber.mustInputData'/>"
									data-rule="required;length[~10];"/>
								</div>
							</div>
							<div class="form-group">
								<!-- 项目名称 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.applyManage.projectName' />
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control"
										data-size="10"
										data-rule="required;"
										id="projectId"
										name="projectName"
										title="<spring:message code='label.allitem'/>" >
				                    </select>
								</div>
								<!-- 金额 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.applyManage.amount' />
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<input type="text"
									class="form-control"
									id="amount"
									name="amount"
									value="${vo.amount}"
									placeholder="<spring:message code='common.laber.mustInputData'/>"
									data-rule="required;length[~10];xxx;"
									data-rule-xxx="[/^(?:0|[1-9]\d*)(?:\.\d{1,2})?$/, '请填写有效的金额']"/>
								</div>
							</div>
							<div class="form-group">
								<!-- 描述 -->
								<label class="control-label col-md-2">
									<spring:message code='label.applyManage.remark' />
									<span class="required">*</span>
								</label>
								<div class="col-md-9">
									<textarea class="form-control"
										rows="10"
										id="remark"
										name="remark"
										data-rule="required;length[~4000];"
										placeholder="<spring:message code='common.laber.mustInputData'/>"
										value="${vo.remark}">${vo.remark}</textarea>
								</div>
								<div class="form-actions">
									<div class="modal-footer">
										<div class="col-md-offset-2 col-md-9">
											<button type="button" class="btn blue" id="saveReimburseBaseInfoId">
												<i class="fa fa-check"></i>
												<spring:message code='btn.common.save' />
											</button>
										</div>
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
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeReimburseBaseInfoEditId"><spring:message code='btn.common.close'/></button>
    </div>
</div>	
<!-- 参数列表 -->
<script type="text/javascript">
	$("#reimburseBaseInfoEditFormId #reimburseType").initDic('${vo.reimburseType}',codeBasicInfo.applyType);//报销类型 
	$("#reimburseBaseInfoEditFormId #projectId").initRecordProjectInfo('${vo.projectName}');  //项目名称
	var reimburseBaseInfoOldVal=$("#reimburseBaseInfoEditFormId").serializeFormJson();
	var reimburseBaseInfoField = {
		userName:"<spring:message code='label.applyManage.userName' />",
		reimburseNo:"<spring:message code='label.applyManage.reimburseNo' />",
		reimburseType:"<spring:message code='label.applyManage.applyType' />", 
		userNo:"<spring:message code='label.applyManage.userNo' />", 
		projectName:"<spring:message code='label.applyManage.projectName' />", 
		departPlace:"<spring:message code='label.applyManage.departTime' />", 
		arrivePlace:"<spring:message code='label.applyManage.arriveTime' />", 
		applyTime:"<spring:message code='label.applyManage.applyType' />", 
		amount:"<spring:message code='label.applyManage.amount' />", 
		remark:"<spring:message code='label.applyManage.remark' />", 
	};
</script>
<!-- 引用配置JS -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/applyManage/reimburseManage/evectionApplyEdit.js"></script>