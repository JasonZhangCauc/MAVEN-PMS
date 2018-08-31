<!-- 角色管理主界面 HuangPeng 20180420 -->
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
		         <form class="form-horizontal" id="roleMianFormId" method="post">
			         <div class="form-body">
				         <div class="form-group">
			                <!-- 角色名称 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.rolemanage.rolename' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="roleName" class="form-control form-filter spinner" 
			                    	placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <!-- 状态 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.rolemanage.rolestatus' />:
			                </label>
			                <div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control" 
									multiple 
									data-size="10" 
									title="<spring:message code='label.allitem'/>"
									name="roleFlag">
			                        <option value="0"><spring:message code='common.label.valid' /></option>
									<option value="1"><spring:message code='common.label.invalid' /></option>
			                    </select>
			                </div>
			                <div class="col-md-1 text-left">
							     <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchRoleBtn">
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
	                <span class="caption-subject bold uppercase"><spring:message code='label.userManage.roleInfo'/></span> 
		       </div>
		    </div>
            <div class="portlet-title">
                <div class="actions">
                    <div class="btn-group btn-group-devided" data-toggle="buttons">
                    	<auth:auth resourceCode="R014_02_OPERATION_EDIT">
							<a href="<%=request.getContextPath()%>/systemManage/roleManagerEdit?operate=add" data-target="#role-modal" 
							   data-toggle="modal" class="btn btn-circle green-haze">
							   <i class="fa fa-plus"></i>
							</a>
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
                    <table class="table table-striped table-bordered table-hover" id="roleMianTableId"></table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="portlet light portlet-fit portlet-datatable bordered">
        	<div class="mt-element-ribbon bg-grey-steel">
	           <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
	                <div class="ribbon-sub ribbon-clip"></div> 
	                <span class="caption-subject bold uppercase"><spring:message code='label.userManage.resourceTree'/></span> 
		       </div>
		    </div>
            <div class="portlet-title">
                <div class="actions">
                    <div class="btn-group btn-group-devided" data-toggle="buttons">
                        <a href="javascript:void(0);" id="assignRoleResourceBtn" class="btn btn-circle btn-sm yellow">
								<i class="fa fa-user"></i>
							</a>  
                    </div>
                </div>
            </div>
            <div class="portlet box grey-cascade form-fit" id="assignResourceDiv">
	            <div class="portlet-body" style="height: 550px;">
	                 <ul id="roleResourceTree" class="ztree" style="overflow:auto;height: 520px;"></ul>
	            </div>
            </div>
        </div>
    </div>
</div>
<!-- End: The query results -->
<!-- 角色新增/编辑弹出框 -->
<div id="role-modal" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div> 
<!-- 参数列表 --> 
<script type="text/javascript">
    var roleId = '${roleId}';
    var r1 = "<spring:message code='label.sysmanage.rolename' />";//角色名称
    var r2 = "角色职责";//职责
	var r3 = "<spring:message code='label.rolemanage.remark' />";//角色描述
	var disableConfirmMsg = "<spring:message code='message.roletodisableselected' />";//确定停用该角色吗？
	var enableConfirmMsg = "<spring:message code='message.roletoenableselected' />";//确定启用该角色吗?
	var deleteRoleConfirmMsg = "<spring:message code='message.deleteauthroleselected' />";//确定删除该角色吗?
	var roledisablesuccess = "<spring:message code='label.sysmanage.disablesuccess' />";//停用成功
	var roleenablefail = "<spring:message code='label.sysmanage.enablesuccess' />";//启用成功
	var setResourceSuccess = "<spring:message code='label.sysmanage.setresourcesuccess' />";
	var atlestChooseOneResource = "<spring:message code='message.atlestchooseoneresource' />";//至少选择一个资源
	var atlestchooseonerole = "<spring:message code='message.atlestchooseonerole' />";//请选择角色
	var gridRole = new Datatable();//角色管理Datatable
	var hasEditAuthRole = isUserHasAuth("R014_02_OPERATION_EDIT");//编辑权限
	var hasRoleDisableAuth = isUserHasAuth("R014_02_OPERATION_DISABLED");//停用/启用权限
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/roleManager/roleManager.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/roleManager/assignResource.js"></script>
