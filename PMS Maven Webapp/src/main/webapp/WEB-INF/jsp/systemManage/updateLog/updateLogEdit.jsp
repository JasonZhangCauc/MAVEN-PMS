<!-- 更新日志新增/编辑界面 ZHOUMIN 20180305 -->
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
					style="vertical-align: inherit;"> <font
						style="vertical-align: inherit;">${vo.currentTime}</font>
				</font>
				</span>
			</div>
		</div>
    </div>
</div>
<div class="modal-body todo-task-modal-body">
	<div id="bootstrap_alerts_demo"></div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet light portlet-fit bordered">
				 <div class="portlet-title">
		             <div class="caption">
		                 <i class="fa fa-info-circle font-red"></i>
		                 <span class="caption-subject font-red sbold uppercase">
			                 <font style="vertical-align: inherit;">
			                       <font style="vertical-align: inherit;"><spring:message code='lable.updateLog' /></font>
			                 </font>
		                 </span>
		             </div>
		             <div class="tools">
		                 <a href="javascript:;" class="collapse"> </a>
		                 <a href="javascript:;" class="reload"> </a>
		             </div>
		         </div>
		         <div class="portlet-body form">
					<form class="form-horizontal form-bordered" id="updateLogEditFormId"
						autocomplete="off" enctype="multipart/form-data"
						data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${vo.id}" name="id" />
						<div class="form-group">
							<!-- 日期 -->
							<label class="control-label col-md-2"> 
								<spring:message code='common.label.date' />
								<span class="required">*</span>
							</label>
							<div class="col-md-4">
								<input type="text" 
									id="updateDate"
									name="updateDate" 	
									value="${vo.updateDate}"
									data-rule="required;"						
									class="date-picker form-control dateSelect" 
									data-date-format="yyyy-mm-dd">
							</div>
							<!-- 版本号 -->
							<label class="control-label col-md-2"> 
								<spring:message code='lable.updateLog.versionNum' />
								<span class="required">*</span>
							</label>
							<div class="col-md-4">
								<input type="text" 
									name="versionNum" 
									id="versionNum"
									value="${vo.versionNum}"
									data-rule="required;length[~25];"
									class="form-control"
			                    	placeholder="<spring:message code='common.laber.mustInputData'/>"> 
							</div>
						</div>
						<div class="form-group">
							<!-- 内容 -->
							<label class="control-label col-md-2"> 
								<spring:message code='label.msgProcess.mText' />
							</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="12" id="updateContent"
									data-rule="length[~2000];" name="updateContent"
									placeholder="<spring:message code='common.laber.mustInputData'/>"
									value="${vo.updateContent}">${vo.updateContent}</textarea>
							</div>
						</div>
						<div class="form-actions">
							<div class="modal-footer">
								<div class="col-md-offset-2 col-md-9">
								<button type="button" class="btn green" id="saveUpdateLogId">
									<spring:message code='btn.common.save' />
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
<div class="modal-footer">
	<div class="col-md-offset-11 col-md-1">
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="clearUpdateLogId"><spring:message code='btn.common.close'/></button>
    </div>
</div>	
<script type="text/javascript">
	$('.date-picker').datepicker({
        rtl: App.isRTL(),
        autoclose: true
    });
    
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/updateLog/updateLogEdit.js"></script>