<!-- 基础信息维护管理主界面  ZHOUMIN 20180305-->
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
		         <form class="form-horizontal" id="codeMianFormId" method="post">
			         <div class="form-body">
				         <div class="form-group">
			            	<!-- 字典中文名称 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.codeManager.codeName' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="codeZh" class="form-control form-filter spinner"
			                     	placeholder="<spring:message code='message.pleaseinput'/>">  
			                </div>
			                <!-- 字典类型 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.codeManager.codeType' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<select class="bs-select form-filter form-control" 
									data-size="10" 
									multiple
									title="<spring:message code='message.pleaseselect' />" 
									id="codeType"
									name="codeType">
			                    </select>
			                </div>
			                <div class="col-md-1 text-left">
							    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchCodeBtn">
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
    <div class="col-md-12">
        <div class="portlet light portlet-fit portlet-datatable bordered">
        	<div class="mt-element-ribbon bg-grey-steel">
	           <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
	                <div class="ribbon-sub ribbon-clip"></div> 
	                <span class="caption-subject bold uppercase"><spring:message code='label.codeManager.code'/></span> 
		       </div>
		    </div>
            <div class="portlet-title">
               <div class="actions">
                    <div class="btn-group btn-group-devided" data-toggle="buttons">
                    	<auth:auth  resourceCode="R014_03_OPERATION_EDIT">
							<a href="<%=request.getContextPath()%>/systemManage/codeManagerEdit?operate=add" data-target="#code-modal" 
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
                    <table class="table table-striped table-bordered table-hover" id="codeMianTableId"></table>
                </div>
            </div>
        </div> 
    </div>
</div>
<!-- End: The query results -->
<!-- 基础信息新增/编辑弹出框 -->
<div id="code-modal" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var codeManagerMain_codeZh = "<spring:message code='label.codeManager.codeZh' />";   //字典中文名称
	var codeManagerMain_codeEn = "<spring:message code='label.codeManager.codeEn' />";   //字典英文名称
	var codeManagerMain_codeValue = "<spring:message code='label.codeManager.codeValue' />";   //字典值
	var codeManagerMain_codeType = "<spring:message code='label.codeManager.codeType' />";   //字典类型
	var codeManagerMain_codeTypeName = "<spring:message code='label.codeManager.codeTypeName' />";   //字典类型名称
	var codeManagerMain_codeFlag = "<spring:message code='label.codeManager.codeFlag' />";   //字典状态
	var codeManagerMain_codeRemark = "<spring:message code='label.codeManager.codeRemark' />";   //字典备注
	var codeManagerMain_disable="<spring:message code='label.sysmanage.disable' />";//停用
	var codeManagerMain_enable="<spring:message code='label.sysmanage.enable' />";//启用
	var codeManagerMain_disableMsg="<spring:message code='label.codeManager.codetodisableselected' />";//确定停用该基础信息吗？
	var codeManagerMain_enableMsg="<spring:message code='label.codeManager.codetoenableselected' />";//确定启用该基础信息吗?
	var codeManagerMain_disablesuccess="<spring:message code='label.sysmanage.disablesuccess' />";//停用成功
	var codeManagerMain_enablefail="<spring:message code='label.sysmanage.enablesuccess' />";//启用成功
	var gridCode = new Datatable();//基础信息维护管理Datatable
	var hasEditAuthCode = isUserHasAuth("R014_03_OPERATION_EDIT");//编辑权限
	var hasCodeDisableAuth = isUserHasAuth("R014_03_OPERATION_DELETE");//停用/启用权限
	$("#codeMianFormId #codeType").initParentCode("");
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/codeManager/codeManager.js"></script>