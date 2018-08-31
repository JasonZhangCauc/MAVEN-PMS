<!-- 合同跟踪主界面  raomingyi 20180322-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="portlet box grey-cascade form-fit">
	<div class="portlet-body form border-green m-bordered">
		<form class="form-horizontal form-bordered" id="contractTrackFormId" data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
			<div class="form-group">
				<!--合同标题-->
                <label class="col-md-1 control-label">
                	<spring:message code='lable.contract.title'/>:
                </label>
                <div class="col-md-3 text-left">
                    <input type="text" name="contractTitle" class="form-control form-filter spinner" 
                    readonly="readonly" value="${contractVo.contractTitle}"> 
                </div>
			    <!--合同编号-->
                <label class="col-md-1 control-label">
                	<spring:message code='lable.contract.contractNo'/>:
                </label>
                <div class="col-md-3 text-left">
                    <input type="text" 
                    name="contractNo"
                    data-width="100%" 
                    class="form-control form-filter spinner" 
                    readonly="readonly" 
                    value="${contractVo.contractNo}"> 
                </div>				
                <!--合同状态-->	
                <label class="col-md-1 control-label">
                	<spring:message code='lable.contract.status'/>:
                </label>				
				<div class="col-md-2">
					<select class="bs-select form-filter form-control" 
							data-size="10" 
							data-width="100%"
							readonly="readonly"
							value="${contractVo.contractStatus}"
							id="contractStatus"
							name="contractStatus">
					 </select>	
				</div>
			</div>
			<div class="form-group">
			    <!--合同金额-->
                <label class="col-md-1 control-label">
                	<spring:message code='lable.contract.price'/>:
                </label>
                <div class="col-md-3 text-left">
                    <input type="text" 
                    name="contractAmount" 
                    class="form-control form-filter spinner" 
                    readonly="readonly" 
                    value="${contractVo.contractAmount}"> 
                </div>			
			   <!-- 所属客户 -->				
				<label class="col-md-1 control-label">
                	<spring:message code='lable.contract.custom'/>:
                </label>				
				<div class="col-md-3 text-left">
					<select class="bs-select form-filter form-control" 
							data-size="10" 
							data-width="100%"
							readonly="readonly"
							value="${contractVo.belongCustomerid}"
							id="belongCustomerid"
							name="belongCustomerid">
					 </select>	
				</div>
				<!-- 所属产品 -->
				<label class="col-md-1 control-label">
					<spring:message code='lable.contract.product'/>:
				</label>						 
				<div class="col-md-2">
					<select class="bs-select form-filter form-control" 
							data-size="10" 
							data-width="100%"
							readonly="readonly"
							value="${contractVo.belongProduct}"
							id="belongProduct"
							name="belongProduct">
					 </select>	
				</div>
			</div>
			<div class="form-group">
			    <!--已到账金额-->
                <label class="col-md-1 control-label">
                	<spring:message code='lable.contractTrack.receivedMoney'/>:
                </label>
                <div class="col-md-3 text-left">
                    <input type="text" name="receivedMoney" class="form-control form-filter spinner" 
                    readonly="readonly" value="${contractVo.receivedMoney}"> 
                </div>		
			    <!--剩余免费服务期-->
                <label class="col-md-1 control-label">
                	<spring:message code='lable.contractTrack.restEffectiveDays'/>:
                </label>
                <div class="col-md-3 text-left">
                    <input type="text" 
                    name="restEffectiveDays" 
                    class="form-control form-filter spinner" 
                    readonly="readonly" 
                    value="${contractVo.restEffectivedays}"> 
                </div>		
			    <!--剩余免费人天-->
                <label class="col-md-1 control-label">
                	<spring:message code='lable.contractTrack.restSendDays'/>:
                </label>
                <div class="col-md-2">
                    <input type="text" 
                    name="restSendDays" 
                    class="form-control form-filter spinner" 
                    readonly="readonly" 
                    value="${contractVo.restSenddays}"> 
                </div>											
		    </div>
		</form>
	</div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="mt-element-ribbon bg-grey-steel">
            <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
                 <div class="ribbon-sub ribbon-clip"></div> 
                 <span class="caption-subject bold uppercase"><spring:message code='lable.contractTrack.trackTable' /></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">       
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
	                        <auth:auth resourceCode="R003_0402">	
								<a href="<%=request.getContextPath()%>/contractmanage/contractTrackEdit?operate=add&contractId=${contractVo.id}" data-target="#newContractTrackModalId" 
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
	                    <table class="table table-striped table-bordered table-hover" id="contractTrackMianTableId"></table>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<!-- 合同跟踪编辑弹出框 -->
<div id="newContractTrackModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:52%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var projectStage="<spring:message code='label.contractTrack.projectStage' />";//项目阶段
	var persondayCounts="<spring:message code='label.contractTrack.persondayCounts' />";//使用人天数量
	var remark="<spring:message code='label.contractTrack.remark' />";//备注
	var createBy="<spring:message code='label.contractTrack.createBy' />";//创建人
	var createDate="<spring:message code='label.contractTrack.createDate' />";//创建时间
	var attachment="<spring:message code='common.label.attachment' />";//附件	
	var gridContractTrack = new Datatable();//合同跟踪表Datatable
	var deleteTrackConfirmMsg="<spring:message code='message.contractTrack.sureDeleteContractTrack' />";//确定删除该跟踪记录吗
	var hasEditContractTrackAuth = isUserHasAuth("R003_0402")//新增/编辑合同跟踪记录权
	var hasDeleteContractTrackAuth = isUserHasAuth("R003_0403");//删除合同跟踪记录权限
	var ContractTrack_contractId='${contractVo.id}';
	//初始化值
	$("#contractTrackFormId #belongProduct").initDic('${contractVo.belongProduct}',codeBasicInfo.PRODUCT);
    $("#contractTrackFormId #belongCustomerid").initCustomerInfo('${contractVo.belongCustomerid}');
	$("#contractTrackFormId #contractStatus").initDic('${contractVo.contractStatus}',codeBasicInfo.contractStatus);
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/contractmanage/contracttrack/contractTrackMain.js"></script>