<!-- 成本查看主界面  005642 20180305-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- BEGIN PAGE BASE CONTENT -->
<div class="row">
     <div class="col-md-12">
          <!-- BEGIN PORTLET-->
          <div class="portlet box grey-cascade form-fit">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i>
					<spring:message code='lable.costReport.costView' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> 
					<a href="javascript:;" class="remove" data-dismiss="modal"> </a>
				</div>
			</div>
			<div class="portlet-body m-heading-1 border-green m-bordered">
					<form class="form-horizontal" id="costDetailFormId" method="post">
				        <div class="row">
				            <div class="form-group">
							    <!--工号-->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.workhoursRecord.workerName'/>:
				                </label>
				                <div class="col-md-3 text-left">
				                    <input type="text" name="workerName" class="form-control form-filter spinner" 
				                         placeholder="<spring:message code='message.pleaseinput'/>">  
				                </div>
							    <!--姓名-->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.workhoursRecord.workDate'/>:
				                </label>
				                <div class="col-md-3 text-left">
				                    <div class="input-group input-large">
										<input type="text" 
											id="beginWorkDate" 
											name="beginWorkDate" 
											value="${vo.beginWorkDate }"
											placeholder="<spring:message code='common.label.from'/>" 
											class="date-picker form-control dateSelect" 
											data-date-format="yyyy-mm-dd">
									    <span class="input-group-addon">to</span>
									    <input type="text" 
									    	id="endWorkDate" 
									    	name="endWorkDate" 
									    	value="${vo.endWorkDate }"
									    	placeholder="<spring:message code='common.label.to'/>" 
									    	class="date-picker form-control dateSelect" 
									    	data-date-format="yyyy-mm-dd">
									</div>
				                </div>				
				                <div class="col-md-3 text-right">
									<a href="javascript:;" class="btn default btn-sm blue-madison" id="searchCostDetailBtn"> 
										<i class="fa fa-search"></i>
										<spring:message code='btn.common.search' /> 
									</a>
								</div>				
							 </div>
						 </div>			                 
				    </form>
				<div class="row">
				    <div class="col-md-12">
				        <!-- Begin: life time stats -->
				        <div class="portlet light portlet-fit portlet-datatable bordered">
				            <div class="portlet-title">
				                <div class="caption">
				                    <i class="icon-settings font-dark"></i>
				                    <span class="caption-subject bold uppercase">
				                      <spring:message code='lable.costReport.costDetail'/>
				                    </span>
				                </div>
				            </div>
				            <div class="portlet-body">
				                <div class="table-container">
				                    <table class="table table-striped table-bordered table-hover" id="costDetailTableId"></table>
				                </div>
				            </div>           
				        </div>
				        <!-- End: life time stats -->
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var costDetail_date = "<spring:message code='common.label.date' />";   //日期
	var costDetail_workNumber = "<spring:message code='label.userManage.workNumber' />";   //工号
	var costDetail_userName = "<spring:message code='label.userManage.userName' />";   //姓名
	var costDetail_workingType = "<spring:message code='label.workhoursRecord.workingType' />";   //工作分类
	var costDetail_workingHours = "<spring:message code='label.workhoursRecord.workingHours' />";   //耗时
	var costDetail_workDesc = "<spring:message code='label.workhoursRecord.workDesc' />";   //工作内容
	var costDetail_remark = "<spring:message code='label.workhoursRecord.remark' />";   //备注
	var gridCostDetail = new Datatable();//成本报表Datatable
	var costDetail_projectId='${vo.projectId }';
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/operationAnalysis/costReport/costDetail.js"></script>