<!-- 合同管理编辑页 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	    <div class="form-group">
	         <div class="col-md-8 col-sm-8">
	             <div class="todo-taskbody-user">
	                 <img class="todo-userpic pull-left" src="../assets/pages/media/users/avatar6.jpg" width="50px" height="50px">
	                 <span class="todo-username pull-left">Penney</span>
	                 <button type="button" class="todo-username-btn btn btn-circle btn-default btn-sm">
	                     <c:if test="${operate=='add'}"><spring:message code='btn.common.add' /></c:if>
	         			 <c:if test="${operate=='edit'}"><spring:message code='btn.common.edit' /></c:if>
	         			 <c:if test="${operate=='look'}"><spring:message code='btn.common.look' /></c:if>
	         			 
	                 </button>
	             </div>
	         </div>
	         <div class="col-md-4 col-sm-4">
	             
	         </div>
	    </div>
    </div>
 <!--     查看页面不可变 -->
  <c:if test="${operate=='look'}">
    
    <div class="modal-body todo-task-modal-body">
        <div id="bootstrap_alerts_demo"> </div>
        <form class="form-horizontal form-bordered" id="contractEditFormId" autocomplete="off" enctype="multipart/form-data"
              data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
		    <input type="hidden" value="${vo.id}" name="id" id="id"/>
		    <input type="hidden" value="" name="changeDetails" id="changeDetails"/>
            <div class="form-group">
	            <!-- 创建人-->
			    <label class="control-label col-md-2">
				    <spring:message code='lable.contract.creater' />
			    </label>
			    <div class="col-md-4">
				    <input type="text" 
				     style="width: 70%;" 
						   class="form-control" 
						   id="createBy" 
						   name="createBy" 
						   value="${vo.createBy}"
						   readonly="readonly"								  
						   placeholder="<spring:message code='common.laber.produceBySys'/>" />
			    </div>
				<!-- 创建部门-->
				<label class="control-label col-md-2">
				   <spring:message code='lable.contract.createDept' />
	                     </label>						
				<div class="col-md-4">
					<input type="text" 
					 	   style="width: 70%;" 
						   class="form-control" 
						   id="createDept" 
						   name="createDept" 
						   value="${vo.createDept}"
						   readonly="readonly"								  
						   placeholder="<spring:message code='common.laber.produceBySys'/>" />
				</div>
              </div>
            <div class="form-group">
		       <!-- 合同编号 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.contractNo' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">
					<input type="text" 
					 style="width: 70%;" 
					 
						   class="form-control" 
						   id="contractNo" 
						   name="contractNo"
						   data-rule="required" 
						   value="${vo.contractNo}"		
						   readonly="readonly"							  								
						   placeholder="<spring:message code='common.laber.mustInputData'/>" />
				</div>
                <!-- 创建时间 -->
				<label class="control-label col-md-2">
				  <spring:message code='lable.contract.createDate' />
				</label>						 
				<div class="col-md-4">
					<input type="text" 
					 style="width: 70%;" 
						   class="form-control" 
						   id="createDate" 
						   name="createDate" 
						   value="${vo.createDate}"
						   readonly="readonly"
						   placeholder="<spring:message code='common.laber.produceBySys'/>" />
				</div>
			</div>
			<div class="form-group">
				<!-- 签订日期-->
				<label class="control-label col-md-2"><spring:message code='lable.contract.signDate' />
				<span class="required">* </span>
				</label>			 
				<div class="col-md-4">								
					<input type="text" 
					 style="width: 70%;" 
						class="date-picker form-control dateSelect"
						id="signedDate"
						name="signedDate"
						data-rule="required" 
						value="${vo.signedDate}" 
						data-rule="required;"
						readonly="readonly"	
						placeholder="<spring:message code='message.pleaseselect'/>" >							
				</div>
				<!-- 所属客户 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.custom' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">
					<select class="bs-select form-filter form-control" 
							data-size="10" 
							data-width="70%"
							data-live-search="true"
							data-rule="required;"
							value="${vo.belongCustomerid}"
							disabled="disabled"
							title="<spring:message code='message.pleaseselect' />" 
							id="belongCustomerid"
							name="belongCustomerid">
	                 </select>								   
				</div>
			</div>
			<div class="form-group">				
				<!-- 合同标题 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.title' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">
					<input type="text" 
					 style="width: 70%;" 
						   class="form-control" 
						   id="contractTitle" 
						   name="contractTitle" 
						   value="${vo.contractTitle}"
						   data-rule="required;length[~100];" 
						   readonly="readonly"	
					       placeholder="<spring:message code='common.laber.mustInputData'/>" />
				</div>
				<!-- 所属产品 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.product' />
				<span class="required">* </span>
				</label>						 
				<div class="col-md-4">
					<select class="bs-select form-filter form-control" 
							data-size="10" 
							data-width="70%"
							data-live-search="true"
							data-rule="required;"
							value="${vo.belongProduct}"
							disabled="disabled"
							id="belongProduct"
							name="belongProduct"
							title="<spring:message code='message.pleaseselect' />" >
	                 </select>	
				</div>
			</div>
			<div class="form-group">
				 <!-- 币种 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.coinType' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">						     
					 <select class="bs-select form-filter form-control" 									
							data-width="70%"
							data-size="10" 
							data-live-search="true"
							data-rule="required;"
							value="${vo.currency}"
							readonly="readonly"	
							disabled="disabled"
							title="<spring:message code='message.pleaseselect' />" 
							id="currency"
							name="currency">
	                 </select>
				</div>						
				<!-- 合同金额 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.price' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">
					<input type="text" 
						   class="form-control" 
						    style="width: 70%;" 
						   id="contractAmount" 
						   name="contractAmount" 
						   value="${vo.contractAmount}"
						   readonly="readonly"	
	                       data-rule="required;positiveNum;length[~25]"
						   placeholder="<spring:message code='common.laber.mustInputData'/>" />
				</div>
			</div>
			<div class="form-group">
				<!-- 有效期-->
				<label class="control-label col-md-2"><spring:message code='lable.contract.expiryDate' /></label>
				<div class="col-md-4">							
					<input type="text" 
					 style="width: 70%;" 
						class="date-picker form-control dateSelect"
						id="effectiveDate"
						name="effectiveDate"
						value="${vo.effectiveDate}" 
						readonly="readonly"	
						placeholder="<spring:message code='message.pleaseselect'/>" >
				</div>
				<!-- 人天单价 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.personPrice' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">
					<input type="text" 
					 style="width: 70%;" 
						   class="form-control" 
						   id="laborPrice" 
						   name="laborPrice" 
						   value="${vo.laborPrice}"
						   readonly="readonly"	
						   data-rule="required;positiveNum;length[~10];"
						   placeholder="<spring:message code='common.laber.mustInputData'/>" />
				</div>
			</div>
			<div class="form-group">
				<!-- 免费服务期阶段-->
				<label class="control-label col-md-2"><spring:message code='lable.contract.freeStage' /></label>
				<div class="col-md-4">
					<select class="bs-select form-filter form-control" 
							data-size="10" 
							data-width="70%"
							data-live-search="true"
							value="${vo.freeservicePeriod}"	
							disabled="disabled"						
							id="freeservicePeriod"
							name="freeservicePeriod"
							placeholder="<spring:message code='message.pleaseselect'/>" >
	                 </select>	
				</div>	                   
				<!--免费服务期时长 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.freeTime' /></label>
				<div class="col-md-4">
					<input type="text" class="form-control"  
					 style="width: 70%;" 
					  id="freeLimit" 
					  name="freeLimit" 
					  value="${vo.freeLimit}"
					  readonly="readonly"	
					  data-rule="positiveNum;length[~10];"
					  placeholder="<spring:message code='common.laber.noneMustInputData'/>" />月
				</div>
			</div>
			<div class="form-group">						
				<!--赠送人天 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.sendDays' /></label>
				<div class="col-md-4">
					<input type="text" class="form-control"  
					 style="width: 70%;" 
					id="giveDay" 
					name="giveDay" 
					value="${vo.giveDay}"
					readonly="readonly"	
					data-rule="positiveNum;length[~10];" 
					placeholder="<spring:message code='common.laber.noneMustInputData'/>" />人天
				</div>
				<!--收费服务期时长 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.payTime' /></label>
				<div class="col-md-4">
					<input type="text" class="form-control"  
					 style="width: 70%;" 
					  id="costserviceTime" 
					  name="costserviceTime" 
					  value="${vo.costserviceTime}"
					  readonly="readonly"	
					  data-rule="positiveNum;length[~10];" 
	                           placeholder="<spring:message code='common.laber.noneMustInputData'/>" />月
				</div>
             </div>
            <div class="form-group">							
				 <!-- 付款说明 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.payDesc' /></label>
				<div class="col-md-9">
				    <textarea class="form-control" rows="5" style="width: 100%;"
				     id="paymentRemark" name="paymentRemark" 
				     value="${vo.paymentRemark}"  
				     readonly="readonly"	
				     data-rule="length[~250];"
				     placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
				     >${vo.paymentRemark}</textarea>
				</div>
	        </div>
            <div class="form-group">												
				 <!-- 备注 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.remark' /></label>
				<div class="col-md-9">
				     <textarea class="form-control" rows="6" style="width: 100%;" 
				     id="remark" name="remark" 
				     value="${vo.remark}" 
				     readonly="readonly"	
				     data-rule="length[~1000];"
				     placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
				     >${vo.remark}</textarea>
				</div>
			 </div>
			<div class="form-group last">
	            <!-- 附件 -->
				<label class="control-label col-md-2">
					<spring:message code='common.label.attachment' />
				</label>
				<div class="col-md-8">
		            <div id="moduleContractGallery" class="editableGallery"></div>
		            <div id="uploaderContractDivId" class="editableGallery">        
	                          <div class="queueList">
	                              <div id="dndArea" class="placeholder">
	                                  <div id="filePicker"></div>	                                    
	                              </div>
	                          </div>
	                          <div class="statusBar" style="display:none;">
	                              <div class="progress">
	                                  <span class="text">0%</span> <span class="percentage"></span>
	                              </div>
	                              <div class="info"></div>
	                              <div class="btns">
	                                  <div id="filePicker2" class="addFileBtn"></div>
	                              </div>
	                          </div>
	                </div> 
				</div>
             </div>           
                    <div class="tabbable-line">
	                   <ul class="nav nav-tabs ">
	                   <li class="active">
	                           <a href="#tab_1" data-toggle="tab"> 注释 </a>
	                       </li>
	                   		 <li>
	                           <a href="#tab_2" data-toggle="tab"> 历史 </a>
	                       </li>
	                   </ul>
	                   <div class="tab-content">
	                       <div class="tab-pane active" id="tab_1">
	                           <!-- TASK COMMENTS -->
	                           <div class="form-group">
	                               <div class="col-md-12">
	                                   <ul class="media-list">
	                                       <li class="media">
	                                           <a class="pull-left" href="javascript:;">
	                                               <img class="todo-userpic" src="../assets/pages/media/users/avatar8.jpg" width="27px" height="27px"> </a>
	                                           <div class="media-body todo-comment">
	                                               <button type="button" class="todo-comment-btn btn btn-circle btn-default btn-sm">回复</button>
	                                               <p class="todo-comment-head">
	                                                   <span class="todo-comment-username">Christina Aguilera</span> &nbsp;
	                                                   <span class="todo-comment-date">17 Sep 2014 at 2:05pm</span>
	                                               </p>
	                                               <p class="todo-text-color"> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
	                                                   </p>
	                                               <!-- Nested media object -->
	                                               <div class="media">
	                                                   <a class="pull-left" href="javascript:;">
	                                                       <img class="todo-userpic" src="../assets/pages/media/users/avatar4.jpg" width="27px" height="27px"> </a>
	                                                   <div class="media-body">
	                                                       <p class="todo-comment-head">
	                                                           <span class="todo-comment-username">Carles Puyol</span> &nbsp;
	                                                           <span class="todo-comment-date">17 Sep 2014 at 4:30pm</span>
	                                                       </p>
	                                                       <p class="todo-text-color"> Thanks so much my dear! </p>
	                                                   </div>
	                                               </div>
	                                           </div>
	                                       </li>
	                                       
	                                       
	                                   </ul>
	                               </div>
	                           </div>
	                           <!-- END TASK COMMENTS -->
	                           <!-- TASK COMMENT FORM -->
	                           <div class="form-group">
	                               <div class="col-md-12">
	                                   <ul class="media-list">
	                                       <li class="media">
	                                           <a class="pull-left" href="javascript:;">
	                                               <img class="todo-userpic" src="../assets/pages/media/users/avatar4.jpg" width="27px" height="27px"> </a>
	                                           <div class="media-body">
	                                               <textarea class="form-control todo-taskbody-taskdesc" rows="4" placeholder="Type comment..."></textarea>
	                                           </div>
	                                       </li>
	                                   </ul>
	                                   <button type="button" class="pull-right btn btn-sm btn-circle green"> &nbsp;发送 &nbsp; </button>
	                               </div>
	                           </div>
	                           <!-- END TASK COMMENT FORM -->
	                       </div>
	                       <jsp:include page="../../common/dataLog.jsp"/>
	                   </div>
                </div>
        </form>
   </div>
   </c:if>
  
  <!--     增加修改页面可变 -->
     <c:if test="${operate=='add' ||operate=='edit'}">
    <div class="modal-body todo-task-modal-body">
        <div id="bootstrap_alerts_demo"> </div>
        <form class="form-horizontal form-bordered" id="contractEditFormId" autocomplete="off" enctype="multipart/form-data"
              data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
		    <input type="hidden" value="${vo.id}" name="id" id="id"/>
		    <input type="hidden" value="" name="changeDetails" id="changeDetails"/>
            <div class="form-group">
	            <!-- 创建人-->
			    <label class="control-label col-md-2">
				    <spring:message code='lable.contract.creater' />
			    </label>
			    <div class="col-md-4">
				    <input type="text" 
				     style="width: 70%;" 
						   class="form-control" 
						   id="createBy" 
						   name="createBy" 
						   value="${vo.createBy}"
						   readonly="readonly"								  
						   placeholder="<spring:message code='common.laber.produceBySys'/>" />
			    </div>
				<!-- 创建部门-->
				<label class="control-label col-md-2">
				   <spring:message code='lable.contract.createDept' />
	                     </label>						
				<div class="col-md-4">
					<input type="text" 
					 style="width: 70%;" 
						   class="form-control" 
						   id="createDept" 
						   name="createDept" 
						   value="${vo.createDept}"
						   readonly="readonly"								  
						   placeholder="<spring:message code='common.laber.produceBySys'/>" />
				</div>
              </div>
            <div class="form-group">
		       <!-- 合同编号 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.contractNo' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">
					<input type="text" 
					 style="width: 70%;" 
						   class="form-control" 
						   id="contractNo" 
						   name="contractNo"
						   data-rule="required" 
						   value="${vo.contractNo}"								  								
						   placeholder="<spring:message code='common.laber.mustInputData'/>" />
				</div>
                <!-- 创建时间 -->
				<label class="control-label col-md-2">
				  <spring:message code='lable.contract.createDate' />
				</label>						 
				<div class="col-md-4">
					<input type="text" 
					 style="width: 70%;" 
						   class="form-control" 
						   id="createDate" 
						   name="createDate" 
						   value="${vo.createDate}"
						   readonly="readonly"
						   placeholder="<spring:message code='common.laber.produceBySys'/>" />
				</div>
			</div>
			<div class="form-group">
				<!-- 签订日期-->
				<label class="control-label col-md-2"><spring:message code='lable.contract.signDate' />
				<span class="required">* </span>
				</label>			 
				<div class="col-md-4">								
					<input type="text" 
					 style="width: 70%;" 
						class="date-picker form-control dateSelect"
						id="signedDate"
						name="signedDate"
						data-rule="required" 
						value="${vo.signedDate}" 
						data-rule="required;"
						placeholder="<spring:message code='message.pleaseselect'/>" >							
				</div>
				<!-- 所属客户 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.custom' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">
					<select class="bs-select form-filter form-control" 
							data-size="10" 
							data-width="70%"
							data-live-search="true"
							data-rule="required;"
							value="${vo.belongCustomerid}"
							title="<spring:message code='message.pleaseselect' />" 
							id="belongCustomerid"
							name="belongCustomerid">
	                 </select>								   
				</div>
			</div>
			<div class="form-group">				
				<!-- 合同标题 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.title' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">
					<input type="text" 
					 style="width: 70%;" 
						   class="form-control" 
						   id="contractTitle" 
						   name="contractTitle" 
						   value="${vo.contractTitle}"
						   data-rule="required;length[~100];" 
					       placeholder="<spring:message code='common.laber.mustInputData'/>" />
				</div>
				<!-- 所属产品 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.product' />
				<span class="required">* </span>
				</label>						 
				<div class="col-md-4">
					<select class="bs-select form-filter form-control" 
							data-size="10" 
							data-width="70%"
							data-live-search="true"
							data-rule="required;"
							value="${vo.belongProduct}"
							id="belongProduct"
							name="belongProduct"
							title="<spring:message code='message.pleaseselect' />" >
	                 </select>	
				</div>
			</div>
			<div class="form-group">
				 <!-- 币种 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.coinType' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">						     
					 <select class="bs-select form-filter form-control" 									
							data-width="70%"
							data-size="10" 
							data-live-search="true"
							data-rule="required;"
							value="${vo.currency}"
							title="<spring:message code='message.pleaseselect' />" 
							id="currency"
							name="currency">
	                 </select>
				</div>						
				<!-- 合同金额 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.price' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">
					<input type="text" 
					 style="width: 70%;" 
						   class="form-control" 
						   id="contractAmount" 
						   name="contractAmount" 
						   value="${vo.contractAmount}"
	                                data-rule="required;positiveNum;length[~25]"
						   placeholder="<spring:message code='common.laber.mustInputData'/>" />
				</div>
			</div>
			<div class="form-group">
				<!-- 有效期-->
				<label class="control-label col-md-2"><spring:message code='lable.contract.expiryDate' /></label>
				<div class="col-md-4">							
					<input type="text" 
					 style="width: 70%;" 
						class="date-picker form-control dateSelect"
						id="effectiveDate"
						name="effectiveDate"
						value="${vo.effectiveDate}" 
						placeholder="<spring:message code='message.pleaseselect'/>" >
				</div>
				<!-- 人天单价 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.personPrice' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">
					<input type="text" 
					 style="width: 70%;" 
						   class="form-control" 
						   id="laborPrice" 
						   name="laborPrice" 
						   value="${vo.laborPrice}"
						   data-rule="required;positiveNum;length[~10];"
						   placeholder="<spring:message code='common.laber.mustInputData'/>" />
				</div>
			</div>
			<div class="form-group">
				<!-- 免费服务期阶段-->
				<label class="control-label col-md-2"><spring:message code='lable.contract.freeStage' /></label>
				<div class="col-md-4">
					<select class="bs-select form-filter form-control" 
							data-size="10" 
							data-width="70%"
							data-live-search="true"
							value="${vo.freeservicePeriod}"									
							id="freeservicePeriod"
							name="freeservicePeriod"
							placeholder="<spring:message code='message.pleaseselect'/>" >
	                 </select>	
				</div>	                   
				<!--免费服务期时长 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.freeTime' /></label>
				<div class="col-md-4">
					<input type="text" class="form-control"  
					 style="width: 70%;" 
					  id="freeLimit" 
					  name="freeLimit" 
					  value="${vo.freeLimit}"
					  data-rule="positiveNum;length[~10];"
					  placeholder="<spring:message code='common.laber.noneMustInputData'/>" />月
				</div>
			</div>
			<div class="form-group">						
				<!--赠送人天 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.sendDays' /></label>
				<div class="col-md-4">
					<input type="text" class="form-control"  
					 style="width: 70%;" 
					id="giveDay" 
					name="giveDay" 
					value="${vo.giveDay}"
					data-rule="positiveNum;length[~10];" 
					placeholder="<spring:message code='common.laber.noneMustInputData'/>" />人天
				</div>
				<!--收费服务期时长 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.payTime' /></label>
				<div class="col-md-4">
					<input type="text" class="form-control"  
					 style="width: 70%;" 
					  id="costserviceTime" 
					  name="costserviceTime" 
					  value="${vo.costserviceTime}"
					  data-rule="positiveNum;length[~10];" 
	                           placeholder="<spring:message code='common.laber.noneMustInputData'/>" />月
				</div>
             </div>
            <div class="form-group">							
				 <!-- 付款说明 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.payDesc' /></label>
				<div class="col-md-9">
				    <textarea class="form-control" rows="5" style="width: 100%;"
				     id="paymentRemark" name="paymentRemark" 
				     value="${vo.paymentRemark}"  
				     data-rule="length[~250];"
				     placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
				     >${vo.paymentRemark}</textarea>
				</div>
	        </div>
            <div class="form-group">												
				 <!-- 备注 -->
				<label class="control-label col-md-2"><spring:message code='lable.contract.remark' /></label>
				<div class="col-md-9">
				     <textarea class="form-control" rows="6" style="width: 100%;" 
				     id="remark" name="remark" 
				     value="${vo.remark}" 
				     data-rule="length[~1000];"
				     placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
				     >${vo.remark}</textarea>
				</div>
			 </div>
			<div class="form-group last">
	            <!-- 附件 -->
				<label class="control-label col-md-2">
					<spring:message code='common.label.attachment' />
				</label>
				<div class="col-md-8">
		            <div id="moduleContractGallery" class="editableGallery"></div>
		            <div id="uploaderContractDivId" class="editableGallery">        
	                          <div class="queueList">
	                              <div id="dndArea" class="placeholder">
	                                  <div id="filePicker"></div>	                                    
	                              </div>
	                          </div>
	                          <div class="statusBar" style="display:none;">
	                              <div class="progress">
	                                  <span class="text">0%</span> <span class="percentage"></span>
	                              </div>
	                              <div class="info"></div>
	                              <div class="btns">
	                                  <div id="filePicker2" class="addFileBtn"></div>
	                              </div>
	                          </div>
	                </div> 
				</div>
             </div>           
            <div class="form-actions">
	                   <div class="modal-footer">
		                     <button type="button" class="btn btn-danger" id="clearContractEditId">
								  <spring:message code='btn.common.clear' />
							 </button>
		                     <button type="button" class="btn green" id="saveContractId">
								  <spring:message code='btn.common.save' />
						     </button>
	                    </div>
                    </div>
                    <div class="tabbable-line">
	                   <ul class="nav nav-tabs ">
	                       <li class="active">
	                           <a href="#tab_1" data-toggle="tab"> 注释 </a>
	                       </li>
	                       <li>
	                           <a href="#tab_2" data-toggle="tab"> 历史 </a>
	                       </li>
	                   </ul>
	                   <div class="tab-content">
	                       <div class="tab-pane active" id="tab_1">
	                           <!-- TASK COMMENTS -->
	                           <div class="form-group">
	                               <div class="col-md-12">
	                                   <ul class="media-list">
	                                       <li class="media">
	                                           <a class="pull-left" href="javascript:;">
	                                               <img class="todo-userpic" src="../assets/pages/media/users/avatar8.jpg" width="27px" height="27px"> </a>
	                                           <div class="media-body todo-comment">
	                                               <button type="button" class="todo-comment-btn btn btn-circle btn-default btn-sm">回复</button>
	                                               <p class="todo-comment-head">
	                                                   <span class="todo-comment-username">Christina Aguilera</span> &nbsp;
	                                                   <span class="todo-comment-date">17 Sep 2014 at 2:05pm</span>
	                                               </p>
	                                               <p class="todo-text-color"> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
	                                                   </p>
	                                               <!-- Nested media object -->
	                                               <div class="media">
	                                                   <a class="pull-left" href="javascript:;">
	                                                       <img class="todo-userpic" src="../assets/pages/media/users/avatar4.jpg" width="27px" height="27px"> </a>
	                                                   <div class="media-body">
	                                                       <p class="todo-comment-head">
	                                                           <span class="todo-comment-username">Carles Puyol</span> &nbsp;
	                                                           <span class="todo-comment-date">17 Sep 2014 at 4:30pm</span>
	                                                       </p>
	                                                       <p class="todo-text-color"> Thanks so much my dear! </p>
	                                                   </div>
	                                               </div>
	                                           </div>
	                                       </li>
	                                       <li class="media">
	                                           <a class="pull-left" href="javascript:;">
	                                               <img class="todo-userpic" src="../assets/pages/media/users/avatar5.jpg" width="27px" height="27px"> </a>
	                                           <div class="media-body todo-comment">
	                                               <button type="button" class="todo-comment-btn btn btn-circle btn-default btn-sm">回复</button>
	                                               <p class="todo-comment-head">
	                                                   <span class="todo-comment-username">Andres Iniesta</span> &nbsp;
	                                                   <span class="todo-comment-date">18 Sep 2014 at 9:22am</span>
	                                               </p>
	                                               <p class="todo-text-color"> Cras sit amet nibh libero, in gravida nulla. Scelerisque ante sollicitudin commodo Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum
	                                                   in vulputate at, tempus viverra turpis.
	                                                   <br> </p>
	                                           </div>
	                                       </li>
	                                       <li class="media">
	                                           <a class="pull-left" href="javascript:;">
	                                               <img class="todo-userpic" src="../assets/pages/media/users/avatar6.jpg" width="27px" height="27px"> </a>
	                                           <div class="media-body todo-comment">
	                                               <button type="button" class="todo-comment-btn btn btn-circle btn-default btn-sm">回复</button>
	                                               <p class="todo-comment-head">
	                                                   <span class="todo-comment-username">Olivia Wilde</span> &nbsp;
	                                                   <span class="todo-comment-date">18 Sep 2014 at 11:50am</span>
	                                               </p>
	                                               <p class="todo-text-color"> Cras sit amet nibh libero, in gravida nulla. Scelerisque ante sollicitudin commodo Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum
	                                                   in vulputate at, tempus viverra turpis.
	                                                   <br> </p>
	                                           </div>
	                                       </li>
	                                   </ul>
	                               </div>
	                           </div>
	                           <!-- END TASK COMMENTS -->
	                           <!-- TASK COMMENT FORM -->
	                           <div class="form-group">
	                               <div class="col-md-12">
	                                   <ul class="media-list">
	                                       <li class="media">
	                                           <a class="pull-left" href="javascript:;">
	                                               <img class="todo-userpic" src="../assets/pages/media/users/avatar4.jpg" width="27px" height="27px"> </a>
	                                           <div class="media-body">
	                                               <textarea class="form-control todo-taskbody-taskdesc" rows="4" placeholder="Type comment..."></textarea>
	                                           </div>
	                                       </li>
	                                   </ul>
	                                   <button type="button" class="pull-right btn btn-sm btn-circle green"> &nbsp;发送 &nbsp; </button>
	                               </div>
	                           </div>
	                           <!-- END TASK COMMENT FORM -->
	                       </div>
	                       <jsp:include page="../../common/dataLog.jsp"/>
	                   </div>
                </div>
        </form>
   </div>
   </c:if>
   <div class="modal-footer">
          <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeContractEditId">关闭</button>
   </div>
