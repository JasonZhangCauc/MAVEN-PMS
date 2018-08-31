<!-- 用户新增/编辑界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="modal-header"> 
   	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <div class="form-group">
         <div class="col-md-8 col-sm-8">
             <div class="todo-taskbody-user">
                 <img class="todo-userpic pull-left" src="<%=request.getContextPath()%>/${vo.loginUserPic}" width="50px" height="50px">
                 <span class="todo-username pull-left">${vo.loginUserName}</span>
             </div>
         </div> 
         <div class="col-md-4 col-sm-4"> 
			<div class="todo-taskbody-date pull-right">
				<span class="caption-helper"><font
					style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><spring:message
								code='common.laber.currentTime' />：</font>
				</font>
				</span> <span class="caption-subject font-green-sharp bold uppercase"><font
					style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">${vo.currentTime}</font>
				</font>
				</span>
			</div>
		</div>
    </div>
</div>
    <div class="modal-body todo-task-modal-body">
        <div id="bootstrap_alerts_demo"> </div>
        <!-- Begin: Query conditions -->
		<div class="row">
			<div class="col-md-12">
				<div class="portlet light portlet-fit bordered">
					 <div class="portlet-title">
			             <div class="caption">
			                 <i class="fa fa-info-circle font-red"></i>
			                 <span class="caption-subject font-red sbold uppercase">
				                 <font style="vertical-align: inherit;">
			                 		<c:if test="${operate=='add'}">
										<spring:message code='btn.common.add' />
									</c:if>
								    <c:if test="${operate=='edit'}">
										<spring:message code='btn.common.edit' />
								    </c:if>
			                 	</font>
			                 </span>
			             </div>
			             <div class="tools">
			                 <a href="javascript:;" class="collapse"> </a>
			                 <a href="javascript:;" class="reload"> </a>
			             </div>
			         </div>
			         <div class="portlet-body form">
				          <form class="form-horizontal  form-bordered" id="activityEditFormId" autocomplete="off" 
								    data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
		                    <div class="form-group">                        
							    <label class="control-label col-md-2">
								    <spring:message code='lable.saleActivity.startDate' />
								    <span class="required">* </span>
							    </label>
							    <div class="col-md-4">
							    	<input type="text" 
										class="date-picker form-control dateSelect"
										id="activityBegindate"
										name="activityBegindate"  
										data-rule="required;"
										placeholder="<spring:message code='common.laber.mustInputData'/>" 
										data-date-format="yyyy-mm-dd" >
							    </div>
							    <!-- 活动结束时间 -->
								<label class="control-label col-md-2"><spring:message code='lable.saleActivity.endDate' />
								<span class="required">* </span>
								</label>												
								<div class="col-md-4">
									<input type="text" 
										class="date-picker form-control dateSelect"
										id="activityEnddate"
										name="activityEnddate" 
										data-rule="required;"
										placeholder="<spring:message code='common.laber.mustInputData'/>" >
							    </div>						
							 </div>
		                    <div class="form-group">                        
								<label class="control-label col-md-2"><spring:message code='lable.saleActivity.activityName' />
								  <span class="required">* </span>
								</label>						 
								<div class="col-md-4">
									<input type="text" 
									   class="form-control" 
									   id="activityName" 
									   name="activityName" 
									   data-rule="required;length[~100];"
									   placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div>
								<!-- 活动类型 -->
								<label class="control-label col-md-2"><spring:message code='lable.saleActivity.activityType' />
								   <span class="required">* </span>
								</label>
								<div class="col-md-4">
								    <select class="bs-select form-filter form-control" 
											data-size="10" 
											data-rule="required;"
											title="<spring:message code='message.pleaseselect' />" 
											id="activityType"
											name="activityType">
					                 </select>
								</div>
							</div>
							<div class="form-group">
								<!-- 销售人员-->
								<label class="control-label col-md-2">
									<spring:message code='lable.saleActivity.saler' />
								 	<span class="required">* </span>
								</label>			 
								<div class="col-md-4">
									 <select class="bs-select form-filter form-control" 
										data-live-search="true" 
										data-size="10"
										data-rule="required;" 
										title="<spring:message code='message.pleaseselect' />"
										name="salesPersonnelId" value="${vo.salesPersonnelId}"
										id="salesPersonnelId">
				                      </select>
								</div>	
								<!-- 客户代表 -->
								<label class="control-label col-md-2">
									<spring:message code='lable.saleActivity.customRepresent' />
								</label>
								<div class="col-md-4">
									<input type="text" 
										   class="form-control" 
										   id="customerBehalf" 
										   name="customerBehalf" 
										   data-rule="length[~100];"
										   placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
								</div>						
							</div>
						    <div class="form-group">							
								 <!-- 活动描述 -->
								<label class="control-label col-md-2">
									<spring:message code='lable.saleActivity.activityDesc' />
									<span class="required">* </span>
								</label>
								<div class="col-md-9">
								     <textarea class="form-control" rows="2" id="activityDescribe" name="activityDescribe" 
									  placeholder="<spring:message code='common.laber.mustInputData'/>"
									  data-rule="required;length[~500];"></textarea>							 
								</div>
							</div>
							<div class="form-group">							
								 <!-- 成果说明 -->
								<label class="control-label col-md-2">
									<spring:message code='lable.saleActivity.resultExplain' />
								</label>
								<div class="col-md-9">
								     <textarea class="form-control" rows="2" 
								     id="activityResults"
								     name="activityResults"
								     data-rule="length[~1000]"
								     placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
									 ></textarea>						 
								</div>
							</div>
							<div class="form-group last">							
								 <!-- 备注 -->
								<label class="control-label col-md-2">
									<spring:message code='lable.saleTrack.remark' />
								</label>
								<div class="col-md-9">
								   <textarea class="form-control" rows="2" id="remark" name="remark" 
								    placeholder="<spring:message code='common.laber.noneMustInputData'/>"
								    ></textarea>					
								</div>
							</div>
		                    <div class="form-actions">
	                             <div class="modal-footer">
	                                <div class="col-md-offset-2 col-md-4">
		                                <button type="button" class="btn green" id="saveActivityId">
											<i class="fa fa-check"></i>
											<spring:message code='btn.common.save' />
									    </button>
	                                </div>   
	                             </div>
		                     </div>
		                     <input type="hidden" 
									   class="form-control" 
									   id="salesprojectId" 
									   name="salesprojectId" value="${vo.salesprojectId}"
									    />
		                 </form> 
			         </div>
				</div> 
			</div>
		</div>
		<c:if test="${vo.id !='' && vo.id !=null}">
		<div class="portlet light portlet-fit bordered">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-tags font-red"></i> <span
						class="caption-subject font-red sbold uppercase"> <font
						style="vertical-align: inherit;"> <font
							style="vertical-align: inherit;"><spring:message code='label.operatlog' /></font> </font> </span>
				</div>
				<div class="tools">
					<a href="javascript:;" class="expand"> </a> <a
						href="javascript:;" class="reload"> </a>
				</div>
			</div>
			<div class="portlet-body" style="display: none;">
				<div class="tabbable-line">
					<ul class="nav nav-tabs ">
						<li class="active"><a href="#tab_1" data-toggle="tab">
								<spring:message code='common.laber.annotation' /> </a></li>
						<li><a href="#tab_2" data-toggle="tab"> <spring:message code='common.laber.history' /> </a></li>
					</ul>
					<div class="tab-content">
						<jsp:include page="../../common/commentLog.jsp" />
						<!--操作日志显示  -->
						<jsp:include page="../../common/dataLog.jsp" />
					</div>
				</div>
			</div>
		</div>
		</c:if>
    </div>
