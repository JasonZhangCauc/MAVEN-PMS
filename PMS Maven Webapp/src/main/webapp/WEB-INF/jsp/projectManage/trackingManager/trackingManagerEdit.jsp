<!-- 跟踪信息新增/编辑界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
<a addtabs='R004_0401' id="refurbishTrackId" url="" title="<spring:message code='btn.common.edit' />"
	class="btn btn-circle green-haze" style="display: none;" ></a> 
<div class="row">
	<div class="col-md-12">
		<div class="portlet light bordered">
			<div class="portlet-body">
				<div class="portlet light bordered">
					<div class="portlet-body form">
						<form class="form-horizontal form-bordered" id="trackingEditFormId" autocomplete="off" enctype="multipart/form-data"
							data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
							<!-- 项目ID -->
							<input type="hidden" value="${vo.id}" id="trackId" name="id" /> 
							<input type="hidden" value="" name="changeDetails" id="changeDetails" />
							<fieldset>
       							<legend style="font-weight:normal;">基本信息</legend>
								<div class="form-group">
									<!-- 客户简称 -->
									<label class="control-label col-md-1"> 
										<spring:message code='lable.customManage.shortName' /> 
										<span class="required">* </span>
									</label>
									<div class="col-md-2">
					                    <select class="bs-select form-filter form-control" 
											data-size="10" 
											data-rule="required;"
											title="<spring:message code='message.pleaseselect' />" 
											id="customerId"
											name="customerId">
					                    </select>
									</div>
									<!-- 项目名称-->
									<label class="control-label col-md-1">
										<spring:message code='lable.saleTrack.projectName' />
										<span class="required">* </span>
									</label>
									<div class="col-md-2">
										<select class="bs-select form-filter form-control" 
											data-size="10" 
											data-rule="required;"
											title="<spring:message code='message.pleaseselect' />" 
											id="projectId"
											name="projectId">
					                    </select>
									</div>
									<!-- 提出部门 -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.putDept' />
										<span class="required">* </span>
									</label>
									<div class="col-md-2">
										<input type="text" 
										   class="form-control" 
										   id="putDept" 
										   name="putDept" 
										   data-rule="required;length[~20];"
										   value="${vo.putDept}"
										   placeholder="<spring:message code='common.laber.mustInputData'/>" />
									</div>
								</div>
								<div class="form-group">
									<!-- 提出人 -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.putBy' />
										<span class="required">* </span>
									</label>
									<div class="col-md-2">
										<input type="text" 
										   class="form-control" 
										   id="putBy" 
										   name="putBy" 
										   data-rule="required;length[~50];"
										   value="${vo.putBy}"
										   placeholder="<spring:message code='common.laber.mustInputData'/>" />
									</div>
									<!-- 登记人 -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.registerBy' />
										<span class="required">* </span>
									</label>
									<div class="col-md-2">
										<input type="text" 
										   class="form-control" 
										   id="registerBy" 
										   name="registerBy" 
										   data-rule="required;length[~20];"
										   value="${vo.registerBy}"
										   placeholder="<spring:message code='common.laber.mustInputData'/>" />
									</div>
									<!-- 提出日期  -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.putDate' />
										<span class="required">* </span>
									</label>
									<div class="col-md-2">
										<input type="text" 
											class="date-picker form-control dateSelect"
											id="putDate"
											name="putDate" 
											data-date-format="yyyy-mm-dd"
											data-rule="required;"
											value="${vo.putDate}" 
											placeholder="<spring:message code='message.pleaseselect'/>" >
									</div>
								</div>
								<div class="form-group">
									<!-- 类型-->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.requirementType' />
										<span class="required">* </span>
									</label>
									<div class="col-md-2">
										<select class="bs-select form-filter form-control" 
											data-size="10" 
											data-rule="required;"
											title="<spring:message code='message.pleaseselect' />" 
											id="requirementType"
											name="requirementType">
					                    </select>
									</div>
									<!-- 优先级-->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.priority' />
										<span class="required">* </span>
									</label>
									<div class="col-md-2">
										<select class="bs-select form-filter form-control" 
											data-size="10" 
											data-rule="required;"
											title="<spring:message code='message.pleaseselect' />" 
											id="priority"
											name="priority">
					                    </select>
									</div>
								</div>
								<div class="form-group">
									<!-- 描述-->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.describe' />
										<span class="required">* </span>
									</label>
									<div class="col-md-9">
										<textarea class="form-control" 
											rows="3" 
											id="describe" 
											name="describe"
											data-rule="length[~2000];"
											placeholder="<spring:message code='common.laber.mustInputData'/>" 
											value="${vo.describe}">${vo.describe}</textarea>
									</div>
								</div>
							</fieldset>
							<fieldset>
       							<legend style="font-weight:normal;">其他信息</legend>
								<div class="form-group">
									<!-- 预计上线时间  -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.expectOnlineDate' />
									</label>
									<div class="col-md-2">
										<input type="text" 
											class="date-picker form-control dateSelect"
											id="expectOnlineDate"
											name="expectOnlineDate" 
											data-date-format="yyyy-mm-dd"
											value="${vo.expectOnlineDate}" 
											placeholder="<spring:message code='message.pleaseselect'/>" >
									</div>
									<!-- 是否验收范围 -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.whetherScope' />
									</label>
									<div class="col-md-2">
										<select class="bs-select form-filter form-control" 
											data-size="10" 
											title="<spring:message code='message.pleaseselect' />" 
											id="whetherScope"
											name="whetherScope">
					                    </select>
									</div>
									<!-- 是否合同  -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.whetherContract' />
									</label>
									<div class="col-md-2">
										<select class="bs-select form-filter form-control" 
											data-size="10" 
											title="<spring:message code='message.pleaseselect' />" 
											id="whetherContract"
											name="whetherContract">
					                    </select>
									</div>
								</div>
								<div class="form-group">
									<!-- 反馈方式  -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.feedbackWay' />
									</label>
									<div class="col-md-2">
										<select class="bs-select form-filter form-control" 
											data-size="10" 
											title="<spring:message code='message.pleaseselect' />" 
											id="feedbackWay"
											name="feedbackWay">
					                    </select>
									</div>
									<!-- 计划反馈时间  -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.feedbackDate' />
									</label>
									<div class="col-md-2">
										<input type="text" 
											class="date-picker form-control dateSelect"
											id="feedbackDate"
											name="feedbackDate" 
											data-date-format="yyyy-mm-dd"
											value="${vo.feedbackDate}" 
											placeholder="<spring:message code='message.pleaseselect'/>" >
									</div>
									<!-- 原因分类  -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.causeClassification' />
									</label>
									<div class="col-md-2">
										<select class="bs-select form-filter form-control" 
											data-size="10" 
											title="<spring:message code='message.pleaseselect' />" 
											id="causeClassification"
											name="causeClassification">
					                    </select>
									</div>
								</div>
								<div class="form-group">
									<!-- 原因分析-->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.causeAnalysis' />
									</label>
									<div class="col-md-9">
										<textarea class="form-control" 
											rows="3" 
											id="causeAnalysis" 
											name="causeAnalysis"
											data-rule="length[~2000];"
											placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
											value="${vo.causeAnalysis}">${vo.causeAnalysis}</textarea>
									</div>
								</div>
								<div class="form-group">
									<!-- 预估工时  -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.expectedTime' />
									</label>
									<div class="col-md-2">
										<input type="text" 
											class="form-control" 
											id="expectedTime" 
											name="expectedTime"
											data-rule="positiveNum;"
											value="${vo.expectedTime}"
											placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
									</div>
									<!-- 已取消时间  -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.cancelDate' />
									</label>
									<div class="col-md-2">
										<input type="text" 
											class="date-picker form-control dateSelect"
											id="cancelDate"
											name="cancelDate" 
											data-date-format="yyyy-mm-dd"
											value="${vo.cancelDate}" 
											placeholder="<spring:message code='message.pleaseselect'/>" >
									</div>
									<!-- 计划上线时间 -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.plannedLineDate' />
									</label>
									<div class="col-md-2">
										<input type="text" 
											class="date-picker form-control dateSelect"
											id="plannedLineDate"
											name="plannedLineDate" 
											data-date-format="yyyy-mm-dd"
											value="${vo.plannedLineDate}" 
											placeholder="<spring:message code='message.pleaseselect'/>" >
									</div>
								</div>
								<div class="form-group">
									<!-- 实际上线时间  -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.actuallyLineDate' />
									</label>
									<div class="col-md-2">
										<input type="text" 
											class="date-picker form-control dateSelect"
											id="actuallyLineDate"
											name="actuallyLineDate" 
											data-date-format="yyyy-mm-dd"
											value="${vo.actuallyLineDate}" 
											placeholder="<spring:message code='message.pleaseselect'/>" >
									</div>
									<!-- 更新完成时间 -->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.completeDate' />
									</label>
									<div class="col-md-2">
										<input type="text" 
											class="date-picker form-control dateSelect"
											id="completeDate"
											name="completeDate" 
											data-date-format="yyyy-mm-dd"
											value="${vo.completeDate}" 
											placeholder="<spring:message code='message.pleaseselect'/>" >
									</div>
									<!-- 是否二期-->
									<label class="control-label col-md-1">
										<spring:message code='label.trackingManager.whetherPhaseIi' />
									</label>
									<div class="col-md-2">
										<select class="bs-select form-filter form-control" 
											data-size="10" 
											title="<spring:message code='message.pleaseselect' />" 
											id="whetherPhaseIi"
											name="whetherPhaseIi">
					                    </select>
									</div>
								</div>
								<div class="form-group">
							        <!-- 附件 -->
									<label class="control-label col-md-1">
										<spring:message code='common.label.attachment' />			
									</label>
									<div class="col-md-9">
							            <div id="moduleGallery" class="editableGallery"></div>
							            <div id="uploaderDivId" class="editableGallery">        
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
							</fieldset>
							<div class="form-actions">
								<div class="row">
									<div class="col-md-offset-2 col-md-10">
										<button type="button" class="btn green" id="saveTrackId">
											<i class="fa fa-check"></i>
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
</div>
<!-- 参数列表 -->
<script type="text/javascript">
	$("#trackingEditFormId #customerId").initCustomerShortName('${vo.customerId}');//客户简称
	$("#trackingEditFormId #projectId").initRecordProjectInfo('${vo.projectId}');//项目名称
	$("#trackingEditFormId #requirementType").initDic('${vo.requirementType}',codeBasicInfo.whyType);//原因类型
	$("#trackingEditFormId #priority").initDic('${vo.priority}',codeBasicInfo.priority);//优先级
	$("#trackingEditFormId #whetherScope").initDic('${vo.whetherScope}',codeBasicInfo.isNot);//是否二期
	$("#trackingEditFormId #whetherPhaseIi").initDic('${vo.whetherPhaseIi}',codeBasicInfo.isNot);//是否范围
	$("#trackingEditFormId #whetherContract").initDic('${vo.whetherContract}',codeBasicInfo.isNot);//是否合同
	$("#trackingEditFormId #feedbackWay").initDic('${vo.feedbackWay}',codeBasicInfo.feedbackWay);//反馈方式
	$("#trackingEditFormId #causeClassification").initDic('${vo.causeClassification}',codeBasicInfo.causeClassification);//原因分类
	
	var trackingEdit_operate='${operate}';
	$(function(){
		if(trackingEdit_operate=='edit'){
			//初始化上传插件
			initWebUploaderUI({
	        	_webUploaderId:'#trackingEditFormId #uploaderDivId',
	        	_fileAddId:'#trackingEditFormId #filePicker',
	        	_fileAddIdContinue:'#trackingEditFormId #filePicker2',
	        	_dataId:'${vo.id}',
	        	_pageType:'R004-04',
	        	_editFileId:'#trackingEditFormId #moduleGallery'});
	        //初始化历史数据
			initEidtUploaderUI({
				_editFileId:'#trackingEditFormId #moduleGallery',
				_dataId:'${vo.id}',
				_pageType:'R004-04',
				_canDelete:true
				});
		}
	});
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManage/trackingManager/trackingManagerEdit.js"></script>
