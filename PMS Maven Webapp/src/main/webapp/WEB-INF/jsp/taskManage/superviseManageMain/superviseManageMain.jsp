<!-- 督办管理界面  zhangm 20180727-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<style>
	#shou {
        	background-image: url(<%=request.getContextPath()%>/assets/global/img/portlet-expand-icon.png);
        }
</style>
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
             	<form class="form-horizontal" id="superviseBaseInfoMainFormIdss" method="post">
			        <div class="form-body">
			            <div class="form-group">
			            	<!-- 项目 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.overseeManager.relevanceProject' />:
				                </label>
				                <div class="col-md-2 text-left">
					                    <select class="bs-select form-filter form-control" 
									    	data-size="10" 
											id="relevanceProject"
											name="relevanceProject" 
											title="<spring:message code='label.allitem' />" >
					                    </select>
				                </div>
			            	<!-- 责任人 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.overseeManager.responsibleMain' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="responsibleMainmh" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <!-- 结论-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.overseeManager.conclusion' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<select class="bs-select form-filter form-control" 
									data-size="10" 
									id="conclusion"
									name="conclusion"
									title="<spring:message code='label.allitem' />" >
			                    </select>
			                </div>
			                <div class="col-md-2">
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" 
			                    	data-style="slide-left" id="searchProjectBaseInfoBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
                                <button type="button" data-target="#superviseInfoHide" data-toggle="collapse" 
                                	aria-expanded="false" class="btn default" data-style="slide-left" >
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>	
							</div>
						</div>
						<div class="line_p collapse" id="superviseInfoHide" aria-expanded=false>
							<div class="form-group">
								
								<!-- 优先级 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.overseeManager.priority' />:
				                </label>
				                <div class="col-md-2 text-left">
									<select class="bs-select form-filter form-control" 
										id="priority" 
										name="priority"
										data-size="10" 
										title="<spring:message code='message.pleaseselect'/>">
									</select>
				                </div>
				                <!-- 任务内容 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.overseeManager.taskDefinition' />:
				                </label>
				                <div class="col-md-2 text-left">
				                    <input type="text" name="taskDefinition" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
				                </div>
				                <!-- 日期-->
				                <label class="col-md-1 control-label">
				                	<spring:message code='common.label.finshdate' />: 
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
                 <span class="caption-subject bold uppercase"><spring:message code='label.overseeManager'/></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">  
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
							<auth:auth resourceCode="R007_01_OPERATION_EDIT">
								<a href="<%=request.getContextPath()%>/taskManage/superviseWorkInfoEdit?operate=add" data-target="#project-modalss" 
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
	                    <table class="table table-striped table-bordered table-hover" id="superviseInfoMianTableId"></table>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<div class="row">
	<div class="col-md-12">
        <div class="portlet light portlet-fit portlet-datatable bordered mt-element-ribbon"> 
        	<div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
                 <div class="ribbon-sub ribbon-clip"></div> 
                 <span class="caption-subject bold uppercase"><spring:message code='label.overseeManagerRecord'/></span> 
	        </div>  
        	<div class="portlet-title">
	             <div class="tools" >
	                 <a href="javascript:;" id="shou" onclick="replaceImage(this)" style="width: 14px;visibility: visible;"> </a> 
	             </div>
	         </div>      
	            <div class="portlet-body form" id="tab1" style="display: none;">
	                <div class="table-container">
	                    <table class="table table-striped table-bordered table-hover" id="linkerMianTableId"></table>
	                </div>
	            </div>  
            <!-- </div>    -->    
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
<div id="project-modalss" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div> 
<div id="project-modalAuths" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 70%;margin-top: 128px;margin-right: 218px;margin-left: -91px;" data-always-visible="1" data-rail-visible="0"></div>
    </div> 
</div> 
<div id="project-modalAuthss" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div> 
<div id="newCustomModalIdsq" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div>

