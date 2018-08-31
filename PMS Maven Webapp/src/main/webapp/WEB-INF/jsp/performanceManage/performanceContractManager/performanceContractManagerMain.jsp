<!-- 绩效合约主界面  zlshi 20180809-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
<!-- BEGIN PAGE BASE CONTENT -->
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-filter font-red"></i> <span
						class="caption-subject font-red sbold uppercase"><font
						style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">查询条件</font> </font> </span>
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> <a
						href="javascript:;" class="reload"> </a>
				</div>
			</div>
			<div class="portlet-body form">
				<form class="form-horizontal" id="performanceContractMainFormId"
					method="post">
					<div class="form-body">
						<div class="form-group">
							<!-- 姓名 -->
							<label class="col-md-1 control-label"> <spring:message
									code='label.performanceContractManager.userName' />: </label>
							<div class="col-md-2 text-left">
								<input type="text" name="pcName"
									class="form-control form-filter spinner"
									placeholder="<spring:message code='message.pleaseinput'/>">
							</div>
							<!-- 指标类别-->
							<label class="col-md-1 control-label"> <spring:message
									code='label.performanceContractManager.targetType' />: </label>
							<div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control"
										data-size="10" data-width="100%" id="pcTargettype"
										name="pcTargettype"
										title="<spring:message code='message.pleaseselect' />">
									</select>
							</div>
							<!-- 指标内容 -->
							<label class="col-md-1 control-label"> <spring:message
									code='label.performanceContractManager.targetContent' />: </label>
							<div class="col-md-2 text-left">
								<input type="text" id="pcTargetcontent" name="pcTargetcontent"
									class="form-control form-filter spinner"
									placeholder="<spring:message code='message.pleaseinput'/>">
							</div>
							<div class="col-md-2">
								<button type="button"
									class="btn btn-primary mt-ladda-btn ladda-button"
									data-style="slide-left" id="searchPerformanceContractBtn">
									<span class="ladda-label"><i class="fa fa-search"></i> </span>
									<span class="ladda-spinner"></span>
									<div class="ladda-progress" style="width: 0px;"></div>
								</button>
								<button type="button" data-target="#pcHide"
									data-toggle="collapse" aria-expanded="false"
									class="btn default" data-style="slide-left"
									id="searchProjectBtn">
									<span class="ladda-label"><i class="fa fa-filter"></i> </span>
								</button>
							</div>
						</div>
						<div class="line_p collapse" id="pcHide"
							aria-expanded=false>
							<div class="form-group">
								<!-- 状态 -->
								<label class="col-md-1 control-label"> <spring:message
										code='label.applyManage.status' />: </label>
								<div class="col-md-2 text-left">
									<select class="bs-select form-filter form-control"
										data-size="10" data-width="100%" id="pcStatus"
										name="pcStatus"
										title="<spring:message code='message.pleaseselect' />">
									</select>
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
                 <span class="caption-subject bold uppercase"><spring:message code='label.performanceContractManager.info'/></span>
	        </div>
		<div class="portlet light portlet-fit portlet-datatable bordered">
			<div class="portlet-title">
				<div class="actions">
					<div class="btn-group btn-group-devided" data-toggle="buttons">
						<auth:auth resourceCode="R009_03_OPERATION_ADD">
							<a href="<%=request.getContextPath()%>/performanceManage/performanceContractEdit?operate=add"
								data-target="#performanceContract" data-toggle="modal"
								class="btn btn-circle green-haze"> <i class="fa fa-plus"></i>
							</a>
						</auth:auth>
					</div>
					<div class="btn-group">
						<a class="btn red btn-sm btn-circle" href="javascript:;"
							data-toggle="dropdown"> <i class="fa fa-print"></i> </a>
						<ul class="dropdown-menu pull-right" id="sample_tools">
							<li><a href="javascript:;" data-action="0"
								class="tool-action"> <i class="icon-printer"></i> Print</a>
							</li>
							<li><a href="javascript:;" data-action="1"
								class="tool-action"> <i class="icon-check"></i> Copy</a>
							</li>
							<li><a href="javascript:;" data-action="2"
								class="tool-action"> <i class="icon-doc"></i> PDF</a>
							</li>
							<li><a href="javascript:;" data-action="3"
								class="tool-action"> <i class="icon-paper-clip"></i> Excel</a></li>
							<li><a href="javascript:;" data-action="4"
								class="tool-action"> <i class="icon-cloud-upload"></i> CSV</a></li>
							<li class="divider"></li>
							<li><a href="javascript:;" data-action="5"
								class="tool-action"> <i class="icon-refresh"></i> Reload</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="portlet-body">
				<div class="table-container">
					<table class="table table-striped table-bordered table-hover"
						id="performanceContractMainTableId"></table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 弹出框 -->
	<div id="performanceContract" class="modal fade todo-task-modal"
		role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content scroller" style="height: 100%;"
				data-always-visible="1" data-rail-visible="0"></div>
		</div>
	</div>

<!-- 参数列表 -->
<script type="text/javascript">
	var performanceContractManager_userName="<spring:message code='label.performanceContractManager.userName'/>";//姓名
	var performanceContractManager_targetType="<spring:message code='label.performanceContractManager.targetType'/>";//指标类别
	var performanceContractManager_targetContent="<spring:message code='label.performanceContractManager.targetContent'/>"; //指标内容
	var performanceContractManager_checkContent="<spring:message code='label.performanceContractManager.checkContent'/>";//考核内容
	var performanceContractManager_weight="<spring:message code='label.performanceContractManager.weight'/>"; //权重
	var performanceContractManager_status="<spring:message code='label.performanceContractManager.status'/>"; //状态
	var performanceContractManager_op="<spring:message code='label.performanceContractManager.op'/>";//状态
	
	var performanceContractManagerMain_delete = "<spring:message code='label.performanceContractManager.delete' />";//删除提示
	var performanceContractManagerMain_submit = "<spring:message code='label.performanceContractManager.submit' />";//提交提示
	$("#performanceContractMainFormId #pcTargettype").initDic(null,
				codeBasicInfo.performanceContractType);//绩效合约指标类型
	
	$("#performanceContractMainFormId #pcStatus").initDic(null,
				codeBasicInfo.performanceContractStatus);//绩效合约状态
	
	var hasViewPCInfoAuth = isUserHasAuth("R009_03_OPERATION_VIEW"); //查看权限
	var hasEditPCInfoAuth = isUserHasAuth("R009_03_OPERATION_EDIT"); //编辑权限
	var hasDelPCInfoAuth = isUserHasAuth("R009_03_OPERATION_DEL"); //删除权限
	var hasSubmitPCInfoAuth = isUserHasAuth("R009_03_OPERATION_COMMIT"); //提交权限
	var hasAuditPCAuth = isUserHasAuth("R009_03_OPERATION_AUDIT"); //考核权限
	
	
	var gridPerformanceContract = new Datatable();//基础信息维护管理Datatable

</script>
<!-- 引用js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/performanceManager/performanceContractManager/performanceContractManagerMain.js"></script>