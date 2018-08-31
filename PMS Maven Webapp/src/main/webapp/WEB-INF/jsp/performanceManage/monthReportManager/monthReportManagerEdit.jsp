<!-- 月报新增/编辑界面 ZHOUMIN 20180305 -->
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
        <form class="form-horizontal form-bordered" id="monthReportEditFormId" autocomplete="off" enctype="multipart/form-data"
              data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">             
			    <input type="hidden" value="${monthReportVo.id}" name="id"/>
			    <input type="hidden" value="" name="changeDetails" id="changeDetails" />
                <div class="form-group">
                    <!-- 填报人 -->
		<label class="control-label col-md-3">
			<spring:message code='label.dailyReportManager.proReporter' />
		</label>
		<div class="col-md-6">
			<input type="hidden" value="${monthReportVo.proReporter}" name="proReporter"/>
	    	<input type="text" 
			   class="form-control" 
			   id="proReporterName" 
			   name="proReporterName" 
			   value="${monthReportVo.proReporterName}"
			   readonly="readonly"
			   data-rule="required;length[~50];" />
		</div>
                </div>
                <div class="form-group">
                    <!-- 填报时间 -->
		<label class="control-label col-md-3">
			<spring:message code='label.dailyReportManager.reportDate' />
		</label>
		<div class="col-md-6">
			<input type="text" 
				class="date-picker form-control dateSelect"
				id="reportMonth"
				name="reportMonth" 
				data-date-format="yyyy-mm"
				readonly="readonly"
				value="${monthReportVo.reportMonth}" 
				data-rule="required;"
				placeholder="<spring:message code='message.pleaseselect'/>" >
		</div>
                </div>
                <div class="form-group">
                    <!-- 项目编号 -->
	    <label class="control-label col-md-3">
		    <spring:message code='label.dailyReportManager.proNum' />
		    <span class="required">* </span>
	    </label>
	    <div class="col-md-6">
		    <select class="bs-select form-filter form-control" 
		    	data-size="10" 
				data-width="70%"
				id="proId"
				name="proId"
				data-rule="required;"
				title="<spring:message code='message.pleaseselect'/>" >
                  </select>
	    </div>
                </div>
                <div class="form-group">
                    <!-- 项目参与人 -->
	    <label class="control-label col-md-3">
		    <spring:message code='label.monthReportManager.proAttendees' />
		    <span class="required">* </span>
	    </label>
	    <div class="col-md-6">
		    <select class="bs-select form-filter form-control" 
		    	data-size="10" 
				data-live-search="true"
				multiple="multiple"
				id="proAttendees"
				name="proAttendees"
				data-rule="required;"
				title="<spring:message code='message.pleaseselect'/>" >
                  </select>
	    </div>
                </div>
                <div class="form-group">
                	<!-- 附件 -->
		<label class="control-label col-md-3">
			<spring:message code='common.label.attachment' />			
		</label>
		<div class="col-md-9">
            <div id="moduleGallery" class="editableGallery"></div>
            <div id="uploaderDivId" class="editableGallery">        
                         <div class="queueList">
                             <div id="dndArea" class="placeholder">
                                 <div id="filePicker"></div>
                                 <p>单次最多可选10张</p>
                             </div>
                         </div>
                         <div class="statusBar" style="display:none;">
                             <div class="progress">
                                 <span class="text">0%</span> <span class="percentage"></span>
                             </div>
                             <div class="info"></div>
                             <div class="btns">
                                 <div id="filePicker2" class="addFileBtn"></div>
                             </div>
                         </div>
                    </div> 
		    </div>
         </div>					
		 <div class="form-actions">
	               <div class="modal-footer">
	                  <button type="button" class="btn btn-danger" id="clearMonthReportId">
				  <spring:message code='btn.common.clear' />
			          </button>
	                  <button type="button" class="btn green" id="saveMonthReportId">
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
                       <!-- 操作日志 显示-->                   
                      <jsp:include page="../../common/dataLog.jsp"/>                     
                  </div>
               </div>
        </form>
   </div>
   <div class="modal-footer">
     <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeMonthReportId">关闭</button>
   </div>
<!-- 参数列表 -->
<script type="text/javascript">
	$("#monthReportEditFormId #proId").initProjectInfo('${monthReportVo.proId}');
	$("#monthReportEditFormId #proAttendees").initUserInfo('${monthReportVo.proAttendees}');
	var monthReoirtManager_operate='${operate}';
	$(function(){
		if(monthReoirtManager_operate=='edit'){
			//初始化上传插件
			initWebUploaderUI({
	        	_webUploaderId:'#uploaderDivId',
	        	_fileAddId:'#filePicker',
	        	_fileAddIdContinue:'#filePicker2',
	        	_dataId:'${monthReportVo.id}',
	        	_pageType:'R006-02',
	        	_editFileId:'#moduleGallery'});
	        //初始化历史数据
			initEidtUploaderUI({
				_editFileId:'#moduleGallery',
				_dataId:'${monthReportVo.id}',
				_pageType:'R006-02',
				_canDelete:true
				});
		}
	});
	
	var monthReportVal=$("#monthReportEditFormId").serializeFormJson();
    var monthReportColumn = {
        proId:" <spring:message code='label.dailyReportManager.proNum' />",
        proAttendees:"<spring:message code='label.monthReportManager.proAttendees' />"  
    };
	
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/performanceManager/monthReportManager/monthReportManagerEdit.js"></script>