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
			                       <font style="vertical-align: inherit;"><spring:message code='lable.projectBaseinfo.projectBaseinfo' /></font>
			                 </font>
		                 </span>
		             </div>
		             <div class="tools">
		                 <a href="javascript:;" class="collapse"> </a>
		                 <a href="javascript:;" class="reload"> </a>
		             </div>
		         </div>
		         <div class="portlet-body form">
					<form class="form-horizontal form-bordered" id="projectBaseInfoEditFormId"
						autocomplete="off" enctype="multipart/form-data"
						data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${vo.id}" name="id"/>
						<input type="hidden" value="" name="changeDetails" id="changeDetails" />
						<div class="form-body">
							<div class="form-group">
								<!-- 项目名称 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.projectName' /> 
									<span class="required">* </span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id="projectName"
										name="projectName" 
										value="${vo.projectName}"
										data-rule="required;length[~50];"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
								<!-- 所属事业部 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.toDivision' /> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										readonly="readonly" 
										id="toDivisionTwo"
										name="toDivisionName"
										data-target="#showDeptModalId" 
										data-toggle="modal"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
									<input type="hidden" data-rule="required;" name="toDivision" id="toDivisionOne" value="${vo.toDivision}" />
								</div>
							</div>
							<div class="form-group">
								<!-- 项目负责人 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.projectHead' /> 
									<span class="required">* </span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id="projectHeadName"
										name="projectHeadName"
										value="${vo.projectHeadName}"
										readonly="readonly"
										data-rule="required;"
										data-target="#showUserModalId" 
										data-toggle="modal"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
									<input type="hidden" value="${vo.projectHead}" name="projectHead" id="projectHead"/> 
								</div>
								<!-- 商务人员 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.businessPeople' /> 
									<span class="required">* </span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id="businessPeopleName"
										name="businessPeopleName" 
										value="${vo.businessPeopleName}" 
										readonly="readonly"
										data-rule="required;"
										data-target="#showUserModalId" 
										data-toggle="modal"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
									<input type="hidden" value="${vo.businessPeople}" name="businessPeople" id="businessPeople"/> 
								</div>
							</div>
							<div class="form-group">
								<!-- 项目资源 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.projectResource' /> 
									<span class="required">*</span> 
								</label>
								<div class="col-md-9">
									<textarea class="form-control" 
										rows="3" 
										data-rule="required;" 
										id="projectResourceName"
										name="projectResourceName" 
										readonly="readonly"
										placeholder="<spring:message code='common.laber.mustInputData'/>"
										value="${vo.projectResourceName}">${vo.projectResourceName}</textarea>
									<input type="hidden" value="${vo.projectResource}" name="projectResource" id="projectResource"/> 
								</div>
							</div>
							<div class="form-group">
								<!-- 项目经理 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.projectManager' /> 
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id=projectManagerName
										name="projectManagerName" 
										value="${vo.projectManagerName}"
										readonly="readonly"
										data-target="#showUserModalId" 
										data-toggle="modal"
										data-rule="required;length[~500];"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
									<input type="hidden" value="${vo.projectManager}" name="projectManager" id="projectManager"/> 
								</div>
								<!-- 产品经理 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.productManager' /> 
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id="productManagerName"
										name="productManagerName" 
										value="${vo.productManagerName}"
										readonly="readonly"
										data-target="#showUserModalId" 
										data-toggle="modal"
										data-rule="required;length[~500];"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
									<input type="hidden" value="${vo.productManager}"  name="productManager" id="productManager"/> 
								</div>
							</div>
							<div class="form-group">
								<!-- 工期 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.workTime' /> 
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<div class="input-group input-large">
										<input type="text" 
											class="date-picker form-control dateSelect"
											style="width: 49%;"
											id="beginTime"
											name="beginTime"
											data-rule="required;"
											value="${vo.beginTime}"
											placeholder="<spring:message code='message.pleaseselect'/>" >
										<input type="text" 
											class="date-picker form-control dateSelect"
											style="width: 49%;"
											id="endTime"
											name="endTime"
											data-rule="required;"
											value="${vo.endTime}"
											placeholder="<spring:message code='message.pleaseselect'/>" >	
									</div>	
								</div>
							</div>
							<div class="form-group">
								<!-- 已耗工时 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.expiredHours' /> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id=expiredHours
										name="expiredHours" 
										value="${vo.expiredHours}"
										data-rule="positiveNum;length[~50];"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
								<!-- 预估工作量 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.estimatedWorkload' /> 
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id=estimatedWorkload
										name="estimatedWorkload" 
										value="${vo.estimatedWorkload}"
										data-rule="required;positiveNum;length[~50];"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
							</div>
							<div class="form-group">
								<!-- 合同金额 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.contractAmount' /> 
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id=contractAmount
										name="contractAmount" 
										value="${vo.contractAmount}"
										data-rule="required;positiveNum;length[~50];"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
								<!-- 利润指标 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.profitTargets' /> 
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id=profitTargets
										name="profitTargets" 
										value="${vo.profitTargets}"
										data-rule="required;positiveNum;length[~50];"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
							</div>
							<div class="form-group">
								<!-- 项目阶段-->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.projectPhase' /> 
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control"
										data-size="10" 
										data-width="70%"
										data-rule="required;"
										title="<spring:message code='message.pleaseselect' />"
										id="projectPhase" name="projectPhase">
									</select>
								</div>
								<!-- 人天成本 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.naturallyCost' /> 
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id=naturallyCost
										name="naturallyCost" 
										value="${vo.naturallyCost}"
										data-rule="required;length[~50];"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
							</div>
							<div class="form-group">
								<!-- 项目状态 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.projectStatus' /> 
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control"
										data-size="10" 
										data-width="70%"
										data-rule="required;"
										title="<spring:message code='message.pleaseselect' />"
										id="projectStatus" name="projectStatus">
									</select>
								</div>
								<!-- 超期时间 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.projectBaseinfo.expirationDate' /> 
								</label>
								<div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id=expirationDate
										name="expirationDate" 
										readonly="readonly"
										value="${vo.expirationDate}"
										data-rule="length[~50];"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
							</div>
							<div class="form-actions">
								<div class="modal-footer">
									<div class="col-md-offset-2 col-md-9">
									<button type="button" class="btn blue" id="saveProjectBaseInfoId">
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
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeProjectBaseInfoEditId"><spring:message code='btn.common.close'/></button>
    </div>
