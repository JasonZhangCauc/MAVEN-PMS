<!-- 里程碑调整界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div class="portlet box grey-cascade form-fit">
			<div class="portlet-title">
				<div class="caption">
				    <i class="fa fa-cogs"></i><spring:message code='btn.common.edit' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> 
					<a href="javascript:;" class="remove" data-dismiss="modal"> </a>
				</div>
			</div>
			<div class="portlet-body form">
				<form class="form-horizontal form-bordered" id="milepostAdjustFormId"
					autocomplete="off" data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
					<input type="hidden" value="${milepostAdjustVo.id}" name="id"/>
					<input type="hidden" value="${milepostAdjustVo.milepostId}" name="milepostId" />
					<input type="hidden" value="" name="changeDetails" id="changeDetails" />
					<div class="form-group">
						<!-- 操作人 -->
						<label class="control-label col-md-2">
							<spring:message code='label.systemlog.operateBy' />
							<span class="required">* </span>
						</label>
						<input type="hidden" value="${milepostAdjustVo.createBy}" name="createBy" />
						<div class="col-md-4">
							<input type="text" 
							   class="form-control" 
							   id="createByName" 
							   name="createByName"
							   readonly="readonly"
							   value="${milepostAdjustVo.createByName}"
							   data-rule="required;length[~250];" />
						</div>
						<!-- 操作时间-->
						<label class="control-label col-md-2">
							<spring:message code='label.systemlog.operateTime' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
							   class="form-control" 
							   id="createDate" 
							   name="createDate"
							   readonly="readonly"
							   value="${milepostAdjustVo.createDate}"
							   data-rule="required;length[~250];" />
						</div>
					</div>
					<div class="form-group">
						<!-- 调整时间-->
						<label class="control-label col-md-2">
							<spring:message code='lable.milepostAdjust.adjustDate' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
								class="date-picker form-control dateSelect"
								id="adjustDate"
								name="adjustDate" 
								data-rule="required;"
								value="${milepostAdjustVo.adjustDate}" 
								placeholder="<spring:message code='message.pleaseselect'/>" >
						</div>
						<!-- 是否顺延-->
						<label class="control-label col-md-2">
							<spring:message code='lable.milepostAdjust.isComplete' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<select class="bs-select form-filter form-control" 
								data-size="10"
								data-width="70%" 
								data-rule="required;"
								title="<spring:message code='message.pleaseselect' />"
								id="isComplete" 
								name="isComplete">
							</select>
						</div>
					</div>
					<div class="form-group">
						<!-- 调整原因 -->
						<label class="control-label col-md-2">
							<spring:message code='lable.milepostAdjust.adjustRemark' /> </label>
						<div class="col-md-9">
							<textarea class="form-control" 
								rows="3" 
								style="width: 100%;"
								id="adjustRemark" 
								data-rule="length[~1000];" 
								name="adjustRemark"
								placeholder="<spring:message code='common.laber.noneMustInputData'/>"
								value="${milepostVo.milepostDescribe}">${milepostAdjustVo.adjustRemark}</textarea>
						</div>
					</div>
					<div class="form-group">
						<!-- 批准人-->
						<label class="control-label col-md-2">
							<spring:message code='lable.milepostAdjust.approvalBy' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<select class="bs-select form-filter form-control" 
								data-size="10"
								data-width="70%" 
								data-rule="required;"
								title="<spring:message code='message.pleaseselect' />"
								id="approvalBy" 
								name="approvalBy">
							</select>
						</div>
						<!-- 批准时间-->
						<label class="control-label col-md-2">
							<spring:message code='lable.milepostAdjust.approvalDate' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
								class="date-picker form-control dateSelect"
								id="approvalDate"
								name="approvalDate" 
								data-rule="required;"
								value="${milepostAdjustVo.approvalDate}" 
								placeholder="<spring:message code='message.pleaseselect'/>" >
						</div>
					</div>
					<div class="form-group">
						<!-- 备注 -->
						<label class="control-label col-md-2">
							<spring:message code='lable.milepostAdjust.remark' /> </label>
						<div class="col-md-9">
							<textarea class="form-control" 
								rows="3" 
								style="width: 100%;"
								id="remark" 
								data-rule="length[~1000];" 
								name="remark"
								placeholder="<spring:message code='common.laber.noneMustInputData'/>"
								value="${milepostAdjustVo.remark}">${milepostAdjustVo.remark}</textarea>
						</div>
					</div>
					<div class="form-actions">
						<div class="row">
							<div class="modal-footer">
								<button type="button" class="btn green" id="saveMilepostAdjustId">
									<i class="fa fa-check"></i>
									<spring:message code='btn.common.save' />
								</button>
								<button type="button" data-dismiss="modal" class="btn default"
									id="closeMilepostAdjustId">
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
	//下拉框初始化
	$("#milepostAdjustFormId #isComplete").initDic('${milepostAdjustVo.isComplete}',codeBasicInfo.yesOrNo);
	$("#milepostAdjustFormId #approvalBy").initUserInfo('${milepostAdjustVo.approvalBy}');
	
	var milepostAdjustOldVal=$("#milepostAdjustFormId").serializeFormJson();
	var milepostAdjustField = {
		adjustDate:"<spring:message code='lable.milepostAdjust.adjustDate' />",
		isComplete:"<spring:message code='lable.milepostAdjust.isComplete' />",
		adjustRemark:"<spring:message code='lable.milepostAdjust.adjustRemark' />",
		approvalBy:"<spring:message code='lable.milepostAdjust.approvalBy' />",
		approvalDate:"<spring:message code='lable.milepostAdjust.approvalDate' />",
		remark:"<spring:message code='lable.milepostAdjust.remark' />"
	};
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManagement/projectMonitorManager/milepostAdjustEdit.js"></script>
