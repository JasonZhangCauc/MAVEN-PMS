<!-- 跟踪表主界面  ZHOUMIN 20180305-->
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
             	<form class="form-horizontal" id="trackingMainFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			            	<!-- 客户简称 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.customManage.shortName' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" value="" name="customerName" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <!-- 项目名称-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.saleTrack.projectName' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<select class="bs-select form-filter form-control" 
									multiple 
									data-size="10" 
									id="projectId"
									name="projectId"
									title="<spring:message code='label.allitem' />" >
			                    </select>
			                </div>
			                <!-- 状态 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.trackingManager.requirementStatus' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<select class="bs-select form-filter form-control" 
									multiple 
									data-size="10" 
									id="requirementStatus"
									name="requirementStatus"
									title="<spring:message code='label.allitem' />" >
			                    </select>
			                </div>
			                <div class="col-md-2">
			                	<!-- 查询 -->
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" 
			                    	data-style="slide-left" id="searchTrackingBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
                                <!-- 更多 -->
                                <button type="button" data-target="#trackingHide" data-toggle="collapse" 
                                	aria-expanded="false" class="btn default" data-style="slide-left" >
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>	
							</div>
						</div>
						<div class="line_p collapse" id="trackingHide" aria-expanded=false>
							<div class="form-group">
								<!-- 原因分类 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.trackingManager.requirementType' />:
				                </label>
				                <div class="col-md-2 text-left">
				                	<select class="bs-select form-filter form-control" 
										multiple 
										data-size="10" 
										id="requirementType"
										name="requirementType"
										title="<spring:message code='label.allitem' />" >
				                    </select>
				                </div>
				                <!-- 优先级 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.trackingManager.priority' />:
				                </label>
				                <div class="col-md-2 text-left">
				                    <select class="bs-select form-filter form-control" 
										multiple 
										data-size="10" 
										id="priority"
										name="priority"
										title="<spring:message code='label.allitem' />" >
				                    </select>
				                </div>
				                <!-- 是否验收范围 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.trackingManager.whetherScope' />:
				                </label>
				                <div class="col-md-2 text-left">
				                    <select class="bs-select form-filter form-control" 
										multiple 
										data-size="10" 
										id="whetherScope"
										name="whetherScope"
										title="<spring:message code='label.allitem' />" >
				                    </select>
				                </div>
							</div>
							<div class="form-group">
								<!-- 是否二期 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.trackingManager.whetherPhaseIi' />:
				                </label>
				                <div class="col-md-2 text-left">
									<select class="bs-select form-filter form-control" 
										multiple 
										data-size="10" 
										id="whetherPhaseIi"
										name="whetherPhaseIi"
										title="<spring:message code='label.allitem'/>" >
				                    </select>
				                </div>
				                <!-- 批次号 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.trackingManager.batchNo' />:
				                </label>
				                <div class="col-md-2 text-left">
									<input type="text" value="" name="batchNo" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
				                </div>
								<!-- 提出日期 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.trackingManager.putDate' />:
				                </label>
				                <div class="col-md-2 text-left">
				                	<div class="input-group input-large">
										<input type="text" 
											id="putBeginDate" 
											name="putBeginDate" 
											placeholder="<spring:message code='common.label.from'/>" 
											class="date-picker form-control dateSelect" 
											data-date-format="yyyy-mm-dd">
									    <span class="input-group-addon">to</span>
									    <input type="text" 
									    	id="putEndDate" 
									    	name="putEndDate" 
									    	placeholder="<spring:message code='common.label.to'/>" 
									    	class="date-picker form-control dateSelect" 
									    	data-date-format="yyyy-mm-dd">
									</div>
				                </div>
							</div>
							<div class="form-group">
								<!-- 描述 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.trackingManager.describe' />:
				                </label>
				                <div class="col-md-6 text-left">
									<input type="text" value="" name="describe" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
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
                 <span class="caption-subject bold uppercase"><spring:message code='label.trackingManager'/></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">  
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
							<auth:auth resourceCode="R004_04_OPERATION_EDIT">
								<a addtabs='R004_0401' url="projectManage/trackingManagerEdit?operate=add" title="<spring:message code='btn.common.add' />"
									class="btn btn-circle green-haze" style="cursor:pointer;" >
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
	                    <table class="table table-striped table-bordered table-hover" id="trackingMianTableId"></table>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var trackingMain_requirementStatus = "<spring:message code='label.trackingManager.requirementStatus' />";   //状态
	var trackingMain_demandNum = "<spring:message code='label.trackingManager.demandNum' />";   			//编号
	var trackingMain_batchNo = "<spring:message code='label.trackingManager.batchNo' />";   				//批次号
	var trackingMain_shortName = "<spring:message code='lable.customManage.shortName' />";   				//客户简称
	var trackingMain_projectName = "<spring:message code='lable.saleTrack.projectName' />";   				//项目名称
	var trackingMain_putDate = "<spring:message code='label.trackingManager.putDate' />";   				//提出日期
	var trackingMain_requirementType = "<spring:message code='label.trackingManager.requirementType' />";   //类型
	var trackingMain_describe = "<spring:message code='label.trackingManager.describe' />";   				//描述
	var trackingMain_priority = "<spring:message code='label.trackingManager.priority' />";   				//优先级
	var trackingMain_whetherPhaseIi = "<spring:message code='label.trackingManager.whetherPhaseIi' />";     //是否二期
	var trackingMain_whetherScope = "<spring:message code='label.trackingManager.whetherScope' />";   		//是否验收范围
	var trackingMain_deleteTrackingMsg="<spring:message code='label.trackingManager.deleteTrackingMsg' />"; //确定删除该跟踪记录吗？
	var trackingMain_dealTrackingMsg="<spring:message code='label.trackingManager.dealTrackingMsg' />";   //确定处理该跟踪记录吗？
	
	var gridTracking = new Datatable();//项目维护Datatable
	var hasEditTrackingAuth = isUserHasAuth("R004_04_OPERATION_EDIT"); //编辑权限
	var hasRemoveTrackingAuth = isUserHasAuth("R004_04_OPERATION_DEL"); //删除权限
	var hasDealTrackingAuth = isUserHasAuth("R004_04_OPERATION_DEAL"); //处理权限
	$("#trackingMainFormId #projectId").initRecordProjectInfo(null);//项目名称
	$("#trackingMainFormId #requirementStatus").initDic(null,codeBasicInfo.requirementStatus);//状态
	$("#trackingMainFormId #requirementType").initDic(null,codeBasicInfo.whyType);//分类
	$("#trackingMainFormId #priority").initDic(null,codeBasicInfo.priority);//优先级
	$("#trackingMainFormId #whetherScope").initDic(null,codeBasicInfo.isNot);//是否二期
	$("#trackingMainFormId #whetherPhaseIi").initDic(null,codeBasicInfo.isNot);//是否范围
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManage/trackingManager/trackingManagerMain.js"></script>