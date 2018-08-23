<!-- 其他成本新增/编辑界面 jczou 20180319 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	    <div class="form-group">
	         <div class="col-md-8 col-sm-8">
	             <div class="todo-taskbody-user">
	                 <img class="todo-userpic pull-left" src="../assets/pages/media/users/avatar6.jpg" width="50px" height="50px">
	                 <span class="todo-username pull-left">Penney</span>
	                 <button type="button" class="todo-username-btn btn btn-circle btn-default btn-sm">
	                      <c:if test="${operate=='add'}"><spring:message code='btn.common.add' /></c:if>
	                      <c:if test="${operate=='edit'}"><spring:message code='btn.common.edit' /></c:if>
	                 </button>
	             </div>
	         </div>
	         <div class="col-md-4 col-sm-4">
	             <div class="todo-taskbody-date pull-right">
	                 <h1 class="page-title pull-left"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">修改日期：
	                  </font></font><small><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2018年4月12日</font></font></small>
	              </h1>
	             </div>
	         </div>
	    </div>
    </div>
    <div class="modal-body todo-task-modal-body">
        <div id="bootstrap_alerts_demo"> </div>
        <form class="form-horizontal form-bordered" id="othercostEditFormId" autocomplete="off" enctype="multipart/form-data"
              data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
				<input type="hidden" value="${otherCostVo.id}" name="id" id="Id" />
				<input type="hidden" value="" name="changeDetails" id="changeDetails" />
				<div class="form-group">
					<!-- 操作人 -->
					<label class="control-label col-md-2">
					   <spring:message code='label.othercostManager.createBy' />								 
					</label>
					<div class="col-md-4">
						<input type="hidden" name="createBy" value="${otherCostVo.createBy}"/>
						<input type="text" 
							class="form-control" 
							id="createByName" 
							name="createByName"
							value="${otherCostVo.createByName}" 
							readonly="readonly" />
					</div>
					<!-- 操作部门 -->
					<label class="control-label col-md-2">
					  <spring:message code='label.othercostManager.createDept' /> 
					</label>
					<div class="col-md-4">
						<input type="hidden" name="createDept" value="${otherCostVo.createDept}">
						<input type="text" 
							class="form-control" 
							id="createDeptName" 
							name="createDeptName"
							value="${otherCostVo.createDeptName}" 
							readonly="readonly" />
					</div>
				</div>
				<div class="form-group">
					<!-- 操作时间 -->
					<label class="control-label col-md-2">
					   <spring:message code='label.othercostManager.createDate' />
					</label>
					<div class="col-md-4">
						<input type="text" 
							class="form-control" 
							id="createDate" 
							name="createDate"
							value="${otherCostVo.createDate}" 
							readonly="readonly"/>
					</div>
					<!-- 项目编号 -->
					<label class="control-label col-md-2"> <spring:message
							code='label.othercostManager.projectId' />
							<span class="required">*</span>
					</label>
					<div class="col-md-4">
						<select class="bs-select form-filter form-control" 
					    	data-size="10" 
							data-width="70%"
							id="projectId"
							name="projectId"
							data-rule="required;"
							title="<spring:message code='message.pleaseselect' />" >
	                    </select>
					</div>
				</div>
				<div class="form-group">
					<!-- 费用大项 -->
					<label class="control-label col-md-2"> <spring:message
							code='label.othercostManager.costSports' />
							<span class="required">*</span>
					</label>
					<div class="col-md-4">
						<select class="bs-select form-filter form-control" 
							data-size="10"
							data-width="70%"
							title="<spring:message code='message.pleaseselect' />"
							data-rule="required;"
							id="costSports" 
							name="costSports">
						</select>
					</div>
					<!-- 费用小项 -->
					<label class="control-label col-md-2"> <spring:message
							code='label.othercostManager.costEvents' />
							<span class="required">*</span>
					</label>
					<div class="col-md-4">
						<select class="bs-select form-filter form-control" 
							data-size="10"
							data-width="70%"
							title="<spring:message code='message.pleaseselect' />"
							data-rule="required;"
							id="costEvents" 
							name="costEvents">
						</select>
					</div>
				</div>
				<div class="form-group">
					<!-- 总金额 -->
					<label class="control-label col-md-2"> <spring:message
							code='label.othercostManager.totalAmount' />
							<span class="required">*</span>
					</label>
					<div class="col-md-4">
						<input type="text" 
							class="form-control" 
							id="totalAmount" 
							name="totalAmount"
							data-rule="required;positiveNum;length[~25];"
							value="${otherCostVo.totalAmount}"
							placeholder="<spring:message code='common.laber.mustInputData'/>" />
					</div>
					<!-- 币种 -->
					<label class="control-label col-md-2"> <spring:message
							code='label.othercostManager.currency' />
							<span class="required">*</span>
					</label>
					<div class="col-md-4">
						<select class="bs-select form-filter form-control" 
							data-size="10"
							data-width="70%"
							data-rule="required;"
							title="<spring:message code='message.pleaseselect' />"
							id="currency" 
							name="currency">
						</select>
					</div>
				</div>
				<div class="form-group">
					<!-- 开始日期 -->
					<label class="control-label col-md-2"> <spring:message
							code='label.othercostManager.beginDate' />
					</label>
					<div class="col-md-4">
						<input type="text" 
							class="form-control date-picker dateSelect"  
							id="beginDate"
							name="beginDate" 
							value="${otherCostVo.beginDate}"
							placeholder="<spring:message code='message.pleaseselect'/>" /> 
					</div>
					<!-- 结束日期 -->
					<label class="control-label col-md-2"> <spring:message
							code='label.othercostManager.endDate' />
					</label>
					<div class="col-md-4">
						<input type="text" 
							class="form-control date-picker dateSelect" 
							id="endDate"
							name="endDate" 
							value="${otherCostVo.endDate}"
							placeholder="<spring:message code='message.pleaseselect'/>" />
					</div>
				</div>
				<div class="form-group">
					<!-- 报销人 -->
					<label class="control-label col-md-2"> 
						<spring:message code='label.othercostManager.peopleConcerned' />
					</label>
					<div class="col-md-4">
						<select class="bs-select form-filter form-control" 
							data-size="10" 
							data-width="70%"
							title="<spring:message code='message.pleaseselect' />" 
							id="peopleConcerned"
							name="peopleConcerned">
	                    </select>
					</div>
					<!-- 是否有发票 -->
					<label class="control-label col-md-2"> 
						<spring:message code='label.othercostManager.whetherInvoice' />
					</label>
					<div class="col-md-4">
						<select class="bs-select form-filter form-control" 
							data-size="10"
							data-width="70%"
							title="<spring:message code='message.pleaseselect' />"
							id="whetherInvoice" 
							name="whetherInvoice">
						</select>
					</div>
				</div>
				<div class="form-group">
					<!-- 费用说明 -->
					<label class="control-label col-md-2"> 
						<spring:message code='label.othercostManager.costDescribe' />
					</label>
					<div class="col-md-9">
						<textarea class="form-control" rows="3" style="width: 100%;"
							id="costDescribe" data-rule="length[~1000];"
							name="costDescribe"
							placeholder="<spring:message code='common.laber.noneMustInputData'/>"
							value="${otherCostVo.costDescribe}">${otherCostVo.costDescribe}</textarea>
					</div>
				</div>
				<div class="form-group">
					<!-- 备注 -->
					<label class="control-label col-md-2"> 
						<spring:message code='label.othercostManager.remark' />
					</label>
					<div class="col-md-9">
						<textarea class="form-control" rows="3" style="width: 100%;" 
							id="remark" d
							ata-rule="length[~1000];"
							name="remark"
							placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
							value="${otherCostVo.remark}">${otherCostVo.remark}</textarea>
					</div>
				</div>				
				<div class="form-actions">
                    <div class="modal-footer">
	                     <button type="button" class="btn btn-danger" id="clearOtherCostId">
							  <spring:message code='btn.common.clear' />
						 </button>
	                     <button type="button" class="btn green" id="saveOtherCostId">
							  <spring:message code='btn.common.save' />
					     </button>
                    </div>
                 </div>
                <div class="tabbable-line">
	                    <ul class="nav nav-tabs ">
	                       <li class="active">
	                           <a href="#tab_1" data-toggle="tab"> 注释 </a>
	                       </li>
	                       <li>
	                           <a href="#tab_2" data-toggle="tab"> 历史 </a>
	                       </li>
	                    </ul>
	                    <div class="tab-content">
	                       <div class="tab-pane active" id="tab_1">
	                           <!-- TASK COMMENTS -->
	                           <div class="form-group">
	                               <div class="col-md-12">
	                                   <ul class="media-list">
	                                       <li class="media">
	                                           <a class="pull-left" href="javascript:;">
	                                               <img class="todo-userpic" src="../assets/pages/media/users/avatar8.jpg" width="27px" height="27px"> </a>
	                                           <div class="media-body todo-comment">
	                                               <button type="button" class="todo-comment-btn btn btn-circle btn-default btn-sm">回复</button>
	                                               <p class="todo-comment-head">
	                                                   <span class="todo-comment-username">Christina Aguilera</span> &nbsp;
	                                                   <span class="todo-comment-date">17 Sep 2014 at 2:05pm</span>
	                                               </p>
	                                               <p class="todo-text-color"> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
	                                                   </p>
	                                               <!-- Nested media object -->
	                                               <div class="media">
	                                                   <a class="pull-left" href="javascript:;">
	                                                       <img class="todo-userpic" src="../assets/pages/media/users/avatar4.jpg" width="27px" height="27px"> </a>
	                                                   <div class="media-body">
	                                                       <p class="todo-comment-head">
	                                                           <span class="todo-comment-username">Carles Puyol</span> &nbsp;
	                                                           <span class="todo-comment-date">17 Sep 2014 at 4:30pm</span>
	                                                       </p>
	                                                       <p class="todo-text-color"> Thanks so much my dear! </p>
	                                                   </div>
	                                               </div>
	                                           </div>
	                                       </li>
	                                       <li class="media">
	                                           <a class="pull-left" href="javascript:;">
	                                               <img class="todo-userpic" src="../assets/pages/media/users/avatar5.jpg" width="27px" height="27px"> </a>
	                                           <div class="media-body todo-comment">
	                                               <button type="button" class="todo-comment-btn btn btn-circle btn-default btn-sm">回复</button>
	                                               <p class="todo-comment-head">
	                                                   <span class="todo-comment-username">Andres Iniesta</span> &nbsp;
	                                                   <span class="todo-comment-date">18 Sep 2014 at 9:22am</span>
	                                               </p>
	                                               <p class="todo-text-color"> Cras sit amet nibh libero, in gravida nulla. Scelerisque ante sollicitudin commodo Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum
	                                                   in vulputate at, tempus viverra turpis.
	                                                   <br> </p>
	                                           </div>
	                                       </li>
	                                       <li class="media">
	                                           <a class="pull-left" href="javascript:;">
	                                               <img class="todo-userpic" src="../assets/pages/media/users/avatar6.jpg" width="27px" height="27px"> </a>
	                                           <div class="media-body todo-comment">
	                                               <button type="button" class="todo-comment-btn btn btn-circle btn-default btn-sm">回复</button>
	                                               <p class="todo-comment-head">
	                                                   <span class="todo-comment-username">Olivia Wilde</span> &nbsp;
	                                                   <span class="todo-comment-date">18 Sep 2014 at 11:50am</span>
	                                               </p>
	                                               <p class="todo-text-color"> Cras sit amet nibh libero, in gravida nulla. Scelerisque ante sollicitudin commodo Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum
	                                                   in vulputate at, tempus viverra turpis.
	                                                   <br> </p>
	                                           </div>
	                                       </li>
	                                   </ul>
	                               </div>
	                           </div>
	                           <!-- END TASK COMMENTS -->
	                           <!-- TASK COMMENT FORM -->
	                           <div class="form-group">
	                               <div class="col-md-12">
	                                   <ul class="media-list">
	                                       <li class="media">
	                                           <a class="pull-left" href="javascript:;">
	                                               <img class="todo-userpic" src="../assets/pages/media/users/avatar4.jpg" width="27px" height="27px"> </a>
	                                           <div class="media-body">
	                                               <textarea class="form-control todo-taskbody-taskdesc" rows="4" placeholder="Type comment..."></textarea>
	                                           </div>
	                                       </li>
	                                   </ul>
	                                   <button type="button" class="pull-right btn btn-sm btn-circle green"> &nbsp;发送 &nbsp; </button>
	                               </div>
	                           </div>
	                           <!-- END TASK COMMENT FORM -->
	                       </div>
	                        <!--操作日志显示  -->
	                        <jsp:include page="../../common/dataLog.jsp"/>
	                   </div>
                  </div>
		 </form>
	 </div>
	 <div class="modal-footer">
       <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeOtherCostId">关闭</button>
     </div>	
