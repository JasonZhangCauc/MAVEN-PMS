<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title><spring:message code='common.label.login01' /></title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta content="Metronic Shop UI description" name="description">
	<meta content="Metronic Shop UI keywords" name="keywords">
	<meta content="keenthemes" name="author">
	<meta property="og:site_name" content="-CUSTOMER VALUE-">
	<meta property="og:title" content="-CUSTOMER VALUE-">
	<meta property="og:description" content="-CUSTOMER VALUE-">
	<meta property="og:type" content="website">
	<meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
	<meta property="og:url" content="-CUSTOMER VALUE-">
	<script src="${ctx}/assets/global/plugins/jquery.min.js"></script>
	<link rel="stylesheet" href="${ctx}/assets/global/css/css_help.css" type="text/css" />
	<script>
		$(function() {
			var parent = "${parent}";
			var child = "${child}";
			$("#menu1 h2 a").each(function() {
				$(this).click(function() {
					$("#menu1 h2 a").each(function() {
						$(this).removeClass("cur");
					});
					$(this).addClass("cur");
				});
			});
			$("#first_"+parent).addClass("aon");
			$("#second_"+parent).css("display", "block");
			$("#help"+parent+"-"+child).click();//加载指定页				
		});
	
		//展开菜单
		function showMenu(no) {
			if($("#second_"+no).css("display") == "none") {
				$("#second_"+no).show();
				$("#first_"+no).addClass("aon");
			} else {
				$("#second_"+no).hide();
				$("#first_"+no).removeClass("aon");
			}
		}
		
		//查询帮助页面内容
		function loadHelpPage(url) {
			$("#helpContext").load("${ctx}"+url);
		}
	</script>
