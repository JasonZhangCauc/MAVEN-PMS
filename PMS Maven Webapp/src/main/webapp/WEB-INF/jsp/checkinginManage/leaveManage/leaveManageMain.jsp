<!-- 合同维护 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<%@ page import="com.ps.result.systemmanage.UserVo"%>
<%
	UserVo loginUser = (UserVo) request.getSession().getAttribute("user");
%>
<!-- BEGIN PAGE BASE CONTENT -->
<div class="m-heading-1 m-bordered">
	<form class="form-horizontal" id="leaveMianFormId" method="post">
        <div class="row">
            <div class="form-group">
			    <!--请假人-->
              
               <label class="col-md-1 control-label">
               	<spring:message code='lable.leave.by' />:
               </label>
               <div class="col-md-2 text-left">
                   <input type="text" value="" name="leaveByName" id="leaveByName" class="form-control form-filter spinner"
                    	 placeholder="<spring:message code='message.pleaseinput'/>"> 
               </div>
			    			
                <!--请假类型-->	
                <label class="col-md-1 control-label">
                	<spring:message code='lable.leave.type'/>:
                </label>
				<div class="col-md-2 text-left">
					<select class="bs-select form-filter form-control" 
						multiple
						data-size="6" 
						title="<spring:message code='label.allitem' />"  
						name="leaveType"
						id="leaveType">
                    </select>
                </div>
                     <!-- 日期 -->
	                <label class="col-md-1 control-label">
	                	<spring:message code='label.chickinginManager.cardRecord.time' />:
	                </label>
	                <div class="col-md-2 text-left">
	                	<div class=" input-group input-large">
							<input type="text" 
								class="dateSelect"
								id="signStartDate" 
								name="signStartDate" 
								placeholder="<spring:message code='common.label.from'/>" 
								class="date-picker  dateSelect " 
								data-date-format="yyyy-mm-dd ">
						</div>
	                </div>     
                <div class="col-md-2 text-right">
					<a href="javascript:;" class="btn default btn-sm blue-madison" id="searchContractBtn"> 
						<i class="fa fa-search"></i>
					</a>
									    
				</div>				
			 </div>
			 
		 </div>			                 
    </form>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="mt-element-ribbon bg-grey-steel">
            <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
                 <div class="ribbon-sub ribbon-clip"></div> 
                 <span class="caption-subject bold uppercase"><spring:message code='lable.contract.contractpreventive'/></span> 
	        </div>
	        <!-- Begin: life time stats -->
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">	                
	                <div class="actions">
	                    
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
							 <a href="<%=request.getContextPath()%>/checkinginManage/leaveManageEdit?operate=add" id="newProInfoModalIds" data-target="#todo-task-modal" data-toggle="modal" class="btn btn-circle green-haze">
								<i class="fa fa-plus"></i>
						    </a>
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
	                    <table class="table table-striped table-bordered table-hover" id="leaveMianTableId"></table>
	                </div>
	            </div>
	         </div>           
        </div>
        <!-- End: life time stats -->
    </div>
     
</div>
<!-- END PAGE BASE CONTENT --> 
<!-- BEGIN 弹框 --> 
<div id="todo-task-modal" class="modal fade todo-task-modal in" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;width:100%" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div>
<!-- END 弹框 --> 
<script type="text/javascript">	
	var t1="<spring:message code='lable.leave.status' />";//请假状态
	var t2="<spring:message code='lable.leave.by' />";//请假人
	var t3="<spring:message code='lable.leave.type' />";//请假类型
	var t4="<spring:message code='lable.leave.starttime' />";//开始时间
	var t5="<spring:message code='lable.leave.endtime' />";//结束时间
	var passBtn="<spring:message code='lable.contract.approvalPass' />";//通过按钮
    var backBtn="<spring:message code='lable.contract.approvalBack' />";//回退按钮
    var passMsg="<spring:message code='message.leave.surePassMsg' />";//确认审批通过该请假信息吗？
    var backMsg="<spring:message code='message.leave.sureBackMsg' />";//确认退回该请假信息吗？	
    var sendBtn="<spring:message code='lable.leave.send' />";//删除请假信息
	var deleteContractConfirmMsg="<spring:message code='message.leave.sureDeleteLeave' />";//确定删除该合同吗
	var sureSendMsg="<spring:message code='message.leave.sureSendLeave' />";//确定提交该合同吗
	var gridContract = new Datatable();//合同维护Datatable
	var hasEditContractAuth = isUserHasAuth("R012_02_OPERATION_EDIT");//新增/编辑合同权限
	var hasDeleteContractAuth =  isUserHasAuth("R012_02_OPERATION_DEL");//删除合同权限
	var hasSendContractAuth =  isUserHasAuth("R012_02_OPERATION_AUTH");//提交合同权限
	
    $("#leaveMianFormId #leaveType").initDic(null,codeBasicInfo.leaveType); 
    
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/checkinginManage/leaveManage/leaveManage.js"></script>