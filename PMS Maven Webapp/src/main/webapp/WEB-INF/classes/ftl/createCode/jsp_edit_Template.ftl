<%-- 编辑页  ${author} ${nowDate?string("yyyy-MM-dd")}  --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%   
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<div class="bjui-pageContent">
    <form  data-validator-option="{focusCleanup:true}" id="userEditFormId" autocomplete="off">
    	<input type="hidden" id="userId" name="id" >
        <div class="portlet light bordered">
	        <table class="control-table">
			    <tr>
				    <!--label注释1-->
            <td class="control-label">
              <label><spring:message code='label.userManage.userAccount' />：</label>
              <span class="required">* </span>
            </td>
            <td>
                <input id="userAccount"
                	   	name="userAccount" 
                   		
				data-rule="required;length[~100];"/>
            </td>
            <!--label注释1-->
            <td class="control-label">
              <label><spring:message code='label.userManage.userName' />：</label>
              <span class="required">* </span>
            </td>
            <td>
                <input name="userName" 
                   	
                    placeholder='<spring:message code='message.pleaseselect' />'
                    data-rule="required;chinese;length[~100];">
            </td>
        	</tr>
          <tr>
            <!--部门-->
            <td class="control-label">
              <label><spring:message code='label.userManage.userDept' />：</label>
              <span class="required">* </span>
            </td>
            <td>
              <select 
		            name="deptId" 
		            id="deptId" 
		            data-toggle="selectpicker" 
		            data-width="50%" 
		            data-live-search="true"
		            
					    	data-rule="required;"
					    	title="<spring:message code='message.pleaseselect' />">
			    			<option value=""></option>
              </select>
            </td>
              <!--性别-->
              <td class="control-label">
                <label><spring:message code='label.userManage.userSex' />：</label>
                <span class="required">* </span>
              </td>
              <td>
              	<input type="radio" name="userSex" value="1" data-toggle="icheck"/>
            		<spring:message code='common.label.female' />
	            	<input type="radio" name="userSex" value="0" data-toggle="icheck" checked="checked"/>
	            		<spring:message code='common.label.male' />
              </td>
          	</tr>
	        </table>
	    </div>
    </form>
</div>
<div class="bjui-pageFooter">
    <div class="pull-right">
        <button type="button" class="btn-green" id="save${objectNameLower}Btn" data-icon="save">
            <spring:message code="btn.common.save"/>
        </button>
        <button type="button" class="btn-close" data-icon="close">
            <spring:message code="btn.common.close"/>
        </button>
    </div>
</div>
<!-- 引用配置JS --> 
<script type="text/javascript" src="<%=path%>/assets/resources/${packageName}/${objectNameLower}Edit.js"></script>
<script>
	$(function(){
		${objectNameLower}Edit.init();
	});
</script>