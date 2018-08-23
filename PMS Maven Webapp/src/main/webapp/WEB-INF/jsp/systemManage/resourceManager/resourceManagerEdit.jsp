<!-- 资源新增/编辑界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
     <div class="col-md-12">
          <!-- BEGIN PORTLET-->
          <div class="portlet box grey-cascade form-fit">
              <div class="portlet-title">
				<div class="caption">
					<c:if test="${operate=='add'}"><i class="fa fa-cogs"></i><spring:message code='btn.common.add' /></c:if>
				    <c:if test="${operate=='edit'}"><i class="fa fa-cogs"></i><spring:message code='btn.common.edit' /></c:if>
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse">
					</a>
					<a href="javascript:;" class="remove" data-dismiss="modal">
				    </a>
				</div>
			  </div>
              <div class="portlet-body form">
                  <form class="form-horizontal form-bordered" id="resourceEditFormId" autocomplete="off" 
				    data-validator-option="{focusCleanup:true}">
				    <input type="hidden" value="${resourceVo.id}" name="id"/>
				    <input type="hidden" value="${resourceVo.pId}" name="pId"/> 
				    <div class="form-group">
                        <!-- 资源标识码 -->
						<label class="control-label col-md-3">
							<spring:message code='lable.resourceManager.resourceCode' />
							<span class="required">* </span>
						</label>
						<div class="col-md-6">
					    	<input type="text" 
							   class="form-control" 
							   id="resourceCode" 
							   name="resourceCode" 
							   value="${resourceVo.resourceCode}"
							   data-rule="required;" 
							   placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
                    </div>
                    <div class="form-group">
                        <!-- 资源路径 -->
						<label class="control-label col-md-3">
							<spring:message code='lable.resourceManager.resourceUrl' />
						</label>
						<div class="col-md-6">
					    	<input type="text" 
							   class="form-control" 
							   id="resourceUrl" 
							   name="resourceUrl" 
							   value="${resourceVo.resourceUrl}"
							   placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
                    </div>
                    <div class="form-group">
                        <!-- 资源类型 -->
						<label class="control-label col-md-3">
							<spring:message code='lable.resourceManager.resourceType' />
							<span class="required">* </span>
						</label>
						<div class="col-md-6">
							<select class="bs-select form-filter form-control" 
								data-size="10" 
								data-rule="required;"
								disabled="disabled"
								title="<spring:message code='message.pleaseselect' />"
								id="resourceType" 
								name="resourceType">
		                    </select>
						</div>
                    </div>
                    <div class="form-group">
                        <!-- 资源中文名 -->
						<label class="control-label col-md-3">
							<spring:message code='lable.resourceManager.resourceDescch' />
							<span class="required">* </span>
						</label>
						<div class="col-md-6">
					    	<input type="text" 
							   class="form-control" 
							   id="resourceDescch" 
							   name="resourceDescch" 
							   value="${resourceVo.resourceDescch}"
							   data-rule="required;" 
							   placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
                    </div>
                    <div class="form-group">
                        <!-- 资源英文名 -->
						<label class="control-label col-md-3">
							<spring:message code='lable.resourceManager.resourceDescen' />
							<span class="required">* </span>
						</label>
						<div class="col-md-6">
					    	<input type="text" 
							   class="form-control" 
							   id="resourceDescen" 
							   name="resourceDescen" 
							   value="${resourceVo.resourceDescen}"
							   data-rule="required;" 
							   placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
                    </div>
                    <div class="form-group">
                        <!-- 父级名称 -->
						<label class="control-label col-md-3">
							<spring:message code='lable.resourceManager.pId' />
							<span class="required">* </span>
						</label>
						<div class="col-md-6">
					    	<input type="text" 
							   class="form-control" 
							   value="${resourcePName}"
							   data-rule="required;" 
							   readonly="readonly"
							   placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
                    </div>
                    <div class="form-group">
                        <!-- 图标代码 -->
						<label class="control-label col-md-3">
							<spring:message code='lable.resourceManager.resourceIcon' />
						</label>
						<div class="col-md-6">
					    	<input type="text" 
							   class="form-control" 
							   id="resourceIcon" 
							   name="resourceIcon" 
							   value="${resourceVo.resourceIcon}"
							   placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
                    </div>
                    <div class="form-group">
                        <!-- 排序 -->
						<label class="control-label col-md-3">
							<spring:message code='lable.resourceManager.resourceOrder' />
							<span class="required">* </span>
						</label>
						<div class="col-md-6">
					    	<input type="text" 
							   class="form-control" 
							   id="resourceOrder" 
							   name="resourceOrder" 
							   value="${resourceVo.resourceOrder}"
							   data-rule="required;" 
							   placeholder="<spring:message code='common.laber.mustInputData'/>" />
						</div>
                    </div>
                    <div class="form-actions">
                          <div class="row">
                              <div class="modal-footer">
                                    <button type="button" class="btn green" id="saveResourceId">
										<i class="fa fa-check"></i>
										<spring:message code='btn.common.save' />
								    </button>
									<button type="button" data-dismiss="modal" class="btn default" id="closeResourceId">
										<i class="fa fa-mail-forward"></i>
										<spring:message code='btn.common.close' />
									</button>
                              </div>
                          </div>
                    </div>
                  </form>
              </div>
          </div>
          <!-- END PORTLET-->
      </div>
</div> 
<script type="text/javascript">
$("#resourceEditFormId #resourceType").initDic('${resourceVo.resourceType}',codeBasicInfo.resourceType);
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/resourceManager/resourceManagerEdit.js"></script>
