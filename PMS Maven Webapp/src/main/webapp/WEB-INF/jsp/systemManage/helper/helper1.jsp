<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<h2 class="help_tit">主页</h2>
<div class="linkChild clear" id="linkChild">
	<div class="bd">
		<div class="subDiv">
			<h3>1.1 主页</h3>
		    <p>用户成功登陆系统后，跳转到主页面，主页面上包含在线人数、帮助、修改密码等功能，如下图：</p>
		    <p class="center"><img width="95%" src="${ctx}/assets/global/img/helper/1.1-0.png" /></p>
		    <p class="center">图1.1 — 1主页</p>
		    <p>
				● 在线人数：显示当前在线用户数，鼠标移动到“在线人数”链接<img src="${ctx}/assets/global/img/helper/loginCount.png" />可查看当前在线用户。
			</p>
			<p>
				● 语言：可切换中英文，鼠标移动到“语言”链接<img src="${ctx}/assets/global/img/helper/language.png" />
				显示中英文切换，点击可以切换中英文。
			</p>
			<p>
				● 主页：点击“主页”链接<img src="${ctx}/assets/global/img/helper/index.png" />可跳转到主页。
			</p>
			<p>
				● 修改密码：点击“修改密码”链接<img src="${ctx}/assets/global/img/helper/modifyPwd.png" />
				可修改用户密码，参考“1.5修改密码”。
			</p>
			<p>
				● 注销：注销用户登录，参考“1.6用户注销”。
			</p>
			<p>
				● 主页中部显示相关照片，点击可放大查看。
			</p>
			<p class="center">
				<img width="95%" src="${ctx}/assets/global/img/helper/1.1-4.png" />
			</p>
			<p class="center">图1.1 — 2主页</p>
			<p class="center">
				<img src="${ctx}/assets/global/img/helper/1.1-5.png" />
			</p>
			<p class="center">图1.1 — 3主页图片</p>
			<p class="center">
				<img width="90%" src="${ctx}/assets/global/img/helper/1.1-6.png" />
			</p>
			<p class="center">图1.1 — 4合作公司（可左右切换）</p>
		    <p>● 主页底部显示版权等相关信息</p>
		    <p class="center">
				<img width="90%" src="${ctx}/assets/global/img/helper/1.1-7.png" />
			</p>
			<p class="center">图1.1 — 5版权</p>
		</div>
	</div>
</div>