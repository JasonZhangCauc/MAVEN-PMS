<!-- 角色分配资源窗口 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div class="portlet box grey-cascade form-fit" id="assignResourceDiv">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i>
					<spring:message code='label.rolemanage.assignResource' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> <a
						href="javascript:;" class="remove" data-dismiss="modal"> </a>
				</div>
			</div>
			<div class="portlet-body">
				<div id="treeDiv"></div>
				<div style="text-align: center;margin: 10px;">
					<button type="button" class="btn green" id="assignResourceBtn">
						<i class="fa fa-check"></i>
						<spring:message code='btn.common.save' />
					</button>
					<button type="button" data-dismiss="modal" class="btn default"
						id="closeAsignResourseBtn">
						<i class="fa fa-mail-forward"></i>
						<spring:message code='btn.common.close' />
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var setResourceSuccess = "<spring:message code='label.sysmanage.setresourcesuccess' />";
	var atlestChooseOneResource = "<spring:message code='message.atlestchooseoneresource' />";//至少选择一个资源
	var roleId = '${roleId}';
</script>
<!-- 引用js --> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/roleManager/assignResource.js"></script>

