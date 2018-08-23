<!-- 投诉建议界面  zhangm 20180813-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<style>
	#shou {
        	background-image: url(<%=request.getContextPath()%>/assets/global/img/portlet-expand-icon.png);
        }
</style>
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			 <div class="portlet-title">
	             <div class="caption">
	                 <i class="fa fa-filter font-red"></i>
	                 <span class="caption-subject font-red sbold uppercase">
	                 	<font style="vertical-align: inherit;">
		                 	<font style="vertical-align: inherit;">
		                 	<spring:message code='label.queryTerm'/>
		                 	</font>
		                 </font>
		             </span>
	             </div>
	             <div class="tools">
	                 <a href="javascript:;" class="collapse"> </a>
	                 <a href="javascript:;" class="reload"> </a>
	             </div>
	         </div>
	         <div class="portlet-body form">
             	<form class="form-horizontal" id="complanintsAndAdviceFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			            	<!-- 工期 开始-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.saleActivity.startDate' />:
			                </label>
			                <div class="col-md-2 text-left">
								<input type="text" 
								   class="date-picker form-control dateSelect" 
								   id="beginTime" readonly="readonly"
								   name="beginTime"
								   data-date-format="yyyy-mm-dd" />
			                </div>
			                
			                <!-- 工期 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.saleActivity.endDate' />:
			                </label>
			                <div class="col-md-2 text-left">
							    <input type="text" 
							    	id="createDateEnd" 
							    	name="createDateEnd" readonly="readonly"
							    	class="date-picker form-control dateSelect" 
							    	data-date-format="yyyy-mm-dd">
			                </div>
			                
			                <!-- 类型 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.Complaints.advice' />:
			                </label>
			                <div class="col-md-2 text-left">
								<select class="bs-select form-filter form-control" 
									id="advicesType" 
									name="advicesType"
									data-size="10"  
									title="<spring:message code='label.allitem'/>">
								</select>
			                </div>
			                
			                <div class="col-md-2">
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" 
			                    	data-style="slide-left" id="searchComplainBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
							</div>
						</div>
			        </div>		                 
			    </form>
	         </div>
		</div>   
	</div>
</div>

<div class="row">
    <div class="col-md-12">
    	<div class="mt-element-ribbon bg-grey-steel">
            <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
                 <div class="ribbon-sub ribbon-clip"></div> 
                 <span class="caption-subject bold uppercase"><spring:message code='lable.Complaints.tsjy'/></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">  
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
							<auth:auth resourceCode="R001_02_OPERATION_EDIT">
								<a href="<%=request.getContextPath()%>/workbenchManage/complaintsAndAdviceEdit?operate=add" data-target="#addComplan" 
								data-toggle="modal" class="btn btn-circle green-haze">
								<i class="fa fa-plus"></i></a>
							</auth:auth>
	                    </div>
	                </div>
	            </div>
	            <div class="portlet-body">
	                <div class="table-container">
	                    <table class="table table-striped table-bordered table-hover" id="complanintsAndAdviceTableId"></table>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<!-- 弹出框 --> 
<div id="addComplan" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div> 

<div id="lookComplain" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	//投诉建议类型下拉框
	$("#complanintsAndAdviceFormId #advicesType").initDic('${vo.advicesType}',codeBasicInfo.adviceType); 
	var complainType = "<spring:message code='lable.Complaints.type' />";//类型
	var complainContent = "<spring:message code='label.msgProcess.mText' />";   //内容
	var complainName = "<spring:message code='label.chickinginManager.cardRecord.name'/>";//姓名
	var createDate = "<spring:message code='label.msgProcess.createDate' />";//创建日期
	var gridComplain = new Datatable();//联系人Datatable 
	var addActivityBtnDEL="<spring:message code='message.confirmdeletemsg' />";//删除
	var addActivityBtnEdit="<spring:message code='btn.common.edit' />";//编辑
	
	var complaintsEdit =isUserHasAuth("R001_02_OPERATION_EDIT");//新增/编辑客户权限
	var complaintsDel =isUserHasAuth("R001_02_OPERATION_DELC");//删除
	
	var workOrderManagerMain_removeWorkOrderMsg = "<spring:message code='label.workOrderManager.removeWorkOrderMsg' />";   //确定删除该记录吗？
	
	
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/workbenchManage/complaintsAndAdviceMain/complaintsAndAdviceMain.js"></script>