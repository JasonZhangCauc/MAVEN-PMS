<!-- 成本报表主界面  005642 20180305-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- BEGIN PAGE BASE CONTENT -->
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-filter font-red"></i> 
					<span class="caption-subject font-red sbold uppercase">
						<font style="vertical-align: inherit;">
							<font style="vertical-align: inherit;">
								<spring:message	code='label.queryTerm' />
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
				 <form class="form-horizontal" id="costReportMianFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			            	<!-- 项目名称 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.projectBaseinfo.projectName' />:
			                </label>
			                <div class="col-md-2 text-left">
			                     <input type="text" name="projectName" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <!-- 项目阶段-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.projectBaseinfo.projectPhase' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<select class="bs-select form-filter form-control" 
									multiple 
									data-size="10" 
									id="projectPhase"
									name="projectPhase"
									title="<spring:message code='label.allitem' />" >
			                    </select>
			                </div>
			                <!-- 项目状态 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.projectBaseinfo.projectStatus' />:
			                </label>
			                <div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control" 
									multiple 
									data-size="10" 
									id="projectStatus"
									name="projectStatus"
									title="<spring:message code='label.allitem'/>" >
			                    </select>
			                </div>
			                <div class="col-md-2">
							    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" 
			                    	data-style="slide-left" id="searchCostReportBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
							    <button type="button" data-target="#costReportHide" data-toggle="collapse" 
                                	aria-expanded="false" class="btn default" data-style="slide-left" >
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>
							</div>
			            </div>
			            <div class="line_p collapse" id="costReportHide" aria-expanded=false>
			            	<div class="form-group">
								<!-- 工期 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='common.label.date' />:
				                </label>
				                <div class="col-md-2 text-left">
				                	<div class="input-group input-large">
										<input type="text" 
											id="beginTime" 
											name="beginTime" 
											placeholder="<spring:message code='common.label.from'/>" 
											class="date-picker form-control dateSelect" 
											data-date-format="yyyy-mm-dd">
									    <span class="input-group-addon">to</span>
									    <input type="text" 
									    	id="endTime" 
									    	name="endTime" 
									    	placeholder="<spring:message code='common.label.to'/>" 
									    	class="date-picker form-control dateSelect" 
									    	data-date-format="yyyy-mm-dd">
									</div>
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
    	<div class="mt-element-ribbon bg-grey-steel">
            <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
                 <div class="ribbon-sub ribbon-clip"></div> 
                 <span class="caption-subject bold uppercase"><spring:message code='lable.costReport.costReport'/></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">  
	                <div class="actions">
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
	                    <table class="table table-striped table-bordered table-hover" id="costReportMianTableId"></table>
	                </div>
	            </div>
	        </div>
	     </div>
    </div>
</div>
<!-- 弹出框 --> 
<div id="view_cost_model" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:60%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var costReport_projectName = "<spring:message code='lable.projectBaseinfo.projectName' />";   //项目名称
	var costReport_projectPhase = "<spring:message code='lable.projectBaseinfo.projectPhase' />";   //项目阶段
	var costReport_projectStatus = "<spring:message code='lable.projectBaseinfo.projectStatus' />";   //项目状态
	var costReport_estimatedWorkload = "<spring:message code='lable.projectBaseinfo.estimatedWorkload' />";   //预估工作量
	var costReport_workTime = "<spring:message code='lable.projectBaseinfo.workTime' />";   //工期
	var costReport_periodWorkHours = "<spring:message code='lable.costReport.periodWorkHours' />";   //期内工作量
	var costReport_cumulativeWorkHours = "<spring:message code='lable.costReport.cumulativeWorkHours' />";   //累计工作量
	var costReport_periodCost = "<spring:message code='lable.costReport.periodCost' />";   //期内成本
	var costReport_cumulativeCost = "<spring:message code='lable.costReport.cumulativeCost' />";   //累计成本
	var costReport_profitTargets = "<spring:message code='lable.projectBaseinfo.profitTargets' />";   //利润指标
	var costReport_profitMargin = "<spring:message code='lable.costReport.profitMargin' />";   //利润率
	var gridCostReport = new Datatable();//成本报表Datatable
	$("#costReportMianFormId #projectPhase").initDic(null,codeBasicInfo.projectPhase);//项目阶段
	$("#costReportMianFormId #projectStatus").initDic(null,codeBasicInfo.projectState);//项目状态	
	var hasViewCostReportAuth = isUserHasAuth("R013_01_OPERATION_VIEW"); //查看权限
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/operationAnalysis/costReport/costReportMain.js"></script>