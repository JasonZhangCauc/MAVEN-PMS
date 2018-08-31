<!-- 项目新增/编辑界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
	<div class="col-md-12">
	    <div class="portlet light bordered">
	        <div class="portlet-body">
	            <div class="portlet-title tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active">
                            <a href="#tab_1" data-toggle="tab"><spring:message code='label.workHoursManager.basicInformation' /></a>
                        </li>
                        <c:if test="${operate=='edit'}">
                        	<li>
	                            <a href="#tab_2" data-toggle="tab"><spring:message code='label.workHoursManager.milestone' /></a>
	                        </li> 
	                        <li>
	                            <a href="#tab_3" data-toggle="tab"><spring:message code='label.workHoursManager.deliverables' /></a>
	                        </li>
                        </c:if>
                    </ul>
                    <div class="tab-content">
                    	<div class="tab-pane active" id="tab_1">
                    		<div class="portlet light bordered">
	                        	<div class="portlet-body form">
	                        		<form class="form-horizontal form-bordered" id="projectEditFormId" autocomplete="off" enctype="multipart/form-data"
					    				data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
					    				<!-- 项目ID -->
					    				<a style="display:none" id="refurbishProjectId" ></a>
					    				<input type="hidden" value="${projectVo.id}" id="projectId" name="id"/>
					    				<input type="hidden" value="${projectVo.projectStatus }" name="projectStatus" />
					    				<input type="hidden" value="" name="changeDetails" id="changeDetails" />
					    				<div class="form-group">
					                        <!-- 创建人 -->
										    <label class="control-label col-md-1">
											    <spring:message code='common.label.createBy' />
										    </label>
										    <div class="col-md-4">
											    <input type="text" 
													   class="form-control" 
													   id="createByName" 
													   readonly="readonly"
													   name="createBy" 
													   value="${projectVo.createByName}"
													   placeholder="<spring:message code='common.laber.produceBySys'/>" />
										    </div>
										    <input type="hidden" name="createBy" value="${projectVo.createBy}" />
											<!-- 创建部门-->
											<label class="control-label col-md-1"><spring:message code='common.label.createDepartment' /></label>
											<div class="col-md-4">
												<input type="text" 
													   class="form-control" 
													   id="createDeptName" 
													   readonly="readonly"
													   placeholder="<spring:message code='common.laber.produceBySys'/>" />
											</div>
											<input type="hidden" value="${projectVo.createDept}" id="createDept" />
					                     </div>
					                     <div class="form-group">
					                     	<!-- 创建时间-->
											<label class="control-label col-md-1"><spring:message code='common.label.createDate' /></label>
											<div class="col-md-4">
												<input type="text" 
													   class="form-control" 
													   id="createDate" 
													   name="createDate" 
													   readonly="readonly"
													   value="${projectVo.createDate}"
													   placeholder="<spring:message code='common.laber.produceBySys'/>" />
											</div>
					                     	<!-- 项目编号 -->
										    <label class="control-label col-md-1">
											    <spring:message code='label.projectManager.projectNo' />
											    <span class="required">* </span>
										    </label>
										    <div class="col-md-4">
										    	<input type="text" 
												   class="form-control" 
												   id="projectNo" 
												   name="projectNo" 
												   readonly="readonly"
												   value="${projectVo.projectNo}"
												   placeholder="<spring:message code='common.laber.produceBySys'/>" />
										    </div>
					                     </div>
					                     <div class="form-group">
					                     	<!-- 合同编号 -->
										    <label class="control-label col-md-1">
											    <spring:message code='lable.contract.contractNo' />
											    <span class="required">* </span>
										    </label>
										    <div class="col-md-4">
										    	<input type="text" 
												   	class="form-control" 
												   	id="contractNoSelect" 
												   	name="contractNo" 
												   	readonly="readonly" 
												  	data-rule="required;length[~25];"
												   	data-target="#selectContractModalId" 
												   	data-toggle="modal"
												   	value="${projectVo.contractNo}" 
												   	placeholder="<spring:message code='message.pleaseselect'/>"
												   	/> 
										    </div>
										    <input type="hidden" name ="contractId" id="contractIdSelect" value="${projectVo.contractId}" />
										    <!-- 所属客户 -->
										    <label class="control-label col-md-1">
											    <spring:message code='label.projectManager.belongCustomerid' />
											    <span class="required">* </span>
										    </label>
										    <div class="col-md-4">
										    	<select class="bs-select form-filter form-control" 
													data-size="10" 
													data-width="70%"
													data-rule="required;"
													disabled
													title="<spring:message code='common.laber.autoWrite' />" 
													id="belongCustomerid"
													name="belongCustomerid">
							                    </select>
										    </div>
					                     </div>
					                     <div class="form-group">
					                     	<!-- 所属产品 -->
					                     	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.belongProduct' />
											    <span class="required">* </span>
										    </label>
										    <div class="col-md-4">
										    	<select class="bs-select form-filter form-control" 
													data-size="10" 
													data-width="70%"
													data-rule="required;"
													disabled
													title="<spring:message code='common.laber.autoWrite' />" 
													id="belongProduct"
													name="belongProduct">
							                    </select>
										    </div>
					                     	<!-- 项目阶段 -->
					                     	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.projectStage' />
											    <span class="required">* </span>
										    </label>
										    <div class="col-md-4">
										    	<select class="bs-select form-filter form-control" 
													data-size="10" 
													data-width="70%"
													data-rule="required;"
													title="<spring:message code='message.pleaseselect' />" 
													id="projectStage"
													name="projectStage">
							                    </select>
										    </div>
					                     </div>
					                     <div class="form-group">
					                     	<!-- 项目标题 -->
					                     	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.projectName' />
											    <span class="required">* </span>
										    </label>
										    <div class="col-md-9">
										    	<textarea class="form-control" style="width: 90%;" rows="1" 
										    		id="projectName" name="projectName" data-rule="required;length[~250];"
													readonly="readonly"
													placeholder="<spring:message code='common.laber.autoWrite'/>" 
													value="${projectVo.projectName}">${projectVo.projectName}</textarea>
										    </div>
					                   	 </div>
					                     <div class="form-group">
					                   	 	<!-- 实施负责人 -->
					                   	 	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.implementHead' />
											    <span class="required">* </span>
										    </label>
										    <div class="col-md-4">
										    	<select class="bs-select form-filter form-control" 
													data-size="10" 
													data-width="70%"
													data-rule="required;"
													title="<spring:message code='message.pleaseselect' />" 
													id="implementHead"
													name="implementHead">
							                    </select>
										    </div>
					                   	 	<!-- 研发负责人 -->
					                   	 	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.exploitHead' />
											    <span class="required">* </span>
										    </label>
										    <div class="col-md-4">
										    	<select class="bs-select form-filter form-control" 
													data-size="10" 
													data-width="70%"
													data-rule="required;"
													title="<spring:message code='message.pleaseselect' />" 
													id="exploitHead"
													name="exploitHead">
							                    </select>
										    </div>
					                   	 </div>
					                     <div class="form-group">
					                     	<!-- 立项日期 -->
					                     	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.projectDate' />
											    <span class="required">* </span>
										    </label>
										    <div class="col-md-4">
										    	<input type="text" 
													class="date-picker form-control dateSelect"
													id="projectDate"
													name="projectDate" 
													value="${projectVo.projectDate}" 
													data-rule="required;"
													placeholder="<spring:message code='message.pleaseselect'/>" >
										    </div>
					                     	<!-- 计划工时 -->
					                   	 	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.planWorkHours' />
											    <span class="required">* </span>
										    </label>
										    <div class="col-md-4">
										    	<input type="text" 
													class="form-control" 
													id="planWorkHours" 
													name="planWorkHours" 
													data-rule="required;positiveNum;"
													value="${projectVo.planWorkHours}"
													placeholder="<spring:message code='common.laber.mustInputData'/>" />
										    </div>
					                     </div>
					                   	 <div class="form-group">
					                   	 	<!-- 项目说明 -->
					                   	 	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.projectTitle' />
										    </label>
										    <div class="col-md-9">
										    	<textarea class="form-control" style="width: 90%;" rows="2" id="projectTitle" data-rule="length[~1000];"
													name="projectTitle"
													placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
													value="${projectVo.projectTitle}">${projectVo.projectTitle}</textarea>
										    </div>
					                   	 </div>
					                   	 <div class="form-group">
					                   	 	<!-- 范围说明 -->
					                   	 	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.scopeDescription' />
										    </label>
										    <div class="col-md-9">
										    	<textarea class="form-control" style="width: 90%;" rows="2" id="scopeDescription" data-rule="length[~1000];"
													name="scopeDescription"
													placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
													value="${projectVo.scopeDescription}">${projectVo.scopeDescription}</textarea>
										    </div>
					                   	 </div>
					                   	 <div class="form-group">
					                   	 	<!-- 风险预估 -->
					                   	 	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.riskAssessment' />
										    </label>
										    <div class="col-md-9">
										    	<textarea class="form-control" style="width: 90%;" rows="2" 
										    	id="riskAssessment" 
										    	data-rule="length[~1000];"
												name="riskAssessment"
												placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
												value="${projectVo.riskAssessment}">${projectVo.riskAssessment}</textarea>
										    </div>
					                   	 </div>
					                   	 <div class="form-group">
					                   	 	<!-- 备注 -->
					                   	 	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.remark' />
										    </label>
										    <div class="col-md-9">
										    	<textarea class="form-control" style="width: 90%;" rows="2" 
										    	id="remark" 
										    	data-rule="length[~1000];"
												name="remark"
												placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
												value="${projectVo.remark}">${projectVo.remark}</textarea>
										    </div>
					                   	 </div>
					                   	 <div class="form-group">
					                   	 	<!-- 附件 -->
					                   	 	<label class="control-label col-md-1">
											    <spring:message code='common.label.attachment' />
										    </label>
										    <div class="col-md-9">
									            <div id="projectModuleGallery" class="editableGallery"></div>
									            <div id="projectUploaderDivId" class="editableGallery">        
						                            <div class="queueList">
						                                <div id="dndArea" class="placeholder">
						                                    <div id="projectFilePicker"></div>
						                                    <p>单次最多可选10张</p>
						                                </div>
						                            </div>
						                            <div class="statusBar" style="display:none;">
						                                <div class="progress">
						                                    <span class="text">0%</span> <span class="percentage"></span>
						                                </div>
						                                <div class="info"></div>
						                                <div class="btns">
						                                    <div id="projectFilePicker2" class="addFileBtn"></div>
						                                </div>
						                            </div>
								                </div> 
											</div>
					                   	 </div>
					                   	 <div class="form-actions">
											<div class="row">
												<div class="modal-footer">
													<c:if test="${projectVo.projectStatus!=1 && projectVo.projectStatus!=2}">
														<button type="button" class="btn green" id="saveProjectId" >
															<i class="fa fa-check"></i>
															<spring:message code='btn.common.save' />
														</button>
													</c:if>
													<c:if test="${projectVo.projectStatus==0 }">
														<auth:auth resourceCode="R004_0103">
															<button type="button" class="btn green" id="submitProjectId" >
																<i class="fa fa-check"></i>
																<spring:message code='btn.common.submit' />
															</button>
														</auth:auth>
													</c:if>
													<button type="button" data-dismiss="modal" class="btn default"
														id="closeProjectId">
														<i class="fa fa-mail-forward"></i>
														<spring:message code='btn.common.close' />
													</button>
												</div>
											</div>
										</div>
					    			</form>
	                        	</div>
	                        </div>
                    	</div>
                    	<!-- 里程碑 -->
                        <div class="tab-pane" id="tab_2">
                        	<div class="row">
							    <div class="col-md-12">
							       <div class="mt-element-ribbon bg-grey-steel">
							            <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
							                 <div class="ribbon-sub ribbon-clip"></div> 
							                 <span class="caption-subject bold uppercase"><spring:message code='lable.milepost.milepostInfo' /></span> 
								        </div>
								        <div class="portlet light portlet-fit portlet-datatable bordered">
								            <div class="portlet-title">							               
								                <div class="actions">
								                    <div class="btn-group btn-group-devided" data-toggle="buttons">
								                    	<auth:auth resourceCode="R004_0104">
															<a href="<%=request.getContextPath()%>/projectManager/milepostManagerEdit?operate=add&projectId=${projectVo.id}" data-target="#newMilepostModalId" 
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
								                    <table class="table table-striped table-bordered table-hover" id="milepostMianTableId"></table>
								                </div>
								            </div>
								        </div>
								     </div>
							    </div>
							</div>
                        </div>
                        <!-- 交付物 -->
                        <div class="tab-pane" id="tab_3">
                        	<div class="row">
							    <div class="col-md-12">
							       <div class="mt-element-ribbon bg-grey-steel">
							            <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
							                 <div class="ribbon-sub ribbon-clip"></div> 
							                 <span class="caption-subject bold uppercase"><spring:message code='lable.deliveries.deliveriesInfo' /></span> 
								        </div>
								        <div class="portlet light portlet-fit portlet-datatable bordered">
								            <div class="portlet-title">							               
								                <div class="actions">
								                    <div class="btn-group btn-group-devided" data-toggle="buttons">
								                    	<auth:auth resourceCode="R004_0106">
															<a href="<%=request.getContextPath()%>/projectManager/deliveriesManagerEdit?operate=add&projectId=${projectVo.id}" data-target="#newDeliveriesModalId" 
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
								                    <table class="table table-striped table-bordered table-hover" id="deliveriesMianTableId"></table>
								                </div>
								            </div>
								        </div>
								     </div>
							    </div>
							</div>
                        </div>
                        <!-- end 交付物 -->
                    </div>
                </div>
	        </div>
	    </div>
	</div>
