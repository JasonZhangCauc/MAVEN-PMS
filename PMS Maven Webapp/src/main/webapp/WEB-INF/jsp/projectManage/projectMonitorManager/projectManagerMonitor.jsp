<!-- 项目监控界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
	<div class="col-md-12">
	    <div class="portlet light bordered">
	        <div class="portlet-body">
	            <div class="portlet-title tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active">
                            <a href="#tab_4" data-toggle="tab"><spring:message code='label.workHoursManager.basicInformation' /></a>
                        </li>
                       	<li>
                            <a href="#tab_5" data-toggle="tab"><spring:message code='label.workHoursManager.milestone' /></a>
                        </li> 
                        <li>
                            <a href="#tab_6" data-toggle="tab"><spring:message code='label.workHoursManager.deliverables' /></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                    	<div class="tab-pane active" id="tab_4">
                    		<div class="portlet light bordered">
	                        	<div class="portlet-body form">
	                        		<form class="form-horizontal form-bordered" id="projectMonitorFormId" autocomplete="off" enctype="multipart/form-data"
					    				data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
					    				<a style="display:none" id="refurbishMonitorId" ></a>
					    				<!-- 项目ID -->
					    				<input type="hidden" value="${projectVo.id}" id="projectId" name="id"/>
					    				<input type="hidden" value="${projectVo.projectStatus }" name="projectStatus" />
					    				<input type="hidden" value="" name="changeDetails" id="changeDetails" />
					    				<div class="form-group">
					                        <!-- 创建人 -->
										    <label class="control-label col-md-1">
											    <spring:message code='common.label.createBy' />
											    <span class="required">* </span>
										    </label>
										    <div class="col-md-4">
											    <input type="text" 
													   class="form-control" 
													   id="createByName" 
													   readonly="readonly"
													   name="createBy" 
													   value="${projectVo.createByName}"/>
										    </div>
										    <input type="hidden" name="createBy" value="${projectVo.createBy}" />
											<!-- 创建部门-->
											<label class="control-label col-md-1"><spring:message code='common.label.createDepartment' /></label>
											<div class="col-md-4">
												<input type="text" 
													   class="form-control" 
													   id="createDeptName" 
													   readonly="readonly"/>
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
													   value="${projectVo.createDate}" />
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
												   placeholder="<spring:message code='common.laber.mustInputData'/>"
												   />
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
												   	value="${projectVo.contractNo}"
												   	placeholder="<spring:message code='common.laber.mustInputData'/>"
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
													title="<spring:message code='message.pleaseselect' />" 
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
													title="<spring:message code='message.pleaseselect' />" 
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
													disabled
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
										    <div class="col-md-10">
										    	<textarea class="form-control" style="width: 100%;" rows="1" 
										    		id="projectName" 
										    		name="projectName" 
										    		data-rule="length[~250];"
										    		placeholder="<spring:message code='common.laber.mustInputData'/>"
													readonly="readonly" value="${projectVo.projectName}">${projectVo.projectName}</textarea>
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
													disabled
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
													disabled
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
													readonly="readonly"
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
													readonly="readonly"
													data-rule="required;positiveNum;"
													value="${projectVo.planWorkHours}"
													placeholder="<spring:message code='common.laber.mustInputData'/>"
												   />
										    </div>
					                     </div>
					                   	 <div class="form-group">
					                   	 	<!-- 项目说明 -->
					                   	 	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.projectTitle' />
										    </label>
										    <div class="col-md-10">
										    	<textarea class="form-control" readonly="readonly" style="width: 100%;" 
										    	rows="2" id="projectTitle" 
										    	data-rule="length[~1000];"
										    	placeholder="<spring:message code='common.laber.noneMustInputData'/>"											  
												name="projectTitle" value="${projectVo.projectTitle}">${projectVo.projectTitle}</textarea>
										    </div>
					                   	 </div>
					                   	 <div class="form-group">
					                   	 	<!-- 范围说明 -->
					                   	 	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.scopeDescription' />
										    </label>
										    <div class="col-md-10">
										    	<textarea class="form-control" 
										    	readonly="readonly" style="width: 100%;" 
										    	rows="2" 
										    	id="scopeDescription" 
										    	data-rule="length[~1000];"
										    	placeholder="<spring:message code='common.laber.noneMustInputData'/>"
												name="scopeDescription" value="${projectVo.scopeDescription}">${projectVo.scopeDescription}</textarea>
										    </div>
					                   	 </div>
					                   	 <div class="form-group">
					                   	 	<!-- 风险预估 -->
					                   	 	<label class="control-label col-md-1">
											    <spring:message code='label.projectManager.riskAssessment' />				
										    </label>
										    <div class="col-md-10">
										    	<textarea class="form-control" readonly="readonly" style="width: 100%;" 
										    	rows="2" id="riskAssessment" 
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
										    <div class="col-md-10">
										    	<textarea class="form-control" style="width: 100%;" rows="2" 
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
									            <div id="proMonitorModuleGallery" class="editableGallery"></div>
											</div>
					                   	 </div>
					                   	 <div class="form-actions">
											<div class="row">
												<div class="modal-footer">
													<c:if test="${projectVo.projectStatus==2}">
														<button type="button" class="btn green" id="saveProjectId" >
															<i class="fa fa-check"></i>
															<spring:message code='btn.common.save' />
														</button>
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
                        <div class="tab-pane" id="tab_5">
                        	<div class="row">
                        		<!-- 里程碑列表 -->
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
								                    <table class="table table-striped table-bordered table-hover" id="milepostEditTableId"></table>
								                </div>
								            </div>
								        </div>
								     </div>
							    </div>
							    <!-- 里程碑调整列表 -->
							    <div class="col-md-12">
							        <div class="mt-element-ribbon bg-grey-steel">
							            <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
							                 <div class="ribbon-sub ribbon-clip"></div> 
							                 <span class="caption-subject bold uppercase"><spring:message code='lable.milepostAdjust.milepostAdjust' /></span> 
								        </div>
								        <div class="portlet light portlet-fit portlet-datatable bordered">
								            <div class="portlet-title">              
								                <div class="actions">
								                    <div class="btn-group btn-group-devided" data-toggle="buttons">
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
								                    <table class="table table-striped table-bordered table-hover" id="milepostAdjustTableId"></table>
								                </div>
								            </div>
								        </div>
								     </div>
							    </div>
							</div>
                        </div>
                        <!-- 交付物 -->
                        <div class="tab-pane" id="tab_6">
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
								                    <table class="table table-striped table-bordered table-hover" id="deliveriesEditTableId"></table>
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
<!-- 里程碑弹出框 -->
<div id="editMilepostModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:60%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!-- 里程碑调整弹出框 -->
<div id="newAdjustmentModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:60%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!-- 交付物弹出框 -->
<div id="editDeliveriesModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:60%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!--  -->
<!-- 参数列表 -->
<script type="text/javascript">
	$("#projectMonitorFormId #projectStage").initDic('${projectVo.projectStage}',codeBasicInfo.projectStage);
	$("#projectMonitorFormId #implementHead").initUserInfo('${projectVo.implementHead}');
	$("#projectMonitorFormId #exploitHead").initUserInfo('${projectVo.exploitHead}');
	$("#projectMonitorFormId #belongCustomerid").initCustomerInfo('${projectVo.belongCustomerid}');
	$("#projectMonitorFormId #belongProduct").initDic('${projectVo.belongProduct}',codeBasicInfo.PRODUCT);
	$("#projectMonitorFormId #createDeptName").val(getDeptByIds($("#projectMonitorFormId #createDept").val()));
	var projectMonitorEdit_projectMonitorBtn = "<spring:message code='lable.projectMonitor.projectMonitorBtn' />";   //项目监控
	
	var projectMonitorOldVal=$("#projectMonitorFormId").serializeFormJson();
	var projectMonitorField = {
		remark:"<spring:message code='label.projectManager.remark' />"
	};
	
	//里程碑
	var milepostEdit_milepostName = "<spring:message code='lable.milepost.milepostName' />";   			//里程碑名称
	var milepostEdit_planCompletedate = "<spring:message code='lable.milepost.planCompletedate' />";   	//计划完成时间
	var milepostEdit_correspondingPhase = "<spring:message code='lable.milepost.correspondingPhase' />";  //对应阶段
	var milepostEdit_milepostStatus = "<spring:message code='lable.milepost.milepostStatus' />";   		//里程碑状态
	var milepostEdit_whetherDelay = "<spring:message code='lable.milepost.whetherDelay' />";   			//是否延误
	var milepostEdit_adjustDate = "<spring:message code='lable.milepost.adjustDate' />";  			 	//调整时间
	var milepostEdit_deviationDay = "<spring:message code='lable.milepost.deviationDay' />";   			//偏差时长
	var milepostEdit_milepostDescribe = "<spring:message code='lable.milepost.milepostDescribe' />";   	//里程碑描述
	var milepostEdit_remark = "<spring:message code='lable.milepost.remark' />";   						//备注
	var milepostEdit_adjustment = "<spring:message code='lable.projectMonitor.adjustment' />";  			//调整
	var gridMilepost=new Datatable();//里程碑Datatable
	var hasEditAuthMilepost = isUserHasAuth("R004_0202");//编辑权限
	var hasAdjustmentAuthMilepost = isUserHasAuth("R004_0203");//调整权限
	
	//交付物
	var deliveriesEdit_deliveriesName= "<spring:message code='lable.deliveries.deliveriesName' />";   			//交付物名称
	var deliveriesEdit_planDeliveriesDate= "<spring:message code='lable.deliveries.planDeliveriesDate' />";   	//计划交付时间
	var deliveriesEdit_whetherContract= "<spring:message code='lable.deliveries.whetherContract' />";   		//是否记入合同
	var deliveriesEdit_personLiable= "<spring:message code='lable.deliveries.personLiable' />";   				//责任人
	var deliveriesEdit_whetherDeliver= "<spring:message code='lable.deliveries.whetherDeliver' />";   			//是否已交付
	var deliveriesEdit_actualDeliveriesDate= "<spring:message code='lable.deliveries.actualDeliveriesDate' />"; //实际交付时间
	var deliveriesEdit_remark= "<spring:message code='lable.milepost.remark' />";   							//备注
	var deliveriesEdit_attachment= "<spring:message code='common.label.attachment' />";   						//附件
	var gridDeliveries=new Datatable();//交付物Datatable
	var hasEditAuthDeliveries = isUserHasAuth("R004_0204");//编辑权限
	
	//里程碑调整
	var milepostAdjust_adjustRemark= "<spring:message code='lable.milepostAdjust.adjustRemark' />";   			//调整原因
	var milepostAdjust_adjustDate= "<spring:message code='lable.milepostAdjust.adjustDate' />";   				//调整时间
	var milepostAdjust_isComplete= "<spring:message code='lable.milepostAdjust.isComplete' />";   				//是否顺延
	var milepostAdjust_operateBy= "<spring:message code='label.systemlog.operateBy' />";   						//操作人
	var milepostAdjust_operateTime= "<spring:message code='label.systemlog.operateTime' />";   					//操作时间
	var milepostAdjust_approvalBy= "<spring:message code='lable.milepostAdjust.approvalBy' />";   				//批准人
	var milepostAdjust_approvalDate= "<spring:message code='lable.milepostAdjust.approvalDate' />";   			//批准时间
	var milepostAdjust_remark= "<spring:message code='lable.milepostAdjust.remark' />";   						//备注
	var gridMilepostAdjust=new Datatable();//里程碑调整Datatable
	var hasEditAuthMilepostAdjust = isUserHasAuth("R004_0203");//编辑权限
	
	//附件初始化
	$(function(){
        //初始化历史数据
		initEidtUploaderUI({
			_editFileId:'#proMonitorModuleGallery',
			_dataId:'${projectVo.id}',
			_pageType:'R004-0201',
			_canDelete:false
			});
	});
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManagement/projectMonitorManager/projectManagerMonitor.js"></script>
