<!-- 404提示页面 -->
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	  <meta charset="UTF-8">
    <title>ERROR</title>
</head>
<style type="text/css">
html,body,head,div,p,a{margin: 0;padding: 0;}
.body-bg{background-color: #dff1f4;}
.main{width: 700px;overflow: hidden;height: 542px;margin: 20px auto;}
.title{font-size: 14px;font-weight: bold;margin: 254px 0 0 218px;color: #d3d3d3;}
.btn{
	display:block;
	width: 145px;
	height: 45px;
	font-size: 14px;
	margin: 95px 0 0 270px;
	line-height: 43px;
	color: #fff;
	font-weight: bold;
	text-align: center;
	text-decoration: none;}
</style>
<body class="body-bg">
	<div class="main" style="background: url(<%=path%>/assets/i/error-bg.png) no-repeat 0 0;">
	    <p class="title">非常抱歉，您要查看的页面没有办法找到</p>
	    <a href="<%=basePath%>" class="btn" style="background: url(<%=path%>/assets/i/error-btn.png) no-repeat 0 0;">返回网站首页</a>
	</div>
</body>
</html>