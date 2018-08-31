<!-- 工作单主界面  zlshi 20180814-->
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
             	<form class="form-horizontal" id="workOrderMainFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			            	<!-- 工作单批次号 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.workOrderManager.workNumber' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="workOrderNum" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <!-- 提出时间 -->
				            <label class="col-md-1 control-label">
				                <spring:message code='label.workOrderManager.putForwardDate' />:
				            </label>
				            <div class="col-md-2 text-left">
								<input type="text" id="putForwardDate" name="putForwardDate"
									class="date-picker form-control dateSelect"
									data-date-format="yyyy-mm-dd">
							</div>
			             	<!-- 项目类别(名称)-->
			                <label class="col-md-1 control-label">
			                <spring:message code='label.workOrderManager.projectType' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<select class="bs-select form-filter form-control" 
									multiple 
									data-size="10" 
									id="projectType"
									name="projectType"
									title="<spring:message code='label.allitem' />" >
			                    </select>
			                </div>
			                <div class="col-md-1">
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" 
			                    	data-style="slide-left" id="searchWorkOrderBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" ></div>
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
                 <span class="caption-subject bold uppercase"><spring:message code='label.workOrderManager'/></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">  
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
								<a href="<%=request.getContextPath()%>/workbenchManage/workOrderManagerEdit" data-target="#workOrder-modal" 
								data-toggle="modal" class="btn btn-circle green-haze">
								<i class="fa fa-plus"></i></a>
							
	                    </div>
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
								<a url="<%=request.getContextPath()%>workbenchManage/workOrderManagerDetail" class="btn btn-circle blue">
								<i class="fa fa-tasks"></i></a>
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
	                    <table class="table table-striped table-bordered table-hover" id="workOrderMianTableId"></table>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<!-- 弹出框 --> 
<div id="workOrder-modal" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div> 
<!-- 参数列表 --> 
<script type="text/javascript">
	var workOrderManagerMain_projectType = "<spring:message code='label.workOrderManager.projectType' />";   		//项目类别
	var workOrderManagerMain_putForwardBy = "<spring:message code='label.workOrderManager.putForwardBy' />"; 		//提出人
	var workOrderManagerMain_createBy = "<spring:message code='label.workOrderManager.createBy' />";		 		//创建人
	var workOrderManagerMain_putForwardDate = "<spring:message code='label.workOrderManager.putForwardDate' />";    //提出时间
	var workOrderManagerMain_workContent = "<spring:message code='label.workOrderManager.workContent' />";   		//工作内容
	var workOrderManagerMain_workNumber = "<spring:message code='label.workOrderManager.workNumber' />";    		//工作单批次号
	var workOrderManagerMain_workType = "<spring:message code='label.workOrderManager.workType' />";   				//工作类别
	var workOrderManagerMain_priority = "<spring:message code='label.workOrderManager.priority' />";   				//优先级
	var workOrderManagerMain_workStatus = "<spring:message code='label.workOrderManager.workStatus' />";   			//工作状态
	var workOrderManagerMain_belongUnit = "<spring:message code='label.workOrderManager.belongUnit' />"; 			 //所属单位
	var workOrderManagerMain_removeWorkOrderMsg = "<spring:message code='label.workOrderManager.removeWorkOrderMsg' />";   //确定删除该工作单吗？
	
	$("#workOrderMainFormId #projectType").initRecordProjectInfo(
				'${vo.projectType}');//项目名称
	
	var gridWorkOrder = new Datatable();//工作单Datatable
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/workbenchManage/workOrderManager/workOrderManagerMain.js"></script>