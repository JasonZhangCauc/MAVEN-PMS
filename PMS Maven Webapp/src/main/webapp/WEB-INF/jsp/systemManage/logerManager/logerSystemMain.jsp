<!-- 系统日志主界面 ZHOUMIN 20180305-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- Begin: Query conditions -->
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered">
			 <div class="portlet-title">
	             <div class="caption">
	                 <i class="fa fa-filter font-red"></i>
	                 <span class="caption-subject font-red sbold uppercase"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">查询条件</font></font></span>
	             </div>
	             <div class="tools">
	                 <a href="javascript:;" class="collapse"> </a>
	                 <a href="javascript:;" class="reload"> </a>
	             </div>
	         </div>
	         <div class="portlet-body form">
		         <form class="form-horizontal" id="userMianFormId" method="post">
			         <div class="form-body">
				         <div class="form-group">
			            	<!-- 操作者 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.operatelog.operator'/>:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="operateName" class="form-control form-filter spinner" 
			                    	placeholder="<spring:message code='message.pleaseinput'/>">  
			                </div>
			                <!-- 操作时间 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.operatelog.operatetime'/>:&nbsp;&nbsp;&nbsp;
			                </label>
							<div class="col-md-2 input-group input-large">
								<input type="text" 
											id="operateBeginDate" 
											name="operateBeginDate" 
											placeholder="<spring:message code='common.label.from'/>" 
											class="date-picker form-control dateSelect" 
											data-date-format="yyyy-mm-dd">
									    <span class="input-group-addon">to</span>
									    <input type="text" id="operateEndDate" 
									    	name="operateEndDate" 
									    	placeholder="<spring:message code='common.label.to'/>" 
									    	class="date-picker form-control dateSelect" 
									    	data-date-format="yyyy-mm-dd">	
							</div>
			                <div class="col-md-1 text-left">
							    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchLogerSystemBtn">
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
	                <span class="caption-subject bold uppercase"><spring:message code='label.systemlog'/></span> 
		       </div>
		    </div>
            <div class="portlet-title">
                <div class="actions">
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
                    <table class="table table-striped table-bordered table-hover" id="logerSystemMianTableId"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 引用参数列表 -->
<script type="text/javascript">
	var s1 = "<spring:message code='label.systemlog.operateBy' />";//操作人
	var s2 = "<spring:message code='label.systemlog.operateTime' />";//操作时间
	var s3 = "<spring:message code='label.systemlog.functionModule' />";//功能模块
	var s4 = "<spring:message code='label.systemlog.operateClass' />";//类名
	var s5 = "<spring:message code='label.systemlog.operateMethod' />";//方法名
	var s6 = "<spring:message code='label.systemlog.errorInfo' />";//错误信息
	var gridLogSystem = new Datatable();//系统日志Datatable
</script>
<!-- 引用js文件 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/logerManager/logerSystem.js"></script>