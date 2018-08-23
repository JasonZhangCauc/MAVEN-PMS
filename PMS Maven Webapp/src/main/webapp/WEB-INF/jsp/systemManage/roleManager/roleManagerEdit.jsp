<!-- 角色新增/编辑界面 ZHOUMIN 20180305 -->
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
         <!-- Begin: Query conditions -->
	<div class="row">
		<div class="col-md-12">
		<div class="portlet light portlet-fit bordered">
			<div class="portlet-title">
					<div class="caption">
						 <i class="fa fa-info-circle font-red"></i>
						 <span class="caption-subject font-red sbold uppercase"> 
							<font style="vertical-align: inherit;"> 
								<font style="vertical-align: inherit;">
									<spring:message code='label.userManage.roleInfo' />
								</font> 
							</font> 
						 </span>
					</div>
					<div class="tools">
					<a href="javascript:;" class="collapse"> </a> <a
						href="javascript:;" class="reload"> </a>
				</div>
			</div>
			<div class="portlet-body form">
				<form class="form-horizontal form-bordered" id="roleEditFormId"
					autocomplete="off"
					data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
					<input type="hidden" value="${vo.id}" name="id" />
					<input type="hidden" value="" name="changeDetails" id="changeDetails" />
					<div class="form-group">
						<!-- 角色标识码 -->
						<label class="control-label col-md-2"> <spring:message
								code='label.rolemanage.roleCode' /> <span class="required">*
						</span> </label>
						<div class="col-md-4">
							<input type="text" class="form-control" id="roleCode"
								name="roleCode" value="${vo.roleCode}"
								data-rule="required;length[~25];remote[<%=request.getContextPath()%>/systemManage/queryRoleInfoByChecking, id]"
								placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
						<!-- 角色中文名称 -->
						<label class="control-label col-md-2"> <spring:message
								code='label.rolemanage.rolenamecn' /> <span class="required">*
						</span> </label>
						<div class="col-md-4">
							<input type="text" class="form-control" id="roleCname"
								name="roleCname" value="${vo.roleCname}"
								data-rule="required;length[~50];"
								placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
					</div>
					<div class="form-group">
						<!-- 角色英文名称 -->
						<label class="control-label col-md-2"> <spring:message
								code='label.rolemanage.rolenameen' /> <span class="required">*
						</span> </label>
						<div class="col-md-4">
							<input type="text" class="form-control" id="roleEname"
								name="roleEname" value="${vo.roleEname}"
								data-rule="required;length[~50];"
								placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
					</div>
					<div class="form-group">
						<!-- 角色描述 -->
						<label class="control-label col-md-2"> <spring:message
								code='label.rolemanage.remark' /> </label>
						<div class="col-md-9">
							<textarea class="form-control" rows="3" id="roleDesc"
								data-rule="length[~1000];" name="roleDesc"
								placeholder="<spring:message code='common.laber.noneMustInputData'/>"
								value="${vo.roleDesc}">${vo.roleDesc}</textarea>
						</div>
					</div>
					<div class="form-actions">
						<div class="modal-footer">
							<div class="col-md-offset-2 col-md-9">
							<button type="button" class="btn green" id="saveRoleId">
								<spring:message code='btn.common.save' />
							</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
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
<div class="modal-footer">
     <div class="col-md-offset-11 col-md-1">
          <button class="btn default" data-dismiss="modal" aria-hidden="true" id="clearRoleId"><spring:message code='btn.common.close'/></button>
     </div>
</div>
<script type="text/javascript">
	var roleOldVal=$("#roleEditFormId").serializeFormJson();
    var roleField = {
		roleCode:"<spring:message code='label.rolemanage.roleCode' /> ",
		roleCname:"<spring:message code='label.rolemanage.rolenamecn' />",
		roleEname:"<spring:message code='label.rolemanage.rolenameen' />", 
		roleDesc:"<spring:message code='label.rolemanage.remark' />"
	};
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/roleManager/roleManagerEdit.js"></script>
