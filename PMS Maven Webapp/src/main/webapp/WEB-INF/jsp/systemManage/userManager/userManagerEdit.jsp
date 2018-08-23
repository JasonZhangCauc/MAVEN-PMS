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
				                       <font style="vertical-align: inherit;"><spring:message code='label.userManage.userInfo' /></font>
				                 </font>
			                 </span>
			             </div>
			             <div class="tools">
			                 <a href="javascript:;" class="collapse"> </a>
			                 <a href="javascript:;" class="reload"> </a>
			             </div>
			         </div>
			         <div class="portlet-body form">
				          <form class="form-horizontal form-bordered" id="userEditFormId" autocomplete="off" enctype="multipart/form-data"
						     data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						     <input type="hidden" value="${vo.id}" name="id" id="userId"/>
						     <input type="hidden" value="" name="changeDetails" id="changeDetails" />
					         <div class="form-body">
						          <div class="form-group">
			                        <!-- 工号 -->
								    <label class="control-label col-md-2">
									    <spring:message code='label.userManage.workNumber' />
									    <span class="required">* </span>
								    </label>
								    <div class="col-md-4">
									    <input type="text" 
											   class="form-control" 
											   id="userAccount" 
											   name="userAccount" 
											   value="${vo.userAccount}"
											   data-rule="required;length[~25];remote[<%=request.getContextPath()%>/systemManage/queryUserInfoByChecking, id]"
											   placeholder="<spring:message code='common.laber.mustInputData'/>" />
								    </div>
									<!-- 姓名 -->
									<label class="control-label col-md-2">
										<spring:message code='label.userManage.userName' />
										<span class="required">* </span>
									</label>
									<div class="col-md-4">
										<input type="text" 
											   class="form-control" 
											   id="userName" 
											   name="userName" 
											   data-rule="required;length[~25];"
											   value="${vo.userName}"
											   placeholder="<spring:message code='common.laber.mustInputData'/>" />
									</div>
				                  </div>
				                  <div class="form-group">
				                        <!-- 性别 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userSex' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<select class="bs-select form-filter form-control" 
												data-size="10" 
												data-rule="required;"
												title="<spring:message code='message.pleaseselect' />" 
												id="userSex"
												name="userSex">
												
						                    </select>
										</div>
					                    <!-- 邮箱 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userEmail' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<input type="text" 
												class="form-control" 
												id="userEmail"
												data-rule="required;length[~25];email"
												name="userEmail" 
												value="${vo.userEmail}"
												placeholder="<spring:message code='common.laber.mustInputData'/>" />
										</div>
				                  </div>
				                  <div class="form-group">
										<!-- 部门 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userDept' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<input type="text" 
												class="form-control" 
												readonly="readonly" 
												id="deptTwo"
												name="deptName"
												data-target="#showDeptModalId" 
												data-toggle="modal"
												placeholder="<spring:message code='common.laber.mustInputData'/>" />
											<input type="hidden" data-rule="required;" name="deptId" id="deptOne" value="${vo.deptId}" />
										</div>
										<!-- 岗位 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userPosition' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<select class="bs-select form-filter form-control" 
												data-size="10" 
												data-rule="required;"
												multiple="multiple"
												title="<spring:message code='message.pleaseselect' />" 
												id="userPosition"
												name="userPosition">
						                    </select>
										</div>
								  </div>
								  <div class="form-group">
								  		<!-- 年龄 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userAge' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<input type="text" 
												class="form-control" 
												id="userAge" 
												name="userAge" 
												data-rule="required;integer(+)"
												value="${vo.userAge}"
												placeholder="<spring:message code='common.laber.mustInputData'/>" />
										</div>
										<!-- 身份证 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userIdcard' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<input type="text" 
												class="form-control" 
												id="userIdcard"
												data-rule="required;IDcard;length[~25];remote[<%=request.getContextPath()%>/systemManage/verificationIdentityCard, id]"
												name="userIdcard" 
												value="${vo.userIdcard}"
												onkeyup="getBirthDay();"
												placeholder="<spring:message code='common.laber.mustInputData'/>" />
										</div>
								  </div>
								  <div class="form-group">
										<!-- 手机 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userMobile' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<input type="text" 
												class="form-control" 
												id="userMobile"
												name="userMobile" 
												data-rule="required;length[~15];mobile"
												value="${vo.userMobile}"
												placeholder="<spring:message code='common.laber.mustInputData'/>" />
										</div>
										<!-- 用户性质 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userNature' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<select class="bs-select form-filter form-control" 
												data-size="10" 
												data-rule="required;"
												title="<spring:message code='message.pleaseselect' />" 
												id="userNature"
												name="userNature">
						                    </select>
										</div>
									</div>
									<div class="form-group">
										<!-- 出生日期 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userBirth' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<input type="text" 
											class="date-picker form-control dateSelect"
											id="userBirth"
											name="userBirth" 
											data-date-format="yyyy-mm-dd"
											data-rule="required;"
											readonly = "readonly"
											value="${vo.userBirth}" 
											placeholder="<spring:message code='message.pleaseselect'/>" >
										</div>
										<!-- 入职日期 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.entryDate' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<input type="text" 
											class="date-picker form-control dateSelect"
											id="entryDate"
											name="entryDate" 
											readonly = "readonly"
											data-date-format="yyyy-mm-dd"
											data-rule="required;"
											value="${vo.entryDate}" 
											placeholder="<spring:message code='message.pleaseselect'/>" >
										</div>
							       </div>
							      <div class="form-group">
										<!-- 语言 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.language' />
										</label>
										<div class="col-md-4">
											<div class="md-radio-inline">
												<div class="md-radio">
													<input type="radio" name="userLanguage" id="userLanguage0" value="0"
														class="md-radiobtn" checked> 
													<label for="userLanguage0">
														<span></span><span class="check"></span> <span class="box"></span>
														<spring:message code='label.userManage.languageZh' />
													</label>
												</div>
												<div class="md-radio has-error">
													<input type="radio" name="userLanguage" id="userLanguage1" value="1"
														class="md-radiobtn"> 
													<label for="userLanguage1">
														<span></span><span class="check"></span> <span class="box"></span>
														<spring:message code='label.userManage.languageCn' />
													</label>
												</div>
											</div>
										</div>
										<!-- 固定电话 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userPhone' />
										</label>
										<div class="col-md-4">
											<input type="text" 
												class="form-control" 
												id="userPhone" 
												name="userPhone" 
												data-rule="length[~25];"
												value="${vo.userPhone}"
												placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
										</div>
								  </div>
								  <div class="form-group">
										<!-- 籍贯-->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userPlace' />
										</label>
										<div class="col-md-4">
											<select class="bs-select form-filter form-control" 
												data-size="10" 
												title="<spring:message code='message.pleaseselect' />" 
												id="userPlace"
												name="userPlace">
						                    </select>
										</div>
										<!-- 政治面貌 -->
										<label class="control-label col-md-2"><spring:message code='label.userManage.userFace' /></label>
										<div class="col-md-4">
											<select class="bs-select form-filter form-control" 
												data-size="10" 
												title="<spring:message code='message.pleaseselect' />"
												id="userFace" 
												name="userFace">
						                    </select>
										</div>
									</div>
								  <div class="form-group">
										<!-- 通讯地址 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userAddress' />
										</label>
										<div class="col-md-10">
											<textarea class="form-control" rows="2" id="userAddress" 
											data-rule="length[~250];"
											name="userAddress"
											placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
											value="${vo.userAddress}">${vo.userAddress}</textarea>
										</div>
								  </div>
								  <div class="form-group">
										<!-- 毕业院校 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.diplomaSchool' />
										</label>
										<div class="col-md-10">
											<textarea class="form-control" rows="2" id="diplomaSchool" 
											data-rule="length[~50];"
											name="diplomaSchool"
											placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
											value="${vo.diplomaSchool}">${vo.diplomaSchool}</textarea>
										</div>
								  </div>
								  <div class="form-group">
								  		<!-- 学历 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userRecord' />
										</label>
										<div class="col-md-4">
											<select class="bs-select form-filter form-control" 
												data-size="10" 
												title="<spring:message code='message.pleaseselect' />" 
												id="userRecord"
												name="userRecord">
						                    </select>
										</div>
										<!-- 毕业日期 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.diplomaDate' />
										</label>
										<div class="col-md-4">
											<input type="text" 
											class="date-picker form-control dateSelect"
											id="diplomaDate"
											name="diplomaDate" 
											readonly = "readonly"
											data-date-format="yyyy-mm-dd"
											value="${vo.diplomaDate}" 
											placeholder="<spring:message code='message.pleaseselect'/>" >
										</div>
								   </div>
								   <div class="form-group">
								   		<!-- 备注 -->
										<label class="control-label col-md-2">
											<spring:message code='label.userManage.userRemark' /> 
										</label>
										<div class="col-md-10">
											<textarea class="form-control" rows="3" id="userRemark" 
											data-rule="length[~1000];"
											name="userRemark"
											placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
											value="${vo.userRemark}">${vo.userRemark}</textarea>
										</div>
								   </div>
								  <div class="form-group">
										<label class="control-label col-md-2"> 
											<spring:message code='label.userManage.userPic' /> 
										</label>
										<div class="col-md-4">
											<!-- <input id="userPicPath" type="file"  name="userPicPath" class="file" data-overwrite-initial="false" data-min-file-count="1" > -->
											<div class="fileinput fileinput-new" data-provides="fileinput">
												<div class="fileinput-new thumbnail">
													<img src="<%=request.getContextPath()%>/${vo.userPic}" />
												</div>
												<div class="fileinput-preview fileinput-exists thumbnail"></div>
												<div>
													<span class="btn red btn-outline btn-file"> 
													<span class="fileinput-new"><spring:message code='common.label.select' /> </span> 
													<span class="fileinput-exists"><spring:message code='common.label.reelection' /> 
													</span> <input type="file" name="userPicPath" accept="image/*"> </span> 
													<a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput">
													   <spring:message code='btn.common.delete' /> 
													</a>
												</div>
											</div>
										</div>
								  </div>
						          <div class="form-actions">
					                 <div class="modal-footer">
					                 	<div class="col-md-offset-2 col-md-9">
                                         <button type="button" class="btn blue" id="saveUserId"><i class="fa fa-check"></i> <spring:message code='btn.common.save' /></button>
					                 	</div>
					                 </div>
						          </div>
				             </div>
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
    	<button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeUserEditId"><spring:message code='btn.common.close'/></button>
 	</div>
