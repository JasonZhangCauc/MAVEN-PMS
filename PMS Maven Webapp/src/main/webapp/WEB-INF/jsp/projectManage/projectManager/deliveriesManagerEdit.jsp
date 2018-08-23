<!-- 交付物新增/编辑界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div class="portlet box grey-cascade form-fit">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i>
					<spring:message code='label.taskManager.taskDispose' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> 
					<a href="javascript:;" class="remove" data-dismiss="modal"> </a>
				</div>
			</div>
			<div class="portlet-body form">
				<form class="form-horizontal form-bordered" id="deliveriesEditFormId"
					autocomplete="off" data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
					<input type="hidden" value="${deliveriesVo.id}" name="id" />
					<input type="hidden" value="${deliveriesVo.projectId}" name="projectId" />
					<input type="hidden" value="" name="changeDetails" id="changeDetails" />
					<div class="form-group">
						<!-- 交付物名称 -->
						<label class="control-label col-md-2">
							<spring:message code='lable.deliveries.deliveriesName' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
							   class="form-control" 
							   id="deliveriesName" 
							   name="deliveriesName" 
							   value="${deliveriesVo.deliveriesName}"
							   data-rule="required;length[~250];" 
							   placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
						<!-- 计划交付时间 -->
						<label class="control-label col-md-2">
							<spring:message code='lable.deliveries.planDeliveriesDate' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
								class="date-picker form-control dateSelect"
								id="planDeliveriesDate"
								name="planDeliveriesDate" 
								data-rule="required;"
								value="${deliveriesVo.planDeliveriesDate}" 
								placeholder="<spring:message code='message.pleaseselect'/>" >
						</div>
					</div>
					<div class="form-group">
						<!-- 是否记入合同 -->
						<label class="control-label col-md-2">
							<spring:message code='lable.deliveries.whetherContract' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<select class="bs-select form-filter form-control" 
								data-size="10"
								data-width="70%" 
								data-rule="required;"
								title="<spring:message code='message.pleaseselect' />"
								id="whetherContract" 
								name="whetherContract">
							</select>
						</div>
						<!-- 责任人-->
						<label class="control-label col-md-2">
							<spring:message code='lable.deliveries.personLiable' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<select class="bs-select form-filter form-control" 
								data-size="10"
								data-width="70%" 
								data-rule="required;"
								title="<spring:message code='message.pleaseselect' />"
								id="personLiable" 
								name="personLiable">
							</select>
						</div>
					</div>
					<div class="form-group">
						<!-- 是否已交付-->
						<label class="control-label col-md-2">
							<spring:message code='lable.deliveries.whetherDeliver' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<select class="bs-select form-filter form-control" 
								data-size="10"
								data-width="70%" 
								data-rule="required;"
								title="<spring:message code='message.pleaseselect' />"
								id="whetherDeliver" 
								name="whetherDeliver">
							</select>
						</div>
						<!-- 实际交付时间 -->
						<label class="control-label col-md-2">
							<spring:message code='lable.deliveries.actualDeliveriesDate' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
								class="date-picker form-control dateSelect"
								id="actualDeliveriesDate"
								name="actualDeliveriesDate" 
								data-rule="required;"
								value="${deliveriesVo.actualDeliveriesDate}" 
								placeholder="<spring:message code='message.pleaseselect'/>" >
						</div>
					</div>
					<div class="form-group">
						<!-- 备注 -->
						<label class="control-label col-md-2">
							<spring:message code='lable.milepost.remark' /> </label>
						<div class="col-md-9">
							<textarea class="form-control" 
								rows="3" 
								style="width: 100%;"
								id="remark" 
								data-rule="length[~1000];" 
								name="remark"
								placeholder="<spring:message code='common.laber.noneMustInputData'/>"
								value="${deliveriesVo.remark}">${deliveriesVo.remark}</textarea>
						</div>
					</div>
					<div class="form-group">
						<!-- 附件 -->
                   	 	<label class="control-label col-md-2">
						    <spring:message code='common.label.attachment' />
					    </label>
					    <div class="col-md-9">
							<div id="deliveriesModuleGallery" class="editableGallery"></div>
				            <div id="deliveriesUploaderDivId" class="editableGallery">        
	                            <div class="queueList">
	                                <div id="dndArea" class="placeholder">
	                                    <div id="deliveriesFilePicker"></div>
	                                    <p>单次最多可选10张</p>
	                                </div>
	                            </div>
	                            <div class="statusBar" style="display:none;">
	                                <div class="progress">
	                                    <span class="text">0%</span> <span class="percentage"></span>
	                                </div>
	                                <div class="info"></div>
	                                <div class="btns">
	                                    <div id="deliveriesFilePicker2" class="addFileBtn"></div>
	                                </div>
	                            </div>
			                </div>
			            </div>
					</div>
					<div class="form-actions">
						<div class="row">
							<div class="modal-footer">
								<button type="button" class="btn green" id="saveDeliveriesId">
									<i class="fa fa-check"></i>
									<spring:message code='btn.common.save' />
								</button>
								<button type="button" data-dismiss="modal" class="btn default"
									id="closeDeliveriesId">
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
	$("#deliveriesEditFormId #whetherDeliver").initDic('${deliveriesVo.whetherDeliver}',codeBasicInfo.yesOrNo);
	$("#deliveriesEditFormId #whetherContract").initDic('${deliveriesVo.whetherContract}',codeBasicInfo.yesOrNo);
	$("#deliveriesEditFormId #personLiable").initUserInfo('${deliveriesVo.personLiable}');
	var deliveriesEdit_operate='${operate}';
	
	var deliveriesAddOldVal=$("#deliveriesEditFormId").serializeFormJson();
	var deliveriesAddField = {
		deliveriesName:"<spring:message code='lable.deliveries.deliveriesName' />",
		planDeliveriesDate:"<spring:message code='lable.deliveries.planDeliveriesDate' />",
		whetherContract:"<spring:message code='lable.deliveries.whetherContract' />",
		personLiable:"<spring:message code='lable.deliveries.personLiable' />",
		whetherDeliver:"<spring:message code='lable.deliveries.whetherDeliver' />",
		actualDeliveriesDate:"<spring:message code='lable.deliveries.actualDeliveriesDate' />",
		remark:"<spring:message code='lable.milepost.remark' />"
	};
	//附件初始化
	$(function(){
		if(deliveriesEdit_operate=='edit'){
			//初始化上传插件
			initWebUploaderUI({
	        	_webUploaderId:'#deliveriesUploaderDivId',
	        	_fileAddId:'#deliveriesFilePicker',
	        	_fileAddIdContinue:'#deliveriesFilePicker2',
	        	_dataId:'${deliveriesVo.id}',
	        	_pageType:'R004-0203',
	        	_editFileId:'#deliveriesModuleGallery'});
	        //初始化历史数据
			initEidtUploaderUI({
				_editFileId:'#deliveriesModuleGallery',
				_dataId:'${deliveriesVo.id}',
				_pageType:'R004-0203',
				_canDelete:true
				});
		}
	});
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManagement/projectManager/deliveriesManagerEdit.js"></script>
