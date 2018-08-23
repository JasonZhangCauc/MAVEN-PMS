<!-- 合同管理编辑页 -->
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
	         			 <c:if test="${operate=='look'}"><spring:message code='btn.common.look' /></c:if>
	         			 
	                 </button>
	             </div>
	         </div>
	         <div class="col-md-4 col-sm-4">
	             
	         </div>
	    </div>
    </div>
 <!--     查看页面不可变 -->
  <c:if test="${operate=='look'}">
    
    <div class="modal-body todo-task-modal-body">
        <div id="bootstrap_alerts_demo"> </div>
        <form class="form-horizontal form-bordered" id="leaveEditFormId" autocomplete="off" enctype="multipart/form-data"
              data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
		    <input type="hidden" value="${vo.id}" name="id" id="id"/>
		    <input type="hidden" value="" name="changeDetails" id="changeDetails"/>
           
            <div class="form-group">
		       <!-- 请假类型 -->
				<label class="control-label col-md-2"><spring:message code='lable.leave.type' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">
					<select class="bs-select form-filter form-control" 
							data-size="10" 
							data-width="70%"
							data-live-search="true"
							data-rule="required;"
							value="${vo.leaveType}"
							disabled="disabled"
							title="<spring:message code='message.pleaseselect' />" 
							id="leaveType"
							name="leaveType">
	                 </select>								   
				</div>
			</div>
			<div class="form-group">
				  <!-- 开始时间 -->
				<label class="control-label col-md-2">
				  <spring:message code='lable.leave.starttime' />
				  <span class="required">* </span>
				</label>						 
				<div class="col-md-4">								
					<input type="text" 
					 style="width: 70%;" 
						class="form_datetime form-control dateSelect"
						id="beginTime"
						name="beginTime"
						data-rule="required" 
						value="${vo.beginTime}" 
						data-rule="required;"
						  readonly="readonly"
						placeholder="<spring:message code='message.pleaseselect'/>" >							
				</div>
				<!-- 结束时间-->
				<label class="control-label col-md-2">
				<spring:message code='lable.leave.endtime' />
				 <span class="required">* </span>
				</label>			 
				<div class="col-md-4">								
					<input type="text" 
					 style="width: 70%;" 
						class="form_datetime form-control dateSelect"
						id="endTime"
						name="endTime"
						data-rule="required" 
						value="${vo.endTime}" 
						data-rule="required;"
						readonly="readonly"	
						placeholder="<spring:message code='message.pleaseselect'/>" >							
				</div>
				
			</div>
			
            
            <div class="form-group">												
				 <!-- 请假理由 -->
				<label class="control-label col-md-2"><spring:message code='lable.leave.reason' /></label>
				<div class="col-md-9">
				     <textarea class="form-control" rows="6" style="width: 100%;" 
				     id="leaveReason" name="leaveReason" 
				     value="${vo.leaveReason}" 
				     readonly="readonly"	
				     data-rule="length[~1000];"
				     placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
				     >${vo.leaveReason}</textarea>
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
	                       <jsp:include page="../../common/dataLog.jsp"/>
	                   </div>
                </div>
        </form>
   </div>
   </c:if>
  
  <!--     增加修改页面可变 -->
     <c:if test="${operate=='add' ||operate=='edit'}">
     <div class="modal-body todo-task-modal-body">
        <div id="bootstrap_alerts_demo"> </div>
        <form class="form-horizontal form-bordered" id="leaveEditFormId" autocomplete="off" enctype="multipart/form-data"
              data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
		    <input type="hidden" value="${vo.id}" name="id" id="id"/>
		    <input type="hidden" value="" name="changeDetails" id="changeDetails"/>
           
            <div class="form-group">
		       <!-- 请假类型 -->
				<label class="control-label col-md-2"><spring:message code='lable.leave.type' />
				<span class="required">* </span>
				</label>
				<div class="col-md-4">
					<select class="bs-select form-filter form-control" 
							data-size="10" 
							data-width="70%"
							data-live-search="true"
							data-rule="required;"
							value="${vo.leaveType}"
							title="<spring:message code='message.pleaseselect' />" 
							id="leaveType"
							name="leaveType">
	                 </select>								   
				</div>
			</div>
			<div class="form-group">
				  <!-- 开始时间 -->
				<label class="control-label col-md-2">
				  <spring:message code='lable.leave.starttime' />
				 <span class="required">* </span>
				</label>			 
				<div class="col-md-4">								
					<input type="text" 
					 style="width: 70%;" 
						class=" form-control dateSelect form_datetime "
						id="beginTime"
						name="beginTime"
						data-rule="required" 
						value="${vo.beginTime}" 
						data-rule="required;"
						readonly="readonly"
						 data-date-format="yyyy-mm-dd hh:ii"
						placeholder="<spring:message code='message.pleaseselect'/>" >							
				</div>
				<!-- 结束时间-->
				<label class="control-label col-md-2">
				<spring:message code='lable.leave.endtime' />
				 <span class="required">* </span>
				</label>			 
				<div class="col-md-4 ">								
					<input type="text" 
					 style="width: 70%;" 
						class="  form-control dateSelect form_datetime "
						id="endTime"
						name="endTime"
						data-rule="required" 
						readonly="readonly"
						value="${vo.endTime}" 
						data-rule="required;"
						 data-date-format="yyyy-mm-dd hh:ii"
						placeholder="<spring:message code='message.pleaseselect'/>" >							
				</div>
			</div>
            <div class="form-group">												
				 <!-- 请假理由 -->
				<label class="control-label col-md-2"><spring:message code='lable.leave.reason' /></label>
				<div class="col-md-9">
				     <textarea class="form-control" rows="6" style="width: 100%;" 
				     id="leaveReason" name="leaveReason" 
				     value="${vo.leaveReason}" 
				     data-rule="length[~1000];"
				     placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
				     >${vo.leaveReason}</textarea>
				</div>
			 </div>
			  <div class="form-actions">
	                   <div class="modal-footer">
		                     <button type="button" class="btn btn-danger" id="clearLeaveEditId">
								  <spring:message code='btn.common.clear' />
							 </button>
		                     <button type="button" class="btn green" id="saveLeaveId">
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
	                                           </div>
	                                       </li>
	                                   </ul>
	                               </div>
	                           </div>
	                           <!-- END TASK COMMENTS -->
	                       </div>
	                       <jsp:include page="../../common/dataLog.jsp"/>
	                   </div>
                </div>
        </form>
   </div>
   </c:if>
   <div class="modal-footer">
          <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeContractEditId">关闭</button>
   </div>