</div>
<!-- 合同选择弹出框 -->
<div id="selectContractModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:80%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!-- 里程碑弹出框 -->
<div id="newMilepostModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:60%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!-- 交付物弹出框 -->
<div id="newDeliveriesModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:60%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!--  -->
<!-- 参数列表 -->
<script type="text/javascript">
	$("#projectEditFormId #projectStage").initDic('${projectVo.projectStage}',codeBasicInfo.projectStage);
	$("#projectEditFormId #implementHead").initUserInfo('${projectVo.implementHead}');
	$("#projectEditFormId #exploitHead").initUserInfo('${projectVo.exploitHead}');
	$("#projectEditFormId #belongCustomerid").initCustomerInfo('${projectVo.belongCustomerid}');
	$("#projectEditFormId #belongProduct").initDic('${projectVo.belongProduct}',codeBasicInfo.PRODUCT);
	$("#projectEditFormId #createDeptName").val(getDeptByIds($("#projectEditFormId #createDept").val()));
	var projectEdit_submitMsg="<spring:message code='lable.projectManager.submitProjectMsg' />";  //确认提交该项目吗？
	var projectEdit_projectEdit="<spring:message code='lable.projectManager.projectEdit' />";   //项目编辑
	$("#projectEditFormId #belongCustomerid").removeAttr("disabled");
    $("#projectEditFormId #belongProduct").removeAttr("disabled");
	var projectOldVal=$("#projectEditFormId").serializeFormJson();
	$("#projectEditFormId #belongCustomerid").attr("disabled",true);
    $("#projectEditFormId #belongProduct").attr("disabled",true);
	var projectField = {
		contractNo:"<spring:message code='lable.contract.contractNo' />",
		belongCustomerid:"<spring:message code='label.projectManager.belongCustomerid' />",
		belongProduct:"<spring:message code='label.projectManager.belongProduct' />",
		projectStage:"<spring:message code='label.projectManager.projectStage' />",
		projectName:"<spring:message code='label.projectManager.projectName' />",
		implementHead:"<spring:message code='label.projectManager.implementHead' />",
		exploitHead:"<spring:message code='label.projectManager.exploitHead' />",
		projectDate:"<spring:message code='label.projectManager.projectDate' />",
		planWorkHours:"<spring:message code='label.projectManager.planWorkHours' />",
		projectTitle:"<spring:message code='label.projectManager.projectTitle' />",
		scopeDescription:"<spring:message code='label.projectManager.scopeDescription' />",
		riskAssessment:"<spring:message code='label.projectManager.riskAssessment' />",
		remark:"<spring:message code='label.projectManager.remark' />"
	};
	
	//里程碑
	var milepostAdd_milepostName = "<spring:message code='lable.milepost.milepostName' />";   			//里程碑名称
	var milepostAdd_planCompletedate = "<spring:message code='lable.milepost.planCompletedate' />";   	//计划完成时间
	var milepostAdd_correspondingPhase = "<spring:message code='lable.milepost.correspondingPhase' />";  //对应阶段
	var milepostAdd_milepostStatus = "<spring:message code='lable.milepost.milepostStatus' />";   		//里程碑状态
	var milepostAdd_whetherDelay = "<spring:message code='lable.milepost.whetherDelay' />";   			//是否延误
	var milepostAdd_adjustDate = "<spring:message code='lable.milepost.adjustDate' />";  			 	//调整时间
	var milepostAdd_deviationDay = "<spring:message code='lable.milepost.deviationDay' />";   			//偏差时长
	var milepostAdd_milepostDescribe = "<spring:message code='lable.milepost.milepostDescribe' />";   	//里程碑描述
	var milepostAdd_remark = "<spring:message code='lable.milepost.remark' />";   						//备注
	var milepostAdd_deleteMsg= "<spring:message code='lable.milepost.deleteMilepostMsg' />";   			//确认删除该里程碑吗？
	var gridMilepost=new Datatable();//里程碑Datatable
	var hasEditAuthMilepost = isUserHasAuth("R004_0105");//编辑权限
	var hasDelAuthMilepost = isUserHasAuth("R004_0104");//删除权限
	
	//交付物
	var deliveriesAdd_deliveriesName= "<spring:message code='lable.deliveries.deliveriesName' />";   			//交付物名称
	var deliveriesAdd_planDeliveriesDate= "<spring:message code='lable.deliveries.planDeliveriesDate' />";   	//计划交付时间
	var deliveriesAdd_whetherContract= "<spring:message code='lable.deliveries.whetherContract' />";   		//是否记入合同
	var deliveriesAdd_personLiable= "<spring:message code='lable.deliveries.personLiable' />";   				//责任人
	var deliveriesAdd_whetherDeliver= "<spring:message code='lable.deliveries.whetherDeliver' />";   			//是否已交付
	var deliveriesAdd_actualDeliveriesDate= "<spring:message code='lable.deliveries.actualDeliveriesDate' />"; //实际交付时间
	var deliveriesAdd_remark= "<spring:message code='lable.milepost.remark' />";   							//备注
	var deliveriesAdd_attachment= "<spring:message code='common.label.attachment' />";   						//附件
	var deliveriesAdd_deleteMsg= "<spring:message code='lable.deliveries.deleteDeliveriesMsg' />";   						//确认删除该交付物吗？
	var gridDeliveries=new Datatable();//交付物Datatable
	var hasEditAuthDeliveries = isUserHasAuth("R004_0106");//编辑权限
	var hasDelAuthDeliveries = isUserHasAuth("R004_0107");//删除权限	
	//附件初始化
	var deliveriesEdit_operate='${operate}';
	$(function(){
		if(deliveriesEdit_operate=='edit'){
			//初始化上传插件
			initWebUploaderUI({
	        	_webUploaderId:'#projectUploaderDivId',
	        	_fileAddId:'#projectFilePicker',
	        	_fileAddIdContinue:'#projectFilePicker2',
	        	_dataId:'${projectVo.id}',
	        	_pageType:'R004-0201',
	        	_editFileId:'#projectModuleGallery'});
	        //初始化历史数据
			initEidtUploaderUI({
				_editFileId:'#projectModuleGallery',
				_dataId:'${projectVo.id}',
				_pageType:'R004-0201',
				_canDelete:true
				});
		}
	});
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManagement/projectManager/projectManagerEdit.js"></script>