</div>
<script type="text/javascript">
	//下拉框数据初始化
	$("#userEditFormId #userSex").initDic('${vo.userSex}',codeBasicInfo.sex);
	$("#userEditFormId #userPlace").initDic('${vo.userPlace}',codeBasicInfo.place);
	$("#userEditFormId #userFace").initDic('${vo.userFace}',codeBasicInfo.face);
	$("#userEditFormId #userRecord").initDic('${vo.userRecord}',codeBasicInfo.record);
	$("#userEditFormId #userPosition").initDic('${vo.userPosition}',codeBasicInfo.position);
	var userLanguage= '${vo.userLanguage}';
	$("input[type='radio'][name='userLanguage'][value='"+userLanguage+"']").prop("checked","checked");
	$("#userEditFormId #deptTwo").val(getDeptByIds('${vo.deptId}'));
	$("#userEditFormId #userNature").initDic('${vo.userNature}',codeBasicInfo.userNature);
	
	var userOldVal=$("#userEditFormId").serializeFormJson();
    var userField = {
		workerName:"<spring:message code='label.workhoursRecord.workerName' />",
		userAccount:"<spring:message code='label.userManage.workNumber' />",
		userName:"<spring:message code='label.userManage.userName' />",
		userSex:"<spring:message code='label.userManage.userSex' />",
		userEmail:"<spring:message code='label.userManage.userEmail' />",
		deptName:"<spring:message code='label.userManage.userDept' />",
		userPosition:"<spring:message code='label.userManage.userPosition' />",
		userAge:"<spring:message code='label.userManage.userAge' />",
		userIdcard:"<spring:message code='label.userManage.userIdcard' />",
		userMobile:"<spring:message code='label.userManage.userMobile' />",
		userNature:"<spring:message code='label.userManage.userNature' />",
		userBirth:"<spring:message code='label.userManage.userBirth' />",
		entryDate:"<spring:message code='label.userManage.entryDate' />",
		userLanguage:"<spring:message code='label.userManage.language' />",
		userPhone:"<spring:message code='label.userManage.userPhone' />",
		userPlace:"<spring:message code='label.userManage.userPlace' />",
		userFace:"<spring:message code='label.userManage.userFace' />",
		userAddress:"<spring:message code='label.userManage.userAddress' />",
		diplomaSchool:"<spring:message code='label.userManage.diplomaSchool' />",
		userRecord:"<spring:message code='label.userManage.userRecord' />",
		diplomaDate:"<spring:message code='label.userManage.diplomaDate' />",
		userRemark:"<spring:message code='label.userManage.userRemark' />" 	
	};
	
</script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/userManager/userManagerEdit.js"></script>