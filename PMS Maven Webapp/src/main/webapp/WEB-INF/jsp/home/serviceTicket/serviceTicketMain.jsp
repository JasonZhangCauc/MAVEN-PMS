<!-- 服务单主界面  ZHOUMIN 20180305-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
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
             	<form class="form-horizontal" id="serviceTicketMainFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			            	<!-- 上传时间 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.serviceTicket.uploaddate' />:
			                </label>
			                <div class="col-md-5 text-left">
			                	<div class="input-group input-large">
									<input type="text" 
										id="uploadBeginDate" 
										name="uploadBeginDate" 
										placeholder="<spring:message code='common.label.from'/>" 
										class="date-picker form-control dateSelect" 
										data-date-format="yyyy-mm-dd">
								    <span class="input-group-addon">to</span>
								    <input type="text" 
								    	id="uploadEndDate" 
								    	name="uploadEndDate" 
								    	placeholder="<spring:message code='common.label.to'/>" 
								    	class="date-picker form-control dateSelect" 
								    	data-date-format="yyyy-mm-dd">
								</div>
			                </div>
			                <!-- 文件名-->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.serviceTicket.filename' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<input type="text" name="filename" class="form-control form-filter spinner"
				                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <div class="col-md-2">
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" 
			                    	data-style="slide-left" id="searchServiceTicket">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
                                <button type="button" data-target="#serviceTicketHide" data-toggle="collapse" 
                                	aria-expanded="false" class="btn default" data-style="slide-left" >
                                    <span class="ladda-label"><i class="fa fa-filter"></i></span>
                                </button>	
							</div>
						</div>
						<div class="line_p collapse" id="serviceTicketHide" aria-expanded=false>
							<div class="form-group">
								<!--上传人 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.serviceTicket.uploadby' />:
				                </label>
				                <div class="col-md-2 text-left">
				                    <input type="text" name="uploadbyName" class="form-control form-filter spinner"
				                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
				                </div>
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
                 <span class="caption-subject bold uppercase"><spring:message code='lable.serviceTicket'/></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">  
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
	                    	<a href="<%=request.getContextPath()%>/systemManage/serviceTicketEdit" 
								data-target="#serviceTicked-modal" data-toggle="modal" class="btn btn-circle green-haze">
							<i class="fa fa-plus"></i></a> 
	                    </div>
	                     <div class="btn-group">
	                        <a class="btn red btn-sm btn-circle" href="javascript:;" data-toggle="dropdown">
	                            <i class="fa fa-print"></i>
	                        </a>
	                        <ul class="dropdown-menu pull-right" id="sample_tools">
	                            <li>
	                                <a href="javascript:;" data-action="0" class="tool-action">
	                                    <i class="icon-printer"></i> Print</a>
	                            </li>
	                            <li>
	                                <a href="javascript:;" data-action="1" class="tool-action">
	                                    <i class="icon-check"></i> Copy</a>
	                            </li>
	                            <li>
	                                <a href="javascript:;" data-action="2" class="tool-action">
	                                    <i class="icon-doc"></i> PDF</a>
	                            </li>
	                            <li>
	                                <a href="javascript:;" data-action="3" class="tool-action">
	                                    <i class="icon-paper-clip"></i> Excel</a>
	                            </li>
	                            <li>
	                                <a href="javascript:;" data-action="4" class="tool-action">
	                                    <i class="icon-cloud-upload"></i> CSV</a>
	                            </li>
	                            <li class="divider"> </li>
	                            <li>
	                                <a href="javascript:;" data-action="5" class="tool-action">
	                                    <i class="icon-refresh"></i> Reload</a>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <div class="portlet-body">
	                <div class="table-container">
	                    <table class="table table-striped table-bordered table-hover" id="serviceTicketMianTableId"></table>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<!-- 服务单上传界面 -->
<div id="serviceTicked-modal" class="modal fade" tabindex="-1"
	data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:45%;top: 50px;height:80%;">
		<div class="modal-content"></div>
	</div>
</div>
<!-- 参数列表 --> 
<script type="text/javascript">
	var serviceTicketMain_filename = "<spring:message code='label.serviceTicket.filename' />";   //文件名
	var serviceTicketMain_uploadby = "<spring:message code='label.serviceTicket.uploadby' />";   //上传人
	var serviceTicketMain_uploaddate = "<spring:message code='label.serviceTicket.uploaddate' />";   //上传时间
	var serviceTicketMain_removeServiceTickMsg = "<spring:message code='label.serviceTicket.removeServiceTickMsg' />";   //确定删除该服务单吗？
	var gridServiceTicket = new Datatable();//工作单Datatable
	var hasEditServiceTicketAuth = isUserHasAuth("R010_0101"); //上传权限
	var hasRemoveServiceTicketAuth = isUserHasAuth("R010_0102"); //删除权限
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/home/serviceTicket/serviceTicketMain.js"></script>