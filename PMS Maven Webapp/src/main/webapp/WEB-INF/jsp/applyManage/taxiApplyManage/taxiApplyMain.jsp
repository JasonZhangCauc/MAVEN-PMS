<!-- 打车报销主界面  zlshi 20180804-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-filter font-red"></i> <span
						class="caption-subject font-red sbold uppercase"><font
						style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">
							<spring:message code='label.queryTerm'/>
							</font> </font> </span>
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> <a
						href="javascript:;" class="reload"> </a>
				</div>
			</div>
			<div class="portlet-body form">
				<form class="form-horizontal" id="taxiApplyMianFormId" method="post">
					<div class="form-body">
						<div class="form-group">
							<!-- 项目名称 -->
							<label class="col-md-1 control-label"> <spring:message
									code='label.applyManage.projectName' />: </label>
							<div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control"
									data-size="10" data-width="100%" id="projectId"
									name="projectId"
									title="<spring:message code='message.pleaseselect' />">
								</select>
							</div>
							<!-- 状态 -->
								<label class="col-md-1 control-label"> <spring:message
										code='label.applyManage.status' />: </label>
								<div class="col-md-2 text-left">
									<select class="bs-select form-filter form-control"
										data-size="10" data-width="100%" id="taxibillStatus"
										name="taxibillStatus"
										title="<spring:message code='message.pleaseselect' />">
									</select>
								</div>
							<!-- 日期 -->
							<label class="col-md-1 control-label"> <spring:message
									code='label.applyManage.applyTime' />: </label>
							<div class="col-md-2 text-left">
								<input type="text" id="reimburseDate" name="reimburseDate"
									class="date-picker form-control dateSelect"
									data-date-format="yyyy-mm-dd">
							</div>
							<div class="col-md-2">
								<button type="button"
									class="btn btn-primary mt-ladda-btn ladda-button"
									data-style="slide-left" id="searchTaxiApplyBtn">
									<span class="ladda-label"><i class="fa fa-search"></i> </span>
									<span class="ladda-spinner"></span>
									<div class="ladda-progress" style="width: 0px;"></div>
								</button>
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
			<div
				class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
				<div class="ribbon-sub ribbon-clip"></div>
				<span class="caption-subject bold uppercase"><spring:message
						code='label.applyManage.applyInfo' /> </span>
			</div>
			<div class="portlet light portlet-fit portlet-datatable bordered">
				<div class="portlet-title">
					<div class="actions">
						<div class="btn-group btn-group-devided" data-toggle="buttons">
							<auth:auth resourceCode="R011_02_OPERATION_ADD">
								<a
									href="<%=request.getContextPath()%>/applyManage/taxiApplyEdit?operate=add"
									data-target="#project-taxiApply" data-toggle="modal"
									class="btn btn-circle green-haze"> <i class="fa fa-plus"></i>
								</a>
							</auth:auth>
						</div>
						<div class="btn-group">
							<a class="btn red btn-sm btn-circle" href="javascript:;"
								data-toggle="dropdown"> <i class="fa fa-print"></i> </a>
							<ul class="dropdown-menu pull-right" id="sample_tools">
								<li><a href="javascript:;" data-action="0"
									class="tool-action"> <i class="icon-printer"></i> Print</a></li>
								<li><a href="javascript:;" data-action="1"
									class="tool-action"> <i class="icon-check"></i> Copy</a></li>
								<li><a href="javascript:;" data-action="2"
									class="tool-action"> <i class="icon-doc"></i> PDF</a></li>
								<li><a href="javascript:;" data-action="3"
									class="tool-action"> <i class="icon-paper-clip"></i> Excel</a>
								</li>
								<li><a href="javascript:;" data-action="4"
									class="tool-action"> <i class="icon-cloud-upload"></i> CSV</a>
								</li>
								<li class="divider"></li>
								<li><a href="javascript:;" data-action="5"
									class="tool-action"> <i class="icon-refresh"></i> Reload</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="portlet-body">
					<div class="table-container">
						<table class="table table-striped table-bordered table-hover"
							id="taxiApplyMianTableId">
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 弹出框 -->
	<div id="project-taxiApply" class="modal fade todo-task-modal"
		role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content scroller" style="height: 100%;"
				data-always-visible="1" data-rail-visible="0"></div>
		</div>
	</div>
	<!-- 参数列表 -->
	<script type="text/javascript">
		var taxiApplyManagerMain_taxiApplyNo = "<spring:message code='label.applyManage.applyNo' />"; //打车报销序号
		var taxiApplyManagerMain_taxiApplyreimburseNo = "<spring:message code='label.applyManage.reimburseNo' />";//打车报销编号
		var taxiApplyManagerMain_taxiApplyStatus = "<spring:message code='label.applyManage.status' />"; //打车报销状态
		var taxiApplyManagerMain_taxiApplyDate = "<spring:message code='label.applyManage.applyTime' />"; //打车日期
		var taxiApplyManagerMain_departTime = "<spring:message code='label.applyManage.departTime' />"; //上车时间
		var taxiApplyManagerMain_arriveTime = "<spring:message code='label.applyManage.arriveTime' />"; //下车时间
		var taxiApplyManagerMain_amount = "<spring:message code='label.applyManage.amount' />"; //金额
		var taxiApplyManagerMain_userName = "<spring:message code='label.applyManage.userName' />"; //姓名
		var taxiApplyManagerMain_projectName = "<spring:message code='label.applyManage.projectName' />"; //项目名称
		var taxiApplyManagerMain_remark = "<spring:message code='label.applyManage.remark' />"; //事由
		var taxiApplyManagerMain_taxiApplySubDate = "<spring:message code='label.applyManage.applySubTime' />"; //提交日期
		var taxiApplyManagerMain_operate = "<spring:message code='common.label.operate' />"; //操作
		var taxiApplyManagerMain_edit = "<spring:message code='label.applyManage.taxiApplyEdit' />";
		var taxiApplyManagerMain_delete = "<spring:message code='label.applyManage.taxiApplDelete' />";
		var taxiApplyManagerMain_submit = "<spring:message code='label.applyManage.taxiApplySubmit' />";
		var taxiApplyManagerMain_refused = "<spring:message code='label.applyManage.taxiApplyRefused' />";
		var taxiApplyManagerMain_audit = "<spring:message code='label.applyManage.taxiApplyAudit' />";
		var gridTaxiApply = new Datatable();//打车报销管理Datatable

		$("#taxiApplyMianFormId #taxibillStatus").initDic(null,
				codeBasicInfo.taxiApplyStatus);//状态
		$("#taxiApplyMianFormId #projectId").initRecordProjectInfo(
				'${vo.projectId}');//项目名称

		var hasEditProjectBaseInfoAuth = isUserHasAuth("R011_02_OPERATION_EDIT"); //编辑权限
		var hasRemoveProjectBaseInfoAuth = isUserHasAuth("R011_02_OPERATION_DEL"); //删除权限
		var hasSubmitProjectBaseInfoAuth = isUserHasAuth("R011_02_OPERATION_COMMIT"); //提交权限
		var hasAuditProjectBaseInfoAuth = isUserHasAuth("R011_02_OPERATION_AUDIT"); //审核权限
		var hasRefusedProjectBaseInfoAuth = isUserHasAuth("R011_02_OPERATION_REFUSED"); //拒绝权限
	</script>
	<!-- 引用js -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/applyManage/taxiApplyManage/taxiApplyMain.js"></script>