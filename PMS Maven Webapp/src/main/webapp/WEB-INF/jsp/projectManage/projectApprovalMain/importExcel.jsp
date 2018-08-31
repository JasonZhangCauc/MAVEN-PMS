<!-- 题目导入 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<style type="text/css">
.am-form-file {
  position: relative;
  overflow: hidden;
}
.am-form-file input[type="file"] {
  position: absolute;
  left: 0;
  top: 0;
  z-index: 1;
  width: 100%;
  opacity: 0;
  cursor: pointer;
  font-size: 50rem;
}
</style>
<script type="text/javascript">
	var chooseFileFirst = "<spring:message code='message.userManagement.chooseFileFirst' />";//请先选择文件
	$(function(){
		//隐藏提示框
		$(".msgShowDivClass").hide();
		$("#file-list").empty();
		$("#doc-form-file").val('');
		
		// 显示添加的导入文件
		$("#doc-form-file").on('change', function() {
			var fileNames = '';
			$.each(this.files, function() {
				fileNames += this.name + ',';
			});
			$("#file-list").val(fileNames.substring(0, fileNames.length-1));
	    });
		
		//下载模板
		$("#downloadTemplateBtn").bind("click",function(){
			window.location.href=basePath+"/projectManage/downloadProjectApprovalTemplate?t="+new Date();
		});
		
		//导入
		$("#importStuDataBtn").click(function() {
			if($("#file-list").val() == "") {
				bootbox.alert(chooseFileFirst);//请先选择文件
				return false;
			}
	        $("#importDataForm").submit();
	    });
	    
	    //保存
    	$("#importDataForm").on('valid.form', function(){
	    	//禁用导入操作页面的各种按钮
	    	$("#importDataForm button").attr("disabled","disabled");
	    	$("#tileEditModalId button").attr("disabled","disabled");
	    	$(".msgShowDivClass").show();
	    	var options = {
	            url:basePath+"/projectManage/importProjectApprovalFile",
	            type:'POST',
	            dataType: 'json',
	            success: function(data){
	            	$(".msgShowDivClass").hide();
	            	$("#importDataForm button").attr("disabled",false);
	            	$("#tileEditModalId button").attr("disabled",false);
	            	if(data.attachObj.length>0){
	            		var html = "";
	            		for(var i=0; i<data.attachObj.length; i++) {
	            			html += data.attachObj[i]+"<br/>";
	            		}
	            		bootbox.alert(html);
	            	}else{
	            		$("#closeTileId").click();
	            		initAttasInfoWal({sa_title:commonSuccessMsg, sa_type:"success", sa_confirmButtonClass:"btn-success"});
	            	}
	            	//刷新查询列表
	            	gridProjectBaseInfo.getDataTable().ajax.reload();
	            }
	        };
	        $("#importDataForm").ajaxSubmit(options); 
	    });
	    
    });
</script>

<div class="row">
	<div class="col-md-12">
		<div class="portlet box grey-cascade">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i><spring:message code='btn.common.edit' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="remove" data-dismiss="modal"></a>
				</div>
			</div>
			<div class="portlet-body" style="padding:20px 0 0;">
				<div class="form-group" style="margin-bottom:0px;">
					<form class="form-horizontal" id="importDataForm" autocomplete="off" 
						data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
						<div style="text-align:center">
							<label class="control-label col-md-2 text-right" style="width:100px;padding: 10px 0;">
								<spring:message code='lable.upload.fileName' />
								<a class="tooltips" data-toggle="tooltip" data-original-title="<spring:message code='lable.titlemanagement.tleNameOriginal' /> "></a>
							</label>
							<div class="col-md-6 text-left input-icon right validFormDiv" style="padding-right:0px">
								<i class="fa"></i>
								<input id="file-list" type="text" class="form-control" readonly="readonly" />
							</div>
							
							<div class="btn-group am-form-file">
								<input name="myfiles" id="doc-form-file" type="file" multiple='true' accept="accplication/msexcel" />
								<button type="button" class="btn blue" id="selectFileBtn">
									<spring:message code='btn.studentmanage.selectfile' />
								</button>
							</div>
						</div>
					</form>
				</div>
				<div class="form-group msgShowDivClass" style="float:center;text-align:center">
					<!-- 数据导入中，请耐心等待! -->
					<div style="color:red"><spring:message code='message.fileImport.dataIsImporting' /></div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal-footer" style="text-align:center" id="tileEditModalId">
	<!-- 下载模板 -->
	<button type="button" id="downloadTemplateBtn" class="btn blue" >
		<spring:message code='btn.studentmanage.downloadtemplate' />
	</button>
	<!-- 导入 -->
	<button type="button" id="importStuDataBtn" class="btn blue">
		<spring:message code='btn.common.import' />
	</button>
	<!-- 关闭 -->		
	<button type="button" data-dismiss="modal" class="btn btn-default" id="closeTileId">
		<spring:message code='btn.common.close' />
	</button>
</div>