<script type="text/javascript">
	$("#contractEditFormId #createDept").val(getDeptByIds($("#contractEditFormId #createDept").val()));
	$("#contractEditFormId #currency").initDic('${vo.currency}',codeBasicInfo.btype);
	$("#contractEditFormId #freeservicePeriod").initDic('${vo.freeservicePeriod}',codeBasicInfo.projectStage);
	$("#contractEditFormId #belongProduct").initDic('${vo.belongProduct}',codeBasicInfo.projectonly);
	$("#contractEditFormId #belongCustomerid").initCustomerInfo('${vo.belongCustomerid}');
	var contractEdit_operate='${operate}';
	$(function(){
		if(contractEdit_operate=='edit'){
			//初始化上传插件
			initWebUploaderUI({
	        	_webUploaderId:'#uploaderContractDivId',
	        	_fileAddId:'#filePicker',
	        	_fileAddIdContinue:'#filePicker2',
	        	_dataId:'${vo.id}',
	        	_pageType:'R003-0101',
	        	_editFileId:'#moduleContractGallery'});
	        //初始化历史数据
			initEidtUploaderUI({
				_editFileId:'#moduleContractGallery',
				_dataId:'${vo.id}',
				_pageType:'R003-0101',
				_canDelete:true
				});
		}
	});

	var contractVal=$("#contractEditFormId").serializeFormJson();
	var contractColumn = {
		signedDate:"<spring:message code='lable.contract.signDate' />",
		belongCustomerid:"<spring:message code='lable.contract.custom' />",
		contractTitle:"<spring:message code='lable.contract.title' />",								
		belongProduct:"<spring:message code='lable.contract.product' />",						
		currency:"<spring:message code='lable.contract.coinType' />",						
		contractAmount:"<spring:message code='lable.contract.price' />",
		effectiveDate:"<spring:message code='lable.contract.expiryDate' />",
		laborPrice:"<spring:message code='common.laber.mustInputData'/>",
		freeservicePeriod:"<spring:message code='lable.contract.freeStage' />",
		freeLimit:"<spring:message code='lable.contract.freeTime' />",
		giveDay:"<spring:message code='lable.contract.sendDays' />",
		costserviceTime:"<spring:message code='lable.contract.payTime' />",
		paymentRemark:"<spring:message code='lable.contract.payDesc' />",					
		remark:"<spring:message code='lable.contract.remark' />"
	};
</script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/pactManage/contractmaintenance/contractManageEdit.js"></script>