</div>	
<!-- 参数列表 -->
<script type="text/javascript">
	$("#projectBaseInfoEditFormId #projectPhase").initDic('${vo.projectPhase}',codeBasicInfo.projectPhase);//项目阶段
	$("#projectBaseInfoEditFormId #toDivisionTwo").val(getDeptByIds('${vo.toDivision}'));
	if('${operate}'=='add'){
		$("#projectBaseInfoEditFormId #projectStatus").initDic("0",codeBasicInfo.projectState);//项目状态
	}else{
		$("#projectBaseInfoEditFormId #projectStatus").initDic('${vo.projectStatus}',codeBasicInfo.projectState);//项目状态
	}
	var projectBaseInfoOldVal=$("#projectBaseInfoEditFormId").serializeFormJson();
	var projectBaseInfoField = {
		projectName:"<spring:message code='lable.projectBaseinfo.projectName' />",
		toDivisionName:"<spring:message code='lable.projectBaseinfo.toDivision' />",
		projectHeadName:"<spring:message code='lable.projectBaseinfo.projectHead' />", 
		businessPeopleName:"<spring:message code='lable.projectBaseinfo.businessPeople' />", 
		projectResourceName:"<spring:message code='lable.projectBaseinfo.projectResource' />", 
		productManagerName:"<spring:message code='lable.projectBaseinfo.productManager' />", 
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
	
	//部门选择
   	$("#toDivisionTwo").on("click",function(){
   		var deptId = $("#toDivisionOne").val();
		$(this).attr("href",basePath+"/common/getDeptList?type=radio&showId=toDivisionTwo&hiddenId=toDivisionOne&deptId="+deptId);
   	});
</script>
<!-- 引用配置JS -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManage/projectBaseinfoManager/projectBaseinfoEdit.js"></script>