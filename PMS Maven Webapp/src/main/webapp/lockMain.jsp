<!DOCTYPE html>
<!-- 登录页面 -->
<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.util.coder.RSAUtils,com.ps.result.common.RSAkeyVo"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	Cookie cookies[] = request.getCookies();
	String cookiesValue = "";
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if ("PMS".equals(cookies[i].getName())) {
				cookiesValue =  URLDecoder.decode(cookies[i].getValue(),"UTF-8");
			}
		}
	}
	RSAkeyVo rsavo=RSAUtils.getPublicKey();
%>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.7
Version: 4.7.5
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Dribbble: www.dribbble.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
Renew Support: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>Metronic Admin Theme #4 | User Lock Screen 2</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Preview page of Metronic Admin Theme #4 for " name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <!--<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />-->
        <link href="<%=request.getContextPath()%>/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="<%=request.getContextPath()%>/assets/global/css/components-rounded.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="<%=request.getContextPath()%>/assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="<%=request.getContextPath()%>/assets/pages/css/lock-2.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> 
        
        <!--[if lt IE 9]>
		<script src="<%=request.getContextPath()%>/assets/global/plugins/respond.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/global/plugins/excanvas.min.js"></script> 
		<script src="<%=request.getContextPath()%>/assets/global/plugins/ie8.fix.min.js"></script> 
		<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
        <script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="<%=request.getContextPath()%>/assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="<%=request.getContextPath()%>/assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="<%=request.getContextPath()%>/assets/pages/scripts/lock-2.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
        <script src="<%=request.getContextPath()%>/resources/common/security.js" type="text/javascript"></script>
	    <script type="text/javascript">
	       	var keys;
			$(function() {
				$("#j_username").hide();
			    var loginError='<%=request.getSession().getAttribute("loginError")%>';
			    if(loginError=="null" || loginError==""){
			        loginError="";
			        $("#lock-form #loginError-div").hide();
			    }else{
			    	$("#lock-form #loginError-div").show();
			    }
			    $("#lock-form #loginError-span").text(loginError);
			    
			    <%request.getSession().removeAttribute("loginError");%>
			    var cookiesValue='<%=cookiesValue%>';
				var username='<%=request.getSession().getAttribute("username")%>';
			    if(username!=null && username!='null'){
			        $("#lock-form #j_username").val(username);
			    }else{
			        $("#lock-form #j_username").val(cookiesValue);
			    }
			    var modulus='<%=rsavo.getModules()%>';
			    var exponent= '<%=rsavo.getExponent()%>';
			    
			    keys=RSAUtils.getKeyPair(exponent,'',modulus);
			    $("#lock-form").submit(function(){
			        var pwd=$("#lock-form #j_password").val();
			        if(pwd!=''){
			          	$("#lock-form #passwordhidden").val(RSAUtils.encryptedString(keys,pwd));
			        }
			        return true;
			    });
			    Lock.init();
			}); 
	     </script>
     </head>
     <body class="">
        <div class="page-lock">
            <div class="page-logo">
                <a class="brand" href="index.html">
                    <img src="<%=request.getContextPath()%>/assets/pages/img/logo-big.png" alt="logo" /> </a>
            </div>
            <div class="page-body">
                <img class="page-lock-img" src="<%=request.getContextPath()%>/assets/pages/media/profile/profile.jpg" alt="">
                <div class="page-lock-info">
                    <h1>${userName }</h1>
                    <span class="email"> ${userAccount} </span>
                    <form class="form-inline" action="<%=request.getContextPath()%>/j_spring_security_check" id="lock-form" method="post">
                        <div class="input-group input-medium">
                        	<input type="text" name="j_username" id="j_username" value="${userAccount}" />
                            <input type="hidden" name="j_password" id="passwordhidden" />
                            <input type="password" class="form-control" id="j_password" name="y_password2" placeholder="密码" />
                            <span class="input-group-btn">
                                <button type="submit" class="btn green icn-only">
                                    <i class="m-icon-swapright m-icon-white"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="page-footer-custom">Copyright &copy; 黄鹏  2018</div>
        </div>
    </body>
</html>