<!-- 参数列表 --> 
<script type="text/javascript">
	
	$("#superviseBaseInfoMainFormIdss #conclusion").initDic('${vo.conclusion}',codeBasicInfo.conclusion);
	var overseeManager = "<spring:message code='label.overseeManager' />";//督办信息
	var overseeManagerResponsibleMain = "<spring:message code='label.overseeManager.responsibleMain' />";   //主要责任人
	var overseeManagerRelevanceProject = "<spring:message code='label.overseeManager.relevanceProject' />";   //项目
	var overseeManagerTaskDefinition = "<spring:message code='label.overseeManager.taskDefinition' />";   //任务内容
	var overseeManagerPriority = "<spring:message code='label.overseeManager.priority' />";   //优先级
	var overseeManagerRequiredDate = "<spring:message code='label.overseeManager.requiredDate' />";   //要求完成时间
	var overseeManagerStatus = "<spring:message code='label.sysmanage.status' />";   //状态
	var overseeManagerActualDate = "<spring:message code='label.overseeManager.actualDate' />";   //实际完成时间

	var projectBaseInfoMain_surePassMsg = "<spring:message code='lable.projectManager.surePassMsg' />";   //确定审核通过该项目吗？
	var workhoursRecordMain_passBtn = "<spring:message code='label.projectManager.passBtn' />";   //通过
	var workhoursRecordMain_backBtn = "<spring:message code='label.projectManager.backBtn' />";   //退回
	var deleteRecordMsg = "确认删除该条督办记录？";
	var gridLinker = new Datatable();//联系人Datatable
	var addActivityBtnCL="<spring:message code='lable.Activity.DB.cl' />";//处理 
	var addActivityBtnDD="<spring:message code='lable.Activity.DB.dd' />";//调度
	var addActivityBtnDEL="<spring:message code='lable.Activity.DB.del' />";//删除
	var addActivityBtnAUTH="<spring:message code='lable.Activity.DB.auth' />";//审核
	var addActivityBtnEdit="<spring:message code='btn.common.edit' />";//编辑
	
	var gridSuperviseInfo = new Datatable();//项目维护Datatable
	var hasCheckcl = isUserHasAuth("R007_01_OPERATION_CL");//处理权限 
	var hasCheckclLD = isUserHasAuth("R007_01_OPERATION_TZ");//领导调整权限
	var hasCheckRecordAuth =  isUserHasAuth("R007_01_OPERATION_AUTH");//审核权限
	var hasEditProjectBaseInfoAuth = isUserHasAuth("R007_01_OPERATION_EDIT"); //编辑权限
	var hasDeleteRecordAuth =  isUserHasAuth("R007_01_OPERATION_DEL");//删除权限
	var spProjectBaseInfoAuth = isUserHasAuth("R007_01_OPERATION_AUTH");
	//$("#relevanceProject").initDic('${vo.relevanceProject}',codeBasicInfo.projectonly);  
	$("#superviseBaseInfoMainFormIdss #relevanceProject").initRecordProjectInfo('${vo.relevanceProject}');
	$("#priority").initDic('${vo.priority}',codeBasicInfo.priorityonly); 
	$("#responsibilityDepartment").initDic('${vo.responsibilityDepartment}',codeBasicInfo.toDivision); 
	function replaceImage(e){
		if(e.id=="shou"){
			 $(e).attr('id',"fang");
			 $(e).css({"background-image":"url(<%=request.getContextPath()%>/assets/global/img/portlet-collapse-icon.png)"});
			 $("#tab1").slideDown("fast");
		}else if(e.id="fang"){
			 $(e).attr('id',"shou");
			 $(e).css({"background-image":"url(<%=request.getContextPath()%>/assets/global/img/portlet-expand-icon.png)"});
			 $("#tab1").slideUp("fast"); 
		}
	}
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/taskManage/superviseWorkInfoList/superviseManageMain.js"></script>