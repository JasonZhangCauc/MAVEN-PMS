<!-- 投诉建议编辑 -->
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
					<form class="form-horizontal  form-bordered" id="complainEdit" autocomplete="off" 
				    data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${vo.id}" name="id" id="id"/>
				    	<input type="hidden" value="" name="changeDetails" id="changeDetails" />
						
						<div class="form-body">
							<div class="form-group">
								<!-- 类型 -->
				                <label class="col-md-2 control-label">
				                	<spring:message code='lable.Complaints.type' />
				                	<span class="required">* </span> 
				                </label>
				                <div class="col-md-4 text-left">
									<select class="bs-select form-filter form-control" 
										id="advicesType" 
										name="advicesType"
										data-rule="required;" 
										data-size="10" 
										title="<spring:message code='message.pleaseselect'/>">
									</select>
				                </div>
							</div>
							<div class="form-group">
								<!-- 投诉内容 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.msgProcess.mText' />
									<span class="required">* </span> 
								</label>
								<div class="col-md-10">
									<textarea class="form-control" rows="3" id="advicesContent" name="advicesContent"  data-rule="required;" 
								     placeholder="<spring:message code='common.laber.noneMustInputData'/>"
								     value="${vo.advicesContent}" data-rule="length[~1000];">${vo.advicesContent}</textarea>
								</div>
							</div>
							
							<div class="form-actions">
								<div class="modal-footer">
									<div class="col-md-offset-2 col-md-9">
									<button type="button" class="btn blue" id="saveComplain">
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
		</div>
	</div>
</div>   
<div class="modal-footer">
	<div class="col-md-offset-11 col-md-1">
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeComplain"><spring:message code='btn.common.close'/></button>
    </div>
</div>
<script type="text/javascript">
	var complainEditOldVal=$("#complainEdit").serializeFormJson();
	//投诉建议类型下拉框
	$("#complainEdit #advicesType").initDic('${vo.advicesType}',codeBasicInfo.adviceType); 
	var complainEditField = { 
		advicesType:"<spring:message code='lable.Complaints.type' />",
		advicesContent:"<spring:message code='label.msgProcess.mText' />",
	};
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/workbenchManage/complaintsAndAdviceMain/complaintsAndAdviceEdit.js"></script>
