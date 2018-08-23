<!-- 项目审批查看界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
	<div class="col-md-12">
	    <div class="portlet box grey-cascade form-fit">
             <div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i><spring:message code='btn.common.view' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse">
					</a>
					<a href="javascript:;" class="remove" data-dismiss="modal">
				    </a>
				</div>
			  </div>
			  <div class="portlet-body form">
			    <form class="form-horizontal  form-bordered" id="projectViewFormId" autocomplete="off" 
				    data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">	                           
	   				<!-- 项目ID -->
    				<input type="hidden" value="${projectVo.id}" id="projectId" name="id"/>
    				<input type="hidden" value="${projectVo.projectStatus }" name="projectStatus" />
    				<div class="form-group">
                        <!-- 创建人 -->
					    <label class="control-label col-md-2">
						    <spring:message code='common.label.createBy' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-4">
						    <input type="text" 
								   class="form-control" 
								   id="createByName" 
								   readonly="readonly"
								   name="createByName" 
								   value="${projectVo.createByName}"/>
					    </div>
						<!-- 创建部门-->
						<label class="control-label col-md-2"><spring:message code='common.label.createDepartment' /></label>
						<div class="col-md-4">
							<input type="text" 
								   class="form-control"
								  value="${projectVo.createDeptName}"
								   id="createDeptName" 
								   readonly="readonly"/>
						</div>
						<input type="hidden" value="${projectVo.createDept}" id="createDept" />
                     </div>
                     <div class="form-group">
                     	<!-- 创建时间-->
						<label class="control-label col-md-2"><spring:message code='common.label.createDate' /></label>
						<div class="col-md-4">
							<input type="text" 
								   class="form-control" 
								   id="createDate" 
								   name="createDate" 
								   readonly="readonly"
								   value="${projectVo.createDate}" />
						</div>
                     	<!-- 项目编号 -->
					    <label class="control-label col-md-2">
						    <spring:message code='label.projectManager.projectNo' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-4">
					    	<input type="text" 
							   class="form-control" 
							   id="projectNo" 
							   name="projectNo" 
							   readonly="readonly"
							   value="${projectVo.projectNo}" />
					    </div>
                     </div>
                     <div class="form-group">
                     	<!-- 合同编号 -->
					    <label class="control-label col-md-2">
						    <spring:message code='lable.contract.contractNo' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-4">
					    	<input type="text" 
							   	class="form-control" 
							   	id="contractNo" 							  
							   	value="${projectVo.contractNo}" />
					    </div>
					    <input type="hidden" name ="contractId" id="contractIdSelect" value="${projectVo.contractId}" />
					    <!-- 所属客户 -->
					    <label class="control-label col-md-2">
						    <spring:message code='label.projectManager.belongCustomerid' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-4">
					        <input type="text" 
							   	class="form-control" 
							   	id="belongCustomerid" 							  
							   	value="${projectVo.belongCustomerName}" />					    	
					    </div>
                     </div>
                     <div class="form-group">
                     	<!-- 所属产品 -->
                     	<label class="control-label col-md-2">
						    <spring:message code='label.projectManager.belongProduct' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-4">
					        <input type="text" 
							   	class="form-control" 
							   	id="belongProduct" 							  
							   	value="${projectVo.belongProductName}" />						    	
					    </div>
                     	<!-- 项目阶段 -->
                     	<label class="control-label col-md-2">
						    <spring:message code='label.projectManager.projectStage' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-4">
					         <input type="text" 
							   	class="form-control" 
							   	id="projectStage" 							  
							   	value="${projectVo.projectStageName}" />						    	
					    </div>
                     </div>
                     <div class="form-group">
                     	<!-- 项目标题 -->
                     	<label class="control-label col-md-2">
						    <spring:message code='label.projectManager.projectName' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-9">
					    	<textarea class="form-control" style="width: 99%;" rows="1" 
					    		id="projectName" name="projectName" data-rule="length[~250];"
								readonly="readonly" value="${projectVo.projectName}">${projectVo.projectName}</textarea>
					    </div>
                   	 </div>
                     <div class="form-group">
                   	 	<!-- 实施负责人 -->
                   	 	<label class="control-label col-md-2">
						    <spring:message code='label.projectManager.implementHead' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-4">
					        <input type="text" 
							   	class="form-control" 
							   	id="implementHead" 							  
							   	value="${projectVo.implementHeadName}" />					    	
					    </div>
                   	 	<!-- 研发负责人 -->
                   	 	<label class="control-label col-md-2">
						    <spring:message code='label.projectManager.exploitHead' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-4">
					         <input type="text" 
							   	class="form-control" 
							   	id="exploitHead" 							  
							   	value="${projectVo.exploitHeadName}" />	
					    </div>
                   	 </div>
                     <div class="form-group">
                     	<!-- 立项日期 -->
                     	<label class="control-label col-md-2">
						    <spring:message code='label.projectManager.projectDate' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-4">
					    	<input type="text" 
								class="date-picker form-control dateSelect"
								id="projectDate"
								name="projectDate" 
								value="${projectVo.projectDate}" 
								data-rule="required;"
								placeholder="<spring:message code='message.pleaseselect'/>" >
					    </div>
                     	<!-- 计划工时 -->
                   	 	<label class="control-label col-md-2">
						    <spring:message code='label.projectManager.planWorkHours' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-4">
					    	<input type="text" 
								class="form-control" 
								id="planWorkHours" 
								name="planWorkHours" 
								data-rule="required;positiveNum;"
								value="${projectVo.planWorkHours}"
								 />
					    </div>
                     </div>
                   	 <div class="form-group">
                   	 	<!-- 项目说明 -->
                   	 	<label class="control-label col-md-2">
						    <spring:message code='label.projectManager.projectTitle' />
					    </label>
					    <div class="col-md-9">
					    	<textarea class="form-control" style="width: 99%;" rows="2" id="projectTitle" data-rule="length[~1000];"
								name="projectTitle" value="${projectVo.projectTitle}">${projectVo.projectTitle}</textarea>
					    </div>
                   	 </div>
                   	 <div class="form-group">
                   	 	<!-- 范围说明 -->
                   	 	<label class="control-label col-md-2">
						    <spring:message code='label.projectManager.scopeDescription' />
					    </label>
					    <div class="col-md-9">
					    	<textarea class="form-control" style="width: 99%;" rows="2" id="scopeDescription" data-rule="length[~1000];"
								name="scopeDescription" value="${projectVo.scopeDescription}">${projectVo.scopeDescription}</textarea>
					    </div>
                   	 </div>
                   	 <div class="form-group">
                   	 	<!-- 风险预估 -->
                   	 	<label class="control-label col-md-2">
						    <spring:message code='label.projectManager.riskAssessment' />
					    </label>
					    <div class="col-md-9">
					    	<textarea class="form-control" style="width: 99%;" rows="2" id="riskAssessment" data-rule="length[~1000];"
								name="riskAssessment" value="${projectVo.riskAssessment}">${projectVo.riskAssessment}</textarea>
					    </div>
                   	 </div>
                   	 <div class="form-group">
                   	 	<!-- 备注 -->
                   	 	<label class="control-label col-md-2">
						    <spring:message code='label.projectManager.remark' />
					    </label>
					    <div class="col-md-9">
					    	<textarea class="form-control" style="width: 99%;" rows="2" id="remark" data-rule="length[~1000];"
								name="remark" value="${projectVo.remark}">${projectVo.remark}</textarea>
					    </div>
                   	 </div>                 	 
                  	<div class="form-actions">
					   <div class="row">
							<div class="modal-footer">													
								<button type="button" data-dismiss="modal" class="btn default"
									id="closeProjectId">
									<i class="fa fa-mail-forward"></i>
									<spring:message code='btn.common.close' />
								</button>
							</div>
					   </div>
				  </div>
   			 </form>
   		   </div>
	    </div>
	</div>
</div>
<!-- 合同选择弹出框 -->
<div id="selectContractModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:80%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!-- 参数列表 -->
<script type="text/javascript">
	$("#projectViewFormId #projectStage").initDic('${projectVo.projectStage}',codeBasicInfo.projectStage);
	$("#projectViewFormId #implementHead").initUserInfo('${projectVo.implementHead}');
	$("#projectViewFormId #exploitHead").initUserInfo('${projectVo.exploitHead}');
	$("#projectViewFormId #belongCustomerid").initCustomerInfo('${projectVo.belongCustomerid}');
	$("#projectViewFormId #belongProduct").initDic('${projectVo.belongProduct}',codeBasicInfo.PRODUCT);		
</script>