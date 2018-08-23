<!-- 角色新增/编辑界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
     <div class="col-md-12">
          <!-- BEGIN PORTLET-->
          <div class="portlet box grey-cascade form-fit">
              <div class="portlet-title">
				<div class="caption">
					<c:if test="${operate=='add'}"><i class="fa fa-cogs"></i><spring:message code='btn.common.add' /></c:if>
				    <c:if test="${operate=='edit'}"><i class="fa fa-cogs"></i><spring:message code='btn.common.edit' /></c:if>
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse">
					</a>
					<a href="javascript:;" class="remove" data-dismiss="modal">
				    </a>
				</div>
			  </div>
              <div class="portlet-body form">
                  <form class="form-horizontal form-bordered" id="dailyReportEditFormId" autocomplete="off" 
				    data-validator-option="{focusCleanup:true}">
				    <input type="hidden" value="${dailyReportVo.id}" name="id"/>
				    <input type="hidden" value="" name="changeDetails" id="changeDetails" />
                    <div class="form-group">
                        <!-- 填报人 -->
						<label class="control-label col-md-2">
							<spring:message code='label.dailyReportManager.proReporter' />
						</label>
						<div class="col-md-4">
							<input type="hidden" value="${dailyReportVo.proReporter}" name="proReporter"/>
					    	<input type="text" 
							   class="form-control" 
							   id="proReporterName" 
							   name="proReporterName" 
							   value="${dailyReportVo.proReporterName}"
							   readonly="readonly"
							   data-rule="required;length[~50];" />
						</div>
						<!-- 填报时间 -->
						<label class="control-label col-md-1">
							<spring:message code='label.dailyReportManager.reportDate' />
						</label>
						<div class="col-md-4">
							<input type="text" 
								class="date-picker form-control dateSelect"
								id="reportDate"
								name="reportDate" 
								readonly="readonly"
								value="${dailyReportVo.reportDate}"
								data-rule="required;"
								placeholder="<spring:message code='message.pleaseselect'/>" >
						</div>
                    </div>
                    <div class="form-group">
                        <!-- 项目编号 -->
					    <label class="control-label col-md-2">
						    <spring:message code='label.dailyReportManager.proNum' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-3">
						    <select class="bs-select form-filter form-control" 
						    	data-size="10" 
								data-width="80%"
								id="proId"
								name="proId"
								data-rule="required;"
								placeholder="<spring:message code='message.pleaseselect'/>"  >
		                    </select>
					    </div>
					    <!-- 日报类型 -->
						<label class="control-label col-md-2">
							<spring:message code='label.dailyReportManager.reportType' />
							<span class="required">* </span>
						</label>
						<div class="col-md-3">
							<select class="bs-select form-filter form-control" 
								data-size="10" 
								id="reportType"
								name="reportType"
								data-rule="required;"
								data-with="80%"
								title="<spring:message code='message.pleaseselect' />" >
		                    </select>
						</div>
                    </div>                  
                    <div class="form-group last">
                        <!-- 当日工作任务 -->
						<label class="control-label col-md-2">
							<spring:message code='label.dailyReportManager.taskToday' />
						</label>
						<div class="col-md-8">
					    	<textarea class="form-control" rows="2" 
					    	id="roleDesc" 
					    	data-rule="length[~1000];" 
					    	name="taskToday"
					    	placeholder="<spring:message code='common.laber.noneMustInputData'/>"
					    	value="${dailyReportVo.taskToday}" >${dailyReportVo.taskToday}</textarea>
						</div>
                    </div>
                    <div class="form-group last">
                        <!-- 当日问题描述 -->
						<label class="control-label col-md-2">
							<spring:message code='label.dailyReportManager.questionToday' />
						</label>
						<div class="col-md-8">
					    	<textarea class="form-control" rows="2" 
					    	id="questionToday" 
					    	data-rule="length[~1000];"
					    	placeholder="<spring:message code='common.laber.noneMustInputData'/>"
					    	name="questionToday" value="${dailyReportVo.questionToday}" >${dailyReportVo.questionToday}</textarea>
						</div>
                    </div>
                    <div class="form-group last">
                        <!-- 实施小结 -->
						<label class="control-label col-md-2">
							<spring:message code='label.dailyReportManager.conclusionToday' />
						</label>
						<div class="col-md-8">
					    	<textarea class="form-control" rows="2" 
					    	id="conclusionToday" data-rule="length[~1000];" 
					    	name="conclusionToday"
					    	placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
					    	value="${dailyReportVo.conclusionToday}" >${dailyReportVo.conclusionToday}</textarea>
						</div>
                    </div>
                    <div class="form-group last">
                        <!-- 明日计划 -->
						<label class="control-label col-md-2">
							<spring:message code='label.dailyReportManager.planTomorrow' />
						</label>
						<div class="col-md-8">
					    	<textarea class="form-control" rows="2" 
					    	id="planTomorrow" 
					    	data-rule="length[~1000];"
					    	placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
					    	name="planTomorrow" value="${dailyReportVo.planTomorrow}" >${dailyReportVo.planTomorrow}</textarea>
						</div>
                    </div>
					<div class="form-actions">
						<div class="row">
							<div class="modal-footer">
								<button type="button" class="btn green" id="saveDailyReportId">
									<i class="fa fa-check"></i>
									<spring:message code='btn.common.save' />
								</button>
								<button type="button" data-dismiss="modal" class="btn default"
									id="closeDailyReportId">
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
<!-- 参数列表 -->
<script type="text/javascript">
	$("#dailyReportEditFormId #reportType").initDic('${dailyReportVo.reportType}',codeBasicInfo.reportType);
	$("#dailyReportEditFormId #proId").initProjectInfo('${dailyReportVo.proId}');
	
	var dailyReportVal=$("#dailyReportEditFormId").serializeFormJson();
    var dailyReportColumn = {
        proId:"<spring:message code='label.dailyReportManager.proNum' />",
		reportType:"<spring:message code='label.dailyReportManager.reportType' />",
		taskToday:"<spring:message code='label.dailyReportManager.taskToday' />",
		questionToday:"<spring:message code='label.dailyReportManager.questionToday' />",
		conclusionToday:"<spring:message code='label.dailyReportManager.conclusionToday' />",
		planTomorrow:"<spring:message code='label.dailyReportManager.planTomorrow' />"   
    };
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/performanceManager/dailyReportManager/dailyReportManagerEdit.js"></script>
