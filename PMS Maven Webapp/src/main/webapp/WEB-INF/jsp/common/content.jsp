<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content" id="contextLoadDiv">
         <%--<!-- BEGIN THEME PANEL -->
         <div class="theme-panel">
             <div class="toggler tooltips" data-container="body" data-placement="left" data-html="true" data-original-title="Click to open advance theme customizer panel">
                 <i class="icon-settings"></i>
             </div>
             <div class="toggler-close">
                 <i class="icon-close"></i>
             </div>
             <div class="theme-options">
                 <div class="theme-option theme-colors clearfix">
                     <span> THEME COLOR </span>
                     <ul>
                         <li class="color-default current tooltips" data-style="default" data-container="body" data-original-title="Default"> </li>
                         <li class="color-grey tooltips" data-style="grey" data-container="body" data-original-title="Grey"> </li>
                         <li class="color-blue tooltips" data-style="blue" data-container="body" data-original-title="Blue"> </li>
                         <li class="color-dark tooltips" data-style="dark" data-container="body" data-original-title="Dark"> </li>
                         <li class="color-light tooltips" data-style="light" data-container="body" data-original-title="Light"> </li>
                     </ul>
                 </div>
             </div>
         </div>
         <!-- END THEME PANEL -->--%>
         <ul class="nav nav-tabs nav-tabs-add" role="tablist">
             <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i></button>
             <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i></button>
             <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-home"></i>主页</a></li>
         </ul>
         <!-- Tab panes -->
         <div class="tab-content" id="tab-content-div">
             <div role="tabpanel" class="tab-pane active" id="home" >
		          <jsp:include page="demo.jsp"/>
             </div>
         </div>
    </div>
    <div class="contextMenu" id="rightMenu">  
	     <ul>  
	        <li id="closeOwnMenu"><spring:message code='common.laber.closeOwnLabel' /></li>  
	        <li id="closeOtherMenu"><spring:message code='common.laber.closeOtherLabel' /></li>  
	        <li id="closeAllMenu"><spring:message code='common.laber.closeAllLabel' /></li>   
	     </ul>  
	</div> 
</div> 