<!-- 合同管理编辑页 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
     <div class="col-md-12">
          <!-- BEGIN PORTLET-->
          <div class="portlet box grey-cascade form-fit">
              <div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i><spring:message code='btn.common.view' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse">
					</a>
					<a href="javascript:;" class="remove" data-dismiss="modal">
				    </a>
				</div>
			  </div>
              <div class="portlet-body form">
                  <form class="form-horizontal  form-bordered" id="contractEditFormId" autocomplete="off" 
				    data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
				    <input type="hidden" value="${vo.id}" name="id" id="id"/>
                    <div class="form-group">
                        <!-- 创建人-->
					    <label class="control-label col-md-2">
						    <spring:message code='lable.contract.creater' />						    
					    </label>
					    <div class="col-md-4">
						    <input type="text" 
								   class="form-control" 
								   id="createBy" 
								   name="createBy" 
								   value="${vo.createByName}"
								   readonly="readonly"								  
								    />
					    </div>
						<!-- 创建部门-->
						<label class="control-label col-md-2">
						   <spring:message code='lable.contract.createDept' />
						 </label>						
						<div class="col-md-4">
							<input type="text" 
								   class="form-control" 
								   id="deptName" 
								   name="createDept" 
								   value="${vo.createDept}"
								   readonly="readonly"								  
								    />
						</div>
                    </div>
                    <div class="form-group">
					<!-- 合同编号 -->
						<label class="control-label col-md-2"><spring:message code='lable.contract.contractNo' />
						<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
								   class="form-control" 
								   id="contractNo" 
								   name="contractNo"
								   data-rule="required" 
								   value="${vo.contractNo}"								
								  />
						</div>
                        <!-- 创建时间 -->
						<label class="control-label col-md-2"><spring:message code='lable.contract.createDate' />
						</label>						 
						<div class="col-md-4">
							<input type="text" 
								   class="form-control" 
								   id="createDate" 
								   name="createDate" 
								   value="${vo.createDate}"
								   readonly="readonly"
								   />
						</div>
					</div>
					<div class="form-group">
						<!-- 签订日期-->
						<label class="control-label col-md-2"><spring:message code='lable.contract.signDate' />
						<span class="required">* </span>
						</label>			 
						<div class="col-md-4">
							<input type="text" 
								class="date-picker form-control dateSelect"
								id="signedDate"
								name="signedDate"
								data-rule="required" 
								value="${vo.signedDate}" 
								data-rule="required;"
								placeholder="<spring:message code='message.pleaseselect'/>" >
						</div>
						<!-- 所属客户 -->
						<label class="control-label col-md-2"><spring:message code='lable.contract.custom' />
						<span class="required">* </span>
						</label>
						<div class="col-md-3">
							<select class="bs-select form-filter form-control" 
									data-size="10" 									
									data-rule="required;"
									data-width="70%"
									value="${vo.belongCustomerid}"
									title="<spring:message code='message.pleaseselect' />" 
									id="belongCustomerid"
									name="belongCustomerid">
			                 </select>								   
						</div>
					</div>
					<div class="form-group">				
						<!-- 合同标题 -->
						<label class="control-label col-md-2"><spring:message code='lable.contract.title' />
						<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
								   class="form-control" 
								   id="contractTitle" 
								   name="contractTitle" 
								   value="${vo.contractTitle}"
								   data-rule="required;length[~100];" 
							/>
						</div>
						<!-- 所属产品 -->
						<label class="control-label col-md-2"><spring:message code='lable.contract.product' />
						<span class="required">* </span>
						</label>						 
						<div class="col-md-4">
							<select class="bs-select form-filter form-control" 
									data-size="10" 
									data-width="70%"
									data-live-search="true"
									data-rule="required;"
									value="${vo.belongProduct}"
									title="<spring:message code='message.pleaseselect' />" 
									id="belongProduct"
									name="belongProduct">
			                 </select>	
						</div>
					</div>
					<div class="form-group">
						 <!-- 币种 -->
						<label class="control-label col-md-2"><spring:message code='lable.contract.coinType' />
						<span class="required">* </span>
						</label>
						<div class="col-md-4">						     
							 <select class="bs-select form-filter form-control" 									
									data-width="70%"
									data-size="10" 
									data-live-search="true"
									data-rule="required;"
									value="${vo.currency}"
									title="<spring:message code='message.pleaseselect' />" 
									id="currency"
									name="currency">
			                 </select>
						</div>						
						<!-- 合同金额 -->
						<label class="control-label col-md-2"><spring:message code='lable.contract.price' />
						<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
								   class="form-control" 
								   id="contractAmount" 
								   name="contractAmount" 
								   value="${vo.contractAmount}"
                                   data-rule="required;range(0~);length[~20]
								   placeholder="<spring:message code='label.userManage.pleaseinputUserName'/>" />
						</div>
					</div>
					<div class="form-group">
						<!-- 有效期-->
						<label class="control-label col-md-2"><spring:message code='lable.contract.expiryDate' /></label>
						<div class="col-md-4">							
							<input type="text" 
								class="date-picker form-control dateSelect"
								id="effectiveDate"
								name="effectiveDate"
								data-rule="required" 
								value="${vo.effectiveDate}" 
								placeholder="<spring:message code='message.pleaseselect'/>" >
						</div>
						<!-- 人天单价 -->
						<label class="control-label col-md-2"><spring:message code='lable.contract.personPrice' />
						<span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
								   class="form-control" 
								   id="laborPrice" 
								   name="laborPrice" 
								   value="${vo.laborPrice}"
								   data-rule="required;range(0~);length[~10]"
								   placeholder="<spring:message code='label.userManage.pleaseinputUserName'/>" />
						</div>
					</div>
					<div class="form-group">
						<!-- 免费服务期阶段-->
						<label class="control-label col-md-2"><spring:message code='lable.contract.freeStage' /></label>
						<div class="col-md-4">
							<select class="bs-select form-filter form-control" 
									data-size="10" 
									data-width="70%"
									value="${vo.freeservicePeriod}"									
									id="freeservicePeriod"
									name="freeservicePeriod">
			                 </select>	
						</div>	                   
						<!--免费服务期时长 -->
						<label class="control-label col-md-2"><spring:message code='lable.contract.freeTime' /></label>
						<div class="col-md-4">
							<input type="text" class="form-control"  
							  id="freeLimit" 
							  name="freeLimit" 
							  value="${vo.freeLimit}"
							  data-rule="range(0~);length[~10];" 
                             />
						</div>
					</div>
					<div class="form-group">						
						<!--赠送人天 -->
						<label class="control-label col-md-2"><spring:message code='lable.contract.sendDays' /></label>
						<div class="col-md-4">
							<input type="text" class="form-control"  
							id="giveDay" 
							name="giveDay" 
							value="${vo.giveDay}"
							data-rule="range(0~);length[~10];" 
							/>
						</div>
						<!--收费服务期时长 -->
						<label class="control-label col-md-2"><spring:message code='lable.contract.payTime' /></label>
						<div class="col-md-4">
							<input type="text" class="form-control"  
							  id="costserviceTime" 
							  name="costserviceTime" 
							  value="${vo.costserviceTime}"
							  data-rule="range(0~);length[~10];" 
                             />
						</div>
                   </div>
                   <div class="form-group last">							
							 <!-- 付款说明 -->
							<label class="control-label col-md-2"><spring:message code='lable.contract.payDesc' /></label>
							<div class="col-md-9">
							      <textarea class="form-control" rows="2" style="width: 100%;" 
							     id="paymentRemark" name="paymentRemark" 
							     value="${vo.paymentRemark}"  
							     data-rule="length[~250];" 
							     ></textarea>
							</div>
					 </div>
                     <div class="form-group last">												
							 <!-- 备注 -->
							<label class="control-label col-md-2"><spring:message code='lable.contract.remark' /></label>
							<div class="col-md-9">
							      <textarea class="form-control" rows="2" style="width: 100%;" 
							     id="remark" name="remark" 
							     value="${vo.remark}" 
							     data-rule="length[~1000];" 
							     ></textarea>
							</div>
					 </div>
					 <div class="form-group last">
                    	<!-- 附件 -->
						<label class="control-label col-md-2">
							<spring:message code='common.label.attachment' />
						</label>
						<div class="col-md-8">
				            <div id="moduleContractAppGallery" class="editableGallery"></div>
				            <div id="uploadContractAppDivId" class="editableGallery">
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
                         <div class="row">
                             <div class="modal-footer">                                  
								<button type="button" data-dismiss="modal" class="btn default" id="closeContractEditId">
									<i class="fa fa-mail-forward"></i>
									<spring:message code='btn.common.close' />
								</button>
                             </div>
                         </div>
                     </div>
                  </form>
              </div>
          </div>
          <!-- END PORTLET-->
      </div>
</div>
<script type="text/javascript">
$("#contractEditFormId #deptName").val(getDeptByIds('${vo.createDept}'));
$("#contractEditFormId #currency").initDic('${vo.currency}',codeBasicInfo.btype);
$("#contractEditFormId #freeservicePeriod").initDic('${vo.freeservicePeriod}',codeBasicInfo.projectStage);
$("#contractEditFormId #belongProduct").initDic('${vo.belongProduct}',codeBasicInfo.projectonly);
$("#contractEditFormId #belongCustomerid").initCustomerInfo('${vo.belongCustomerid}');
var contractAppDetail_operate='${operate}';
$(function(){
	if(contractAppDetail_operate=='view'){		
        //初始化历史数据
		initEidtUploaderUI({
			_editFileId:'#moduleContractAppGallery',
			_dataId:'${vo.id}',
			_pageType:'R003-0101'
			});
	}
});

</script>