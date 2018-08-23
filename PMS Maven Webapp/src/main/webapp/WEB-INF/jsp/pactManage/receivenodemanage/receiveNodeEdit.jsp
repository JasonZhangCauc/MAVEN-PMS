<!-- 收款节点编辑 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
     <div class="col-md-12">
          <!-- BEGIN PORTLET-->
          <div class="portlet box grey-cascade form-fit">
              <div class="portlet-title">
				<div class="caption">
					<c:if test="${operate=='add'}"><i class="fa fa-cogs"></i><spring:message code='btn.common.add' /></c:if>
				    <c:if test="${operate=='edit'}"><i class="fa fa-cogs"></i><spring:message code='btn.common.edit' /></c:if>
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse">
					</a>
					<a href="javascript:;" class="remove" data-dismiss="modal">
				    </a>
				</div>
			  </div>
              <div class="portlet-body form">
                  <form class="form-horizontal  form-bordered" id="nodeEditFormId" autocomplete="off" 
				    data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
				    <input type="hidden" value="${vo.id}" name="id" id="id"/>
				    <input type="hidden" value="${vo.contractId}" name="contractId" id="contractId"/>
				    <input type="hidden" value="${vo.belongCustomerid}" name="belongCustomerid" id="belongCustomerid"/>
				    <input type="hidden" value="${vo.belongProduct}" name="belongProduct" id="belongProduct"/>
				    <input type="hidden" value="" name="changeDetails" id="changeDetails" />
                     <!-- 收款节点编号 -->
                    <div class="form-group">                       
					    <label class="control-label col-md-2">
						    <spring:message code='label.receiveNode.receivablesNo' />
					    </label>
					    <div class="col-md-4">
						    <input type="text" 
								   class="form-control" 
								   id="receivablesNo" 
								   name="receivablesNo" 
								   value="${vo.receivablesNo}"
								   readonly="readonly" 								   
								   placeholder="<spring:message code='common.laber.produceBySys'/>" />
					    </div>
					    <!-- 收款节点名称 -->
						<label class="control-label col-md-2"><spring:message code='label.receiveNode.receivablesName' />
						<span class="required">* </span>
						</label>						
						<div class="col-md-4">
							<input type="text" 
								   class="form-control" 
								   id="receivablesName" 
								   name="receivablesName" 
								   value="${vo.receivablesName}"
								   data-rule="required;length[~100];" 								  
								   placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
					  </div>					
                    <!-- 项目阶段 -->
                    <div class="form-group">                        
						<label class="control-label col-md-2"><spring:message code='label.receiveNode.projectStage' />
						  <span class="required">* </span>
						</label>						 
						<div class="col-md-4">
							 <select class="bs-select form-filter form-control" 
									data-size="10"									
									data-live-search="true"
									data-width="70%" 
									data-rule="required;"
									title="<spring:message code='message.pleaseselect' />" 
									id="projectStage"
									name="projectStage">
			                 </select>
						</div>
						<!-- 应收金额 -->
						<label class="control-label col-md-2"><spring:message code='label.receiveNode.receivableAmount' />
						 <span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
							   class="form-control" 
							   id="receivableAmount" 
							   name="receivableAmount" 
							   value="${vo.receivableAmount}"
							   data-rule="required;positiveNum;length[~25];"
							   placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
					</div>					
					<div class="form-group">
						<!-- 收款时间 -->
						<label class="control-label col-md-2"><spring:message code='label.receiveNode.receivableDate' />
						 <span class="required">* </span>
						</label>
					    <div class="col-md-4">					   								
							<input type="text" 
								class="date-picker form-control dateSelect"
								id="receivableDate"
								name="receivableDate"
								data-rule="required" 
								value="${vo.receivableDate}" 
								data-rule="required;"
								placeholder="<spring:message code='message.pleaseselect'/>" >													   
						</div>							   	
						 <!-- 收款状态-->
						<label class="control-label col-md-2"><spring:message code='label.receiveNode.receivableStatus' />
						 <span class="required">* </span>
						</label>			 
						<div class="col-md-4">
							 <select class="bs-select form-filter form-control" 
									data-size="10" 
									data-live-search="true" 
									data-rule="required;"
									data-width="70%"
									title="<spring:message code='message.pleaseselect' />" 
									id="receivableStatus"
									name="receivableStatus">
			                 </select>
						</div>	
					</div>
					<div class="form-group">
						<!-- 负责人 -->
						<label class="control-label col-md-2"><spring:message code='label.receiveNode.responsibleBy' />
						 <span class="required">* </span>
						</label>
						<div class="col-md-4">
							 <select class="bs-select form-filter form-control" 
									data-size="10"
									data-live-search="true"
									data-width="70%"
									title="<spring:message code='message.pleaseselect' />" 
									id="responsibleBy" 
								    name="responsibleBy" 
								    value="${vo.responsibleBy}"
								    data-rule="required;">
			                 </select>
						</div>
						<!-- 开票时间 -->
						<label class="control-label col-md-2"><spring:message code='label.receiveNode.billingDate' /></label>
						<div class="col-md-4">					   								
							<input type="text" 
								class="date-picker form-control dateSelect"
								id="billingDate"
								name="billingDate"
								value="${vo.billingDate}"
								placeholder="<spring:message code='message.pleaseselect'/>" >													   
						</div>																					
                    </div>          
                   <div class="form-group">
						<!-- 开票人 -->
						<label class="control-label col-md-2"><spring:message code='label.receiveNode.billingBy' /></label>
						<div class="col-md-4">
							<input type="text" 
							   class="form-control" 
							   id="billingBy" 
							   name="billingBy" 
							   value="${vo.billingBy}"
							   data-rule="length[~50];"
							   placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
						</div>																	
                    </div>             					
				   <div class="form-group">							
						 <!-- 付款说明 -->
						<label class="control-label col-md-2"><spring:message code='label.receiveNode.paymentRemark' /></label>
						<div class="col-md-9">
						     <textarea class="form-control" rows="3" 
						     id="paymentRemark" 
						     name="paymentRemark"						      
						     value="${vo.paymentRemark}"
						     placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
						     data-rule="length[~250];">${vo.paymentRemark}</textarea>						     
						</div>
					</div>
                     <div class="form-actions">
                         <div class="row">
                             <div class="modal-footer">
                                   <button type="button" class="btn green" id="saveNodeId">
									<i class="fa fa-check"></i>
									<spring:message code='btn.common.save' />
							    </button>
								<button type="button" data-dismiss="modal" class="btn default" id="closeNodeEditId">
									<i class="fa fa-mail-forward"></i>
									<spring:message code='btn.common.close' />
								</button>
                             </div>
                         </div>
                     </div>
                  </form>
              </div>
          </div>
          <!-- END PORTLET-->
      </div>
