<!-- 合同选择主界面 wb066 20180319 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- BEGIN PAGE BASE CONTENT -->
<div class="row">
     <div class="col-md-12">
          <!-- BEGIN PORTLET-->
          <div class="portlet box grey-cascade form-fit">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i>
					<spring:message code='lable.contract.contractSelect' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> 
					<a href="javascript:;" class="remove" data-dismiss="modal"> </a>
				</div>
			</div>
			<div class="portlet-body">
				<div class="m-heading-1 border-green m-bordered">
					<form class="form-horizontal" id="contractSelectFormId" method="post">
				        <div class="row">
				            <div class="form-group">
							    <!--合同标题-->
				                <label class="col-md-1 control-label">
				                	<spring:message code='lable.contract.title'/>:
				                </label>
				                <div class="col-md-2 text-left">
				                    <input type="text" name="contractTitle" class="form-control form-filter spinner" 
				                         placeholder="<spring:message code='message.pleaseinput'/>">  
				                </div>
							    <!--合同编号-->
				                <label class="col-md-1 control-label">
				                	<spring:message code='lable.contract.contractNo'/>:
				                </label>
				                <div class="col-md-2 text-left">
				                    <input type="text" name="contractNo" class="form-control form-filter spinner" 
				                    	placeholder="<spring:message code='message.pleaseinput'/>">
				                </div>				
				                <!--所属客户-->
				                <label class="col-md-1 control-label">
				                	<spring:message code='lable.saleTrack.proCustom'/>:
				                </label>			   
				                <div class="col-md-2 text-left">
									<select class="bs-select form-filter form-control"  
										multiple
										data-size="20" 
										title="<spring:message code='label.allitem' />" 
										name="belongCustomerid"
										id="belongCustomerid">
				                    </select>
				                </div>   
				                <div class="col-md-2 text-right">
									<a href="javascript:;" class="btn default btn-sm blue-madison" id="searchContractSelectBtn"> 
										<i class="fa fa-search"></i>
										<spring:message code='btn.common.search' /> 
									</a>
									<a data-target="#contractSelectHide" data-toggle="collapse" class="btn default btn-sm blue-hoki" aria-expanded="false">
				                       <i class="fa fa-unsorted"></i>
				                       <spring:message code='common.label.more' />
				                    </a>				    
								</div>				
							 </div>
							<div class="form-group line_p collapse" id="contractSelectHide" aria-expanded=false>
							 <div class="form-group"> 			 				                                       
								<!--所属产品-->	
								<label class="col-md-1 control-label">
									<spring:message code='lable.contract.product'/>:
								</label>
								<div class="col-md-2 text-left">
									<select class="bs-select form-filter form-control" 						
										multiple
										data-size="10" 
										title="<spring:message code='label.allitem' />" 
										name="belongProduct"
										id="belongProduct">
									</select>
								</div>
								<!--签定日期范围-->
								<label class="col-md-1 control-label">
									<spring:message code='lable.contract.signDateRange'/>:&nbsp;&nbsp;&nbsp;
								</label>
								<div class="col-md-3">
									<div class="input-group input-large">
										<input type="text" id="signStartDate" name="signStartDate"  placeholder="<spring:message code='common.label.from' />"  class="date-picker form-control dateSelect">										
										<span class="input-group-addon">to</span>										
										<input type="text" id="signEndDate" name="signEndDate" placeholder="<spring:message code='common.label.to' />"  class="date-picker form-control dateSelect">
									</div>
								</div>				
							 </div>
							</div> 
						 </div>			                 
				    </form>
				</div>
				<div class="row">
				    <div class="col-md-12">
				        <!-- Begin: life time stats -->
				        <div class="portlet light portlet-fit portlet-datatable bordered">
				            <div class="portlet-title">
				                <div class="caption">
				                    <i class="icon-settings font-dark"></i>
				                    <span class="caption-subject bold uppercase">
				                      <spring:message code='lable.contract.contractTable'/>
				                    </span>
				                </div>
				            </div>
				            <div class="portlet-body">
				                <div class="table-container">
				                    <table class="table table-striped table-bordered table-hover" id="contractSelectTableId"></table>
				                </div>
				            </div>           
				        </div>
				        <!-- End: life time stats -->
				    </div>
				</div>
				<div style="text-align: center;margin: 10px;">
					<button type="button" class="btn green" id="contractSelectBtn">
						<i class="fa fa-check"></i>
						<spring:message code='btn.common.save' />
					</button>
					<button type="button" data-dismiss="modal" class="btn default"
						id="closeContractSelectBtn">
						<i class="fa fa-mail-forward"></i>
						<spring:message code='btn.common.close' />
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END 弹框 --> 
<script type="text/javascript">	
	var contractSelect_contractNo="<spring:message code='lable.contract.contractNo' />";//合同编号
	var contractSelect_title="<spring:message code='lable.contract.title' />";//合同标题
	var contractSelect_custom="<spring:message code='lable.contract.custom' />";//所属客户
	var contractSelect_product="<spring:message code='lable.contract.product' />";//所属产品
	var contractSelect_signDate="<spring:message code='lable.contract.signDate' />";//签订日期
	var contractSelect_price="<spring:message code='lable.contract.price' />";//合同金额
	var contractSelect_coinType="<spring:message code='lable.contract.coinType' />";//币种
	var contractSelect_freeTime="<spring:message code='lable.contract.freeTime' />";//免费服务期
	var contractSelect_sendDays="<spring:message code='lable.contract.sendDays' />";//赠送人天
	var contractSelect_expiryDate="<spring:message code='lable.contract.expiryDate' />";//有效期
	var contractSelect_status="<spring:message code='lable.contract.status' />";//合同状态
	var contractSelect_attachment="<spring:message code='common.label.attachment' />";//附件		
	var contractSelect_pleaseSelectRecord="<spring:message code='label.performanceManager.pleaseSelectRecord' />";//请勾选记录！
	var gridContractSelect = new Datatable();//合同维护Datatable
	$("#contractSelectFormId #belongProduct").initDic(null,codeBasicInfo.PRODUCT);
	$("#contractSelectFormId #belongCustomerid").initCustomerInfo(null);
	var contractSelect_contractId='${contractId}'; //合同选择
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/contractmanage/contractmaintenance/contractSelect.js"></script>