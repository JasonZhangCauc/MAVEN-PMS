<!-- 月报报管理主界面  ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- BEGIN PAGE BASE CONTENT -->
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-filter font-red"></i> <span
						class="caption-subject font-red sbold uppercase"><font
						style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">查询条件</font>
					</font>
					</span>
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> <a
						href="javascript:;" class="reload"> </a>
				</div>
			</div>
			<div class="portlet-body form">
				<form class="form-horizontal" id="monthReportMianFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			                <!-- 项目编号 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.dailyReportManager.proNum' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" 
								   class="form-control" 
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
									title="<spring:message code='label.allitem'/>">
			                    </select>
			                </div>
			                <!-- 操作 -->
			                <div class="col-md-2">
			                	<!-- 查询 -->
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchMonthReportBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
                                <button type="button" data-target="#monthReportHide" data-toggle="collapse" aria-expanded="false" class="btn default" data-style="slide-left" id="searchMonthReportBtn">
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>
							</div>
			            </div>
			            <div class="form-group line_p collapse" id="monthReportHide" aria-expanded=false>
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
									title="<spring:message code='label.allitem'/>" >
			                    </select>
			                </div>
			                <!-- 填写日期 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.dailyReportManager.reportDate'/>:
			                </label>
			                <div class="col-md-2 text-left">
				                <div class="input-group input-large">
									<input type="text" 
										id="reportBeginMonth" 
										name="reportBeginMonth" 
										placeholder="<spring:message code='common.label.from'/>" 
										class="date-picker form-control dateSelect" 
										data-date-format="yyyy-mm">
								    <span class="input-group-addon">to </span>
								    <input type="text" 
								    	id="reportEndMonth" 
								    	name="reportEndMonth" 
								    	placeholder="<spring:message code='common.label.to'/>" 
								    	class="date-picker form-control dateSelect" 
								    	data-date-format="yyyy-mm">
								</div>
							</div>
			            </div>
			        </div>
			    </form>
	        </div>
	    </div>
	</div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="portlet light portlet-fit portlet-datatable bordered">
            <div class="portlet-title">	 
                <div class="caption">
		                <i class="fa fa-info-circle font-dark"></i>
		                <span class="caption-subject bold uppercase">月报信息</span>
			    </div>                
                <div class="actions">
                    <div class="btn-group btn-group-devided" data-toggle="buttons">
                    	<auth:auth resourceCode="R006_0301">
							<a href="<%=request.getContextPath()%>/monthReportManager/monthReportEdit?operate=add" 
								data-target="#todo-task-modal" data-toggle="modal" class="btn btn-circle green-haze">
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
                    <table class="table table-striped table-bordered table-hover" id="monthReportMianTableId"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 月报新增/编辑弹出框 -->
<div id="todo-task-modal" class="modal fade" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var monthReportManager_proNum="<spring:message code='label.dailyReportManager.proNum' />";//项目编号
	var monthReportManager_proReporter="<spring:message code='label.dailyReportManager.proReporter' />";//填写人
	var monthReportManager_reportMonth="<spring:message code='label.monthReportManager.reportMonth' />";//月份
	var monthReportManager_belongCustomer="<spring:message code='label.dailyReportManager.belongCustomer' />";//所属客户
	var monthReportManager_belongProduct="<spring:message code='label.dailyReportManager.belongProduct' />";//所属产品
	var monthReportManager_attachment="<spring:message code='common.label.attachment' />";//附件
	var monthReportManager_deleteDailyReportMsg="<spring:message code='label.monthReportManager.deleteDailyReportMsg' />";//确认删除该月报信息吗？
	var gridMonthReport = new Datatable();//月报管理Datatable
	var hasEditAuthMonthReport = isUserHasAuth("R006_0301");//编辑权限
	var hasRemoveAuthMonthReport = isUserHasAuth("R006_0302");//删除权限
	//初始化下拉框
	$("#monthReportMianFormId #belongCustomer").initCustomerInfo(null);
	$("#monthReportMianFormId #belongProduct").initDic(null,codeBasicInfo.PRODUCT);
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/performanceManager/monthReportManager/monthReportManager.js"></script>