</div>
<script type="text/javascript">
	$("#nodeEditFormId #projectStage").initDic('${vo.projectStage}',codeBasicInfo.projectStage);
	$("#nodeEditFormId #receivableStatus").initDic('${vo.receivableStatus}',codeBasicInfo.receiveNodeStatus);
	$("#nodeEditFormId #responsibleBy").initUserInfo('${vo.responsibleBy}');   
	var receiveNodeVal=$("#nodeEditFormId").serializeFormJson();
	var receiveNodeColumn = {
	    receivablesName:"<spring:message code='label.receiveNode.receivablesName' />",
		projectStage:"<spring:message code='label.receiveNode.projectStage' />",
		receivableAmount:"<spring:message code='label.receiveNode.receivableAmount' />",
		receivableDate:"<spring:message code='label.receiveNode.receivableDate' />",
		receivableStatus:"<spring:message code='label.receiveNode.receivableStatus' />",
		responsibleBy:"<spring:message code='label.receiveNode.responsibleBy' />",
		billingBy:"<spring:message code='label.receiveNode.billingBy' />",
		billingDate:"<spring:message code='label.receiveNode.billingDate' />",
		paymentRemark:"<spring:message code='label.receiveNode.paymentRemark' />"			
	};
 
</script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/contractmanage/receivenodemanage/receiveNodeEdit.js"></script>