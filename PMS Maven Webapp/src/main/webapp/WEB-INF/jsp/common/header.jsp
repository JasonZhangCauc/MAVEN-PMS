<%-- 头部信息 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<%@ page import="com.ps.result.systemmanage.UserVo"%>
<%
	UserVo loginUser = (UserVo) request.getSession().getAttribute("user");
%>
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner">
        <!-- BEGIN LOGO -->
        <div class="page-logo">
            <a href="#">
            <img src="<%=request.getContextPath()%>/assets/layouts/layout2/img/logo-default.png" alt="logo" class="logo-default" /> </a>
            <div class="menu-toggler sidebar-toggler">
                <!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
            </div>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- BEGIN PAGE ACTIONS -->
        <!-- DOC: Remove "hide" class to enable the page header actions -->
        
        <!-- END PAGE ACTIONS -->
        <!-- BEGIN PAGE TOP -->
        <div class="page-top">
            <!-- BEGIN HEADER SEARCH BOX -->
            <!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
            <!-- END HEADER SEARCH BOX -->
            <div class="page-actions">
		        <div class="btn-group">
	                <button type="button" class="btn btn-circle btn-outline red dropdown-toggle" data-toggle="dropdown">
	                    <i class="fa fa-calendar-check-o"></i>&nbsp;
	                    <span class="hidden-sm hidden-xs">签&nbsp;卡</span>&nbsp;
	                    <i class="fa fa-angle-down"></i>
	                </button>
	                <ul class="dropdown-menu" role="menu">
	                    <li>
	                        <a onclick="chickinonOrdown(1)"><i class="fa fa-sun-o"></i> 上班签卡 </a>
	                    </li>
	                    <li class="divider"> </li>
	                    <li>
	                        <a onclick="chickinonOrdown(2)"><i class="fa fa-moon-o"></i> 下班签卡 </a>
	                    </li>
	                </ul>
	            </div>
            </div>
	        <form class="search-form search-form-expanded" action="page_general_search_3.html" method="GET">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search..." name="query">
                    <span class="input-group-btn">
                        <a href="javascript:;" class="btn submit">
                            <i class="icon-magnifier"></i>
                        </a>
                    </span>
                </div>
            </form>
	        <!-- BEGIN TOP NAVIGATION MENU -->
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                    <li class="dropdown dropdown-user">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <img style="width:39px;height:39px;" class="img-circle" src="<%=request.getContextPath()%>/<%=loginUser.getUserPic()%>" />
                            <span class="username username-hide-on-mobile"><%=loginUser.getUserName() %></span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-default">
                        	<li>
                                <a addtabs="R014_09" title="<spring:message code='lable.serviceTicket'/>" url="systemManage/serviceTicketMain" >
                                    <i class="fa fa-file-text"></i> <spring:message code='lable.serviceTicket'/></a>
                            </li>
                        	<li>
                                <a addtabs="R001-1003" title="<spring:message code='lable.updateLog'/>" url="systemManage/updateLogViewMain" >
                                    <i class="fa fa-file-text"></i> <spring:message code='lable.updateLog'/></a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/common/lockUser">
                                    <i class="icon-lock"></i> 锁屏 </a>
                            </li>
                            <li>
                                <a id="logoutA" href="<%=request.getContextPath()%>/common/logout">
                                    <i class="icon-key"></i> 登出 </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                    <!-- BEGIN QUICK SIDEBAR TOGGLER -->
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                    <li class="dropdown dropdown-extended quick-sidebar-toggler" >
                        <span class="sr-only">Toggle Quick Sidebar</span>
                        <i class="icon-logout" id="logoutLog"></i>
                    </li>
                    <!-- END QUICK SIDEBAR TOGGLER -->
                </ul>
            </div>
            <!-- END TOP NAVIGATION MENU -->
                    
            <!-- BEGIN TOP NAVIGATION MENU -->
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <i class="icon-bell"></i>
                            <span class="badge badge-default"> 7 </span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="external">
                                <h3>
                                    <span class="bold">12 pending</span> notifications</h3>
                                <a href="page_user_profile_1.html">view all</a>
                            </li>
                            <li>
                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 250px;"><ul class="dropdown-menu-list scroller" style="height: 250px; overflow: hidden; width: auto;" data-handle-color="#637283" data-initialized="1">
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">just now</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-success">
                                                    <i class="fa fa-plus"></i>
                                                </span> New user registered. </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">3 mins</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-danger">
                                                    <i class="fa fa-bolt"></i>
                                                </span> Server #12 overloaded. </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">10 mins</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-warning">
                                                    <i class="fa fa-bell-o"></i>
                                                </span> Server #2 not responding. </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">14 hrs</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-info">
                                                    <i class="fa fa-bullhorn"></i>
                                                </span> Application error. </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">2 days</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-danger">
                                                    <i class="fa fa-bolt"></i>
                                                </span> Database overloaded 68%. </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">3 days</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-danger">
                                                    <i class="fa fa-bolt"></i>
                                                </span> A user IP blocked. </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">4 days</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-warning">
                                                    <i class="fa fa-bell-o"></i>
                                                </span> Storage Server #4 not responding dfdfdfd. </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">5 days</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-info">
                                                    <i class="fa fa-bullhorn"></i>
                                                </span> System Error. </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">9 days</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-danger">
                                                    <i class="fa fa-bolt"></i>
                                                </span> Storage server failed. </span>
                                        </a>
                                    </li>
                                </ul><div class="slimScrollBar" style="background: rgb(99, 114, 131); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(234, 234, 234); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <i class="icon-envelope-open"></i>
                            <span class="badge badge-default"> 4 </span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="external">
                                <h3>You have
                                    <span class="bold">7 New</span> Messages</h3>
                                <a href="app_inbox.html">view all</a>
                            </li>
                            <li>
                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 275px;"><ul class="dropdown-menu-list scroller" style="height: 275px; overflow: hidden; width: auto;" data-handle-color="#637283" data-initialized="1">
                                    <li>
                                        <a href="#">
                                            <span class="photo">
                                                <img src="../assets/layouts/layout3/img/avatar2.jpg" class="img-circle" alt=""> </span>
                                            <span class="subject">
                                                <span class="from"> Lisa Wong </span>
                                                <span class="time">Just Now </span>
                                            </span>
                                            <span class="message"> Vivamus sed auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="photo">
                                                <img src="../assets/layouts/layout3/img/avatar3.jpg" class="img-circle" alt=""> </span>
                                            <span class="subject">
                                                <span class="from"> Richard Doe </span>
                                                <span class="time">16 mins </span>
                                            </span>
                                            <span class="message"> Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="photo">
                                                <img src="../assets/layouts/layout3/img/avatar1.jpg" class="img-circle" alt=""> </span>
                                            <span class="subject">
                                                <span class="from"> Bob Nilson </span>
                                                <span class="time">2 hrs </span>
                                            </span>
                                            <span class="message"> Vivamus sed nibh auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="photo">
                                                <img src="../assets/layouts/layout3/img/avatar2.jpg" class="img-circle" alt=""> </span>
                                            <span class="subject">
                                                <span class="from"> Lisa Wong </span>
                                                <span class="time">40 mins </span>
                                            </span>
                                            <span class="message"> Vivamus sed auctor 40% nibh congue nibh... </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="photo">
                                                <img src="../assets/layouts/layout3/img/avatar3.jpg" class="img-circle" alt=""> </span>
                                            <span class="subject">
                                                <span class="from"> Richard Doe </span>
                                                <span class="time">46 mins </span>
                                            </span>
                                            <span class="message"> Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                                        </a>
                                    </li>
                                </ul><div class="slimScrollBar" style="background: rgb(99, 114, 131); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(234, 234, 234); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown dropdown-extended dropdown-tasks" id="header_task_bar">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <i class="icon-calendar"></i>
                            <span class="badge badge-default"> 3 </span>
                        </a>
                        <ul class="dropdown-menu extended tasks">
                            <li class="external">
                                <h3>You have
                                    <span class="bold">12 pending</span> tasks</h3>
                                <a href="app_todo.html">view all</a>
                            </li>
                            <li>
                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 275px;"><ul class="dropdown-menu-list scroller" style="height: 275px; overflow: hidden; width: auto;" data-handle-color="#637283" data-initialized="1">
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">New release v1.2 </span>
                                                <span class="percent">30%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 40%;" class="progress-bar progress-bar-success" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">40% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">Application deployment</span>
                                                <span class="percent">65%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 65%;" class="progress-bar progress-bar-danger" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">65% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">Mobile app release</span>
                                                <span class="percent">98%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 98%;" class="progress-bar progress-bar-success" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">98% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">Database migration</span>
                                                <span class="percent">10%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 10%;" class="progress-bar progress-bar-warning" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">10% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">Web server upgrade</span>
                                                <span class="percent">58%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 58%;" class="progress-bar progress-bar-info" aria-valuenow="58" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">58% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">Mobile development</span>
                                                <span class="percent">85%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 85%;" class="progress-bar progress-bar-success" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">85% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">New UI release</span>
                                                <span class="percent">38%</span>
                                            </span>
                                            <span class="progress progress-striped">
                                                <span style="width: 38%;" class="progress-bar progress-bar-important" aria-valuenow="18" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">38% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                </ul><div class="slimScrollBar" style="background: rgb(99, 114, 131); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(234, 234, 234); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown dropdown-extended dropdown-notification" id="header_inbox_bar">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <i class="icon-users"></i>
                            <span class="badge badge-danger"> ${activeUsers.size()} </span>
                        </a>
                        <ul class="dropdown-menu">
                        	<li class="external">
                                <h3>在线人员列表</h3>
                            </li>
                            <li>
	                           	<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 250px;">
		                           	<ul class="dropdown-menu-list scroller" style="height: 250px; overflow: hidden; width: auto;" data-handle-color="#637283" data-initialized="1">
		                        	<c:forEach items="${activeUsers}" var="userVo">  
		                                <li>
		                                    <a href="#">
		                                        <span class="photo">
		                                        	<c:if test="${userVo.userPic != null && userVo.userPic != ''}" >
		                                            	<img style="width:29px;height:29px;" src="<%=request.getContextPath()%>${userVo.userPic}" class="img-circle" alt=""> </span>
		                                            </c:if>
										<c:if test="${userVo.userPic == null || userVo.userPic == ''}">
											<img style="width:29px;height:29px;" src="<%=request.getContextPath()%>/assets/layouts/layout2/img/avatar3_small.jpg" class="img-circle" alt=""> </span>
										</c:if>
		                                        <span class="subject">
		                                            <span class="from">${userVo.userName}</span>
		                                        </span>
		                                        <span class="message">${userVo.userIp}</span>
		                                    </a>
		                                </li>
			                         </c:forEach>
			                         </ul>
		                         </div>
	                         </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- END TOP NAVIGATION MENU -->
        </div>
        <!-- END PAGE TOP -->
    </div>
    <!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<!-- 资源列表弹出框 -->
<div id="updatePasswordModelId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:60%;height:80%;" >
		<div class="modal-content" ></div>
	</div>
</div>