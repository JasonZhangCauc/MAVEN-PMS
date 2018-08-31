<!-- 基础信息维护新增/编辑界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="modal-header">
   	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <div class="form-group">
         <div class="col-md-8 col-sm-8">
             <div class="todo-taskbody-user">
                 <img class="todo-userpic pull-left" src="<%=request.getContextPath()%>/${vo.loginUserPic}" width="50px" height="50px">
                 <span class="todo-username pull-left">${codeVo.loginUserName}</span>
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
						style="vertical-align: inherit;">${codeVo.currentTime}</font>
				</font>
				</span>
			</div>
		</div>
    </div>
</div>
<div class="modal-body todo-task-modal-body">
	<div id="bootstrap_alerts_demo"></div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet light portlet-fit bordered">
				 <div class="portlet-title">
		             <div class="caption">
		                 <i class="fa fa-info-circle font-red"></i>
		                 <span class="caption-subject font-red sbold uppercase">
			                 <font style="vertical-align: inherit;">
			                       <font style="vertical-align: inherit;"><spring:message code='label.codeManager.code' /></font>
			                 </font>
		                 </span>
		             </div>
		             <div class="tools">
		                 <a href="javascript:;" class="collapse"> </a>
		                 <a href="javascript:;" class="reload"> </a>
		             </div>
		         </div>
		         <div class="portlet-body form">
					<form class="form-horizontal form-bordered" id="codeEditFormId"
						autocomplete="off" enctype="multipart/form-data"
						data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${codeVo.id}" name="id" />
						<div class="form-group">
							<!-- 字典类型 -->
							<label class="control-label col-md-2"> <spring:message
									code='label.codeManager.codeType' /> <span class="required">*</span>
							</label>
							<div class="col-md-4">
								<select class="bs-select form-filter form-control"
									data-size="10" data-rule="required;"
									title="<spring:message code='message.pleaseselect' />"
									id="codeType" name="codeType" /> </select>
							</div>
							<input type="hidden" value="${codeVo.codeValue}" name="codeValue" />
							<!-- 字典中文名称 -->
							<label class="control-label col-md-2"> <spring:message
									code='label.codeManager.codeZh' /> <span class="required">*
							</span> </label>
							<div class="col-md-4">
								<input type="text" class="form-control" id="codeZh"
									name="codeZh" value="${codeVo.codeZh}"
									data-rule="required;length[~250];"
									placeholder="<spring:message code='common.laber.mustInputData'/>" />
							</div>
						</div>
						<div class="form-group">
							<!-- 字典描述 -->
							<label class="control-label col-md-2"> <spring:message
									code='label.codeManager.codeRemark' /> </label>
							<div class="col-md-10">
								<textarea class="form-control" rows="3" id="codeRemark"
									data-rule="length[~1000];" name="codeRemark"
									placeholder="<spring:message code='common.laber.noneMustInputData'/>"
									value="${codeVo.codeRemark}">${codeVo.codeRemark}</textarea>
							</div>
						</div>
						<div class="form-actions">
							<div class="modal-footer">
								<div class="col-md-offset-2 col-md-9">
								<button type="button" class="btn green" id="saveCodeId">
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
</div>
<div class="modal-footer">
	<div class="col-md-offset-11 col-md-1">
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="clearCodeId"><spring:message code='btn.common.close'/></button>
    </div>
</div>	
<script type="text/javascript">
	$("#codeEditFormId #codeType").initParentCode('${codeVo.codeType}');
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/codeManager/codeManagerEdit.js"></script>