</head>
<body style="background:#dbe9f2;">
	<div class="help_bg">
		<div class="help_box">
			<div class="help_head">
				<a href="#" title="帮助手册" class="logo"><img src="${ctx}/assets/global/img/helper/logo.png"></a>
				<ul class="nav_box">
					<li class="on_nav">
						<a href="#" class="user1">用户手册</a>
					</li>
					<%--<li>
						<a href="#" class="user3">常见问题</a>
					</li>--%>
				</ul>
				<a href="#" onclick="" class="ico_sm"></a>
				<a href="#" onclick="window.close();" class="ico_tc"></a>
			</div>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tbody>
					<tr valign="top">
					    <td width="220" valign="top" class="left_nr">
					        <div class="help_left">
								<div id="menu1" class="ask_list">
									<h1 id="first_1" onclick="showMenu(1)">
										<a href="javascript:void(0)">首页</a>
									</h1>
									<div id="second_1" style="display: none">
										<h2><a id="help1-1" href="#" class="cur" onclick="loadHelpPage('/helper/toHelpHome')">主页</a></h2>
									</div> 
									<h1 id="first_2" onclick="showMenu(2)">
										<a href="javascript:void(0)">售前管理</a>
									</h1>
									<div id="second_2" style="display: none">
										<auth:auth resourceCode="R002_01">
									    	<h2><a id="help2-1" href="#" onclick="loadHelpPage('/helper/hepleR00201')">客户维护</a></h2>
									   	</auth:auth>
									   	<auth:auth resourceCode="R002_02">
									    	<h2><a id="help2-2" href="#" onclick="loadHelpPage('/helper/hepleR00202')">销售跟踪</a></h2>
									    </auth:auth>
									</div>
									<h1 id="first_3" onclick="showMenu(3)">
										<a href="javascript:void(0)">合同管理</a>
									</h1>
									<div id="second_3" style="display: none">
										<auth:auth resourceCode="R003_01">
										    <h2><a id="help3-1" href="#" onclick="loadHelpPage('/helper/hepleR00301')">合同维护</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R003_02">
										    <h2><a id="help3-2" href="#" onclick="loadHelpPage('/helper/hepleR00302')">合同审批</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R003_03">
										    <h2><a id="help3-3" href="#" onclick="loadHelpPage('/helper/hepleR00303')">收款节点管理</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R003_04">
										    <h2><a id="help3-4" href="#" onclick="loadHelpPage('/helper/hepleR00304')">合同执行情况</a></h2>
										</auth:auth>
									</div>
									<h1 id="first_4" onclick="showMenu(4)">
										<a href="javascript:void(0)">项目管理</a>
									</h1>
									<div id="second_4" style="display: none">
										<auth:auth resourceCode="R004_01">
										    <h2><a id="help4-1" href="#" onclick="loadHelpPage('/helper/hepleR00401')">项目立项</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R004_06">
										    <h2><a id="help4-2" href="#" onclick="loadHelpPage('/helper/hepleR00406')">项目审批</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R004_02">
										    <h2><a id="help4-3" href="#" onclick="loadHelpPage('/helper/hepleR00402')">项目监控</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R004_03">
										    <h2><a id="help4-4" href="#" onclick="loadHelpPage('/helper/hepleR00403')">单价管理</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R004_04">
										    <h2><a id="help4-5" href="#" onclick="loadHelpPage('/helper/hepleR00404')">工时统计</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R004_05">
										    <h2><a id="help4-6" href="#" onclick="loadHelpPage('/helper/hepleR00405')">其他成本</a></h2>
										</auth:auth>
									</div>
									<h1 id="first_5" onclick="showMenu(5)">
										<a href="javascript:void(0)">任务管理</a>
									</h1>
									<div id="second_5" style="display: none">
										<auth:auth resourceCode="R005_01">
										    <h2><a id="help5-1" href="#" onclick="loadHelpPage('/helper/hepleR00501')">任务分派</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R005_02">
										    <h2><a id="help5-2" href="#" onclick="loadHelpPage('/helper/hepleR00502')">我的任务</a></h2>
										</auth:auth>
									</div>
									<h1 id="first_6" onclick="showMenu(6)">
										<a href="javascript:void(0)">绩效管理</a>
									</h1>
									<div id="second_6" style="display: none">
										<auth:auth resourceCode="R006_01">
										    <h2><a id="help6-1" href="#" onclick="loadHelpPage('/helper/hepleR00601')">绩效档案</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R006_02">
										    <h2><a id="help6-2" href="#" onclick="loadHelpPage('/helper/hepleR00602')">日报管理</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R006_03">
										    <h2><a id="help6-3" href="#" onclick="loadHelpPage('/helper/hepleR00603')">月报管理</a></h2>
										</auth:auth>
									</div>
									<h1 id="first_7" onclick="showMenu(7)">
										<a href="javascript:void(0)">系统管理</a>
									</h1>
									<div id="second_7" style="display: none">
										<auth:auth resourceCode="R001_01">
										    <h2><a id="help7-1" href="#" onclick="loadHelpPage('/helper/hepleR00101')">用户管理</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R001_02">
										    <h2><a id="help7-2" href="#" onclick="loadHelpPage('/helper/hepleR00102')">角色管理</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R001_03">
										    <h2><a id="help7-3" href="#" onclick="loadHelpPage('/helper/hepleR00103')">操作日志</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R001_04">
										    <h2><a id="help7-4" href="#" onclick="loadHelpPage('/helper/hepleR00104')">系统日志</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R001_05">
										    <h2><a id="help7-5" href="#" onclick="loadHelpPage('/helper/hepleR00105')">基础信息维护</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R001_06">
										    <h2><a id="help7-6" href="#" onclick="loadHelpPage('/helper/hepleR00106')">组织架构维护</a></h2>
										</auth:auth>
										<auth:auth resourceCode="R001_07">
										    <h2><a id="help7-7" href="#" onclick="loadHelpPage('/helper/hepleR00107')">修改密码</a></h2>
										</auth:auth>
									</div>
								</div>
    						</div> 
       					</td>
    					<td valign="top" class="right_nr">
							<div class="right_img">
								<div style="width:95%; margin:0px auto;">
									<div class="ifm" id="ifm">
										<div id="helpContext"></div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>