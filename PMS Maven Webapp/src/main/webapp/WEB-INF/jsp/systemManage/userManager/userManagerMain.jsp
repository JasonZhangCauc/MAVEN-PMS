<!-- 用户管理主界面 HuangPeng 20180420 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- Begin: Query conditions -->
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
		         <form class="form-horizontal" id="userMianFormId" method="post">
			         <div class="form-body">
				         <div class="form-group">
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.userManage.workNumber'/>:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="userAccount" class="form-control form-filter spinner" 
			                    	placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.userManage.userName'/>:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="userName" class="form-control form-filter spinner" 
			                    	placeholder="<spring:message code='message.pleaseinput'/>">  
			                </div>
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.userManage.userFlag'/>:
			                </label>
			                <div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control" 
									multiple 
									data-size="10"
									data-with="70%" 
									title="<spring:message code='label.allitem'/>" 
									name="userFlag">
			                        <option value="0"><spring:message code='common.label.valid' /></option>
									<option value="1"><spring:message code='common.label.invalid' /></option>
			                    </select>
			                </div>
			                <div class="col-md-1 text-left">
							    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchUserBtn">
                                   <span class="ladda-label"><i class="fa fa-search"></i></span>
                                   <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
							</div>
			            </div>
			         </div>
		         </form>  
	         </div>
		</div>   
	</div>
</div>
<!-- End: Query conditions -->
<!-- Begin: The query results -->
<div class="row">
    <div class="col-md-8">
        <div class="portlet light portlet-fit portlet-datatable bordered">
        	<div class="mt-element-ribbon bg-grey-steel">
	           <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
	                <div class="ribbon-sub ribbon-clip"></div> 
	                <span class="caption-subject bold uppercase"><spring:message code='label.userManage.userInfo'/></span> 
		       </div>
		    </div>
            <div class="portlet-title">
                <div class="actions">
                    <div class="btn-group btn-group-devided" data-toggle="buttons">
						<auth:auth resourceCode="R014_01_OPERATION_ALLOT">	
							<a href="<%=request.getContextPath()%>/systemManage/userManagerEdit?operate=add" data-target="#user-modal" 
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
                    <table class="table table-striped table-bordered table-hover" id="userMianTableId"></table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="portlet light portlet-fit portlet-datatable bordered">
        	<div class="mt-element-ribbon bg-grey-steel">
	           <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
	                <div class="ribbon-sub ribbon-clip"></div> 
	                <span class="caption-subject bold uppercase"><spring:message code='label.userManage.roleInfo'/></span> 
		       </div>
		    </div>
            <div class="portlet-title">
                <div class="actions">
                    <div class="btn-group btn-group-devided" data-toggle="buttons">
                        <auth:auth  resourceCode="R014_01_OPERATION_ALLOT">
							<a href="javascript:void(0);" id="assignroleBtn" class="btn btn-circle btn-sm yellow">
							<i class="fa fa-user"></i>
							</a>  
						</auth:auth>  
                    </div>
                </div>
            </div>
            <div class="portlet-body" >
                <div class="table-container" >
                    <table class="table table-striped table-bordered table-hover" id="userAssignRoleTableId"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End: The query results -->
<!-- 弹出框 --> 
<div id="user-modal" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div> 
<script type="text/javascript">
    var t1 = "<spring:message code='label.userManage.userPic' />"; //头像
	var t2 = "<spring:message code='label.userManage.workNumber' />";//员工编号
	var t3 = "<spring:message code='label.userManage.userName' />";//姓名
	var t4 = "<spring:message code='lable.linker.mailbox' />";//邮箱
	var t5 = "<spring:message code='label.remark' />";//备注
	var r1 = "<spring:message code='label.sysmanage.rolename' />";//角色名称
	var resetPwdMessage = "<spring:message code='message.resetpwdmessage' />";//您确定要重置密码吗？
	var resetPwdHint = "<spring:message code='message.resetpwdhint' />";//重置密码成功！您的密码为1234！
	var userdisablesuccess = "<spring:message code='label.sysmanage.disablesuccess' />";//停用成功
	var userenablefail = "<spring:message code='label.sysmanage.enablesuccess' />";//启用成功
	var disableConfirmMsg = "<spring:message code='message.suretodisableselected' />";//确定停用该用户吗
	var enableConfirmMsg = "<spring:message code='message.suretoenableselected' />";//确定启用该用户吗
	var currentdisableselected = "<spring:message code='message.currentuserdisableselected' />";//确定停用当前用户吗
	var assignrolesuccess = "<spring:message code='label.sysmanage.assignrolesuccess' />";//分配角色成功
	var gridUser = new Datatable();
	var gridRole = new Datatable();
	var hasEditAuthUser = isUserHasAuth("R014_01_OPERATION_EDIT");			//编辑权限
	var hasResertPsswordAuth = isUserHasAuth("R014_01_OPERATION_RESET"); 	//重置密码权限
	var hasUserDisableAuth = isUserHasAuth("R014_01_OPERATION_DISABLED");	//停用/启用权限
</script>
<script src="<%=request.getContextPath()%>/resources/systemManage/userManager/userManager.js" type="text/javascript"></script>