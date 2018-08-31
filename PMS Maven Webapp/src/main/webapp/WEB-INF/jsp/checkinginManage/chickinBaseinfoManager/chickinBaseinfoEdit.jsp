<!-- 项目维护新增/编辑界面 zm 20180703 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>

<%@ page import="com.ps.result.systemmanage.UserVo"%>
<%
	UserVo loginUser = (UserVo) request.getSession().getAttribute("user");
%>
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
	<div id="bootstrap_alerts_demo"></div>
       <!-- Begin: Query conditions -->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet light portlet-fit bordered">
				 <div class="portlet-title">
		             <div class="caption">
		                 <i class="fa fa-info-circle font-red"></i>
		                 <span class="caption-subject font-red sbold uppercase">
			                 <font style="vertical-align: inherit;">
			                       <font style="vertical-align: inherit;"><spring:message code='label.chickinginManager.cardRecord.chickinBaseinfo' /></font>
			                 </font>
		                 </span>
		             </div>
		             <div class="tools">
		                 <a href="javascript:;" class="collapse"> </a>
		                 <a href="javascript:;" class="reload"> </a>
		             </div>
		         </div>
		         <div class="portlet-body form">
					<form class="form-horizontal form-bordered" id="projectBaseInfoEditFormId"
						autocomplete="off" enctype="multipart/form-data"
						data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<input type="hidden" value="${vo.id}" name="id"/>
						<input type="hidden" value="${vo.createBy }" name="createBy"/>
						<input type="hidden"  name="changeDetails" id="changeDetails" />
						<input type="hidden" value="2" name="bqType" id="bqType" />
						<input type="hidden" value="${vo.chickinState}" name="chickinState" id="chickinState" />
						<div class="form-body">
							
							<div class="form-group">
								
								<!-- 时间 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.chickinginManager.cardRecord.time' /> 
									<span class="required">*</span>
								</label>
								
									<div class="col-md-4">
										<input class="form-control dateSelect form_datetime"
										 type="text"
										  style="width: 70%;" 
										   data-date-format="yyyy-mm-dd hh:ii"
										   readonly="readonly"
							
										  
										   data-rule="required" value="${vo.chickinTime}"
										   id="chickinTime" name="chickinTime">
									</div>
									<script>
											$('#chickinTime').datetimepicker({
											   	language:"zh-CN", //汉化
											    autoclose : true,   //选择日期后自动关闭日期选择框
											    todayHighlight : true,   //当天高亮显示
      											  autoclose: true,
											    endDate : new Date()
											});
									</script>
								<%-- <div class="col-md-4">
									<input type="text" 
										class="form-control" 
										id=expirationDate
										name="expirationDate" 
										readonly="readonly"
										value=""
										data-rule="length[~50];"
										placeholder="<spring:message code='common.laber.mustInputData'/>" />
								</div> --%>
								
								<!-- 类型 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.chickinginManager.cardRecord.type' /> 
									<span class="required">*</span> 
								</label>
								<div class="col-md-4">
									<select class="bs-select form-filter form-control"
										data-size="10" 
										data-width="70%"
										data-rule="required;"
										
										id="chickinType" name="chickinType"> 
									</select>
								</div>
								
								<!-- 补签理由 -->
								<label class="control-label col-md-2"> 
									<spring:message code='label.chickinginManager.cardRecord.reason' /> 
								</label>
								<div class="col-md-8">
									<textarea class="form-control" rows="3" 
								     id="chickinReason" 
								     name="chickinReason"  
								     data-rule="length[~1000];"
								     >${vo.chickinReason}</textarea>
								</div>
							</div> 
							<div class="form-actions">
								<div class="modal-footer">
									<div class="col-md-offset-2 col-md-9">
									<button type="button" class="btn blue" id="saveProjectBaseInfoId">
										<i class="fa fa-check"></i>
										<spring:message code='btn.common.save' />
									</button>
									</div>
								</div>
							</div>
						</div>
					</form>
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
	</div>
</div>   
<div class="modal-footer">
	<div class="col-md-offset-11 col-md-1">
        <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeProjectBaseInfoEditId"><spring:message code='btn.common.close'/></button>
    </div>
</div>	
<!-- 参数列表 -->
<script type="text/javascript">
	$("#projectBaseInfoEditFormId #chickinType").initDic('${vo.chickinType}',codeBasicInfo.checkType);

	var projectBaseInfoOldVal=$("#projectBaseInfoEditFormId").serializeFormJson();
	var projectBaseInfoField = {
		projectName:"<spring:message code='lable.projectBaseinfo.projectName' />",
		toDivisionName:"<spring:message code='lable.projectBaseinfo.toDivision' />",
		projectHeadName:"<spring:message code='lable.projectBaseinfo.projectHead' />", 
		businessPeopleName:"<spring:message code='lable.projectBaseinfo.businessPeople' />", 
		projectResourceName:"<spring:message code='lable.projectBaseinfo.projectResource' />", 
		productManagerName:"<spring:message code='lable.projectBaseinfo.productManager' />", 
		beginTime:"<spring:message code='label.workHoursManager.beginDate' />", 
		endTime:"<spring:message code='label.workHoursManager.endDate' />", 
		projectManagerName:"<spring:message code='lable.projectBaseinfo.projectManager' />", 
		expiredHours:"<spring:message code='lable.projectBaseinfo.expiredHours' />", 
		estimatedWorkload:"<spring:message code='lable.projectBaseinfo.estimatedWorkload' />", 
		contractAmount:"<spring:message code='lable.projectBaseinfo.contractAmount' />", 
		profitTargets:"<spring:message code='lable.projectBaseinfo.profitTargets' />", 
		projectPhase:"<spring:message code='lable.projectBaseinfo.projectPhase' />", 
		naturallyCost:"<spring:message code='lable.projectBaseinfo.naturallyCost' />", 
		projectStatus:"<spring:message code='lable.projectBaseinfo.projectStatus' />"	
	};
	
	//部门选择
   	$("#toDivisionTwo").on("click",function(){
   		var deptId = $("#toDivisionOne").val();
		$(this).attr("href",basePath+"/common/getDeptList?type=radio&showId=toDivisionTwo&hiddenId=toDivisionOne&deptId="+deptId);
   	});
   	
   	$(".form_datetime").datetimepicker({
		language: 'zh-CN',//显示中文
	    autoclose: true,
	    isRTL: App.isRTL(),
	    
	    format: "yyyy-mm-dd hh:ii",
	    fontAwesome: true,
	    pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left")
	});
</script>
<!-- 引用配置JS -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/checkinginManage/chickinBaseinfoManager/chickinBaseinfoEdit.js"></script>