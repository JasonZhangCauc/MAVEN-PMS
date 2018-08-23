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
			                 <i class="fa fa-info-circle font-greens" ></i>
			                 <span class="caption-subject font-greens sbold uppercase">
				                 <font style="vertical-align: inherit;">
			                 		<c:if test="${operate=='look'}">
										<spring:message code='btn.common.look' />
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
				          <form class="form-horizontal  form-bordered" id="CustomEditFormId" autocomplete="off" 
				   			 data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						     <input type="hidden" value="${vo.id}" name="id" id="id"/>
				    		<input type="hidden" value="" name="changeDetails" id="changeDetails" />
					         <div class="form-body">
						          <div class="form-group">
			                        <!-- 客户简称 -->
								    <label class="control-label col-md-2">
									    <spring:message code='lable.customManage.shortName' />
									    <span class="required">* </span>
								    </label>
								    <div class="col-md-4">
									    <input type="text" readonly="readonly"
										   class="form-control" 
										   id="customShortName" 
										   name="customShortName" 
										   value="${vo.customShortName}"
										   data-rule="required;length[~25];" 
										   placeholder="<spring:message code='common.laber.mustInputData'/>" />
								    </div>
									<!-- 开票名称 -->
									<label class="control-label col-md-2">
										<spring:message code='lable.customManage.taxpayerName' />
									</label>
									<div class="col-md-4">
										<input type="text" readonly="readonly"
										   class="form-control" 
										   id="taxpayerName" 
										   name="taxpayerName" 
										   value="${vo.taxpayerName}"
										   data-rule="length[~50];"								  
										   placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
									</div>
				                  </div>
				                  <div class="form-group">
				                        <!-- 公司全称 -->
										<label class="control-label col-md-2">
											<spring:message code='lable.customManage.companyName' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<input type="text" readonly="readonly"
											   class="form-control" 
											   id="customName" 
											   name="customName" 
											   value="${vo.customName}"
											    data-rule="required;length[~100];"
											   placeholder="<spring:message code='common.laber.mustInputData'/>" />
												
						                    </select>
										</div>
					                    <!-- 纳税人识别号 -->
										<label class="control-label col-md-2">
											<spring:message code='lable.customManage.taxpayerNumber' />
										</label>
										<div class="col-md-4">
											<input type="text" readonly="readonly"
											   class="form-control" 
											   id="taxpayerNumber" 
											   name="taxpayerNumber" 
											   value="${vo.taxpayerNumber}"
											   data-rule="length[~50];"
											   placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
										</div>
				                  </div>
				                  
				                  <div class="form-group">
				                  		<!-- 二字码 -->
										<label class="control-label col-md-2">
											<spring:message code='lable.customManage.second' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<input type="text" readonly="readonly"
											   class="form-control" 
											   id="second" 
											   name="second" 
											   value="${vo.second}"
											   data-rule="required;length[~25];remote[<%=request.getContextPath()%>/preSalesManage/querySecondByChecking, id]" 
											   placeholder="<spring:message code='common.laber.mustInputData'/>" />
										</div>
				                  
										<!-- 开票电话 -->
										<label class="control-label col-md-2">
											<spring:message code='lable.customManage.taxpayerPhone' />
										</label>
										<div class="col-md-4">
											<input type="text" readonly="readonly"
											   class="form-control" 
											   id="taxpayerPhone" 
											   name="taxpayerPhone" 
											   value="${vo.taxpayerPhone}"
											   data-rule="length[~25];mobile;" 
											   placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
										</div>
										
								  </div>
								  <div class="form-group">
								  		<!-- 公司简码 -->
										<label class="control-label col-md-2">
											<spring:message code='lable.customManage.shortCode' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<input type="text" readonly="readonly"
											   class="form-control" 
											   id="customCode" 
											   name="customCode" 
											   value="${vo.customCode}"
											   data-rule="required;length[~25];"
											   placeholder="<spring:message code='common.laber.mustInputData'/>" />
										</div>
										<!-- 开票地址 -->
										<label class="control-label col-md-2">
											<spring:message code='lable.customManage.taxpayerAddress' />
										</label>
										<div class="col-md-4">
											<input type="text" readonly="readonly"
											   class="form-control" 
											   id="taxpayerAddress" 
											   name="taxpayerAddress" 
											   value="${vo.taxpayerAddress}"
											   data-rule="length[~250];"
											   placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
										</div>
										
								  </div>
								  <div class="form-group">
								  		<!-- 所在地址 -->
										<label class="control-label col-md-2">
											<spring:message code='lable.customManage.address' />
											<span class="required">* </span>
										</label>
										<div class="col-md-4">
											<input type="text" readonly="readonly"
											   class="form-control" 
											   id="customAddress" 
											   name="customAddress" 
											   value="${vo.customAddress}"
											   data-rule="required;length[~250];" 
											   placeholder="<spring:message code='common.laber.mustInputData'/>" />
										</div>
								  		
										<!-- 联系电话 -->
										<label class="control-label col-md-2">
											<spring:message code='lable.customManage.phone' />
										</label>
										<div class="col-md-4">
											<input type="text" readonly="readonly"
											   class="form-control" 
											   id="contactPhone" 
											   name="contactPhone" 
											   value="${vo.contactPhone}"
											   data-rule="length[~25];mobile;"
											   placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
										</div>
										
									</div>
									<div class="form-group">
										<!-- 开户行 -->
										<label class="control-label col-md-2">
											<spring:message code='lable.customManage.taxpayerBank' />
										</label>
										<div class="col-md-4">
											<input type="text" readonly="readonly"
											   class="form-control" 
											   id="taxpayerBank" 
											   name="taxpayerBank" 
											   value="${vo.taxpayerBank}"
											   data-rule="length[~50];"
											   placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
										</div>
										<!-- 邮箱 -->
										<label class="control-label col-md-2">
											<spring:message code='lable.customManage.email' />
										</label>
										<div class="col-md-4">
											<input type="text" class="form-control" id="email" name="email" value="${vo.email}"
								            data-rule="length[~25];email;" readonly="readonly"
											placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
										</div>
										
							       </div>
							       <div class="form-group">
										<!-- 开户账号 -->
										<label class="control-label col-md-2">
											<spring:message code='lable.customManage.taxpayerAccount' />
										</label>
										<div class="col-md-4">
											<input type="text" class="form-control" readonly="readonly"  id="taxpayerAccount" name="taxpayerAccount" value="${vo.taxpayerAccount}"
											placeholder="<spring:message code='common.laber.noneMustInputData'/>" />
										</div>
								  </div>
							      <div class="form-group">
										<!-- 备注 -->
										<label class="control-label col-md-2">
											<spring:message code='lable.customManage.remark' />
										</label>
										<div class="col-md-9">
											<textarea class="form-control" rows="4" readonly="readonly"
												id="remark" data-rule="length[~1000];" name="remark"
												placeholder="<spring:message code='common.laber.noneMustInputData'/>"
												value="${vo.remark}">${vo.remark}</textarea>
										</div>
								  </div>
								  
						          <div class="form-actions">
					                 <div class="modal-footer">
					                 	<div class="col-md-offset-2 col-md-9">
                                         <button class="btn default" data-dismiss="modal" aria-hidden="true" id="closeCustomBaseInfoEditId"><spring:message code='btn.common.close'/></button>
					                 	</div>
					                 </div>
						          </div>
				             </div>
				         </form>  
			         </div>
				</div> 
			</div>
		</div>
    </div>
<script type="text/javascript">
	var objectVal=$("#CustomEditFormId").serializeFormJson();
	var customColumn = { 
		customShortName : "<spring:message code='lable.customManage.shortName' />", 
		taxpayerName : "<spring:message code='lable.customManage.taxpayerName' />",
		customName : "<spring:message code='lable.customManage.companyName' />",
		taxpayerNumber : "<spring:message code='lable.customManage.taxpayerNumber' />",
		customAddress : "<spring:message code='lable.customManage.address' />",
		taxpayerAddress : "<spring:message code='lable.customManage.taxpayerAddress' />",
		customCode : "<spring:message code='lable.customManage.shortCode' />",
		taxpayerPhone : "<spring:message code='lable.customManage.taxpayerPhone' />",
		contactPhone : "<spring:message code='lable.customManage.phone' />",
		taxpayerBank : "<spring:message code='lable.customManage.taxpayerBank' />",
		email : "<spring:message code='lable.customManage.email' />",
		taxpayerAccount : "<spring:message code='lable.customManage.taxpayerAccount' />",
		remark : "<spring:message code='lable.customManage.remark' />"
	};
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/preSalesManage/custommanage/customManageEdit.js"></script>