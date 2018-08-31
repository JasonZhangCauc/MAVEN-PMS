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
			                 		<spring:message code='btn.common.edit' />
			                 </font>
		                 </span>
		             </div>
		             <div class="tools">
		                 <a href="javascript:;" class="collapse"> </a>
		                 <a href="javascript:;" class="reload"> </a>
		             </div>
		         </div>
		         <div class="portlet-body form">
					<form class="form-horizontal  form-bordered" id="CustomEditFormIds" autocomplete="off" 
				   			 data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${vo.id}" name="id" id="id" class="form-control" />
				    	<input type="hidden" value="" name="changeDetails" id="changeDetails" />
						
						<div class="form-body">
							<div class="form-group">
								<!-- 开始时间-->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.moni.moniStartDate' /> 
									<span class="required">*</span>  
								</label>
								<div class="col-md-4">
									<input type="text" 
								   class="date-picker form-control dateSelect" 
								   id="moniStartDate" 
								   name="moniStartDate"
								   data-date-format="yyyy-mm-dd"
								   value="${vo.moniStartDate}"/>
								</div>
								
								<!-- 结束时间 -->
								<label class="control-label col-md-2"> 
									<spring:message code='lable.moni.moniEndDate' /> 
								</label>
								<div class="col-md-4">
									<input type="text" 
								   class="date-picker form-control dateSelect" 
								   id="moniEndDate"
								   name="moniEndDate"
								   data-date-format="yyyy-mm-dd"
								   value="${vo.moniEndDate}"/>
								</div>
							</div>
							<div class="form-group">
									<!-- 备注 -->
									<label class="control-label col-md-2">
										<spring:message code='lable.moni.moniInstruction' />
									</label>
									<div class="col-md-9">
										<textarea class="form-control" rows="4"
											id="remark" data-rule="length[~1000];" name="moniInstruction"
											placeholder="<spring:message code='common.laber.noneMustInputData'/>"
											value="${vo.moniInstruction}">${vo.moniInstruction}</textarea>
									</div>
							  </div>
							<div class="form-actions">
				                 <div class="modal-footer">
				                 	<div class="col-md-offset-2 col-md-9">
                                        <button type="button" class="btn blue" id="saveCustomIds"><i class="fa fa-check"></i> <spring:message code='btn.common.save' /></button>
				                 	</div>
				                 </div>
					          </div>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>
</div>   
<div class="modal-footer">
	<div class="col-md-offset-11 col-md-1">
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeCustomBaseInfoEditId"><spring:message code='btn.common.close'/></button>
    </div>
</div>
<script type="text/javascript">
	var objectVal=$("#CustomEditFormIds").serializeFormJson();
	var customColumn = { 
		customShortName : "<spring:message code='lable.customManage.shortName' />", 
		taxpayerName : "<spring:message code='lable.customManage.taxpayerName' />",
		customName : "<spring:message code='lable.customManage.companyName' />",
		taxpayerNumber : "<spring:message code='lable.customManage.taxpayerNumber' />",
		customAddress : "<spring:message code='lable.customManage.address' />",
		taxpayerAddress : "<spring:message code='lable.customManage.taxpayerAddress' />",
		customCode : "<spring:message code='lable.customManage.shortCode' />",
		taxpayerPhone : "<spring:message code='lable.customManage.taxpayerPhone' />",
		contactPhone : "<spring:message code='lable.customManage.phone' />",
		taxpayerBank : "<spring:message code='lable.customManage.taxpayerBank' />",
		email : "<spring:message code='lable.customManage.email' />",
		taxpayerAccount : "<spring:message code='lable.customManage.taxpayerAccount' />",
		remark : "<spring:message code='lable.customManage.remark' />"
	};
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManage/projectApprovalManager/projectMoniEdit.js"></script>
