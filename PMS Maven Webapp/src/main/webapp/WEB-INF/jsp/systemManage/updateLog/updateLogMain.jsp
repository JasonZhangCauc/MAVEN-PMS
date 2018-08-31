<!-- 更新日志主界面  ZHOUMIN 20180305-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- Begin: Query conditions -->
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			 <div class="portlet-title">
	             <div class="caption">
	                 <i class="fa fa-filter font-red"></i>
	                 <span class="caption-subject font-red sbold uppercase">
	                 	<font style="vertical-align: inherit;">
	                 		<font style="vertical-align: inherit;"><spring:message code='label.queryTerm' /></font>
	                 	</font>
	                 </span>
	             </div>
	             <div class="tools">
	                 <a href="javascript:;" class="collapse"> </a>
	                 <a href="javascript:;" class="reload"> </a>
	             </div>
	         </div>
	         <div class="portlet-body form">
		         <form class="form-horizontal" id="updateLogMianFormId" method="post">
			         <div class="form-body">
				         <div class="form-group">
			            	<!-- 日期 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='common.label.date' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" 
									id="updateDate"
									name="updateDate" 	
									class="date-picker form-control dateSelect" 
									data-date-format="yyyy-mm-dd">
			                </div>
			                <!-- 内容 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.msgProcess.mText' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<input type="text" name="updateContent" class="form-control form-filter spinner" 
			                    	placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <label class="col-md-1 control-label"> 
								<spring:message code='lable.updateLog.versionNum' />
							</label>
							<div class="col-md-2 text-left">
			                	<input type="text" name="versionNum" class="form-control form-filter spinner" 
			                    	placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <div class="col-md-1 text-left">
							    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchUpdateLogBtn">
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
<!-- End: Query conditions -->
<!-- Begin: The query results -->
<div class="row">
    <div class="col-md-12">
        <div class="portlet light portlet-fit portlet-datatable bordered">
        	<div class="mt-element-ribbon bg-grey-steel">
	           <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
	                <div class="ribbon-sub ribbon-clip"></div> 
	                <span class="caption-subject bold uppercase"><spring:message code='lable.updateLog'/></span> 
		       </div>
		    </div>
            <div class="portlet-title">
               <div class="actions">
                    <div class="btn-group btn-group-devided" data-toggle="buttons">
                    	<auth:auth  resourceCode="R014_08_OPERATION_DELETE">
							<a href="<%=request.getContextPath()%>/systemManage/updateLogEdit?operate=add" data-target="#updateLog-modal" 
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
                    <table class="table table-striped table-bordered table-hover" id="updateLogMianTableId"></table>
                </div>
            </div>
        </div> 
    </div>
</div>
<!-- End: The query results -->
<!-- 基础信息新增/编辑弹出框 -->
<div id="updateLog-modal" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var updateLogMain_updateDate = "<spring:message code='common.label.date' />";   //日期
	var updateLogMain_versionNum = "<spring:message code='lable.updateLog.versionNum' />";   //版本号
	var updateLogMain_updateContent = "<spring:message code='label.msgProcess.mText' />";   //内容
	var updateLogMain_removeMsg = "<spring:message code='lable.updateLog.removeMsg' />";   //确定删除该更新日志吗？
	var gridUpdateLog = new Datatable();//基础信息维护管理Datatable 
	var hasEditAuthUpdateLog = isUserHasAuth("R014_08_OPERATION_EDIT");//编辑权限
	var hasRemoveAuthUpdateLog = isUserHasAuth("R014_08_OPERATION_DELETE");//删除权限
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/updateLog/updateLogMain.js"></script>