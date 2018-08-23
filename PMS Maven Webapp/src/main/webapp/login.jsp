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
        <title>内部管理系统</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no" name="viewport" />
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <meta content="内部管理系统" name="description" />
        <meta content="Penney" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" /> -->
        <link href="<%=request.getContextPath()%>/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="<%=request.getContextPath()%>/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="<%=request.getContextPath()%>/assets/global/css/components.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="<%=request.getContextPath()%>/assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="<%=request.getContextPath()%>/assets/pages/css/login-5.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> 
        <!-- END : LOGIN PAGE 5-1 -->
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
        <script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="<%=request.getContextPath()%>/assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="<%=request.getContextPath()%>/assets/pages/scripts/login-5.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
        <script src="<%=request.getContextPath()%>/resources/common/security.js" type="text/javascript"></script>
		<script type="text/javascript">
		    var keys;
			$(function() {
			    var loginError='<%=request.getSession().getAttribute("loginError")%>';
			    if(loginError=="null" || loginError==""){
			        loginError="";
			        $("#login-form #loginError-div").hide();
			    }else{
			    	$("#login-form #loginError-div").show();
			    }
			    $("#login-form #loginError-span").text(loginError);
			    
			    <%request.getSession().removeAttribute("loginError");%>
			    var cookiesValue='<%=cookiesValue%>';
				var username='<%=request.getSession().getAttribute("username")%>';
			    if(username!=null && username!='null'){
			        $("#login-form #j_username").val(username);
			    }else{
			        $("#login-form #j_username").val(cookiesValue);
			    }
			    var modulus='<%=rsavo.getModules()%>';
			    var exponent= '<%=rsavo.getExponent()%>';
			    
			    keys=RSAUtils.getKeyPair(exponent,'',modulus);
			    
			    $("#login-form").submit(function(){
			        $("#sbm-btn").attr("disabled", true);
			        var pwd=$("#login-form #j_password").val();
			       
			        if(pwd!=''){
			          $("#login-form #passwordhidden").val(RSAUtils.encryptedString(keys,pwd));
			        }
			        return true;
			    });
			    
			    Login.init('<%=request.getContextPath()%>');
			}); 
		</script>
    </head>
    <!-- END HEAD -->
    <body class=" login">
        <!-- BEGIN : LOGIN PAGE 5-1 -->
        <div class="user-login-5">
            <div class="row bs-reset">
                <div class="col-md-6 bs-reset mt-login-5-bsfix">
                    <div class="login-bg" style="background-image:url(<%=request.getContextPath()%>/assets/pages/img/login/bg1.jpg)">
                        <img class="login-logo" src="<%=request.getContextPath()%>/assets/pages/img/login/logo.png" /> </div>
                </div>
                <div class="col-md-6 login-container bs-reset mt-login-5-bsfix">
                    <div class="login-content">
                        <img src="<%=request.getContextPath()%>/assets/layouts/layout2/img/logo-login.png">
                        <p> Lorem ipsum dolor sit amet, coectetuer adipiscing elit sed diam nonummy et nibh euismod aliquam erat volutpat. Lorem ipsum dolor sit amet, coectetuer adipiscing. </p>
                        <form class="login-form" action="<%=request.getContextPath()%>/j_spring_security_check" id="login-form" method="post">
                            <div class="alert alert-danger display-hide" id="loginError-div">
                                <button class="close" data-close="alert"></button>
                                <span id="loginError-span">Enter any username and password. </span>
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <input class="form-control form-control-solid placeholder-no-fix form-group" 
	                                    type="text" 
	                                    autocomplete="off" 
	                                    placeholder="Username" 
	                                    name="j_username" 
	                                    value="admin"
	                                    id="j_username" 
	                                    required/> 
                                </div>
                                <div class="col-xs-6">
                                    <input class="form-control form-control-solid placeholder-no-fix form-group" 
	                                    type="password" 
	                                    autocomplete="off" 
	                                    placeholder="Password" 
	                                    id="j_password" 
	                                    value="test1234"
	                                    required/> 
                                    <input type="hidden" name="j_password" id="passwordhidden"></input>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="rem-password">
                                        <label class="rememberme mt-checkbox mt-checkbox-outline">
                                            <input type="checkbox" name="j_remember" value="yes" /> Remember me
                                            <span></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-8 text-right">
                                    <div class="forgot-password">
                                        <a href="javascript:;" id="forget-password" class="forget-password">Forgot Password?</a>
                                    </div>
                                    <button class="btn green" type="submit">Sign In</button>
                                </div>
                            </div>
                        </form>
                        <!-- BEGIN FORGOT PASSWORD FORM -->
                        <form class="forget-form" action="javascript:;" method="post">
                            <h3 class="font-green">Forgot Password ?</h3>
                            <p> Enter your e-mail address below to reset your password. </p>
                            <div class="form-group">
                                <input class="form-control placeholder-no-fix form-group" type="text" autocomplete="off" placeholder="Email" name="email" /> </div>
                            <div class="form-actions">
                                <button type="button" id="back-btn" class="btn green btn-outline">Back</button>
                                <button type="submit" id="sbm-btn" class="btn btn-success uppercase pull-right">Submit</button>
                            </div>
                        </form>
                        <!-- END FORGOT PASSWORD FORM -->
                    </div>
                    <div class="login-footer">
                        <div class="row bs-reset">
                            <div class="col-xs-5 bs-reset">
                                <ul class="login-social">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="icon-social-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <i class="icon-social-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <i class="icon-social-dribbble"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-7 bs-reset">
                                <div class="login-copyright text-right">
                                    <p>Copyright &copy; 黄鹏  2018</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>