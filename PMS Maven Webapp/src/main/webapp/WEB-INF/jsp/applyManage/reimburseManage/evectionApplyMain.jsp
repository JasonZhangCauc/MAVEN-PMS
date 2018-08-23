<!-- 报销申请信息维护主界面  lanjunjie 20180802-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			 <div class="portlet-title">
	             <div class="caption">
	                 <i class="fa fa-filter font-red"></i>
	                 <span class="caption-subject font-red sbold uppercase">
	                 	<font style="vertical-align: inherit;">
		                 	<font style="vertical-align: inherit;">
		                 	<spring:message code='label.queryTerm'/>
		                 	</font>
		                 </font>
		             </span>
	             </div>
	             <div class="tools">
	                 <a href="javascript:;" class="collapse"> </a>
	                 <a href="javascript:;" class="reload"> </a>
	             </div>
	         </div>
	         <div class="portlet-body form">
             	<form class="form-horizontal" id="reimburseBaseInfoMainFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			            	<!-- 报销日期 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.applyManage.Time' />:
			                </label>
			                <div class="col-md-2 text-left">
								<input type="text"
								class="date-picker form-control dateSelect"
								style="width: 100%;"
								id="applyTime"
								name="applyTime"
								value="${vo.applyTime}"
								placeholder="<spring:message code='message.pleaseselect'/>" >
			                </div>
			                <!-- 报销类型-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.applyManage.applyType' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<select class="bs-select form-filter form-control"
									multiple
									data-size="10"
									id="applyType"
									name="reimburseType"
									title="<spring:message code='label.allitem' />" >
			                    </select>
			                </div>
							<!-- 项目名称-->
				            <label class="col-md-1 control-label">
				                <spring:message code='label.applyManage.projectName' />:
				            </label>
				            <div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control"
									data-size="10"
									id="projectId"
									name="projectName"
									title="<spring:message code='label.allitem'/>" >
				                </select>
				             </div>
			                <div class="col-md-2">
			                	<!-- 查询 -->
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" 
			                    	data-style="slide-left" id="searchReimburseBaseInfoBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
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
            <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
                 <div class="ribbon-sub ribbon-clip"></div> 
                 <span class="caption-subject bold uppercase"><spring:message code='label.applyManage.applyInfo'/></span>
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">  
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
	                    	<!-- 新增 -->
							<auth:auth resourceCode="R011_01_OPERATION_ADD">
								<a href="<%=request.getContextPath()%>/applyManage/evectionApplyEdit?operate=add" data-target="#reimburse-modal"
								data-toggle="modal" class="btn btn-circle green-haze">
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
	                    <table class="table table-striped table-bordered table-hover" id="reimburseBaseInfoMianTableId"></table>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<!-- 弹出框 --> 
<div id="reimburse-modal" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div> 
<!-- 参数列表 --> 
<script type="text/javascript">
	var reimburseBaseInfoMain_applyType = "<spring:message code='label.applyManage.applyType' />";   //报销类型
	var reimburseBaseInfoMain_departPlace = "<spring:message code='label.applyManage.departPlace' />";   //出发地点
	var reimburseBaseInfoMain_arrivePlace = "<spring:message code='label.applyManage.arrivePlace' />";   //到达地点
	var reimbursetBaseInfoMain_userName = "<spring:message code='label.applyManage.userName' />";   //姓名
	var reimburseBaseInfoMain_userNo = "<spring:message code='label.applyManage.userNo' />";   //工号
	var reimburseBaseInfoMain_applyTime = "<spring:message code='label.applyManage.Time' />";   //报销申请时间
	var reimburseBaseInfoMain_reimburseNo = "<spring:message code='label.applyManage.reimburseNo' />";   //报销单号
	var reimburseBaseInfoMain_amount = "<spring:message code='label.applyManage.amount' />";   //金额
	var reimburseBaseInfoMain_projectName = "<spring:message code='label.applyManage.projectName' />";   //项目名称
	var reimburseBaseInfoMain_remark = "<spring:message code='label.applyManage.remark' />";   //描述
	var reimburseBaseInfoMain_status = "<spring:message code='label.applyManage.status' />";   //状态
	var reimburseBaseInfoMain_applyNo = "<spring:message code='label.applyManage.applyNo' />";   //报销申请编号
	var reimburseBaseInfoMain_deleteReimburseMsg = "<spring:message code='label.applyManage.applyDelete' />";   //删除提醒信息
	var reimburseBaseInfoMain_commitReimburseMsg = "<spring:message code='label.applyManage.applyCommit' />";   //提交提醒信息
	var reimburseBaseInfoMain_auditReimburseMsg = "<spring:message code='label.applyManage.applyAudit' />";   //审核提醒信息
	var reimburseBaseInfoMain_applyBackMsg = "<spring:message code='label.applyManage.applyBack' />";   //驳回申请提醒信息
	var reimburseBaseInfoMain_applyRatifyMsg = "<spring:message code='label.applyManage.applyRatify' />";   //批准申请提醒信息
	var gridReimburseBaseInfo = new Datatable();//项目维护Datatable
	//操作权限控制
	var hasEditReimburseBaseInfoAuth = isUserHasAuth("R011_01_OPERATION_EDIT"); //编辑权限
	var hasRemoveReimburseBaseInfoAuth = isUserHasAuth("R011_01_OPERATION_DEL"); //删除权限
	var hasAuditReimburseBaseInfoAuth = isUserHasAuth("R011_01_OPERATION_AUDIT"); //审核权限
	var hasCommitReimburseBaseInfoAuth = isUserHasAuth("R011_01_OPERATION_COMMIT");//提交权限
	var hasRatifyReimburseBaseInfoAuth = isUserHasAuth("R011_01_OPERATION_RATIFY");//提交权限

	$("#reimburseBaseInfoMainFormId #applyType").initDic(null,codeBasicInfo.applyType);//报销类型
	$("#projectId").initRecordProjectInfo('${vo.projectName}');  //项目名称

</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/applyManage/reimburseManage/evectionApplyMain.js"></script>