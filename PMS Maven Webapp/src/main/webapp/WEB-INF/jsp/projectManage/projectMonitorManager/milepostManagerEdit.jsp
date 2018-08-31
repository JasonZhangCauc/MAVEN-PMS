<!-- 里程碑新增/编辑界面 ZHOUMIN 20180305 -->
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
				<form class="form-horizontal form-bordered" id="milepostEditFormId"
					autocomplete="off" data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
					<input type="hidden" value="${milepostVo.id}" name="id" />
					<input type="hidden" value="${milepostVo.projectId}" name="projectId" />
					<input type="hidden" value="" name="changeDetails" id="changeDetails" />
					<div class="form-group">
						<!-- 里程碑名称 -->
						<label class="control-label col-md-2">
							<spring:message code='lable.milepost.milepostName' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
							   class="form-control" 
							   id="milepostName" 
							   name="milepostName"
							   readonly="readonly" 
							   value="${milepostVo.milepostName}"
							   data-rule="required;length[~250];" 
							   placeholder="<spring:message code='common.laber.mustInputData'/>"/>
						</div>
						<!-- 计划完成时间 -->
						<label class="control-label col-md-2">
							<spring:message code='lable.milepost.planCompletedate' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
								class="date-picker form-control dateSelect"
								id="planCompletedate"
								name="planCompletedate"
								disabled
								data-rule="required;"
								value="${milepostVo.planCompletedate}" 
								placeholder="<spring:message code='message.pleaseselect'/>" >
						</div>
					</div>
					<div class="form-group">
						<!-- 对应阶段 -->
						<label class="control-label col-md-2">
							<spring:message code='lable.milepost.correspondingPhase' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<select class="bs-select form-filter form-control" 
								data-size="10"
								data-width="70%" 
								data-rule="required;"
								disabled
								title="<spring:message code='message.pleaseselect' />"
								id="correspondingPhase" 
								name="correspondingPhase">
							</select>
						</div>
						<!-- 里程碑状态 -->
						<label class="control-label col-md-2">
							<spring:message code='lable.milepost.milepostStatus' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<select class="bs-select form-filter form-control" 
								data-size="10"
								data-width="70%" 
								data-rule="required;"
								disabled
								title="<spring:message code='message.pleaseselect' />"
								id="milepostStatus" 
								name="milepostStatus">
							</select>
						</div>
					</div>
					<div class="form-group">
						<!-- 里程碑描述 -->
						<label class="control-label col-md-2">
							<spring:message code='lable.milepost.milepostDescribe' /> </label>
						<div class="col-md-9">
							<textarea class="form-control" 
								rows="3" 
								style="width: 100%;"
								id="milepostDescribe" 
								data-rule="length[~1000];" 
								name="milepostDescribe"
								placeholder="<spring:message code='common.laber.noneMustInputData'/>"
								value="${milepostVo.milepostDescribe}">${milepostVo.milepostDescribe}</textarea>
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
								value="${milepostVo.remark}">${milepostVo.remark}</textarea>
						</div>
					</div>
					<div class="form-group">
						<!-- 附件 -->
                   	 	<label class="control-label col-md-2">
						    <spring:message code='common.label.attachment' />
					    </label>
					    <div class="col-md-9">
							<div id="milepostModuleGallery" class="editableGallery"></div>
				            <div id="milepostUploaderDivId" class="editableGallery">        
	                            <div class="queueList">
	                                <div id="dndArea" class="placeholder">
	                                    <div id="milepostFilePicker"></div>
	                                    <p>单次最多可选10张</p>
	                                </div>
	                            </div>
	                            <div class="statusBar" style="display:none;">
	                                <div class="progress">
	                                    <span class="text">0%</span> <span class="percentage"></span>
	                                </div>
	                                <div class="info"></div>
	                                <div class="btns">
	                                    <div id="milepostFilePicker2" class="addFileBtn"></div>
	                                </div>
	                            </div>
			                </div>
			            </div>
					</div>
					<div class="form-actions">
						<div class="row">
							<div class="modal-footer">
								<button type="button" class="btn green" id="saveMilepostId">
									<i class="fa fa-check"></i>
									<spring:message code='btn.common.save' />
								</button>
								<button type="button" data-dismiss="modal" class="btn default"
									id="closeMilepostId">
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
	$("#milepostEditFormId #correspondingPhase").initDic('${milepostVo.correspondingPhase}',codeBasicInfo.projectStage);
	$("#milepostEditFormId #milepostStatus").initDic('${milepostVo.milepostStatus}',codeBasicInfo.milepostStatus);
	
	var milepostEditOldVal=$("#milepostEditFormId").serializeFormJson();
	var milepostEditField = {
		milepostDescribe:"<spring:message code='lable.milepost.milepostDescribe' />",
		remark:"<spring:message code='lable.milepost.remark' />"
	};
	
	//附件初始化
	$(function(){
		//初始化上传插件
		initWebUploaderUI({
        	_webUploaderId:'#milepostUploaderDivId',
        	_fileAddId:'#milepostFilePicker',
        	_fileAddIdContinue:'#milepostFilePicker2',
        	_dataId:'${milepostVo.id}',
        	_pageType:'R004-0202',
        	_editFileId:'#milepostModuleGallery'});
        //初始化历史数据
		initEidtUploaderUI({
			_editFileId:'#milepostModuleGallery',
			_dataId:'${milepostVo.id}',
			_pageType:'R004-0202',
			_canDelete:true
			});
	});
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManagement/projectMonitorManager/milepostManagerEdit.js"></script>
