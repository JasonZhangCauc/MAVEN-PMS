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
			                 		<c:if test="${operate=='add'}">
										<spring:message code='btn.common.add' />
									</c:if>
								    <c:if test="${operate=='edit'}">
										<spring:message code='btn.common.edit' />
								    </c:if>
			                 	</font>
			                 </span>
			             </div>
			             <div class="tools">
			                 <a href="javascript:;" class="collapse"> </a>
			                 <a href="javascript:;" class="reload"> </a>
			             </div>
			         </div>
			         <div class="portlet-body form">
				          <form class="form-horizontal form-bordered" id="TrackEditFormIdES" autocomplete="off" 
						    data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
							    <input type="hidden" value="${vo.id}" name="id" id="id"/>
							    <input type="hidden" value="" name="changeDetails" id="changeDetails" />
			                    <div class="form-group">                       
									<!-- 项目编号 -->
									<label class="control-label col-md-2">
									    <spring:message code='lable.saleTrack.projectNo' />
									    <span class="required">* </span>
									</label>
									<div class="col-md-4">
										<input type="text" 
											   class="form-control" 
											   id="projectno" 
											   name="projectno" 
											   value="${vo.projectno}"
											   readonly="readonly"
											   placeholder="<spring:message code='common.laber.produceBySys'/>" />								   
									</div>
									<!-- 项目名称 -->
									<label class="control-label col-md-2">
									    <spring:message code='lable.saleTrack.projectName' />
									    <span class="required">* </span>
									</label>			 
									<div class="col-md-4">
										<input type="text" 
											   class="form-control" 
											   id="projectName"
											   name="projectName" 
											   value="${vo.projectName}"
											   data-rule="required;length[~100];"  
											   placeholder="<spring:message code='common.laber.mustInputData'/>" />
									</div>
								</div>
								<div class="form-group">
									<!-- 所属产品 -->
									<label class="control-label col-md-2">
									    <spring:message code='lable.saleTrack.product' />
									    <span class="required">* </span>
									</label>
									<div class="col-md-4">
										<select class="bs-select form-filter form-control" 
												data-size="10" 
												data-rule="required;"
												value="${vo.belongProduct}"
												title="<spring:message code='message.pleaseselect' />" 
												id="belongProduct"
												name="belongProduct">
						                 </select>								   
									</div>
									<!-- 意向客户 -->
									<label class="control-label col-md-2">
									<spring:message code='lable.saleTrack.proCustom' />
									<span class="required">* </span>
									</label>
									<div class="col-md-4">
										<select class="bs-select form-filter form-control" 
												data-size="10" 
												data-rule="required;"
												title="<spring:message code='message.pleaseselect' />" 
												id="customerId"
												name="customerId">
						                 </select>								   
									</div>	
								 </div>
								<div class="form-group">
									<!-- 决策者 -->
									<label class="control-label col-md-2">
									    <spring:message code='lable.saleTrack.proDecisionMaker' />
									</label>						 
									<div class="col-md-4">							
										<select class="bs-select form-filter form-control" 
												data-size="10" 
												title="<spring:message code='message.pleaseselect' />"
												value="${vo.decisionMaker}" 
												id="decisionMaker"
												name="decisionMaker">
						                 </select>
									</div>
									<!-- 销售负责人-->
									<label class="control-label col-md-2">
									     <spring:message code='lable.saleTrack.proResponser' />
									     <span class="required">* </span>
									</label>
									<div class="col-md-4">							
										 <select class="bs-select form-filter form-control" 								
											data-live-search="true" 
											data-size="10"
											data-rule="required;" 
											title="<spring:message code='message.pleaseselect' />"
											value="${vo.saleResponsible}"
											name="saleResponsible"
											id="saleResponsible">
					                      </select>
									</div>
								 </div>
								<div class="form-group">
									<!-- 销售状态 -->
									<label class="control-label col-md-2">
									    <spring:message code='lable.saleTrack.proStatus' />
									    <span class="required">* </span>
									</label>
									<div class="col-md-4">							
										<select class="bs-select form-filter form-control" 
												data-size="10" 
												data-rule="required;"
												title="<spring:message code='message.pleaseselect' />" 
												id="saleStatus"
												value="${vo.saleStatus}"
												name="saleStatus">
						                 </select>
									</div>
									<!-- 项目预算 -->
									<label class="control-label col-md-2">
									    <spring:message code='lable.saleTrack.proBudget' /></label>
									<div class="col-md-4">
										<input type="text" 
											   class="form-control" 
											   id="projectBudget" 
											   name="projectBudget" 
											   value="${vo.projectBudget}"
											   data-rule="positiveNum;length[~25];" 
											   placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
									</div>	
								</div>	
								<div class="form-group">
				                    <!-- 币种 -->
									<label class="control-label col-md-2">
									     <spring:message code='lable.saleTrack.coinType' /></label>
									<div class="col-md-4">						     
										 <select class="bs-select form-filter form-control" 
												data-size="10" 
												value="${vo.currency}"
												title="<spring:message code='message.pleaseselect' />" 
												id="currency"
												name="currency">
						                 </select>
									</div>	
									<!--联系人-->
									<label class="control-label col-md-2">
									    <spring:message code='lable.saleTrack.linker' /></label>
									<div class="col-md-4">							
										<select class="bs-select form-filter form-control" 
											data-live-search="true" 
											data-size="10"
											title="<spring:message code='message.pleaseselect' />"
											value="${vo.linker}"
											name="linker"
											id="linker">
					                     </select>
									</div>					
								</div>
								<div class="form-group">
									<!--干系人-->
									<label class="control-label col-md-2">
									     <spring:message code='lable.saleTrack.proStakeholder' />
									</label>
									<div class="col-md-9">						
									    <select class="bs-select form-filter form-control" 
											multiple
											data-live-search="true" 
											data-size="10"
											data-width="100%" 
											title="<spring:message code='message.pleaseselect' />"
											value="${vo.stakeholder}"
											name="stakeholder"
											id="stakeholder">
					                     </select>
									</div>			  
								</div>	
								<div class="form-group last">
									<!-- 附件 -->
									<label class="control-label col-md-2">
										<spring:message code='common.label.attachment' />							
									</label>
									<div class="col-md-8">
							            <div id="moduleGallery" class="editableGallery"></div>
							            <div id="uploaderDivId" class="editableGallery">        
				                            <div class="queueList">
				                                <div id="dndArea" class="placeholder">
				                                    <div id="filePicker"></div>	                                    
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
		                                <div class="col-md-6 text-center">
			                                <button type="button" class="btn green" id="saveTrackId">
												<i class="fa fa-check"></i>
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
		<%-- <c:if test="${vo.id !='' && vo.id !=null}">
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
		</c:if> --%>
    </div>
