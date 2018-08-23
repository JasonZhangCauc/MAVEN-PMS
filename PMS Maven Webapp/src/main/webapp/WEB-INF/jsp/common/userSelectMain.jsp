<!-- 人员选择弹出界面 wb066 20180319 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<!-- BEGIN PAGE BASE CONTENT -->
<div class="row">
     <div class="col-md-12">
          <!-- BEGIN PORTLET-->
          <div class="portlet box grey-cascade form-fit">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i>
					<spring:message code='common.laber.userSelect' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> 
					<a href="javascript:;" class="remove" data-dismiss="modal"> </a>
				</div>
			</div>
			<div class="portlet-body m-heading-1 border-green m-bordered">
					<form class="form-horizontal" id="userSelectFormId" method="post">
				        <div class="row">
				            <div class="form-group">
							    <!--工号-->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.userManage.workNumber'/>:
				                </label>
				                <div class="col-md-3 text-left">
				                    <input type="text" name="userAccount" class="form-control form-filter spinner" 
				                         placeholder="<spring:message code='message.pleaseinput'/>">  
				                </div>
							    <!--姓名-->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.userManage.userName'/>:
				                </label>
				                <div class="col-md-3 text-left">
				                    <input type="text" name="userName" class="form-control form-filter spinner" 
				                    	placeholder="<spring:message code='message.pleaseinput'/>">
				                </div>				
				                <div class="col-md-2 text-right">
									<a href="javascript:;" class="btn default btn-sm blue-madison" id="searchUserSelectBtn"> 
										<i class="fa fa-search"></i>
										<spring:message code='btn.common.search' /> 
									</a>
								</div>				
							 </div>
						 </div>			                 
				    </form>
				<div class="row">
				    <div class="col-md-12">
				        <!-- Begin: life time stats -->
				        <div class="portlet light portlet-fit portlet-datatable bordered">
				            <div class="portlet-title">
				                <div class="caption">
				                    <i class="icon-settings font-dark"></i>
				                    <span class="caption-subject bold uppercase">
				                      <spring:message code='common.laber.userBaseInfo'/>
				                    </span>
				                </div>
				            </div>
				            <div class="portlet-body">
				                <div class="table-container">
				                    <table class="table table-striped table-bordered table-hover" id="userSelectTableId"></table>
				                </div>
				            </div>           
				        </div>
				        <!-- End: life time stats -->
				    </div>
				</div>
				<div style="text-align: center;margin: 10px;">
					<button type="button" class="btn green" id="userSelectBtn">
						<i class="fa fa-check"></i>
						<spring:message code='btn.common.save' />
					</button>
					<button type="button" data-dismiss="modal" class="btn default"
						id="closeUserSelectBtn">
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
	var userSelect_workNumber="<spring:message code='label.userManage.workNumber' />";//工号
	var userSelect_userName="<spring:message code='label.userManage.userName' />";//姓名
	var userSelect_pleaseSelectRecord="<spring:message code='label.performanceManager.pleaseSelectRecord' />";//请勾选记录！
	var gridUserSelect = new Datatable();//合同维护Datatable
	var userSelect_userId='${users}'.split(",");; //合同选择
	var userSelect_showId='${showId}'; //显示ID
	var userSelect_hideId='${hideId}'; //隐藏ID
	var radio = '${radio}';
	var userPosition='${userPosition}';
	var deptId='${deptId}';
	var yesSelectUserId=[];
	var yesSelectUserName=[];
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/common/userSelect.js"></script>