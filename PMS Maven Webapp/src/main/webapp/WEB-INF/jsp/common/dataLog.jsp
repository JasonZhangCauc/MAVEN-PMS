<%-- 数据日志信息 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>

<div class="tab-pane" id="tab_2">
	<div class="col-md-12 col-sm-12">
		<c:forEach items="${vo.changeList}" var="changeVo">
			<div class="todo-tasklist">
	            <div class="todo-tasklist-item todo-tasklist-item-border-green">
	            	<c:if test="${changeVo.changeByIcon != null && changeVo.changeByIcon != ''}">
	            		<img class="todo-userpic pull-left" src="<%=request.getContextPath()%>${changeVo.changeByIcon}" width="27px" height="27px">
	            	</c:if>
	                <c:if test="${changeVo.changeByIcon == null || changeVo.changeByIcon == ''}">
	                	<img class="todo-userpic pull-left" src="<%=request.getContextPath()%>/assets/pages/media/users/avatar1.jpg" width="27px" height="27px">
	                </c:if>
	                <div class="todo-tasklist-item-title">${changeVo.changeByName}</div>
	                <div class="todo-tasklist-item-text">${changeVo.changeContent}</div>
	                <div class="todo-tasklist-controls pull-left">
	                    <span class="todo-tasklist-date"><i class="fa fa-calendar"></i>${changeVo.changeDate}</span>
	                </div>
	            </div>
	        </div>
		</c:forEach>
    </div>
</div>