<div class="modal-footer">
    <div class="col-md-offset-11 col-md-1"> 
    	<button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeTrackEditIdss"><spring:message code='btn.common.close'/></button>
 	</div> 
</div>
<script type="text/javascript">
		$("#TrackEditFormIdES #saleStatus").initDic('${vo.saleStatus}',codeBasicInfo.saleStatus);
		$("#TrackEditFormIdES #currency").initDic('${vo.currency}',codeBasicInfo.btype);
		$("#TrackEditFormIdES #belongProduct").initDic('${vo.belongProduct}',codeBasicInfo.projectonly);
		$("#TrackEditFormIdES #customerId").initCustomerInfo('${vo.customerId}');
		$("#TrackEditFormIdES #saleResponsible").initUserInfoSale('${vo.saleResponsible}');
		$("#TrackEditFormIdES #createDept").val(getDeptByIds($("#TrackEditFormId #createDept").val()));
		$("#TrackEditFormIdES #decisionMaker").initCusLinker('${vo.decisionMaker}','${vo.customerId}');
		$("#TrackEditFormIdES #stakeholder").initCusLinker('${vo.stakeholder}','${vo.customerId}');
		$("#TrackEditFormIdES #linker").initCusLinker('${vo.linker}','${vo.customerId}');
		var saleTrack_operate="${operate}";  
		var milepostEdit_operate='edit';
		$(function(){
			if(saleTrack_operate=='edit'){
				initWebUploaderUI({
		        	_webUploaderId:'#uploaderDivId',
		        	_fileAddId:'#filePicker',
		        	_fileAddIdContinue:'#filePicker2',
		        	_dataId:'${vo.id}',
		        	_pageType:'R002-01',
		        	_editFileId:'#moduleGallery',
		        	_canDelete:true
		        });
				initEidtUploaderUI({
					_editFileId:'#moduleGallery',
					_dataId:'${vo.id}', 
					_pageType:'R002-01',
					_canDelete:true
				});
			}
		});
		var saleTrackOldVal=$("#TrackEditFormIdES").serializeFormJson();
		var saleTrackField = { 
			createBy:"<spring:message code='lable.saleTrack.creater' />",
			createDept:"<spring:message code='lable.saleTrack.createDept' />",
			projectno:"<spring:message code='lable.saleTrack.projectNo' />",
			createDate:"<spring:message code='lable.saleTrack.createDate' />",
			projectName:"<spring:message code='lable.saleTrack.projectName' />",
			belongProduct:"<spring:message code='lable.saleTrack.product' />",
			customerId:"<spring:message code='lable.saleTrack.proCustom' />",
			decisionMaker:"<spring:message code='lable.saleTrack.proDecisionMaker' />",
			saleResponsible:"<spring:message code='lable.saleTrack.proResponser' />",
			saleStatus:"<spring:message code='lable.saleTrack.proStatus' />",
			projectBudget:"<spring:message code='lable.saleTrack.proBudget' />",
			currency:"<spring:message code='lable.saleTrack.coinType' />",
			stakeholder:"<spring:message code='lable.saleTrack.proStakeholder' />",
			linker:"<spring:message code='lable.saleTrack.linker' />",
			remark:"<spring:message code='lable.saleTrack.remark' />"
		};
	</script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/preSalesManage/saletrack/saleTrackEdit.js"></script>