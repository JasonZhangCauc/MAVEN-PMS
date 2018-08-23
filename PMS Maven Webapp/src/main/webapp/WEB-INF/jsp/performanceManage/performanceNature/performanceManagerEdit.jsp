<!-- 绩效编辑界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
     <div class="col-md-12">
          <!-- BEGIN PORTLET-->
          <div class="portlet box grey-cascade form-fit">
              <div class="portlet-title">
				<div class="caption">
				    <i class="fa fa-cogs"></i><spring:message code='btn.common.edit' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse">
					</a>
					<a href="javascript:;" class="remove" data-dismiss="modal">
				    </a>
				</div>
			  </div>
              <div class="portlet-body form">
                  <form class="form-horizontal form-bordered" id="performanceEditFormId" autocomplete="off" 
				    data-validator-option="{focusCleanup:true}">
				    <!-- 绩效ID -->
				    <input type="hidden" value="${performanceVo.id}" name="id"/>
				    <!-- 用户ID -->
				    <input type="hidden" value="${performanceVo.userId}" name="userId" />
				    <!-- 操作记录ID -->
				    <input type="hidden" value="" name="changeDetails" id="changeDetails" />
                    <div class="form-group">
                        <!-- 工号 -->
					    <label class="control-label col-md-2">
						    <spring:message code='label.userManage.workNumber' />
					    </label>
					    <div class="col-md-3">
						    <input type="text" 
								   class="form-control" 
								   value="${userVo.userAccount}"
								   readonly="readonly"/>
					    </div>
					    <!-- 姓名 -->
					    <label class="control-label col-md-2">
						    <spring:message code='label.userManage.userName' />
					    </label>
					    <div class="col-md-3">
						    <input type="text" 
								   class="form-control" 
								   value="${userVo.userName}"
								   readonly="readonly"/>
					    </div>
                    </div>
                    <div class="form-group">
                        <!-- 绩效月份 -->
					    <label class="control-label col-md-2">
						    <spring:message code='label.performanceManager.month' />
					    </label>
					    <div class="col-md-3">
						    <input type="text" 
								   class="form-control" 
								   name="month"
								   value="${performanceVo.month}"
								   readonly="readonly"/>
					    </div>
					    <!-- 绩效等级 -->
					    <label class="control-label col-md-2">
						    <spring:message code='label.performanceManager.grade' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-3">
					    	<select class="bs-select form-filter form-control" 
								data-size="10" 
								data-rule="required;"
								title="<spring:message code='message.pleaseselect' />" 
								id="grade"
								name="grade">
		                    </select>
					    </div>
                    </div>                
                    <div class="form-group">
                        <!-- 绩效数量 -->
					    <label class="control-label col-md-2">
						    <spring:message code='label.performanceManager.kpa' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-3">
					    	<div class="md-radio-inline">
								<div class="md-radio">
									<input type="radio" name="kpiKind" id="kpiKind0" value="0"
										class="md-radiobtn" checked> 
									<label for="kpiKind0">
										<span></span><span class="check"></span> <span class="box"></span>
										+
									</label>
								</div>
								<div class="md-radio has-error">
									<input type="radio" name="kpiKind" id="kpiKind1" value="1"
										class="md-radiobtn"> 
									<label for="kpiKind1">
										<span></span><span class="check"></span> <span class="box"></span>
										-
									</label>									
								</div>
							</div>
					    </div>
					     <label class="control-label col-md-2">
						    <spring:message code='label.performanceManager.kpaNum' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-3">
					    	<input type="text" 
								class="form-control" 
								id="kpiNumbers" 
								name="kpiNumbers" 
								data-rule="required;integer(+0)"
								value="${performanceVo.kpiNumbers}"
								placeholder="<spring:message code='common.laber.mustInputData'/>" />
					    </div>
                    </div>
                    <div class="form-group last">
                        <!-- 评语 -->
						<label class="control-label col-md-2">
							<spring:message code='label.performanceManager.comments' />
						</label>
						<div class="col-md-8">
					    	<textarea class="form-control" rows="3" id="comments" data-rule="length[~1000];" 
					    		name="comments"
					    		placeholder="<spring:message code='common.laber.noneMustInputData'/>"
					    		value="${performanceVo.comments}" >${performanceVo.comments}</textarea>
						</div>
                    </div>
                    <div class="form-group last">
                        <!-- 备注 -->
						<label class="control-label col-md-2">
							<spring:message code='label.performanceManager.remarks' />
						</label>
						<div class="col-md-8">
					    	<textarea class="form-control" rows="3" 
					    	id="remarks" 
					    	data-rule="length[~1000];" 
					    	name="remarks"
					    	placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
					    	value="${performanceVo.remarks}" >${performanceVo.remarks}</textarea>
						</div>
                    </div>
					<div class="form-actions">
						<div class="row">
							<div class="modal-footer">
								<button type="button" class="btn green" id="savePerformanceId">
									<i class="fa fa-check"></i>
									<spring:message code='btn.common.save' />
								</button>
								<button type="button" data-dismiss="modal" class="btn default"
									id="closePerformanceId">
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
<!-- 计算 -->
<script type="text/javascript">
	//下拉框初始化
	$("#performanceEditFormId #grade").initDic('${performanceVo.grade}',codeBasicInfo.grade);
	var kpiKind= '${performanceVo.kpiKind}';
	$("input[type='radio'][name='kpiKind'][value='"+kpiKind+"']").prop("checked","checked");
	var performanceEdit_operate='${operate}';
	
	var performanceEditVal=$("#performanceEditFormId").serializeFormJson();
    var performanceEditColumn = {
        grade:"<spring:message code='label.performanceManager.grade' />",
		kpiKind:"<spring:message code='label.performanceManager.kpa' />",
		kpiNumbers:"<spring:message code='label.performanceManager.kpaNum' />",
		comments:"<spring:message code='label.performanceManager.comments' />",
		remarks:"<spring:message code='label.performanceManager.remarks' />"   
    };
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/performanceManager/performanceNature/performanceManagerEdit.js"></script>
