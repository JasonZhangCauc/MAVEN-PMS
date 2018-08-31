<!-- 工作单详细界面  zlshi 20180814-->
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
             	<form class="form-horizontal" id="workOrderDetailFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			            	<!-- 提出人 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.workOrderManager.putForwardBy' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="workOrderNum" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <!-- 状态 -->
				            <label class="col-md-1 control-label">
				                <spring:message code='label.workOrderManager.workStatus' />:
				            </label>
				            <div class="col-md-2 text-left">
				                <select class="bs-select form-filter form-control" 
									data-size="10" 
									id="questionStatus"
									name="questionStatus" >
			                    </select>
				            </div>
			             	<!-- 问题类型(新需求/需求变更/优化/数据核对/数据变更/系统缺陷/操作咨询)-->
			                <label class="col-md-2 control-label">
			                <spring:message code='label.workOrderManager.questionType' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<select class="bs-select form-filter form-control" 
									data-size="10" 
									id="questionType"
									name="questionType" >
			                    </select>
			                </div>
			                <div class="col-md-1">
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" 
			                    	data-style="slide-left" id="searchWorkOrderDetailBtn">
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
	                    	<!-- 新增问题 -->
							<%-- <auth:auth resourceCode="R009_0101"> --%>
								<a href="<%=request.getContextPath()%>/workbenchManage/workOrderManagerEditQuestion" data-target="#workOrder-modal" 
								data-toggle="modal" class="btn btn-circle green-haze">
								<i class="fa fa-plus"></i></a>
							<%-- </auth:auth> --%>
	                    </div>
	                    <!-- 批量导入 -->
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
	                    	<a href="<%=request.getContextPath()%>/workbenchManage/workOrderManagerAddQuestion?operate=add" data-target="#workOrder-modal" 
								data-toggle="modal" class="btn btn-circle blue">
								<i class="fa fa-cloud-upload"></i></a>
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
	                    <table class="table table-striped table-bordered table-hover" id="workOrderDetailTableId"></table>
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
	var workOrderManagerMain_questionStatus = "<spring:message code='label.workOrderManager.workStatus' />";       //问题状态
	var workOrderManagerMain_questionNumber = "<spring:message code='label.workOrderManager.questionNumber' />";   //问题编号
	var workOrderManagerMain_putForwardBy = "<spring:message code='label.workOrderManager.putForwardBy' />";       //提出人
	var workOrderManagerMain_putForwardDate = "<spring:message code='label.workOrderManager.putForwardDate' />";   //提出时间
	var workOrderManagerMain_questionContent = "<spring:message code='label.workOrderManager.questionContent' />"; //问题描述
	var workOrderManagerMain_questionType = "<spring:message code='label.workOrderManager.questionType' />";  	   //问题类型
	var workOrderManagerMain_questionPriority = "<spring:message code='label.workOrderManager.questionPriority' />";   //优先级
	
	
	$("#workOrderDetailFormId #questionStatus").initRecordProjectInfo(null);//问题状态
	var gridWorkOrderDetail = new Datatable();//工作单详情Datatable
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/workbenchManage/workOrderManager/workOrderManagerDetail.js"></script>