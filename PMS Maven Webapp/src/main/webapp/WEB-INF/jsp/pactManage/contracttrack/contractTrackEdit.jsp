<!-- 合同跟踪编辑 -->
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
                  <form class="form-horizontal  form-bordered" id="ContractTrackEditFormId" autocomplete="off" 
				    data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
				    <input type="hidden" value="${vo.id}" name="id" id="id"/>
				    <input type="hidden" value="${vo.contractId}" name="contractId" id="contractId"/>
				    <input type="hidden" value="" name="changeDetails" id="changeDetails" />
                     <!-- 创建人 -->
                    <div class="form-group">                       
					    <label class="control-label col-md-2">
						    <spring:message code='label.contractTrack.createBy' />
						    <span class="required">* </span>
					    </label>
					    <div class="col-md-4">
						    <input type="text" 
								   class="form-control" 
								   id="createBy" 
								   name="createBy" 
								   value="${vo.createBy}"
								   readonly="readonly" 								   
								   />
					    </div>
					    <!-- 创建时间 -->
						<label class="control-label col-md-2"><spring:message code='label.contractTrack.createDate' />
						<span class="required">* </span>
						</label>						
						<div class="col-md-4">
							<input type="text" 
								   class="form-control" 
								   id="createDate" 
								   name="createDate" 
								   value="${vo.createDate}"
								   readonly="readonly"
								    />
						</div>
					  </div>					 
                    <!-- 项目阶段 -->
                    <div class="form-group">                        
						<label class="control-label col-md-2"><spring:message code='label.contractTrack.projectStage' />
						  <span class="required">* </span>
						</label>						 
						<div class="col-md-4">
							 <select class="bs-select form-filter form-control" 
									data-size="10" 									
									data-live-search="true" 
									data-rule="required;"
									data-width="70%"
									title="<spring:message code='message.pleaseselect' />" 
									id="projectStage"
									name="projectStage">
			                 </select>
						</div>
						<!-- 使用人天数量 -->
						<label class="control-label col-md-2"><spring:message code='label.contractTrack.persondayCounts' />
						 <span class="required">* </span>
						</label>
						<div class="col-md-4">
							<input type="text" 
							   class="form-control" 
							   id="persondayCounts" 
							   name="persondayCounts" 
							   value="${vo.persondayCounts}"
							   data-rule="required;range(0~);"
							   placeholder="<spring:message code='common.laber.mustInputData'/>" 
							   />
						</div>
					</div>													
				    <div class="form-group">							
						 <!-- 备注 -->
						<label class="control-label col-md-2"><spring:message code='label.contractTrack.remark' /></label>
						<div class="col-md-9">
						     <textarea class="form-control" rows="3" 
						     id="remark" 
						     name="remark"
						     placeholder="<spring:message code='common.laber.noneMustInputData'/>" 
						     value="${vo.remark}" 
						     data-rule="length[~1000];"
						     >${vo.remark}</textarea>						     
						</div>
					</div>
					<div class="form-group last">
                    	<!-- 附件 -->
						<label class="control-label col-md-2">
							<spring:message code='common.label.attachment' />							
						</label>
						<div class="col-md-4">
				            <div id="moduleGallery" class="editableGallery"></div>
				            <div id="uploaderTrackDivId" class="editableGallery">        
	                            <div class="queueList">
	                                <div id="dndArea" class="placeholder">
	                                    <div id="filePicker"></div>	                                    
	                                </div>
	                            </div>
	                            <div class="statusBar" style="display:none;">
	                                <div class="progress">
	                                    <span class="text">0%</span> <span class="percentage"></span>
	                                </div>
	                                <div class="info"></div>
	                                <div class="btns">
	                                    <div id="filePicker2" class="addFileBtn"></div>
	                                </div>
	                            </div>
			                </div> 
						</div>
                    </div>
                     <div class="form-actions">
                         <div class="row">
                             <div class="modal-footer">
                                   <button type="button" class="btn green" id="saveContractTrackId">
									<i class="fa fa-check"></i>
									<spring:message code='btn.common.save' />
							    </button>
								<button type="button" data-dismiss="modal" class="btn default" id="closeContractTrackEditId">
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
$("#ContractTrackEditFormId #projectStage").initDic('${vo.projectStage}',codeBasicInfo.projectStage);
var contractTrack_operate='${operate}';
$(function(){
	if(contractTrack_operate=='edit'){
		//初始化上传插件
		initWebUploaderUI({
        	_webUploaderId:'#uploaderTrackDivId',
        	_fileAddId:'#filePicker',
        	_fileAddIdContinue:'#filePicker2',
        	_dataId:'${vo.id}',
        	_pageType:'R003-0401',
        	_editFileId:'#moduleGallery'});
        //初始化历史数据
		initEidtUploaderUI({
			_editFileId:'#moduleGallery',
			_dataId:'${vo.id}',
			_pageType:'R003-0401'
			});
	}
});
 var contractTrackVal=$("#ContractTrackEditFormId").serializeFormJson();
 var contractTrackColumn = {
     projectStage:"<spring:message code='label.contractTrack.projectStage' />",
     persondayCounts:"<spring:message code='label.contractTrack.persondayCounts' />",
     remark:"<spring:message code='label.contractTrack.remark' />"
 };


</script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/contractmanage/contracttrack/contractTrackEdit.js"></script>