<!-- 项目监控主界面  ZHOUMIN 20180305-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			 <div class="portlet-title">
	             <div class="caption">
	                 <i class="fa fa-filter font-red"></i>
	                 <span class="caption-subject font-red sbold uppercase"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">查询条件</font></font></span>
	             </div>
	             <div class="tools">
	                 <a href="javascript:;" class="collapse"> </a>
	                 <a href="javascript:;" class="reload"> </a>
	             </div>
	         </div>
	         <div class="portlet-body form">
             	  <form class="form-horizontal" id="projectMonitorMianFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			            	<!-- 项目标题 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.projectManager.projectName' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="projectTitle" class="form-control form-filter spinner"
			                     	placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <!-- 项目编号-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.projectManager.projectNo' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<input type="text" name="projectNo" class="form-control form-filter spinner"
			                     	placeholder="<spring:message code='message.pleaseinput'/>">
			                </div>
			                <!-- 项目阶段 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.projectManager.projectStage' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<select class="bs-select form-filter form-control" 
									multiple 
									data-size="10" 
									id="projectStage"
									name="projectStage"
									title="<spring:message code='label.allitem' />">
			                    </select>
			                </div>
			                <div class="col-md-2">
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchProjectMonitorBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
                                <!-- 更多 -->
                                <button type="button" data-target="#projectMonitorHide" data-toggle="collapse" aria-expanded="false" class="btn default" data-style="slide-left" id="searchProjectMonitorBtn">
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>
							</div>
						</div>
						<div class="line_p collapse" id="projectMonitorHide" aria-expanded=false>
							<div class="form-group">
								<!-- 所属客户 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.projectManager.belongCustomerid' />:
				                </label>
				                <div class="col-md-2 text-left">
									<select class="bs-select form-filter form-control" 
										multiple 
										data-size="10" 
										id="belongCustomer"
										name="belongCustomer"
										title="<spring:message code='label.allitem' />">
				                    </select>
				                </div>
				                <!-- 所属产品 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.projectManager.belongProduct' />:
				                </label>
				                <div class="col-md-2 text-left">
				                    <select class="bs-select form-filter form-control" 
										multiple 
										data-size="10" 
										id="belongProduct"
										name="belongProduct"
										title="<spring:message code='label.allitem' />">
				                    </select>
				                </div>
				                <!-- 立项日期 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.projectManager.projectDate' />:
				                </label>
				                <div class="col-md-2 text-left">
				                	<div class="input-group input-large">
										<input type="text" 
											id="projectBeginDate" 
											name="projectBeginDate" 
											placeholder="<spring:message code='common.label.from'/>" 
											class="date-picker form-control dateSelect" 
											data-date-format="yyyy-mm-dd">
									    <span class="input-group-addon">to</span>
									    <input type="text" 
									    	id="projectEndDate" 
									    	name="projectEndDate" 
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
        <div class="portlet light portlet-fit portlet-datatable bordered">
            <div class="portlet-title"> 
                <div class="caption">
	                <i class="fa fa-info-circle font-dark"></i>
	                <span class="caption-subject bold uppercase">项目信息</span>
		        </div>           
                <div class="actions">
                    <div class="btn-group btn-group-devided" data-toggle="buttons">
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
                    <table class="table table-striped table-bordered table-hover" id="projectMonitorMianTableId"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var projectMonitorMain_projectNo = "<spring:message code='label.projectManager.projectNo' />";   //项目编号
	var projectMonitorMain_projectName = "<spring:message code='label.projectManager.projectName' />";   //项目标题
	var projectMonitorMain_belongCustomer = "<spring:message code='label.projectManager.belongCustomerid' />";   //所属客户
	var projectMonitorMain_belongProduct = "<spring:message code='label.projectManager.belongProduct' />";   //所属产品
	var projectMonitorMain_projectDate = "<spring:message code='label.projectManager.projectDate' />";   //立项日期
	var projectMonitorMain_implementHead = "<spring:message code='label.projectManager.implementHead' />";   //实施负责人
	var projectMonitorMain_exploitHead = "<spring:message code='label.projectManager.exploitHead' />";   //研发负责人
	var projectMonitorMain_planWorkHours = "<spring:message code='label.projectManager.planWorkHours' />";   //计划工时
	var projectMonitorMain_projectStage = "<spring:message code='label.projectManager.projectStage' />";   //项目阶段
	var projectMonitorMain_projectStatus = "<spring:message code='label.projectManager.projectStatus' />";   //项目状态
	var projectMonitorMain_attachment = "<spring:message code='common.label.attachment' />";   //附件
	var projectMonitorMain_projectMonitorBtn = "<spring:message code='lable.projectMonitor.projectMonitorBtn' />";   			//项目监控
	var gridProjectMonitor = new Datatable();//项目管理Datatable
	var hasMonitorProjectAuth = isUserHasAuth("R004_0201"); //项目监控权限
	//查询条件下拉框初始化
	$("#projectMonitorMianFormId #belongProduct").initDic(null,codeBasicInfo.PRODUCT);
    $("#projectMonitorMianFormId #projectStatus").initDic(null,codeBasicInfo.projectStatus);
    $("#projectMonitorMianFormId #projectStage").initDic(null,codeBasicInfo.projectStage);
    $("#projectMonitorMianFormId #belongCustomer").initCustomerInfo(null);
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManagement/projectMonitorManager/projectMonitorManager.js"></script>