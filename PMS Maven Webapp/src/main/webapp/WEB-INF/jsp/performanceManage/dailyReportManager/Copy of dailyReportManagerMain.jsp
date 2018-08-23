<!-- 日报管理主界面  ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="m-heading-1 m-bordered">
	<form class="form-horizontal" id="dailyReportMianFormId" method="post">
        <div class="row">
            <div class="form-group">
                <!-- 项目编号 -->
                <label class="col-md-1 control-label">
                	<spring:message code='label.dailyReportManager.proNum' />:
                </label>
                <div class="col-md-2 text-left">
                    <input type="text" 
					   class="form-control" 
					   id="proNum"
					   name="proNum"
					   placeholder="<spring:message code='message.pleaseinput'/>"> 
                </div>
                <!-- 填报人 -->
                <label class="col-md-1 control-label">
                	<spring:message code='label.dailyReportManager.proReporter' />:
                </label>
                <div class="col-md-2 text-left">
					<input type="text" 
					   class="form-control" 
					   id="proReporterName" 
					   name="proReporterName" 
					   placeholder="<spring:message code='message.pleaseinput'/>"> 
                </div>
                <!-- 所属客户 -->
                <label class="col-md-1 control-label">
                	<spring:message code='label.dailyReportManager.belongCustomer' />:
                </label>
                <div class="col-md-2 text-left">
					<select class="bs-select form-filter form-control" 
						multiple 
						data-size="10" 
						id="belongCustomer"
						name="belongCustomer"
						title="<spring:message code='label.allitem' />" >
                    </select>
                </div>
                <!-- 操作 -->
                <div class="col-md-2">
                	<!-- 查询 -->
				    <a href="javascript:;" class="btn default btn-sm blue-madison" id="searchDailyReportBtn"> 
					    <i class="fa fa-search"></i>
				    </a>
				    <!-- 更多 -->
				    <a data-target="#dailyReportHide" data-toggle="collapse" class="btn default btn-sm blue-hoki" aria-expanded="false">
                       <i class="fa fa-filter"></i>
                    </a>
				</div>
            </div>
            <div class="form-group line_p collapse" id="dailyReportHide" aria-expanded=false>
            	<!-- 所属产品 -->
                <label class="col-md-1 control-label">
                	<spring:message code='label.dailyReportManager.belongProduct' />:
                </label>
                <div class="col-md-2 text-left">
                    <select class="bs-select form-filter form-control" 
						multiple 
						data-size="10" 
						id="belongProduct"
						name="belongProduct"
						title="<spring:message code='label.allitem' />" >
                    </select>
                </div>
                <!-- 填写日期 -->
                <label class="col-md-1 control-label">
                	<spring:message code='label.dailyReportManager.reportDate'/>:
                </label>
                <div class="col-md-2 text-left">
	                <div class="input-group input-large">
						<input type="text" 
							id="reportBeginDate" 
							name="reportBeginDate" 
							placeholder="<spring:message code='common.label.from'/>" 
							class="date-picker form-control dateSelect" 
							data-date-format="yyyy-mm-dd">
					    <span class="input-group-addon">to</span>
					    <input type="text" id="reportEndDate" 
					    	name="reportEndDate" 
					    	placeholder="<spring:message code='common.label.to'/>" 
					    	class="date-picker form-control dateSelect" 
					    	data-date-format="yyyy-mm-dd">
					</div>
				</div>
            </div>
        </div>
    </form>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="mt-element-ribbon bg-grey-steel">
            <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
                 <div class="ribbon-sub ribbon-clip"></div> 
                 <span class="caption-subject bold uppercase"><spring:message code='label.dailyReportManager.dailyReportList' /></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">            
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
	                    	<auth:auth resourceCode="R006_0201">
								<a href="<%=request.getContextPath()%>/dailyReportManager/dailyReportEdit?operate=add" 
									data-target="#newDailyReportModalId" data-toggle="modal" class="btn btn-circle green-haze">
								<i class="fa fa-plus"></i></a> 
							</auth:auth>
	                    </div>
	                    <div class="btn-group">
	                        <a class="btn red btn-sm btn-circle" href="javascript:;" data-toggle="dropdown">
	                            <i class="fa fa-print"></i>
	                        </a>
	                        <ul class="dropdown-menu pull-right" id="sample_tools">
	                            <li>
	                                <a href="javascript:;" data-action="0" class="tool-action">
	                                    <i class="icon-printer"></i> Print</a>
	                            </li>
	                            <li>
	                                <a href="javascript:;" data-action="1" class="tool-action">
	                                    <i class="icon-check"></i> Copy</a>
	                            </li>
	                            <li>
	                                <a href="javascript:;" data-action="2" class="tool-action">
	                                    <i class="icon-doc"></i> PDF</a>
	                            </li>
	                            <li>
	                                <a href="javascript:;" data-action="3" class="tool-action">
	                                    <i class="icon-paper-clip"></i> Excel</a>
	                            </li>
	                            <li>
	                                <a href="javascript:;" data-action="4" class="tool-action">
	                                    <i class="icon-cloud-upload"></i> CSV</a>
	                            </li>
	                            <li class="divider"> </li>
	                            <li>
	                                <a href="javascript:;" data-action="5" class="tool-action">
	                                    <i class="icon-refresh"></i> Reload</a>
	                            </li>
	                        </ul>
	                    </div>                  
	                </div>
	            </div>
	            <div class="portlet-body">
	                <div class="table-container">
	                    <table class="table table-striped table-bordered table-hover" id="dailyReportMianTableId"></table>
	                </div>
	            </div>
	        </div>
	     </div>
    </div>
</div>
<!-- 日报新增/编辑弹出框 -->
<div id="newDailyReportModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:50%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var dailyReportManager_proNum="<spring:message code='label.dailyReportManager.proNum' />";//项目编号
	var dailyReportManager_belongCustomer="<spring:message code='label.dailyReportManager.belongCustomer' />";//所属客户
	var dailyReportManager_belongProduct="<spring:message code='label.dailyReportManager.belongProduct' />";//所属产品
	var dailyReportManager_proReporter="<spring:message code='label.dailyReportManager.proReporter' />";//填报人
	var dailyReportManager_reportDate="<spring:message code='label.dailyReportManager.reportDate' />";//填报日期
	var dailyReportManager_reportType="<spring:message code='label.dailyReportManager.reportType' />";//日报类型
	var dailyReportManager_taskToday="<spring:message code='label.dailyReportManager.taskToday' />";//当天任务
	var dailyReportManager_questionToday="<spring:message code='label.dailyReportManager.questionToday' />";//当天问题
	var dailyReportManager_conclusionToday="<spring:message code='label.dailyReportManager.conclusionToday' />";//当日小结
	var dailyReportManager_planTomorrow="<spring:message code='label.dailyReportManager.planTomorrow' />";//明日计划
	var dailyReportManager_deleteDailyReportMsg="<spring:message code='label.dailyReportManager.deleteDailyReportMsg' />";//确认删除该日报信息吗？
	var gridDailyReport = new Datatable();//角色管理Datatable
	var hasEditAuthDailyReport = isUserHasAuth("R006_0201");//编辑权限
	var hasRemoveAuthDailyReport = isUserHasAuth("R006_0202"); //删除权限
	//初始化下拉框
	$("#dailyReportMianFormId #belongCustomer").initCustomerInfo(null);
	$("#dailyReportMianFormId #belongProduct").initDic(null,codeBasicInfo.PRODUCT);
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/performanceManager/dailyReportManager/dailyReportManager.js"></script>