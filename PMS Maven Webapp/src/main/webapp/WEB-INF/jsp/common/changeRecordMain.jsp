<!-- 数据变更日志界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div class="portlet box grey-cascade form-fit">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i>
					<spring:message code='btn.common.datalog' />
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> <a
						href="javascript:;" class="remove" data-dismiss="modal"> </a>
				</div>
			</div>
			<div class="portlet-body">
				<div class="row">
				    <div class="col-md-12">
				        <div class="portlet-body">
			                <div class="table-container">
			                    <table class="table table-striped table-bordered table-hover" id="changeRecordTableId"></table>
			                </div>
			            </div>
				        <!-- End: life time stats -->
				    </div>
				</div>
				<div style="text-align: center;margin: 10px;">
					<button type="button" data-dismiss="modal" class="btn default"
						id="closeChangeRecordBtn">
						<i class="fa fa-mail-forward"></i>
						<spring:message code='btn.common.close' />
					</button>
				</div>
			</div>
		</div>
		<!-- END PORTLET-->
	</div>
</div> 
<script type="text/javascript">	
	var changeRecord_changeId='${changeRecordVo.changeId}';
	var changeRecord_changeType='${changeRecordVo.changeType}';
	var changeRecord_changeBy="<spring:message code='lable.changeRecord.changeBy' />";//变更人
	var changeRecord_changeDate="<spring:message code='lable.changeRecord.changeDate' />";//变更日期
	var changeRecord_changeContent="<spring:message code='lable.changeRecord.changeContent' />";//变更内容
	var changeRecordGrid= new Datatable();//数据变更Datatable
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/common/changeRecord.js"></script>
