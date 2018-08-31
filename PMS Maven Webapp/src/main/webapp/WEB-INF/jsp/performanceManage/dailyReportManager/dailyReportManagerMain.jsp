<!-- 日报管理主界面  ZHOUMIN 20180305 -->
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
				<form class="form-horizontal" id="dailyReportMianFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			                <!-- 项目编号 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.dailyReportManager.proNum' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" 
								   class="form-control" 
								   id="proNum"
								   name="proNum"
								   placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <!-- 填报人 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.dailyReportManager.proReporter' />:
			                </label>
			                <div class="col-md-2 text-left">
								<input type="text" 
								   class="form-control" 
								   id="proReporterName" 
								   name="proReporterName" 
								   placeholder="<spring:message code='message.pleaseinput'/>"> 
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
			                <!-- 操作 -->
			                <div class="col-md-2">
			                    
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchDailyReportBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
                                <!-- 新增 -->
							    <a href="<%=request.getContextPath()%>/dailyReportManager/dailyReportEdit?operate=add" 
									data-target="#todo-task-modal" data-toggle="modal" class="btn btn-sm green-haze">
								<i class="fa fa-plus"></i></a> 
                                <!-- 更多 -->
                                <button type="button" data-target="#dailyReportHide" data-toggle="collapse" aria-expanded="false" class="btn default" data-style="slide-left" id="searchDailyReportBtn">
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>
							</div>
			            </div>
			            <div class="form-group line_p collapse" id="dailyReportHide" aria-expanded=false>
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
			                <!-- 填写日期 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.dailyReportManager.reportDate'/>:
			                </label>
			                <div class="col-md-2 text-left">
				                <div class="input-group input-large">
									<input type="text" 
										id="reportBeginDate" 
										name="reportBeginDate" 
										placeholder="<spring:message code='common.label.from'/>" 
										class="date-picker form-control dateSelect" 
										data-date-format="yyyy-mm-dd">
								    <span class="input-group-addon">to</span>
								    <input type="text" id="reportEndDate" 
								    	name="reportEndDate" 
								    	placeholder="<spring:message code='common.label.to'/>" 
								    	class="date-picker form-control dateSelect" 
								    	data-date-format="yyyy-mm-dd">
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
		                <span class="caption-subject bold uppercase">其他成本列表</span>
			 </div>  
	         <div class="portlet-title tabbable-line">
	             <ul class="nav nav-tabs">
	                 <li class="active">
	                     <a href="#tab_actions_pending" data-toggle="tab"> 日报 </a>
	                 </li>
	                 <li>
	                     <a href="#tab_actions_completed" data-toggle="tab"> 月报 </a>
	                 </li>
	             </ul>
	         </div>
	         <div class="portlet-body">
	             <div class="tab-content">
	                 <div class="tab-pane active" id="tab_actions_pending">
	                     <!-- BEGIN: Actions -->
	                     <div class="mt-actions">
	                         <div class="mt-action">
	                             <div class="mt-action-img">
	                                 <img src="../assets/pages/media/users/avatar10.jpg" /> </div>
	                             <div class="mt-action-body">
	                                 <div class="mt-action-row">
	                                     <div class="mt-action-info ">
	                                         <div class="mt-action-icon ">
	                                             <i class="icon-magnet"></i>
	                                         </div>
	                                         <div class="mt-action-details ">
	                                             <span class="mt-action-author">Natasha Kim</span>
	                                             <p class="mt-action-desc">Dummy text of the printing</p>
	                                         </div>
	                                     </div>
	                                     <div class="mt-action-datetime ">
	                                         <span class="mt-action-date">3 jun</span>
	                                         <span class="mt-action-dot bg-green"></span>
	                                         <span class="mt=action-time">9:30-13:00</span>
	                                     </div>
	                                     <div class="mt-action-buttons ">
	                                         <div class="btn-group btn-group-circle">
	                                             <button type="button" class="btn btn-outline green btn-sm">编辑</button>
	                                             <button type="button" class="btn btn-outline red btn-sm">删除</button>
	                                         </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </div>
	                         <div class="mt-action">
	                             <div class="mt-action-img">
	                                 <img src="../assets/pages/media/users/avatar3.jpg" /> </div>
	                             <div class="mt-action-body">
	                                 <div class="mt-action-row">
	                                     <div class="mt-action-info ">
	                                         <div class="mt-action-icon ">
	                                             <i class=" icon-bubbles"></i>
	                                         </div>
	                                         <div class="mt-action-details ">
	                                             <span class="mt-action-author">Gavin Bond</span>
	                                             <p class="mt-action-desc">pending for approval</p>
	                                         </div>
	                                     </div>
	                                     <div class="mt-action-datetime ">
	                                         <span class="mt-action-date">3 jun</span>
	                                         <span class="mt-action-dot bg-red"></span>
	                                         <span class="mt=action-time">9:30-13:00</span>
	                                     </div>
	                                     <div class="mt-action-buttons ">
	                                         <div class="btn-group btn-group-circle">
	                                             <button type="button" class="btn btn-outline green btn-sm">编辑</button>
	                                             <button type="button" class="btn btn-outline red btn-sm">删除</button>
	                                         </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </div>
	                         <div class="mt-action">
	                             <div class="mt-action-img">
	                                 <img src="../assets/pages/media/users/avatar2.jpg" /> </div>
	                             <div class="mt-action-body">
	                                 <div class="mt-action-row">
	                                     <div class="mt-action-info ">
	                                         <div class="mt-action-icon ">
	                                             <i class="icon-call-in"></i>
	                                         </div>
	                                         <div class="mt-action-details ">
	                                             <span class="mt-action-author">Diana Berri</span>
	                                             <p class="mt-action-desc">Lorem Ipsum is simply dummy text</p>
	                                         </div>
	                                     </div>
	                                     <div class="mt-action-datetime ">
	                                         <span class="mt-action-date">3 jun</span>
	                                         <span class="mt-action-dot bg-green"></span>
	                                         <span class="mt=action-time">9:30-13:00</span>
	                                     </div>
	                                     <div class="mt-action-buttons ">
	                                         <div class="btn-group btn-group-circle">
	                                             <button type="button" class="btn btn-outline green btn-sm">编辑</button>
	                                             <button type="button" class="btn btn-outline red btn-sm">删除</button>
	                                         </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </div>
	                         <div class="mt-action">
	                             <div class="mt-action-img">
	                                 <img src="../assets/pages/media/users/avatar7.jpg" /> </div>
	                             <div class="mt-action-body">
	                                 <div class="mt-action-row">
	                                     <div class="mt-action-info ">
	                                         <div class="mt-action-icon ">
	                                             <i class=" icon-bell"></i>
	                                         </div>
	                                         <div class="mt-action-details ">
	                                             <span class="mt-action-author">John Clark</span>
	                                             <p class="mt-action-desc">Text of the printing and typesetting industry</p>
	                                         </div>
	                                     </div>
	                                     <div class="mt-action-datetime ">
	                                         <span class="mt-action-date">3 jun</span>
	                                         <span class="mt-action-dot bg-red"></span>
	                                         <span class="mt=action-time">9:30-13:00</span>
	                                     </div>
	                                     <div class="mt-action-buttons ">
	                                         <div class="btn-group btn-group-circle">
	                                             <button type="button" class="btn btn-outline green btn-sm">编辑</button>
	                                             <button type="button" class="btn btn-outline red btn-sm">删除</button>
	                                         </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </div>
	                         <div class="mt-action">
	                             <div class="mt-action-img">
	                                 <img src="../assets/pages/media/users/avatar8.jpg" /> </div>
	                             <div class="mt-action-body">
	                                 <div class="mt-action-row">
	                                     <div class="mt-action-info ">
	                                         <div class="mt-action-icon ">
	                                             <i class="icon-magnet"></i>
	                                         </div>
	                                         <div class="mt-action-details ">
	                                             <span class="mt-action-author">Donna Clarkson </span>
	                                             <p class="mt-action-desc">Simply dummy text of the printing</p>
	                                         </div>
	                                     </div>
	                                     <div class="mt-action-datetime ">
	                                         <span class="mt-action-date">3 jun</span>
	                                         <span class="mt-action-dot bg-green"></span>
	                                         <span class="mt=action-time">9:30-13:00</span>
	                                     </div>
	                                     <div class="mt-action-buttons ">
	                                         <div class="btn-group btn-group-circle">
	                                             <button type="button" class="btn btn-outline green btn-sm">编辑</button>
	                                             <button type="button" class="btn btn-outline red btn-sm">删除</button>
	                                         </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </div>
	                         <div class="mt-action">
	                             <div class="mt-action-img">
	                                 <img src="../assets/pages/media/users/avatar9.jpg" /> </div>
	                             <div class="mt-action-body">
	                                 <div class="mt-action-row">
	                                     <div class="mt-action-info ">
	                                         <div class="mt-action-icon ">
	                                             <i class="icon-magnet"></i>
	                                         </div>
	                                         <div class="mt-action-details ">
	                                             <span class="mt-action-author">Tom Larson</span>
	                                             <p class="mt-action-desc">Lorem Ipsum is simply dummy text</p>
	                                         </div>
	                                     </div>
	                                     <div class="mt-action-datetime ">
	                                         <span class="mt-action-date">3 jun</span>
	                                         <span class="mt-action-dot bg-green"></span>
	                                         <span class="mt=action-time">9:30-13:00</span>
	                                     </div>
	                                     <div class="mt-action-buttons ">
	                                         <div class="btn-group btn-group-circle">
	                                             <button type="button" class="btn btn-outline green btn-sm">编辑</button>
	                                             <button type="button" class="btn btn-outline red btn-sm">删除</button>
	                                         </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </div>
	                     </div>
	                     <!-- END: Actions -->
	                 </div>
	                 <div class="tab-pane" id="tab_actions_completed">
	                     <!-- BEGIN:Completed-->
	                     <div class="mt-actions">
	                         <div class="mt-action">
	                             <div class="mt-action-img">
	                                 <img src="../assets/pages/media/users/avatar1.jpg" /> </div>
	                             <div class="mt-action-body">
	                                 <div class="mt-action-row">
	                                     <div class="mt-action-info ">
	                                         <div class="mt-action-icon ">
	                                             <i class="icon-action-redo"></i>
	                                         </div>
	                                         <div class="mt-action-details ">
	                                             <span class="mt-action-author">Frank Cameron</span>
	                                             <p class="mt-action-desc">Lorem Ipsum is simply dummy</p>
	                                         </div>
	                                     </div>
	                                     <div class="mt-action-datetime ">
	                                         <span class="mt-action-date">3 jun</span>
	                                         <span class="mt-action-dot bg-red"></span>
	                                         <span class="mt=action-time">9:30-13:00</span>
	                                     </div>
	                                     <div class="mt-action-buttons ">
	                                         <div class="btn-group btn-group-circle">
	                                             <button type="button" class="btn btn-outline green btn-sm">编辑</button>
	                                             <button type="button" class="btn btn-outline red btn-sm">删除</button>
	                                         </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </div>
	                         <div class="mt-action">
	                             <div class="mt-action-img">
	                                 <img src="../assets/pages/media/users/avatar8.jpg" /> </div>
	                             <div class="mt-action-body">
	                                 <div class="mt-action-row">
	                                     <div class="mt-action-info ">
	                                         <div class="mt-action-icon ">
	                                             <i class="icon-cup"></i>
	                                         </div>
	                                         <div class="mt-action-details ">
	                                             <span class="mt-action-author">Ella Davidson </span>
	                                             <p class="mt-action-desc">Text of the printing and typesetting industry</p>
	                                         </div>
	                                     </div>
	                                     <div class="mt-action-datetime ">
	                                         <span class="mt-action-date">3 jun</span>
	                                         <span class="mt-action-dot bg-green"></span>
	                                         <span class="mt=action-time">9:30-13:00</span>
	                                     </div>
	                                     <div class="mt-action-buttons">
	                                         <div class="btn-group btn-group-circle">
	                                             <button type="button" class="btn btn-outline green btn-sm">编辑</button>
	                                             <button type="button" class="btn btn-outline red btn-sm">删除</button>
	                                         </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </div>
	                         <div class="mt-action">
	                             <div class="mt-action-img">
	                                 <img src="../assets/pages/media/users/avatar5.jpg" /> </div>
	                             <div class="mt-action-body">
	                                 <div class="mt-action-row">
	                                     <div class="mt-action-info ">
	                                         <div class="mt-action-icon ">
	                                             <i class=" icon-graduation"></i>
	                                         </div>
	                                         <div class="mt-action-details ">
	                                             <span class="mt-action-author">Jason Dickens </span>
	                                             <p class="mt-action-desc">Dummy text of the printing and typesetting industry</p>
	                                         </div>
	                                     </div>
	                                     <div class="mt-action-datetime ">
	                                         <span class="mt-action-date">3 jun</span>
	                                         <span class="mt-action-dot bg-red"></span>
	                                         <span class="mt=action-time">9:30-13:00</span>
	                                     </div>
	                                     <div class="mt-action-buttons ">
	                                         <div class="btn-group btn-group-circle">
	                                             <button type="button" class="btn btn-outline green btn-sm">编辑</button>
	                                             <button type="button" class="btn btn-outline red btn-sm">删除</button>
	                                         </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </div>
	                         <div class="mt-action">
	                             <div class="mt-action-img">
	                                 <img src="../assets/pages/media/users/avatar2.jpg" /> </div>
	                             <div class="mt-action-body">
	                                 <div class="mt-action-row">
	                                     <div class="mt-action-info ">
	                                         <div class="mt-action-icon ">
	                                             <i class="icon-badge"></i>
	                                         </div>
	                                         <div class="mt-action-details ">
	                                             <span class="mt-action-author">Jan Kim</span>
	                                             <p class="mt-action-desc">Lorem Ipsum is simply dummy</p>
	                                         </div>
	                                     </div>
	                                     <div class="mt-action-datetime ">
	                                         <span class="mt-action-date">3 jun</span>
	                                         <span class="mt-action-dot bg-green"></span>
	                                         <span class="mt=action-time">9:30-13:00</span>
	                                     </div>
	                                     <div class="mt-action-buttons ">
	                                         <div class="btn-group btn-group-circle">
	                                             <button type="button" class="btn btn-outline green btn-sm">编辑</button>
	                                             <button type="button" class="btn btn-outline red btn-sm">删除</button>
	                                         </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </div>
	                         <!-- END: Completed -->
	                     </div>
	                 </div>
	             </div>
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
	var dailyReportManager_proNum="<spring:message code='label.dailyReportManager.proNum' />";//项目编号
	var dailyReportManager_belongCustomer="<spring:message code='label.dailyReportManager.belongCustomer' />";//所属客户
	var dailyReportManager_belongProduct="<spring:message code='label.dailyReportManager.belongProduct' />";//所属产品
	var dailyReportManager_proReporter="<spring:message code='label.dailyReportManager.proReporter' />";//填报人
	var dailyReportManager_reportDate="<spring:message code='label.dailyReportManager.reportDate' />";//填报日期
	var dailyReportManager_reportType="<spring:message code='label.dailyReportManager.reportType' />";//日报类型
	var dailyReportManager_taskToday="<spring:message code='label.dailyReportManager.taskToday' />";//当天任务
	var dailyReportManager_questionToday="<spring:message code='label.dailyReportManager.questionToday' />";//当天问题
	var dailyReportManager_conclusionToday="<spring:message code='label.dailyReportManager.conclusionToday' />";//当日小结
	var dailyReportManager_planTomorrow="<spring:message code='label.dailyReportManager.planTomorrow' />";//明日计划
	var dailyReportManager_deleteDailyReportMsg="<spring:message code='label.dailyReportManager.deleteDailyReportMsg' />";//确认删除该日报信息吗？
	var gridDailyReport = new Datatable();//角色管理Datatable
	var hasEditAuthDailyReport = isUserHasAuth("R006_0201");//编辑权限
	var hasRemoveAuthDailyReport = isUserHasAuth("R006_0202"); //删除权限
	//初始化下拉框
	$("#dailyReportMianFormId #belongCustomer").initCustomerInfo(null);
	$("#dailyReportMianFormId #belongProduct").initDic(null,codeBasicInfo.PRODUCT);
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/performanceManager/dailyReportManager/dailyReportManager.js"></script>