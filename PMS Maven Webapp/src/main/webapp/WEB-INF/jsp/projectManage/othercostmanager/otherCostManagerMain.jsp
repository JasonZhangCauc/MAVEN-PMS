<%--  其他成本主页面 jczou 2018-03-19  --%>
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
				<form class="form-horizontal" id="othercostManagementMianFormId" method="post" 
					action="<%=request.getContextPath()%>/projectManagement/exportOtherCostInfo">
			        <div class="form-body">
			            <div class="form-group">
				        	<!-- 项目编号 -->
							<label class="control-label col-md-1">
							<spring:message code='label.othercostManager.projectId' />
							</label>
							<div class="col-md-2">
						     	<input type="text" 
						     		class="form-control" 
						     		id="projectNo" 
						     		name="projectNo"
									placeholder="<spring:message code='message.pleaseinput'/>" />
							</div>
							<!-- 项目标题 -->
							<label class="control-label col-md-1">
							<spring:message code='label.othercostManager.projectName' />
							</label>
							<div class="col-md-2">
						     	<input type="text" 
						     		class="form-control" 
						     		id="projectName" 
						     		name="projectName"
									placeholder="<spring:message code='message.pleaseinput'/>"/>
							</div>
							<!-- 报销人 -->
							<label class="control-label col-md-1">
							<spring:message code='label.othercostManager.peopleConcerned' />
							</label>
							<div class="col-md-2">
						     	<input type="text" 
						     		class="form-control" 
						     		id="peopleName" 
						     		name="peopleName"
									placeholder="<spring:message code='message.pleaseinput'/>"> 
							</div>	
					        <div class="col-md-2">
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="othercostManagementSearchBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
                                <button type="button" data-target="#othercostHide" data-toggle="collapse" aria-expanded="false" class="btn default" data-style="slide-left" id="othercostManagementSearchBtn">
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>
							</div>
						</div>
						<div class="form-group line_p collapse" id="othercostHide" aria-expanded=false>
							<div class="form-group">
							<!-- 费用大项 -->
							<label class="control-label col-md-1">
							<spring:message code='label.othercostManager.costSports' />
							</label>
							<div class="col-md-2">
								<select class="bs-select form-filter form-control" 
										data-size="10" 
										title="<spring:message code='label.allitem' />" 
										id="costSports"
										name="costSports">
				                 </select>
						   	</div>
						   	<!-- 费用小项 -->
							<label class="control-label col-md-1">
							<spring:message code='label.othercostManager.costEvents' />
							</label>
							<div class="col-md-2">
								<select class="bs-select form-filter form-control" 
										data-size="10" 
										title="<spring:message code='label.allitem' />" 
										multiple
										id="costEvents"
										name="costEvents">
				                 </select>
						   	</div>
						 </div>
						 <div class="form-group">
			      			<!-- 有效期 -->
			                <label class="col-md-1 control-label">
			               		<spring:message code='label.othercostManager.date'/>:
			               	</label>
			                <div class="col-md-2">
			                	<div class="input-group input-large">
					               	<input type="text" 
										id="startTime" 
										name="startTime" 
										class="date-picker form-control dateSelect"
										placeholder="<spring:message code='common.label.from'/>" >
								    <span class="input-group-addon">to </span>
								    <input type="text" 
								    	id="endTime" 
								    	name="endTime" 
								    	class="date-picker form-control dateSelect"
								    	placeholder="<spring:message code='common.label.to'/>" >
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
		                <span class="caption-subject bold uppercase">其他成本列表</span>
			    </div>                 
                <div class="actions">
                    <div class="btn-group btn-group-devided" data-toggle="buttons">
                    	<auth:auth resourceCode="R004_0501">
							<a href="<%=request.getContextPath()%>/projectManagement/otherCostManagerEdit?operate=add" data-target="#todo-task-modal"
							data-toggle="modal" class="btn btn-circle green-haze">
							<i class="fa fa-plus"></i></a> 
						</auth:auth>
						<auth:auth resourceCode="R004_0503">
							<a class="btn btn-circle blue" id="otherCostExport">
							<i class="fa fa-download"></i></a> 
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
                    <table class="table table-striped table-bordered table-hover" id="othercostManagementMianTableId"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 其他成本新增编辑弹出框 --> 
<div id="todo-task-modal" class="modal fade" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div>
<script type="text/javascript">
	var othercostManager_projectId = "<spring:message code='label.othercostManager.projectId' />"; //项目编号
	var othercostManager_projectName = "<spring:message code='label.othercostManager.projectName' />"; //项目标题
	var othercostManager_costSports = "<spring:message code='label.othercostManager.costSports' />"; //费用大项
	var othercostManager_costEvents = "<spring:message code='label.othercostManager.costEvents' />"; //费用小项
	var othercostManager_currency = "<spring:message code='label.othercostManager.currency' />"; //币种
	var othercostManager_peopleConcerned = "<spring:message code='label.othercostManager.peopleConcerned' />"; //报销人
	var othercostManager_costDescribe = "<spring:message code='label.othercostManager.costDescribe' />"; //费用描述
	var othercostManager_remark = "<spring:message code='label.othercostManager.remark' />"; //备注
	var othercostManager_whetherInvoice = "<spring:message code='label.othercostManager.whetherInvoice' />"; //是否有发票
	var othercostManager_beginDate = "<spring:message code='label.othercostManager.beginDate' />"; //开始时间
	var othercostManager_endDate = "<spring:message code='label.othercostManager.endDate' />"; //结束时间
	var date = "<spring:message code='label.othercostManager.date' />"; //日期范围
	var deleteothercostConfirmMsg = "<spring:message code='label.othercostManager.deleteWorkhoursConfirmMsg' />";  //确定删除工时统计信息吗？
	var hasEditAuthothercost = isUserHasAuth("R004_0501"); //编辑权限
	var hasDeleteothercostAuth = isUserHasAuth("R004_0502"); //删除权限
	var gridothercost = new Datatable();//其他成本Datatable
	
	//下拉框初始化
	$("#othercostManagementMianFormId #costSports").initDic(null,codeBasicInfo.costSports);
	$("#othercostManagementMianFormId #costEvents").initDic(null,codeBasicInfo.costEventsTravel);
	
</script>
<!-- 引用配置JS --> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManagement/othercostmanager/otherCostManagerMain.js"></script>