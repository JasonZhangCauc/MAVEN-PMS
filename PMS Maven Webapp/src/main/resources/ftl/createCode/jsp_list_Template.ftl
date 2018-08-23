<%--  主页面 ${author} ${nowDate?string("yyyy-MM-dd")}  --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%   
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<div class="bjui-pageHeader" style="background-color:#fff; border-bottom:none;">
	<form id="${objectNameLower}MianFormId" method="post">
	    <div class="note note-success">
		    <div class="bjui-row col-4">
	        	<!-- 账号 -->
		        <label class="row-label"><spring:message code='label.userManage.userAccount' />：</label>
		        <div class="row-input">
		            <input name="userAccount" type="text">
		        </div>
		        <!-- 姓名 -->
			    	<label class="row-label"><spring:message code='label.userManage.userName' />：</label>
		        <div class="row-input">
		            <input name="userName" type="text">
		        </div>
		        <!-- 部门 --> 
		        <label class="row-label"><spring:message code='label.userManage.userDept' />：</label>
		        <div class="row-input">
		        	<input name="deptName" type="text">
		        </div>
		        <button type="button" id="${objectNameLower}SearchBtn" class="btn-green" data-icon="search">
		            <spring:message code='btn.common.search' />
		        </button>
		        <button type="button" onclick="viewSearch()" class="btn-orange margin-md-1" data-icon="fa-unsorted">
		            <spring:message code='common.label.more' />
		        </button>
      	</div>
				<div class="bjui-row col-4 moreView">
	        	<!-- 模块 -->
		        <label class="row-label"><spring:message code='label.userManage.userModule' />：</label>
		        <div class="row-input">
		        	<input name="userModuleName" type="text">
		        </div>
		        <!-- 岗位 -->
			    	<label class="row-label"><spring:message code='label.userManage.userPosition' />：</label>
		        <div class="row-input">
		        	<input name="userPositionName" type="text">
		        </div>
		        <!-- 员工编号 -->
		        <label class="row-label"><spring:message code='label.userManage.userNum' />：</label>
		        <div class="row-input">
		            <input name="userNum" type="text">
		        </div>
				</div>
	    </div>
	</form>
</div>
<div class="bjui-pageContent">
    <div class="portlet light bordered">
        <div class="portlet-title">
			    <div class="caption">
					<i class="fa fa-briefcase"></i>
					<spring:message code='label.queryresult'/>
				</div>
				<div class="actions">
						<button type="button" id="${objectNameLower}AddBtn" class="btn-green btn-circle" data-icon="plus">
							<spring:message code='btn.common.add'/>
		        </button>
		        <button type="button" id="${objectNameLower}ExportBtn" class="btn-orange btn-circle" data-icon="fa-download">
		          <spring:message code='btn.common.export' />                    
		        </button>
				</div>
			</div>
      <div class="row">
        <div class="col-md-12">
             <table class="table table-bordered" id="${objectNameLower}MianTableId" data-toggle="datagrid"></table>
        </div>
    	</div>
    </div>
</div>
<script type="text/javascript">
	<#list fieldList as var>
	var ${objectNameLower}Main_${var.reColName} = "<spring:message code='label.${objectNameLower}.${var.reColName}' />";   //${var.comments}
	</#list>
	var ${objectName}Title = "功能名称";
	var ${objectNameLower}MainTableTile="查询结果";
</script>

<!-- 引用配置JS --> 
<script type="text/javascript" src="<%=path%>/assets/resources/${packageName}/${objectNameLower}Main.js"></script>
<script type="text/javascript">
	$(function() {
		${objectNameLower}Main.init();
	});
</script>