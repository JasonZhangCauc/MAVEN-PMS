<!-- 客户管理 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %> 
<style>
	.textAligh{
		
	}
</style>
<div class="row">
     <div class="col-md-12">
        <div class="portlet light portlet-fit bordered query">
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
		         <div class="portlet-body form">
			         <form class="form-horizontal" id="ProInfoMianFormIdParent" method="post">
				         <div class="form-body">
					         <div class="form-group">
								<!--项目名称-->
				                <label class="col-md-1 control-label">
				                	<spring:message code='lable.saleTrack.projectName'/>:
				                </label>
				                <div class="col-md-2 text-left">
				                    <input type="text" name="projectName" class="form-control form-filter spinner" 
				                    placeholder="<spring:message code='message.pleaseinput'/>">
				                </div>
				                <!--销售状态-->	
				                <label class="col-md-1 control-label">
				                	<spring:message code='lable.saleTrack.proStatus'/>:
				                </label>
								<div class="col-md-2 text-left">
									<select class="bs-select form-filter form-control" 
										data-size="10" 
										title="<spring:message code='label.allitem' />" 
										name="saleStatus"
										id="saleStatus">
				                    </select>
				                </div>
								<!--销售负责人-->
				                <label class="col-md-1 control-label">
				                	<spring:message code='lable.saleTrack.proResponser'/>:
				                </label>
				                <div class="col-md-2 text-left">
				                    <select class="bs-select form-filter form-control" 	
											data-size="10"
											name="saleResponsible"
											title="<spring:message code='label.allitem' />" 
											id="saleResponsible">
											
			                      </select>
				                </div>   
				                <div class="col-md-1 text-left">
								    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchProInfoBtn">
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
</div>
<div class="row">
         <div class="col-md-8">
              <div class="portlet light portlet-fit portlet-datatable bordered">
		           <div class="mt-element-ribbon bg-grey-steel">
		               <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
		                    <div class="ribbon-sub ribbon-clip"></div> 
		                    <span class="caption-subject bold uppercase">销售跟踪信息</span> 
			           </div>
			       </div>
		           <div class="portlet-title">
		                <div class="actions">
		                    <div class="btn-group btn-group-devided" data-toggle="buttons">
								<auth:auth resourceCode="R002_02_OPERATION_EDIT">	
									<a href="<%=request.getContextPath()%>/preSalesManage/saleTrackEdit?operate=add" id="newProInfoModalIds" data-target="#newProInfoModalId" 
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
	                    <table class="table table-striped table-bordered table-hover" id="ProInfoMianTableId"></table>
	                </div>
	           </div>
	          </div>
         </div>
         <div class="col-md-4">
	        <div class="portlet light portlet-fit bordered">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-microphone font-green"></i> 
						<span class="caption-subject bold font-green uppercase"><spring:message code='活动记录'/></span>
					</div>
					<div class="actions">
						
					</div>
				</div>
				<div class="portlet-body">
					<div class="timeline" id="html_jj">
						<!-- <div class="textAligh">
							<div class="alert alert-info">温馨提示! 无活动记录. </div>  
						</div> -->
					</div>
					<div id="html_jjs"> 
						<div class="textAligh">
							<div class="alert alert-info">温馨提示! 无活动记录. </div>  
						</div>
					</div>
				</div>
			</div>  
	     </div>
</div>
<!-- BEGIN 弹框 --> 
<div id="newProInfoModalId" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
	</div>
</div>

<div id="addActivityModalId" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
	</div>
</div>

<script type="text/javascript">
	$("#saleStatus").initDic(null,codeBasicInfo.saleStatus);
	
	var t1="<spring:message code='lable.saleTrack.projectNo' />";//项目编号
	var t2="<spring:message code='lable.saleTrack.projectName' />";//项目名称
	var belongProduct="<spring:message code='lable.saleTrack.product' />";//所属产品
	var t3="<spring:message code='lable.saleTrack.proCustom' />";//意向客户
	var t4="<spring:message code='lable.saleTrack.proResponser' />";//销售负责人
	var t5="<spring:message code='lable.saleTrack.proBudget' />";//项目预算
	var t6="<spring:message code='lable.saleTrack.proStatus' />";//项目状态
	var t7="<spring:message code='lable.saleTrack.proDecisionMaker' />";//项目决策者
	var t8="<spring:message code='lable.saleTrack.linker' />";//项目联系人
	var t9="<spring:message code='lable.saleTrack.proStakeholder' />";//项目干系人
	var t10="<spring:message code='lable.saleTrack.remark' />";//备注
	var attachment="<spring:message code='common.label.attachment' />";//附件	
	
	var t12="<spring:message code='lable.saleActivity.activityType' />";//活动类型
	var t13="<spring:message code='lable.saleActivity.activityName' />";//活动名称
	var t14="<spring:message code='lable.saleActivity.startDate' />";//开始时间
	var t15="<spring:message code='lable.saleActivity.endDate' />";//结束时间
	var t16="<spring:message code='lable.saleActivity.saler' />";//销售人员
	var t17="<spring:message code='lable.saleActivity.customRepresent' />";//客户代表
	var t18="<spring:message code='lable.saleActivity.activityDesc' />";//活动描述
	var t19="<spring:message code='lable.saleActivity.resultExplain' />";//成果描述
	var t20="<spring:message code='lable.saleTrack.remark'/>";//备注

    var deleteProInfoBtn="<spring:message code='lable.saleTrack.delete' />";//删除项目
    var addActivityBtn="<spring:message code='lable.Activity.add' />";//新增销售活动
    var deleteActivityBtn="<spring:message code='lable.Activity.delete' />";//删除销售活动
	var deleteProInfoConfirmMsg="<spring:message code='message.ProInfomanage.sureDeleteProInfo' />";//确定删除该项目吗
	var deleteActivityConfirmMsg="<spring:message code='message.ProInfomanage.sureDeleteActivity' />";//确定删除该销售活动吗
	var gridProInfo = new Datatable();//销售跟踪Datatable
	var gridActivity = new Datatable();//销售活动Datatable
	var hasEditProInfoAuth = isUserHasAuth("R002_02_OPERATION_EDIT");//编辑项目权限
	var hasDeleteProInfoAuth = isUserHasAuth("R002_02_OPERATION_DELP");//删除项目权限
	var hasEditActivityAuth = isUserHasAuth("R002_02_OPERATION_EDITH");//编辑销售活动
	var hasDeleteActivityAuth = isUserHasAuth("R002_02_OPERATION_DELH");//删除销售活动
	$("#ProInfoMianFormIdParent #saleStatus").initDic(null,codeBasicInfo.saleStatus);
	$("#ProInfoMianFormIdParent #customerId").initCustomerInfo(null);
	$("#ProInfoMianFormIdParent #saleResponsible").initUserInfoSale(null);
	
</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/preSalesManage/saletrack/saleTrackMain.js"></script>