<div class="modal-footer">
    <div class="col-md-offset-11 col-md-1">
    	<button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeCustomBaseInfoEditIdACT"><spring:message code='btn.common.close'/></button>
 	</div>
</div>
<script type="text/javascript">
	var saleActivityOldVal=$("#activityEditFormId").serializeFormJson();
	$("#activityType").initDic('${vo.activityType}',codeBasicInfo.activityType);
	$("#salesPersonnelId").initUserInfoSale('${vo.salesPersonnelId}');
	var saleActivityField = { 
			createBy:"<spring:message code='lable.saleTrack.creater' />",
			createDept:"<spring:message code='lable.saleTrack.createDept' />",
			activityBegindate:"<spring:message code='lable.saleActivity.startDate' />",
			activityEnddate:"<spring:message code='lable.saleActivity.endDate' />",
			activityName:"<spring:message code='lable.saleActivity.activityName' />",
			activityType:"<spring:message code='lable.saleActivity.activityType' />",
			salesPersonnelId:"<spring:message code='lable.saleActivity.saler' />",
			customerBehalf:"<spring:message code='lable.saleActivity.customRepresent' />",
			activityDescribe:"<spring:message code='lable.saleActivity.activityDesc' />",
			activityResults:"<spring:message code='lable.saleActivity.resultExplain' />",
			remark:"<spring:message code='lable.saleTrack.remark' />",
		};
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/preSalesManage/saletrack/saleActivityEdit.js"></script>