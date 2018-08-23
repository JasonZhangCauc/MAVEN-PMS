<!-- 单价新增/编辑界面 jczou 20180312 -->
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
        <form class="form-horizontal form-bordered" id="costEditFormId" autocomplete="off" enctype="multipart/form-data"
              data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">  
				<input type="hidden" value="${vo.id}" name="id" id="Id" />
				<input type="hidden" value="" name="changeDetails" id="changeDetails" />
				<div class="form-group">
					<!-- 供应商名称 -->
					<label class="control-label col-md-2"> 
						<spring:message code='label.costManagement.suppliername' /> 
						<span class="required">* </span> 
					</label>
					<div class="col-md-4">
						<select class="bs-select form-filter form-control" data-size="10"
							data-width="70%" data-rule="required;"
							title="<spring:message code='message.pleaseselect' />"
							id="supplierId" name="supplierId">

						</select>
					</div>
					<!-- 单价类型 -->
					<label class="control-label col-md-2"> <spring:message
							code='label.costManagement.priceType' /> <span class="required">*
					</span> </label>
					<div class="col-md-4">
						<select class="bs-select form-filter form-control" data-size="10"
							data-width="70%" data-rule="required;"
							title="<spring:message code='message.pleaseselect' />"
							id="priceType" name="priceType">

						</select>
					</div>
				</div>
				<div class="form-group">
					<!-- 单价金额 -->
					<label class="control-label col-md-2"> <spring:message
							code='label.costManagement.price' /> <span class="required">*
					</span> </label>
					<div class="col-md-4">
						<input type="text" class="form-control" 
						       id="price" name="price"
							   data-rule="positiveNum;required;length[~10];"
							   value="${vo.price}"
							   placeholder="<spring:message code='common.laber.mustInputData'/>"/>
					</div>
					<!-- 币种 -->
					<label class="control-label col-md-2"> <spring:message
							code='label.costManagement.currency' /> <span class="required">*
					</span> </label>
					<div class="col-md-4">
						<select class="bs-select form-filter form-control" data-size="10"
							data-width="70%" data-rule="required;"
							title="<spring:message code='message.pleaseselect' />"
							id="currency" name="currency">

						</select>
					</div>
				</div>
				<div class="form-group">
					<!-- 开始日期 -->
					<label class="control-label col-md-2"> <spring:message
							code='label.costManagement.beginDate' /> <span class="required">*
					</span> </label>
					<div class="col-md-4">
						<input type="text" 
							class="date-picker form-control dateSelect"
							id="beginDate"
							name="beginDate" 
							value="${vo.beginDate}" 
							data-rule="required;"
							placeholder="<spring:message code='message.pleaseselect'/>" >
					</div>
					<!-- 结束日期 -->
					<label class="control-label col-md-2"> <spring:message
							code='label.costManagement.endDate' /> </label>
					<div class="col-md-4">
						<input type="text" 
							class="date-picker form-control dateSelect"
							id="endDate"
							name="endDate" 
							value="${vo.endDate}" 
							placeholder="<spring:message code='message.pleaseselect'/>">
					</div>
				</div>
				<div class="form-group">
					<!-- 任务描述 -->
					<label class="control-label col-md-2">
						<spring:message code='label.codeManager.codeRemark' /> </label>
					<div class="col-md-9">
						<textarea class="form-control" 
							rows="3" 
							style="width: 100%;"
							data-rule="length[~1000];" 
							id="remark"
							name="remark"
							placeholder="<spring:message code='common.laber.noneMustInputData'/>"
							value="${vo.remark}">${vo.remark}</textarea>
					</div>
				</div>				
				<div class="form-actions">
	                    <div class="modal-footer">
		                     <button type="button" class="btn btn-danger" id="clearCostId">
								  <spring:message code='btn.common.clear' />
							 </button>
		                     <button type="button" class="btn green" id="saveCostId">
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
       <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeCostId">关闭</button>
    </div>
<!-- 参数 -->
<script type="text/javascript">
	$("#costEditFormId #supplierId").initDic('${vo.supplierId}',codeBasicInfo.suppliername);
	$("#costEditFormId #priceType").initDic('${vo.priceType}',codeBasicInfo.pricetype);
	$("#costEditFormId #currency").initDic('${vo.currency}',codeBasicInfo.currency);
	//设置开始时间不能大于结束时间
    $("#costEditFormId #beginDate").on("changeDate",function(e){
    	$("#costEditFormId #endDate").datepicker("setStartDate",e.date);
    });
    $("#costEditFormId #endDate").on("changeDate",function(e){
    	$("#costEditFormId #beginDate").datepicker("setEndDate",e.date);
    });
    var costOldVal=$("#costEditFormId").serializeFormJson();
    var costField = {
		supplierId:"<spring:message code='label.costManagement.suppliername' /> ",
		priceType:"<spring:message code='label.costManagement.priceType' />",
		price:"<spring:message code='label.costManagement.price' />",
		currency:"<spring:message code='label.costManagement.currency' />",
		beginDate:"<spring:message code='label.costManagement.beginDate' />",
		endDate:"<spring:message code='label.costManagement.endDate' />",
		remark:"<spring:message code='label.codeManager.codeRemark' />"
	};
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManagement/costmanager/costManagementEdit.js"></script>