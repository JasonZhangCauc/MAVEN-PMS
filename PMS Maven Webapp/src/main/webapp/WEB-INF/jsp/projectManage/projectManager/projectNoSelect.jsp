<!-- 项目立项主界面  ZHOUMIN 20180305-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
     <div class="col-md-12">
          <!-- BEGIN PORTLET-->
          <div class="portlet box grey-cascade form-fit">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i>
					<spring:message code='lable.projectmanagent.projectSelect' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> 
					<a href="javascript:;" class="remove" data-dismiss="modal"> </a>
				</div>
			</div>
			<div class="portlet-body">
				<div class="m-heading-1 border-green m-bordered">
					<form class="form-horizontal" id="projectSelectFormId" method="post">
				        <div class="row">
            <div class="form-group">
            	<!-- 项目标题 -->
                <label class="col-md-1 control-label">
                	<spring:message code='label.projectManager.projectName' />:
                </label>
                <div class="col-md-2 text-left">
                    <input type="text" name="projectName" class="form-control form-filter spinner"
                     	placeholder="<spring:message code='label.workHoursManager.placeinputprojectName' />"> 
                </div>
                <!-- 项目编号-->
                <label class="col-md-1 control-label">
                	<spring:message code='label.projectManager.projectNo' />:
                </label>
                <div class="col-md-2 text-left">
                	<input type="text" name="projectNo" class="form-control form-filter spinner"
                     	placeholder="<spring:message code='label.workHoursManager.placeinputprojectNo' />">
                </div>
                <!-- 项目状态 -->
                <label class="col-md-1 control-label">
                	<spring:message code='label.projectManager.projectStatus' />:
                </label>
                <div class="col-md-2 text-left">
                	<select class="bs-select form-filter form-control" 
						multiple 
						data-size="10" 
						id="projectStatus"
						name="projectStatus"
						title="<spring:message code='label.allitem' />" >
                    </select>
                </div>
                <div class="col-md-2">
				    <a href="javascript:;" class="btn default btn-sm blue-madison" id="searchProjectBtn"> 
					    <i class="fa fa-search"></i>
				    </a>
				    <!-- 更多 -->
				    <a data-target="#projectHide" data-toggle="collapse" class="btn default btn-sm blue-hoki" aria-expanded="false">
                       <i class="fa fa-filter"></i>
                    </a>
				</div>
			</div>
			<div class="line_p collapse" id="projectHide" aria-expanded=false>
				<div class="form-group">
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
							title="<spring:message code='label.allitem' />" >
	                    </select>
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
				</div>
				<div class="form-group">
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
<div class="row">
    <div class="col-md-12">
        <div class="mt-element-ribbon bg-grey-steel">
            <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
                 <div class="ribbon-sub ribbon-clip"></div> 
                 <span class="caption-subject bold uppercase"><spring:message code='label.projectManager.projectInfo' /></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">
	                <div class="caption">
	                    <i class="icon-settings font-dark"></i>
	                    <span class="caption-subject bold uppercase"><spring:message code='label.projectManager.projectInfo' /></span>
	                </div>
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
							<a addtabs='R00401_01' url="projectManager/projectManagerEdit?operate=add"  
							class="btn btn-circle green-haze" style="cursor:pointer;" title="<spring:message code='btn.common.add' />" >
							<i class="fa fa-plus"></i>&nbsp;<spring:message code='btn.common.add' /></a> 
	                    </div>
	                    <div class="btn-group">
	                        <a class="btn red btn-sm btn-circle" href="javascript:;" data-toggle="dropdown">
	                            <i class="fa fa-share"></i>
	                            <span class="hidden-xs">工具类 </span>
	                            <i class="fa fa-angle-down"></i>
	                        </a>
	                        <ul class="dropdown-menu pull-right" id="sample_3_tools">
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
	                    <table class="table table-striped table-bordered table-hover" id="projectMianTableId"></table>
	                </div>
	            </div>
	        </div>
	     </div>
    </div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var projectManagerMain_projectNo = "<spring:message code='label.projectManager.projectNo' />";   //项目编号
	var projectManagerMain_projectName = "<spring:message code='label.projectManager.projectName' />";   //项目标题
	var projectManagerMain_belongCustomer = "<spring:message code='label.dailyReportManager.belongCustomer' />";   //所属客户
	var projectManagerMain_belongProduct = "<spring:message code='label.dailyReportManager.belongProduct' />";   //所属产品
	var projectManagerMain_projectDate = "<spring:message code='label.projectManager.projectDate' />";   //立项日期
	var projectManagerMain_implementHead = "<spring:message code='label.projectManager.implementHead' />";   //实施负责人
	var projectManagerMain_exploitHead = "<spring:message code='label.projectManager.exploitHead' />";   //研发负责人
	var projectManagerMain_planWorkHours = "<spring:message code='label.projectManager.planWorkHours' />";   //计划工时
	var projectManagerMain_projectStage = "<spring:message code='label.projectManager.projectStage' />";   //项目阶段
	var projectManagerMain_projectStatus = "<spring:message code='label.projectManager.projectStatus' />";   //项目状态
	var projectManagerMain_attachment = "<spring:message code='common.label.attachment' />";   //附件
	var projectManagerMain_deleteProjectMsg="<spring:message code='label.projectManager.deleteProjectMsg' />";   //确认删除该项目吗！
	var gridProject = new Datatable();//基础信息维护管理Datatable
	var hasEditAuthProject = true; //编辑权限
	var hasRemoveProjectAuth = true; //删除权限
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManagement/projectManager/projectManager.js"></script>