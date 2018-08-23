<!--公共的错误页面  -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" ></button>
</div>
<div class="modal-body">
	${message}
</div>
<div class="modal-footer">
	<button type="button"  class="btn blue" data-dismiss="modal" >
	<spring:message code='btn.common.ok' />
	</button>
</div>