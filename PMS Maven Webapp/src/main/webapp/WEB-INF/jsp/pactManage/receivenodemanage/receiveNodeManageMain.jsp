<!-- 收款节点管理 -->
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
             	<form class="form-horizontal" id="contractNodeFormId" method="post">
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
						    <!--合同编号-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.contract.contractNo'/>:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="contractNo" class="form-control form-filter spinner" 
			                       placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>				
			                <!--收款状态-->	
							<label class="col-md-1 control-label">
								<spring:message code='label.receiveNode.receivableStatus'/>:
							</label>
							<div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control" 						
									multiple
									data-size="10"
									data-live-search="true"  
									title="<spring:message code='label.allitem' />" 
									name="receivableStatus"
									id="receivableStatus">
								</select>
							</div>
			                <div class="col-md-2 text-right">
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchContractBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
                                <button type="button" data-target="#receiveNodeHide" data-toggle="collapse" aria-expanded="false" class="btn default" data-style="slide-left" id="searchContractBtn">
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>					    
							</div>				
						 </div>
						<div class="form-group line_p collapse" id="receiveNodeHide" aria-expanded=false>
						 <div class="form-group"> 
						  <!--合同状态-->	
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.contract.status'/>:
			                </label>
							<div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control" 
								    multiple 
									data-size="6"
									data-live-search="true"  
									title="<spring:message code='label.allitem' />"  
									name="contractStatus"
									id="contractStatus">
			                    </select>
			                </div>                                       							  
							 <!--所属产品-->	
							<label class="col-md-1 control-label">
								<spring:message code='lable.contract.product'/>:
							</label>
							<div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control"
								    multiple  						
									data-size="10" 
									data-live-search="true" 
									title="<spring:message code='label.allitem' />" 
									name="belongProduct"
									id="belongProduct">
								</select>
							</div>
							<!--项目阶段-->	
							<label class="col-md-1 control-label">
								<spring:message code='label.receiveNode.projectStage'/>:
							</label>
							<div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control" 						
									multiple 
									data-size="10"
									data-live-search="true"  
									title="<spring:message code='label.allitem' />" 
									name="projectStage"
									id="projectStage">
								</select>
							</div>		
						 </div>
						 <div class="form-group">
						  <!--所属客户-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.saleTrack.proCustom'/>:
			                </label>			   
			                <div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control" 
								    multiple  
									data-size="20"
									data-live-search="true"  
									title="<spring:message code='label.allitem' />" 
									name="belongCustomerid"
									id="belongCustomerid"
									>
			                    </select>
			                </div>
			                <!--签定日期范围-->
							<label class="col-md-1 control-label">
								<spring:message code='lable.contract.signDateRange'/>:
							</label>
							<div class="col-md-5 text-left">
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
	                <span class="caption-subject bold uppercase">合同信息</span>
		        </div> 
                <div class="actions">	                    
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
    <div class="col-md-12">
        <div class="portlet light portlet-fit portlet-datatable bordered">
            <div class="portlet-title">
                <div class="caption">
	                <i class="fa fa-info-circle font-dark"></i>
	                <span class="caption-subject bold uppercase">收款节点</span>
	            </div> 
                <div class="actions">	                    
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
                    <table class="table table-striped table-bordered table-hover" id="nodeMianTableId"></table>
                </div>
            </div>         
        </div>
    </div>
</div>
<!-- END PAGE BASE CONTENT --> 
<!-- BEGIN 弹框 --> 
<div id="newContractNodeModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:60%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<div id="addNodeModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:50%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!-- END 弹框 --> 
<script type="text/javascript">	
	var contractNo="<spring:message code='lable.contract.contractNo' />";//合同编号
	var title="<spring:message code='lable.contract.title' />";//合同标题
	var custom="<spring:message code='lable.contract.custom' />";//所属客户
	var product="<spring:message code='lable.contract.product' />";//所属产品
	var signDate="<spring:message code='lable.contract.signDate' />";//签订日期
	var price="<spring:message code='lable.contract.price' />";//合同金额
	var coinType="<spring:message code='lable.contract.coinType' />";//币种
	var freeTime="<spring:message code='lable.contract.freeTime' />";//免费服务期
	var sendDays="<spring:message code='lable.contract.sendDays' />";//赠送人天
	var expiryDate="<spring:message code='lable.contract.expiryDate' />";//有效期
	var status="<spring:message code='lable.contract.status' />";//合同状态
	var attachment="<spring:message code='common.label.attachment' />";//附件
	var receivablesNo="<spring:message code='label.receiveNode.receivablesNo' />";//收款节点编号
	var receivablesName="<spring:message code='label.receiveNode.receivablesName' />";//节点名称
	var projectStage="<spring:message code='label.receiveNode.projectStage' />";//项目阶段
	var receivableAmount="<spring:message code='label.receiveNode.receivableAmount' />";//应收金额
	var receivableDate="<spring:message code='label.receiveNode.receivableDate' />";//收款时间
	var receivableStatus="<spring:message code='label.receiveNode.receivableStatus' />";//收款状态
	var paymentRemark="<spring:message code='label.receiveNode.paymentRemark' />";//付款说明
	var responsibleBy="<spring:message code='label.receiveNode.responsibleBy' />";//负责人
	var billingDate="<spring:message code='label.receiveNode.billingDate' />";//开票时间
	var billingBy="<spring:message code='label.receiveNode.billingBy' />";//开票人	
    var addNodeBtn="<spring:message code='lable.receiveNode.add' />";//新增收款节点
    var lookoverBtn="<spring:message code='lable.contract.lookover' />";//查看合同按钮
	var deleteNodeConfirmMsg="<spring:message code='message.receiveNode.sureDeleteNode' />";//确定删除该收款节点吗
	var gridReceiveNode = new Datatable();//用户管理Datatable
	var gridContractInfo = new Datatable();//合同信息Datatable
	var hasEditNodeAuth = isUserHasAuth("R003_0301");//新增/编辑收款节点权限
	var hasDeleteNodeAuth = isUserHasAuth("R003_0301");//删除收款节点
	
	$("#contractNodeFormId #belongProduct").initDic(null,codeBasicInfo.PRODUCT);	
    $("#contractNodeFormId #contractStatus").initDic(null,codeBasicInfo.contractStatus);
	$("#contractNodeFormId #receivableStatus").initDic(null,codeBasicInfo.receiveNodeStatus);
	$("#contractNodeFormId #projectStage").initDic(null,codeBasicInfo.projectStage);
    $("#contractNodeFormId #belongCustomerid").initCustomerInfo(null);
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/contractmanage/receivenodemanage/receiveNodeManage.js"></script>