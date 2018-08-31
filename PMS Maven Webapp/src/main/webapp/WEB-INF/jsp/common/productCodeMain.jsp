<!-- 代码生成工具-ZHOUMIN  -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<div class="portlet box green">
   <div class="portlet-title">
       <div class="caption">
           <i class="fa fa-gift"></i>代码生成</div>
       <div class="tools">
           <a href="javascript:;" class="collapse"> </a>
           <a href="#portlet-config" data-toggle="modal" class="config"> </a>
           <a href="javascript:;" class="reload"> </a>
           <a href="javascript:;" class="remove"> </a>
       </div>
   </div>
   <div class="portlet-body form">
       <!-- BEGIN FORM-->
       <form class="form-horizontal" id="codeEditFormId" autocomplete="off"
				data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
           <div class="form-body">
               <div class="form-group">
                   <label class="col-md-3 control-label">项目名：</label>
                   <div class="col-md-4">
                       <input type="text" name="projectName"  value="pc" class="form-control input-circle">
                   </div>
               </div>
               <div class="form-group">
                   <label class="col-md-3 control-label">作者：</label>
                   <div class="col-md-4">
                       <input type="text" name="author" value="ZHOUMIN" class="form-control input-circle">
                   </div>
               </div>
               <div class="form-group">
                   <label class="col-md-3 control-label">上级包名：</label>
                   <div class="col-md-4">
                       <input type="text" name="packageName" value="usermanage" class="form-control input-circle">
                   </div>
               </div>
               <div class="form-group">
                   <label class="col-md-3 control-label">处理类名：</label>
                   <div class="col-md-4">
                       <input type="text" name="objectName" value="UserManage" class="form-control input-circle">
                   </div>
               </div>
               <div class="form-group">
                   <label class="col-md-3 control-label">数据表名：</label>
                   <div class="col-md-4">
                       <input type="text" name="tableName" value="PC_USER" class="form-control input-circle">
                   </div>
               </div>
           </div>
           <div class="form-actions">
               <div class="row">
                   <div class="col-md-offset-3 col-md-9">
                       <button type="button" class="btn btn-circle green" id="saveCodeId">Submit</button>
                       <button type="button" class="btn btn-circle grey-salsa btn-outline">Cancel</button>
                   </div>
               </div>
           </div>
       </form>
       <!-- END FORM-->
    </div>
</div>
<script type="text/javascript">
$(function() {
	//保存
	$("#saveCodeId").click(function() {
		$.ajax({
			url: basePath+'/systemManage/proCode',
			type: 'POST',
			dataType: 'json',
			data: $("#codeEditFormId").serialize()
		})
		.done(function(data) {
		}).fail(function(data) {
			alert("操作成功");
		});
	});
});
</script>
</html>
