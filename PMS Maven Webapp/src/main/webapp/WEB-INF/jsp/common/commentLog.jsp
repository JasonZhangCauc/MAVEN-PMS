<%--注释公共界面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<div class="tab-pane active" id="tab_1">
	<!-- TASK COMMENTS -->
	<div class="form-group">
		<div class="col-md-12">
			<ul class="media-list">
				<c:forEach items="${vo.commentUserList}" var="commentVo">
					<li class="media">
						<a class="pull-left" href="javascript:;"> 
							<img class="todo-userpic" src="<%=request.getContextPath()%>${commentVo.userPic}" width="27px" height="27px">
						</a>
						<div class="media-body todo-comment">
							<p class="todo-comment-head">
								<span class="todo-comment-username">${commentVo.userName}</span>&nbsp; 
								<span class="todo-comment-date">${commentVo.commentTime}</span>
							</p>
							<p class="todo-text-color">
								${commentVo.comment} <br>
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- END TASK COMMENTS -->
	<!-- TASK COMMENT FORM -->
	<form class="form-horizontal form-bordered" id="commentFormId" autocomplete="off" enctype="multipart/form-data"
		data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}"> 
		<div class="form-group">
			<div class="col-md-12">
				<ul class="media-list">
					<li class="media"><a class="pull-left"
						href="javascript:;"> <img class="todo-userpic"
							src="../assets/pages/media/users/avatar4.jpg" width="27px"
							height="27px"> </a>
						<div class="media-body">
							<textarea class="form-control todo-taskbody-taskdesc" name="commentContent"
								rows="4" placeholder="<spring:message code='common.laber.pleaseinput'/>"></textarea>
						</div>
					</li>
				</ul>
				<input type="hidden" value="${vo.loginUserId }" name="userId" />
				<input type="hidden" value="${vo.id }" name="dataId" />
				<input type="hidden" value="${vo.currentTime }" name="commentTime" />
				<input type="hidden" value="${vo.functionCode }" name="functionNo" />
				<button type="button" id="saveComment"
					class="pull-right btn btn-sm btn-circle green">
					&nbsp;<spring:message code='btn.common.send'/> &nbsp;</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/common/commentLog.js"></script>