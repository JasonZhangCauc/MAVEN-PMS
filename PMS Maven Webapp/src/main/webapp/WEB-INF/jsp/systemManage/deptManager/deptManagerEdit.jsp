<!-- 组织架构新增/编辑界面 ZHOUMIN 20180305 -->
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
                  <form class="form-horizontal form-bordered" id="deptEditFormId" autocomplete="off" 
				    data-validator-option="{focusCleanup:true}">
				    <input type="hidden" value="${deptVo.id}" name="id" id="deptId"/>
				    <input type="hidden" value="${deptVo.deptPid}" name="deptPid"/> 
				    <div class="form-group">
                        <!-- 父级部门名称 -->
						<label class="control-label col-md-3">
							<spring:message code='label.deptManager.deptPName' />
							<span class="required">* </span>
						</label>
						<div class="col-md-6">
					    	<input type="text" 
							   class="form-control" 
							   id="deptPName" 
							   name="deptPName" 
							   value="${deptVo.deptPName}"
							   disabled="disabled"
							   data-rule="required;" 
							   placeholder="<spring:message code='common.message.mustinput'/>" />
						</div>
                    </div>
                    <div class="form-group">
                        <!-- 部门名称 -->
					    <label class="control-label col-md-3">
						    <spring:message code='label.deptManager.deptName' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-6">
						    <input type="text" 
							   class="form-control" 
							   id="deptName" 
							   name="deptName" 
							   value="${deptVo.deptName}"
							   data-rule="required;length[~50];" 
							   placeholder="<spring:message code='common.message.mustinput'/>" />
					    </div>
                    </div>
                    <div class="form-actions">
						<div class="row">
							<div class="col-md-offset-3 col-md-9">
								<button type="button" class="btn green" id="saveDeptId">
									<i class="fa fa-check"></i>
									<spring:message code='btn.common.save' />
								</button>
								<button type="button" data-dismiss="modal" class="btn default"
									id="closeDeptId">
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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/systemManage/deptManager/deptManagerEdit.js"></script>