<script type="text/javascript">
	$("#leaveEditFormId #leaveType").initDic('${vo.leaveType}',codeBasicInfo.leaveType);
	var contractEdit_operate='${operate}';
	$(function(){
		if(contractEdit_operate=='edit'){
			//初始化上传插件
			initWebUploaderUI({
	        	_webUploaderId:'#uploaderContractDivId',
	        	_fileAddId:'#filePicker',
	        	_fileAddIdContinue:'#filePicker2',
	        	_dataId:'${vo.id}',
	        	_pageType:'R003-0101',
	        	_editFileId:'#moduleContractGallery'});
	        //初始化历史数据
			initEidtUploaderUI({
				_editFileId:'#moduleContractGallery',
				_dataId:'${vo.id}',
				_pageType:'R003-0101',
				_canDelete:true
				});
		}
	});
	
	var contractVal=$("#leaveEditFormId").serializeFormJson();
	var contractColumn = {
		signedDate:"<spring:message code='lable.contract.signDate' />",
		belongCustomerid:"<spring:message code='lable.contract.custom' />",
		contractTitle:"<spring:message code='lable.contract.title' />",								
		belongProduct:"<spring:message code='lable.contract.product' />",						
		currency:"<spring:message code='lable.contract.coinType' />",						
		contractAmount:"<spring:message code='lable.contract.price' />",
		effectiveDate:"<spring:message code='lable.contract.expiryDate' />",
		laborPrice:"<spring:message code='common.laber.mustInputData'/>",
		freeservicePeriod:"<spring:message code='lable.contract.freeStage' />",
		freeLimit:"<spring:message code='lable.contract.freeTime' />",
		giveDay:"<spring:message code='lable.contract.sendDays' />",
		costserviceTime:"<spring:message code='lable.contract.payTime' />",
		paymentRemark:"<spring:message code='lable.contract.payDesc' />",					
		leaveReason:"<spring:message code='lable.contract.remark' />"
	};
	$(".form_datetime").datetimepicker({
		language: 'zh-CN',//显示中文
	    autoclose: true,
	    isRTL: App.isRTL(),
	    
	    format: "yyyy-mm-dd hh:ii",
	    fontAwesome: true,
	    pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left")
	});
</script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/checkinginManage/leaveManage/leaveManageEdit.js"></script>