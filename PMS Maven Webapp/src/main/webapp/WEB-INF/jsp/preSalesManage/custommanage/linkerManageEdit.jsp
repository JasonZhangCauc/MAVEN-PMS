<!-- 联系人编辑 -->
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
			                 		<c:if test="${operate=='add'}">
										<spring:message code='btn.common.add' />
									</c:if>
								    <c:if test="${operate=='edit'}">
										<spring:message code='btn.common.edit' />
								    </c:if>
			                 </font>
		                 </span>
		             </div>
		             <div class="tools">
		                 <a href="javascript:;" class="collapse"> </a>
		                 <a href="javascript:;" class="reload"> </a>
		             </div>
		         </div>
		         <div class="portlet-body form">
					<form class="form-horizontal  form-bordered" id="linkerEditFormIdss" autocomplete="off" 
				    data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${vo.id}" name="id" id="id"/>
						<input type="hidden" value="${vo.customerId}" name="customerId" id="customerId"/>
				    	<input type="hidden" value="" name="changeDetails" id="changeDetails" />
						
						<div class="form-body">
							<div class="form-group">
								<!-- 联系人姓名 -->
								<label class="control-label col-md-1"> 
									<spring:message code='lable.linker.name' /> 
									<span class="required">* </span> 
								</label>
								<div class="col-md-4" style="width:39.33333%">
									<input type="text" 
								   class="form-control" 
								   id="contactName" 
								   name="contactName" 
								   value="${vo.contactName}"
								   data-rule="required;length[~25];" 
								   placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
								
								<!-- 移动电话 -->
								<label class="control-label col-md-1"> 
									<spring:message code='lable.linker.mobilephone' /> 
									<span class="required">* </span> 
								</label>
								<div class="col-md-4" style="width:39.33333%">
									<input type="text" 
								   class="form-control" 
								   id="mobilePhone" 
								   name="mobilePhone" 
								   value="${vo.mobilePhone}"
								   data-rule="required;length[~50];mobile;remote[<%=request.getContextPath()%>/preSalesManage/queryPhoneByChecking, id]" 								  
								   placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
							</div>
							
							
							<div class="form-group">
								<!-- 职务描述 -->
								<label class="control-label col-md-1"> 
									<spring:message code='lable.linker.jobDesc' /> 
									<span class="required">* </span> 
								</label>
								<div class="col-md-4" style="width:39.33333%">
									<input type="text" 
								   class="form-control" 
								   id="positionDescribe" 
								   name="positionDescribe" 
								   value="${vo.positionDescribe}"
								   data-rule="required;length[~100];"
								   placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
								
								<!-- 固定电话 -->
								<label class="control-label col-md-1"> 
									<spring:message code='lable.customManage.phone' /> 
								</label>
								<div class="col-md-4" style="width:39.33333%">
									<input type="text" 
								   class="form-control" 
								   id="fixedPhone" 
								   name="fixedPhone" 
								   value="${vo.fixedPhone}"
								   data-rule="length[~25];tel;"
								   placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
								</div>
							</div>
							
							<div class="form-group">
								<!-- 邮箱 -->
								<label class="control-label col-md-1"> 
									<spring:message code='lable.linker.mailbox' /> 
								</label>
								<div class="col-md-4" style="width:39.33333%">
									<input type="text" 
								   class="form-control" 
								   id="email" 
								   name="email" 
								   value="${vo.email}"
								   data-rule="length[~25];email;"								   
								   placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
								</div>
								
								<!-- QQ号 -->
								<label class="control-label col-md-1"> 
									<spring:message code='lable.linker.qqNo' /> 
								</label>
								<div class="col-md-4" style="width:39.33333%">
									<input type="text" 
								   class="form-control" 
								   id="qqCard" 
								   name="qqCard" 
								   value="${vo.qqCard}"
								   data-rule="length[~25];qq;"
								   placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
								</div>
							</div>
							
							<div class="form-group">
								<!-- 备注 -->
								<label class="control-label col-md-1"> 
									<spring:message code='lable.customManage.remark' /> 
								</label>
								<div class="col-md-10">
									<textarea class="form-control" rows="3" id="remark" name="remark" 
								     placeholder="<spring:message code='common.laber.noneMustInputData'/>"
								     value="${vo.remark}" data-rule="length[~1000];">${vo.remark}</textarea>
								</div>
							</div>
							
							<div class="form-actions">
								<div class="modal-footer">
									<div class="col-md-offset-2 col-md-9">
									<button type="button" class="btn blue" id="saveLinkerBtnIdss">
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
			<%-- <c:if test="${vo.id !='' && vo.id !=null}">
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
			</c:if> --%>
		</div>
	</div>
</div>   
<div class="modal-footer">
	<div class="col-md-offset-11 col-md-1">
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeLinkBaseInfoEditId"><spring:message code='btn.common.close'/></button>
    </div>
</div>
<script type="text/javascript">
	var linkerOldVal=$("#linkerEditFormIdss").serializeFormJson();
	var linkerField = { 
		contactName:"<spring:message code='lable.linker.name' />",
		mobilePhone:"<spring:message code='lable.linker.mobilephone' />",
		positionDescribe:"<spring:message code='lable.linker.jobDesc' />",
		fixedPhone:"<spring:message code='lable.linker.telephone' />",
		email:"<spring:message code='lable.linker.mailbox' />",
		qqCard:"<spring:message code='lable.linker.qqNo' />",
		remark:"<spring:message code='lable.customManage.remark' />"
	};
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/preSalesManage/custommanage/linkerManageEdit.js"></script>
