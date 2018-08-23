<!-- 任务新增/编辑界面 ZHOUMIN 20180305 -->
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
        <form class="form-horizontal form-bordered" id="taskAssignEditFormId" autocomplete="off" enctype="multipart/form-data"
              data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">              
				    <input type="hidden" value="${taskVo.id}" name="id" id="taskId"/>
				    <input type="hidden" value="" name="changeDetails" id="changeDetails" />
                    <div class="form-group">
                        <!-- 发起人 -->
						<label class="control-label col-md-2">
							<spring:message code='label.taskManager.originator' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<select class="bs-select form-filter form-control" 
								data-size="10" 
								data-width="70%"
								data-rule="required;"
								title="<spring:message code='message.pleaseselect' />" 
								id="originator"
								name="originator">
		                    </select>
						</div>
						<!-- 接收人 -->
						<label class="control-label col-md-2">
							<spring:message code='label.taskManager.recipient' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<select class="bs-select form-filter form-control" 
								data-size="10" 
								data-width="70%"
								data-rule="required;"
								title="<spring:message code='message.pleaseselect' />"
								id="recipient" 
								name="recipient">
		                    </select>
						</div>
                    </div>
                    <div class="form-group">
                    	<!-- 要求完成日期-->
						<label class="control-label col-md-2">
							<spring:message code='label.taskManager.reqFinitionDate' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
								class="date-picker form-control dateSelect"
								id="reqFinitionDate"
								name="reqFinitionDate" 
								value="${taskVo.reqFinitionDate}" 
								data-rule="required;"
								placeholder="<spring:message code='message.pleaseselect'/>" >
						</div>
						<!-- 紧急程度 -->
						<label class="control-label col-md-2">
							<spring:message code='label.taskManager.emergency' />
							<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<select class="bs-select form-filter form-control" 
								data-size="10" 
								data-width="70%"
								data-rule="required;"
								title="<spring:message code='message.pleaseselect' />"
								id="emergency" 
								name="emergency">
		                    </select>
						</div>
                    </div>
                    <div class="form-group">
                    	<!-- 任务描述 -->
						<label class="control-label col-md-2">
							<spring:message code='label.taskManager.taskDesc' /> 
							<span class="required">* </span>
						</label>
						<div class="col-md-9">
							<textarea class="form-control" rows="3" style="width: 100%;" id="taskDesc" 
								data-rule="required;length[~1000];"
								placeholder="<spring:message code='common.laber.mustInputData'/>"
								name="taskDesc" value="${taskVo.taskDesc}">${taskVo.taskDesc}</textarea>
						</div>
                    </div>
                    <div class="form-group">
                    	<!-- 反馈情况 -->
						<label class="control-label col-md-2"><spring:message
								code='label.taskManager.feedback' /> </label>
						<div class="col-md-9">
							<textarea class="form-control" rows="3" style="width: 100%;" id="feedback" data-rule="length[~1000];" readonly="readonly"
								name="feedback" value="${taskVo.feedback}">${taskVo.feedback}</textarea>
						</div>
                    </div>
                    <div class="form-group">
                    	<!-- 是否关闭 -->
						<label class="control-label col-md-2"><spring:message code='label.taskManager.isClose' /></label>
						<div class="col-md-4">
							<div class="md-radio-inline">
								<div class="md-radio">
									<input type="radio" name="isClose" id="isClose2" value="0" disabled 
										title="<spring:message code='common.label.yes' />" class="md-radiobtn"> 
									<label for="isClose2">
										<span></span><span class="check"></span> <span class="box"></span>
										<spring:message code='common.label.yes' />
									</label>
								</div>
								<div class="md-radio has-error">
									<input type="radio" name="isClose" id="isClose3" value="1" disabled 
										title="<spring:message code='common.label.no' />" class="md-radiobtn" checked> 
									<label for="isClose3">
										<span></span><span class="check"></span> <span class="box"></span>
										<spring:message code='common.label.no' />
									</label>
								</div>
							</div>
						</div>
						<!-- 关闭日期-->
						<label class="control-label col-md-2"><spring:message code='label.taskManager.closeDate' /></label>
						<div class="col-md-4">
							<input type="text" 
								class="date-picker form-control dateSelect"
								id="closeDate"
								name="closeDate" 
								value="${taskVo.closeDate}" 
								disabled
								placeholder="<spring:message code='message.pleaseselect'/>" >
						</div>
                    </div>
                    <div class="form-group">
                    	<!-- 反馈情况 -->
						<label class="control-label col-md-2"><spring:message
								code='label.taskManager.remarks' /> </label>
						<div class="col-md-9">
							<textarea class="form-control" rows="3" style="width: 100%;" readonly="readonly" 
								id="remarks" data-rule="length[~1000];"
								name="remarks" value="${taskVo.remarks}">${taskVo.remarks}</textarea>
						</div>
                    </div>
					<div class="form-actions">
						<div class="row">
							<div class="modal-footer">
								<c:if test="${operate=='edit' || operate=='add'}">
									<button type="button" class="btn btn-danger" id="clearTaskId">
								         <spring:message code='btn.common.clear' />
							        </button>
									<button type="button" class="btn green" id="saveTaskAssignId" >
										<i class="fa fa-check"></i>
										<spring:message code='btn.common.save' />
									</button>
								</c:if>
								<c:if test="${operate=='edit' && taskVo.sendStatus=='0'}">
									<auth:auth resourceCode="R005_0103">										
										<button type="button" class="btn green" id="sendTaskId" onClick="taskAssignManagerEdit.sendOrBankTask('0')">
											<i class="fa fa-check"></i>
											<spring:message code='label.taskManager.send' />
										</button>
									</auth:auth>
								</c:if>
								<c:if test="${operate=='edit' && taskVo.sendStatus=='1' && taskVo.isClose=='1'}">
									<auth:auth resourceCode="R005_0103">
										<button type="button" class="btn green" id="sendBackTaskId" onClick="taskAssignManagerEdit.sendOrBankTask('1')">
											<i class="fa fa-check"></i>
											<spring:message code='label.taskManager.sendBack'/>
										</button>
									</auth:auth>
								</c:if>								
							</div>
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
	                       <div class="tab-pane" id="tab_2">
	                           <ul class="todo-task-history">
	                               <li>
	                                   <div class="todo-task-history-date"> 20 Jun, 2014 at 11:35am </div>
	                                   <div class="todo-task-history-desc"> Task created </div>
	                               </li>
	                               <li>
	                                   <div class="todo-task-history-date"> 21 Jun, 2014 at 10:35pm </div>
	                                   <div class="todo-task-history-desc"> Task category status changed to "Top Priority" </div>
	                               </li>
	                               <li>
	                                   <div class="todo-task-history-date"> 22 Jun, 2014 at 11:35am </div>
	                                   <div class="todo-task-history-desc"> Task owner changed to "Nick Larson" </div>
	                               </li>
	                               <li>
	                                   <div class="todo-task-history-date"> 30 Jun, 2014 at 8:09am </div>
	                                   <div class="todo-task-history-desc"> Task completed by "Nick Larson" </div>
	                               </li>
	                           </ul>
	                       </div>
	                   </div>
                   </div>
		</form>    
    </div>
    <div class="modal-footer">
       <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeTaskId">关闭</button>
    </div>
<script type="text/javascript">
	//下拉框初始化
	$("#taskAssignEditFormId #originator").initUserInfo('${taskVo.originator}');
	$("#taskAssignEditFormId #recipient").initUserInfo('${taskVo.recipient}');
	$("#taskAssignEditFormId #emergency").initDic('${taskVo.emergency}',codeBasicInfo.emergency);
	var task_isClose= '${taskVo.isClose}';
	$("input[type='radio'][name='isClose'][value='"+task_isClose+"']").prop("checked","checked");
	
	var taskAssignOldVal=$("#taskAssignEditFormId").serializeFormJson();
    var taskAssignField = {
		originator:"<spring:message code='label.taskManager.originator' />",
		recipient:"<spring:message code='label.taskManager.recipient' />",
 		reqFinitionDate:"<spring:message code='label.taskManager.reqFinitionDate' />",
		emergency:"<spring:message code='label.taskManager.emergency' />",
		taskDesc:"<spring:message code='label.taskManager.taskDesc' />"
	};
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/taskManage/taskAssignManager/taskAssignManagerEdit.js"></script>
