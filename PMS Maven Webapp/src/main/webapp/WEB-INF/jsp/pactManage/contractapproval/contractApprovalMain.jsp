<!-- 合同审批 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- BEGIN PAGE BASE CONTENT -->
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			 <div class="portlet-title">
	             <div class="caption">
	                 <i class="fa fa-filter font-red"></i>
	                 <span class="caption-subject font-red sbold uppercase"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">查询条件</font></font></span>
	             </div>
	             <div class="tools">
	                 <a href="javascript:;" class="collapse"> </a>
	                 <a href="javascript:;" class="reload"> </a>
	             </div>
	         </div>
	         <div class="portlet-body form">
             	<form class="form-horizontal" id="approvalMianFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
						    <!--合同标题-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.contract.title'/>:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="contractTitle" class="form-control form-filter spinner" 
			                         placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
						    			
			                <!--合同状态-->	
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.contract.status'/>:
			                </label>
							<div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control" 
									multiple 
									data-size="6" 
									title="<spring:message code='label.allitem' />"  
									name="contractStatus"
									id="contractStatus">
			                    </select>
			                </div>
			                 <!--所属客户-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.saleTrack.proCustomSh'/>:
			                </label>			   
			                <div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control"  
									multiple 
									data-size="20" 
									title="<spring:message code='label.allitem' />" 
									name="belongCustomerid"
									id="belongCustomerid"
									>
			                    </select>
			                </div>       
			                <div class="col-md-2 text-right">
			                   <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchContractAppBtn">
                                  <span class="ladda-label"><i class="fa fa-search"></i></span>
                                  <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                               </button>
                               <button type="button" data-target="#contractAppHide" data-toggle="collapse" aria-expanded="false" class="btn default" data-style="slide-left" id="searchContractAppBtn">
                                   <span class="ladda-label"><i class="fa fa-filter"></i></span>
                               </button>			    
							</div>				
						 </div>
						<div class="form-group line_p collapse" id="contractAppHide" aria-expanded=false>
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
								<spring:message code='lable.contract.signDate'/>:
							</label>
							 <div class="col-md-2 text-left">
				                	<div class="input-group input-large">
					                  <input type="text" 
											id="signStartDate"
											name="signStartDate" 
											placeholder="<spring:message code='common.label.from'/>" 
											class="date-picker form-control dateSelect" 
											data-date-format="yyyy-mm-dd">			
									   <span class="input-group-addon">to</span>
									   <input type="text" 
											id="signEndDate"
											name="signEndDate" 
											placeholder="<spring:message code='common.label.to'/>" 
											class="date-picker form-control dateSelect" 
											data-date-format="yyyy-mm-dd">							    
									</div>
				              </div>
						  </div>						   
					  </div> 
					</div>			                 
			    </form>
	         </div>
		</div>   
	</div>
</div>
<!-- END PAGE BASE CONTENT -->

<div class="row">
    <div class="col-md-12">
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	           <div class="portlet-title">	
                <div class="caption">
	                <i class="fa fa-info-circle font-dark"></i>
	                <span class="caption-subject bold uppercase">
	                <spring:message code='lable.contract.contract'/>
	                </span>
	            </div> 
                <div class="actions">	
                	<div class="btn-group btn-group-devided" data-toggle="buttons">
						<a href="/PMS/pactManage/contractApprovalDetail?operate=add" data-target="#project-modal" data-toggle="modal" class="btn btn-circle green-haze">
						<i class="fa fa-plus"></i></a>
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
	                    <table class="table table-striped table-bordered table-hover" id="contractMianTableId"></table>
	                </div>
	            </div>           
	      </div>
    </div>     
</div>
<!-- BEGIN 弹框 --> 
<div id="newContractAppModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:60%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!-- END 弹框 -->
<script type="text/javascript">
	var t1="<spring:message code='lable.contract.contractNo' />";//合同编号
	var t2="<spring:message code='lable.contract.title' />";//合同标题
	var t3="<spring:message code='lable.contract.custom' />";//所属客户
	var t4="<spring:message code='lable.contract.product' />";//所属产品
	var t5="<spring:message code='lable.contract.signDate' />";//签订日期
	var t6="<spring:message code='lable.contract.price' />";//合同金额
	var t7="<spring:message code='lable.contract.coinType' />";//币种
	var t8="<spring:message code='lable.contract.freeTime' />";//免费服务期
	var t9="<spring:message code='lable.contract.sendDays' />";//赠送人天
	var t10="<spring:message code='lable.contract.expiryDate' />";//有效期
	var t11="<spring:message code='lable.contract.status' />";//合同状态
	var t12="<spring:message code='lable.contract.creater' />";//创建人
	var attachment="<spring:message code='common.label.attachment' />";//附件
	var gridContractApp = new Datatable();//合同审批Datatable
	var hasContractAppAuth = isUserHasAuth("R003_0201");//审批/退回合同权限		
	var passBtn="<spring:message code='lable.contract.approvalPass' />";//通过按钮
    var backBtn="<spring:message code='lable.contract.approvalBack' />";//回退按钮
    var passMsg="<spring:message code='message.contract.surePassMsg' />";//确认审批通过该合同吗？
    var backMsg="<spring:message code='message.contract.sureBackMsg' />";//确认退回该合同吗？
	var lookoverBtn="<spring:message code='lable.contract.lookover' />";//查看按钮
	var previewBtn="<spring:message code='lable.contract.preview' />";//预览按钮

	$("#approvalMianFormId #belongProduct").initDic(null,codeBasicInfo.PRODUCT);
    $("#approvalMianFormId #contractStatus").initDic(null,codeBasicInfo.contractStatus);
    $("#approvalMianFormId #belongCustomerid").initCustomerInfo(null);
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/pactManage/contractapproval/contractApprovalMain.js"></script>