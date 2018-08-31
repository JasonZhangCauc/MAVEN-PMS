<!-- 500提示页面 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>500ERROR</title>
  </head>
  <body>
    <center>ERROR,<a href="<%=path%>">RETURN HOME</a></center>
  </body>
</html>
