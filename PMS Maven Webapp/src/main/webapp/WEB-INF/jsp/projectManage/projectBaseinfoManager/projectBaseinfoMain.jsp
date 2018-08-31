<!-- 项目维护主界面  ZHOUMIN 20180305-->
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
             	<form class="form-horizontal" id="projectBaseInfoMainFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			            	<!-- 项目名称 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.projectBaseinfo.projectName' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" value="测" name="projectName" class="form-control form-filter spinner"
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
			                <!-- 项目负责人 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.projectBaseinfo.projectHead' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<input type="text" name="projectHeadName" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <div class="col-md-2">
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" 
			                    	data-style="slide-left" id="searchProjectBaseInfoBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
                                <button type="button" data-target="#projectBaseInfoHide" data-toggle="collapse" 
                                	aria-expanded="false" class="btn default" data-style="slide-left" >
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>	
							</div>
						</div>
						<div class="line_p collapse" id="projectBaseInfoHide" aria-expanded=false>
							<div class="form-group">
								<!-- 商务人员 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='lable.projectBaseinfo.businessPeople' />:
				                </label>
				                <div class="col-md-2 text-left">
				                	<input type="text" name="businessPeopleName" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
				                </div>
				                <!-- 项目经理 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='lable.projectBaseinfo.projectManager' />:
				                </label>
				                <div class="col-md-2 text-left">
				                    <input type="text" name="projectManagerName" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
				                </div>
				                <!-- 产品经理 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='lable.projectBaseinfo.productManager' />:
				                </label>
				                <div class="col-md-2 text-left">
				                    <input type="text" name="productManagerName" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
				                </div>
							</div>
							<div class="form-group">
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
				                <label class="col-md-1 control-label">
				                	<spring:message code='lable.projectBaseinfo.auditStatus' />:
				                </label>
				                <div class="col-md-2 text-left">
									<select class="bs-select form-filter form-control" 
										multiple 
										data-size="10" 
										id="auditStatus"
										name="auditStatus"
										title="<spring:message code='label.allitem'/>" >
				                    </select>
				                </div>
								<!-- 工期 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='lable.projectBaseinfo.workTime' />:
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
                 <span class="caption-subject bold uppercase"><spring:message code='lable.projectBaseinfo.projectBaseinfo'/></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">  
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
							<auth:auth resourceCode="R004_07_OPERATION_EDIT">
								<a href="<%=request.getContextPath()%>/projectManage/projectBaseInfoEdit?operate=add" data-target="#project-modal" 
								data-toggle="modal" class="btn btn-circle green-haze">
								<i class="fa fa-plus"></i></a>
							</auth:auth>
							<a href="<%=request.getContextPath()%>/projectManage/importExcel" 
								class="btn btn-circle btn-primary" id="tleImport" data-target="#newExcelModalId" data-toggle="modal">
							<i class="fa fa-sign-in"></i></a>
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
	                    <table class="table table-striped table-bordered table-hover" id="projectBaseInfoMianTableId"></table>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<!-- 弹出框 --> 
<div id="newExcelModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:30%;top: 50px;" >
		<div class="modal-content" >
		</div>
	</div>
</div>
<!-- 弹出框 --> 
<div id="project-modal" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div> 
<!-- 参数列表 --> 
<script type="text/javascript">
	var projectBaseInfoMain_projectName = "<spring:message code='lable.projectBaseinfo.projectName' />";   //项目名称
	var projectBaseInfoMain_toDivision = "<spring:message code='lable.projectBaseinfo.toDivision' />";   //所属事业部
	var projectBaseInfoMain_workTime = "<spring:message code='lable.projectBaseinfo.workTime' />";   //工期
	var projectBaseInfoMain_projectResource = "<spring:message code='lable.projectBaseinfo.projectResource' />";   //项目资源
	var projectBaseInfoMain_projectHead = "<spring:message code='lable.projectBaseinfo.projectHead' />";   //项目负责人
	var projectBaseInfoMain_businessPeople = "<spring:message code='lable.projectBaseinfo.businessPeople' />";   //商务人员
	var projectBaseInfoMain_projectManager = "<spring:message code='lable.projectBaseinfo.projectManager' />";   //项目经理
	var projectBaseInfoMain_productManager = "<spring:message code='lable.projectBaseinfo.productManager' />";   //产品经理
	var projectBaseInfoMain_estimatedWorkload = "<spring:message code='lable.projectBaseinfo.estimatedWorkload' />";   //预估工作量
	var projectBaseInfoMain_expiredHours = "<spring:message code='lable.projectBaseinfo.expiredHours' />";   //已耗工时
	var projectBaseInfoMain_profitTargets = "<spring:message code='lable.projectBaseinfo.profitTargets' />";   //利润指标
	var projectBaseInfoMain_projectPhase = "<spring:message code='lable.projectBaseinfo.projectPhase' />";   //项目阶段
	var projectBaseInfoMain_projectStatus = "<spring:message code='lable.projectBaseinfo.projectStatus' />";   //项目状态
	var projectBaseInfoMain_auditStatus = "<spring:message code='lable.projectBaseinfo.auditStatus' />";   //审核状态
	var projectBaseInfoMain_naturallyCost = "<spring:message code='lable.projectBaseinfo.naturallyCost' />";   //人天成本
	var projectBaseInfoMain_expirationDate = "<spring:message code='lable.projectBaseinfo.expirationDate' />";   //超期时间
	var projectBaseInfoMain_deleteProjectMsg = "<spring:message code='label.projectManager.deleteProjectMsg' />";   //确认删除该项目吗？
	var projectBaseInfoMain_passBtn = "<spring:message code='label.projectManager.passBtn' />";   //通过
	var projectBaseInfoMain_surePassMsg = "<spring:message code='lable.projectManager.surePassMsg' />";   //确定审核通过该项目吗？
	var gridProjectBaseInfo = new Datatable();//项目维护Datatable
	var hasEditProjectBaseInfoAuth = isUserHasAuth("R004_07_OPERATION_EDIT"); //编辑权限
	var hasRemoveProjectBaseInfoAuth = isUserHasAuth("R004_07_OPERATION_DELETE"); //删除权限
	var hasAuditProjectBaseInfoAuth = isUserHasAuth("R004_07_OPERATION_AUDIT"); //审核权限
	$("#projectBaseInfoMainFormId #projectPhase").initDic(null,codeBasicInfo.projectPhase);//项目阶段
	$("#projectBaseInfoMainFormId #projectStatus").initDic(null,codeBasicInfo.projectState);//项目状态	
	$("#projectBaseInfoMainFormId #auditStatus").initDic(null,codeBasicInfo.auditStatus);//审核状态
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManage/projectBaseinfoManager/projectBaseinfoMain.js"></script>