<!-- 监控上传界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div class="portlet box grey-cascade form-fit">
			<input type="hidden" name="moniDucId" id="moniDucId"/>
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i>
					<spring:message code='label.serviceTicket.serviceMoinUpload' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> 
					<a href="javascript:;" id="closeServiceTicketBtn" class="remove" data-dismiss="modal"> </a>
				</div>
			</div>
			<div class="portlet-body">
				<div class="file-loading">
					<input id="serviceTicketFileId" name="serviceTicketFileName" type="file" class="file-loading" multiple="multiple"/>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- bootstarp-fileinput wb066 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-fileinput-master/css/fileinput.min.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-fileinput-master/js/fileinput.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-fileinput-master/js/locales/zh.js"></script>
<script type="text/javascript">
	var moniDucId = $("#moniDucId").val();
    var control = $('#serviceTicketFileId'); 
    control.fileinput({
        uploadUrl:basePath+'/projectManage/upload?moniDucId='+moniDucId,
        showCaption: false,
        showCancel:false,
        showUploadedThumbs:false,
        showClose:false,
        autoReplace:true,
        maxFileCount:10,
        overwriteInitial:true,
        showUploadedThumbs:false,
        language:'zh',
        initialPreviewCount:1,
        initialPreviewShowDelete:false,
        overwriteInitial: false,
        validateInitialCount: true,
        layoutTemplates:{
             actions: ''
	    }
	    }).on('fileuploaded', function(event, data, previewId, index){ 
	    	$("#closeServiceTicketBtn").click(); 
	    	$("#searchServiceTicket").click();
	    });
	    
</script>
