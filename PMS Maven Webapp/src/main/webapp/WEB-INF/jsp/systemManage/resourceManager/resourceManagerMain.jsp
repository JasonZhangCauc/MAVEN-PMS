<!-- 资源管理主界面  ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
        	<div class="portlet box grey-cascade form-fit">
	            <div class="portlet-body">
	                 <ul id="resourceTreeId" class="ztree" style="overflow:auto;max-height:500px;"></ul>
	            </div>
            </div>
        </div>
    </div>
</div>
<!-- 组织架构新	增/编辑弹出框 -->
<div id="newResourceModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:60%;height:80%;" >
		<div class="modal-content" id="resourceEditId">
		</div>
	</div>
</div>
<!-- 引用参数列表 -->
<script type="text/javascript">
	var hasAddAuth = true;
	var hasEditAuth = true;
	var hasDeleteAuth = true;
	var hasEnableAuth = true;
	var hasDisableAuth = true;
	var addtraintype="<spring:message code='btn.common.add' />";//新增
	var deletetraintype="<spring:message code='btn.common.delete' />";//删除
	var edittraintype="<spring:message code='btn.common.edit' />";//编辑
	var enabletraintype="<spring:message code='label.sysmanage.enable' />";//启用
	var disabletraintype="<spring:message code='label.sysmanage.disable' />";//禁用
	var enableResourceMsg="<spring:message code='lable.resourceManager.enableResourceMsg' />";//确认启用该资源吗？
	var disableResourceMsg="<spring:message code='lable.resourceManager.disableResourceMsg' />";//确认禁用该资源吗？
	var enableSuccess="<spring:message code='label.sysmanage.enablesuccess' />";//启用成功
	var disableSuccess="<spring:message code='label.sysmanage.disablesuccess' />";//禁用成功
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/resourceManager/resourceManager.js"></script>