<script type="text/javascript">
	//下拉框初始化
	$("#othercostEditFormId #currency").initDic('${otherCostVo.currency}',codeBasicInfo.currency);
	$("#othercostEditFormId #projectId").initProjectInfo('${otherCostVo.projectId}');
	$("#othercostEditFormId #costSports").initDic('${otherCostVo.costSports}',codeBasicInfo.costSports);
	var costSportsVal='${otherCostVo.costSports}';
	if(costSportsVal=='0'){
		$("#othercostEditFormId #costEvents").initDic(costSportsVal,codeBasicInfo.costEventsTravel);
	}else if(costSportsVal=='1'){
		$("#othercostEditFormId #costEvents").initDic(costSportsVal,codeBasicInfo.costEventsOther);
	}
	$("#othercostEditFormId #peopleConcerned").initUserInfo('${otherCostVo.peopleConcerned}');
	$("#othercostEditFormId #whetherInvoice").initDic('${otherCostVo.whetherInvoice}',codeBasicInfo.yesOrNo);
	$("#othercostEditFormId #createDeptName").val(getDeptByIds('${otherCostVo.createDept}'));
	
	var otherCostOldVal=$("#othercostEditFormId").serializeFormJson();
    var otherCostField = {
		createByName:"<spring:message code='label.othercostManager.createBy' />",							 
		createDeptName:"<spring:message code='label.othercostManager.createDept' />", 
		createDate:"<spring:message code='label.othercostManager.createDate' />",
		projectId:"<spring:message code='label.othercostManager.projectId' />",
		costSports:"<spring:message code='label.othercostManager.costSports' />",
		costEvents:"<spring:message code='label.othercostManager.costEvents' />",
		totalAmount:"<spring:message code='label.othercostManager.totalAmount' />",
		currency:"<spring:message code='label.othercostManager.currency' />",
		beginDate:"<spring:message code='label.othercostManager.beginDate' />",
		endDate:"<spring:message code='label.othercostManager.endDate' />",
		peopleConcerned:"<spring:message code='label.othercostManager.peopleConcerned' />",
		whetherInvoice:"<spring:message code='label.othercostManager.whetherInvoice' />",
		costDescribe:"<spring:message code='label.othercostManager.costDescribe' />",
		remark:"<spring:message code='label.othercostManager.remark' />"
	};
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManagement/othercostmanager/otherCostManagerEdit.js"></script>