<!-- 绩效维护主界面  ZHOUMIN 20180305-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>

<div class="portlet box grey-cascade form-fit">
	<div class="portlet-body form border-green m-bordered">
		<form class="form-horizontal form-bordered" id="performanceNatrue" data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
			<div class="form-group">
				<!-- 工号 -->
				<label class="control-label col-md-1">
				   <spring:message code='label.userManage.workNumber' />
				</label>
				<div class="col-md-2">
					<input type="text" class="form-control" value="${userVo.userAccount }" readonly="readonly" />
				</div>
				<!-- 姓名 -->
				<label class="control-label col-md-1"><spring:message
						code='label.userManage.userName' /> </label>
				<div class="col-md-2">
					<input type="text" class="form-control" value="${userVo.userName }" readonly="readonly" />
				</div>
				<!-- 部门 -->
				<label class="control-label col-md-1"><spring:message
						code='label.userManage.userDept' /> </label>
				<div class="col-md-2">
					<input type="text" class="form-control" value="${userVo.deptId }" readonly="readonly" id="deptName" />
				</div>
			</div>
			<div class="form-group">
				<!-- 入职时间 -->
				<label class="control-label col-md-1"><spring:message
						code='label.userManage.entryDate' /> </label>
				<div class="col-md-2">
					<input type="text" class="form-control" value="${userVo.entryDate }" readonly="readonly" />
				</div>
				<!-- 用户性质 -->
				<label class="control-label col-md-1"><spring:message
						code='label.userManage.userNature' /> </label>
				<div class="col-md-2">
					<input type="text" class="form-control" value="${userVo.userNature }" readonly="readonly" id="userNature" />
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
                 <span class="caption-subject bold uppercase"><spring:message code='label.performanceManager.performanceNatrue' /></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">
	               <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">	                        
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
	                            </li>
	                        </ul>
	                    </div>
	                </div>            
	            </div>
	            <div class="portlet-body">
	                <div class="table-container">
	                    <table class="table table-striped table-bordered table-hover" id="performanceNatrueMianTableId"></table>
	                </div>
	            </div>
	        </div>
	     </div>
    </div>
</div>
<!-- 绩效档案编辑弹出框 -->
<div id="newPerformanceModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:50%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var performanceNatrue_month="<spring:message code='label.performanceManager.month' />";//绩效月份
	var performanceNatrue_grade="<spring:message code='label.performanceManager.grade' />";//绩效等级
	var performanceNatrue_kpa="<spring:message code='label.performanceManager.kpa' />";//kpa
	var performanceNatrue_comments="<spring:message code='label.performanceManager.comments' />";//评语
	var performanceNatrue_remarks="<spring:message code='label.performanceManager.remarks' />";//备注
	var performanceNatrue_performancescore="<spring:message code='label.performanceManager.performancescore' />";//绩效评分
	var gridPerformanceNatrue = new Datatable();//基础信息维护管理Datatable
	var hasEditAuthPerformanceNatrue = isUserHasAuth("R006_0103");//编辑权限
	var performanceNatrue_userId='${userVo.id}';
	var performanceNatrue_yearMonth='${yearMonth}';
	//初始化值
	$("#performanceNatrue #deptName").val(getDeptByIds('${userVo.deptId}'));
	$("#performanceNatrue #userNature").val(initCodeText('${userVo.userNature}',codeBasicInfo.userNature));
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/performanceManager/performanceNature/performanceNatrue.js"></script>