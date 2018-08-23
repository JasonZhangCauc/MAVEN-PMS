<%--  单价主页面 jczou 2018-02-28  --%>
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
				<form class="form-horizontal" id="costManagementMianFormId" method="post">
					<div class="form-body">
						<div class="form-group">
							<!-- 供应商名称 -->
							<label class="col-md-1 control-label"> <spring:message
									code='label.costManagement.suppliername' />: </label>
							<div class="col-md-2">
								<select class="bs-select form-filter form-control" multiple
									data-size="10" title="<spring:message code='label.allitem' />"
									id="supplierId" name="supplierId">
								</select>
							</div>
							<!-- 单价类型 -->
							<label class="col-md-1 control-label"> <spring:message
									code='label.costManagement.priceType' />: </label>
							<div class="col-md-2">
								<select class="bs-select form-filter form-control" multiple
									data-size="10" title="<spring:message code='label.allitem' />"
									id="priceType" name="priceType">
								</select>
							</div>
							<div class="col-md-2">
								<button type="button"
									class="btn btn-primary mt-ladda-btn ladda-button"
									data-style="slide-left" id="costManagementSearchBtn">
									<span class="ladda-label"><i class="fa fa-search"></i>
									</span> <span class="ladda-spinner"></span>
									<div class="ladda-progress" style="width: 0px;"></div>
								</button>
								<button type="button" data-target="#costHide"
									data-toggle="collapse" aria-expanded="false"
									class="btn default" data-style="slide-left"
									id="costManagementSearchBtn">
									<span class="ladda-label"><i class="fa fa-filter"></i>
									</span>
								</button>
							</div>
						</div>
						<div class="form-group line_p collapse" id="costHide"
							aria-expanded=false>
							<!-- 有效期 -->
							<label class="col-md-1 control-label"> <spring:message
									code='label.costManagement.legaldate' />: </label>
							<div class="col-md-2 text-left">
								<div class="input-group input-large">
									<input type="text" id="startTime" name="startTime"
										placeholder="<spring:message code='common.label.from'/>"
										class="date-picker form-control dateSelect">
									<span class="input-group-addon">to </span> <input type="text"
										id="endTime" name="endTime"
										class="date-picker form-control dateSelect"
										placeholder="<spring:message code='common.label.to'/>">
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
	                <span class="caption-subject bold uppercase">单价列表</span>
		        </div>               
                <div class="actions">
                    <div class="btn-group btn-group-devided" data-toggle="buttons">
                    	<auth:auth resourceCode="R004_0301">
							<a href="<%=request.getContextPath()%>/projectManagement/costManagementEdit?operate=add" data-target="#todo-task-modal"
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
                    <table class="table table-striped table-bordered table-hover" id="costManagementMianTableId"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 新增编辑弹出框 --> 
<div id="todo-task-modal" class="modal fade" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div>
<!-- 参数列表 -->
<script type="text/javascript">
	var costManagement_suppliername = "<spring:message code='label.costManagement.suppliername' />";   //供应商ID
	var costManagement_priceType = "<spring:message code='label.costManagement.priceType' />";   //单价类型
	var costManagement_price = "<spring:message code='label.costManagement.price' />";   //单价
	var costManagement_currency = "<spring:message code='label.costManagement.currency' />";   //币种
	var costManagement_beginDate = "<spring:message code='label.costManagement.beginDate' />";   //开始日期
	var costManagement_endDate = "<spring:message code='label.costManagement.endDate' />";   //结束日期
	var costManagement_remark = "<spring:message code='label.costManagement.remark' />";   //备注
	var deleteCostConfirmMsg = "<spring:message code='label.costManagement.deleteCostConfirmMsg' />";  //确定删除单价信息吗？
	var cost_dategrid = "<spring:message code='label.costManagement.costDateGrid' />";  //确定删除单价信息吗？
	var hasEditAuthCost = isUserHasAuth("R004_0301");//编辑权限
	var hasDeleteCostAuth = isUserHasAuth("R004_0302");//删除权限
	var gridCost = new Datatable();//单价管理Datatable
	//初始化下拉框
	$("#costManagementMianFormId #supplierId").initDic('${vo.supplierId}',codeBasicInfo.suppliername);
	$("#costManagementMianFormId #priceType").initDic('${vo.priceType}',codeBasicInfo.pricetype);
	$("#costManagementMianTableId #currency").initDic('${vo.currency}',codeBasicInfo.currency);
</script>

<!-- 引用配置JS --> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManagement/costmanager/costManagementMain.js"></script>