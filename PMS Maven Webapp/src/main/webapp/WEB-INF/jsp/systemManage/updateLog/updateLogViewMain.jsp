<!-- 更新日志查看主界面  ZHOUMIN 20180305-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
<!-- Begin: Query conditions -->
<div class="row">
	<div class="col-md-12">
		
		<div class="portlet light portlet-fit bordered">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-microphone font-green"></i> 
					<span class="caption-subject bold font-green uppercase"><spring:message code='lable.updateLog'/></span>
				</div>
				<div class="actions">
					
				</div>
			</div>
			<div class="portlet-body">
				<div class="timeline">
					<!-- TIMELINE ITEM -->
					<c:forEach items="${updatelogList}" var="updatelogVo" varStatus="row">
					<div class="timeline-item">
						<div class="timeline-badge">
						<c:choose>
							<c:when test="${row.index=='0' }">
	                            <div class="timeline-icon" style="background-color: #0871c7;">
	                                ${updatelogVo.versionNum}
	                            </div>
		                    </c:when>
							<c:otherwise>
	                            <div class="timeline-icon">
	                                ${updatelogVo.versionNum}
	                            </div>
							</c:otherwise>
						</c:choose>  
						</div> 
						<div class="timeline-body">
							<div class="timeline-body-arrow"></div>
							<div class="timeline-body-head">
								<div class="timeline-body-head-caption">
									<a href="javascript:;" class="timeline-body-title font-blue-madison">${updatelogVo.createByName}</a> 
									<span class="timeline-body-time font-grey-cascade">${updatelogVo.updateDate}</span>
								</div>
							</div>
							<div class="timeline-body-content">
								<span class="font-grey-cascade">${updatelogVo.updateContent}</span>
							</div>
						</div>
					</div>
					</c:forEach>
					<!-- END TIMELINE ITEM -->
				</div>
			</div>
		</div>
	</div>
</div>