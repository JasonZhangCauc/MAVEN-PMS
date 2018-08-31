<!-- 打卡记录主界面  ZHANGJIAMING 20180802-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<%@ page import="com.ps.result.systemmanage.UserVo"%>
<%
	UserVo loginUser = (UserVo) request.getSession().getAttribute("user");
%>
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered query">
			 <div class="portlet-title">
	             <div class="caption">
	                 <i class="fa fa-filter font-red"></i>
	                 <span class="caption-subject font-red sbold uppercase"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">查询条件</font></font></span>
	             </div>
	             <div class="tools">
	                 <a href="javascript:;" class="collapse"> </a>
	                 <a href="javascript:;" class="reload"> </a>
	             </div>
	         </div>
	         <div class="portlet-body form">
             	<form class="form-horizontal" id="chickinBaseInfoMainFormId" method="post">
			        <div class="form-body">
			            <div class="form-group">
			            	<!-- 姓名 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.chickinginManager.cardRecord.name' />:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" value="" name="chickinByName" id="chickinByName" class="form-control form-filter spinner"
			                     	 placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <!-- 日期 -->
			                <label class="col-md-1 control-label">
			                	<spring:message code='label.chickinginManager.cardRecord.time' />:
			                </label>
			                <!-- 日期范围 -->
			                <div class="col-md-2 text-left">
			                	<div class=" input-group input-large">
									<input type="text" 
										id="beginTime" 
										name="beginTime" 
										placeholder="<spring:message code='common.label.from'/>" 
										class="date-picker form-control dateSelect " 
										data-date-format="yyyy-mm-dd ">
								    <span class="input-group-addon">to</span>
								    <input type="text" 
								    	id="endTime" 
								    	name="endTime" 
								    	placeholder="<spring:message code='common.label.to'/>" 
								    	class="date-picker form-control dateSelect" 
								    	data-date-format="yyyy-mm-dd">
								</div>
			                </div>
			                <!-- 状态 -->
			                 <label class="col-md-2 control-label">
			                	<spring:message code='label.chickinginManager.cardRecord.state' />:
			                </label>
			                <div class="col-md-2 text-left">
			                	<select class="bs-select form-filter form-control" 
									data-size="10" 
									id="chickinState"
									name="chickinState"
									title="<spring:message code='label.allitem' />" >
			                    </select>
			                </div> 
			                <div class="col-md-1">
			                    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" 
			                    	data-style="slide-left" id="searchChickinBaseInfoBtn">
                                    <span class="ladda-label"><i class="fa fa-search"></i></span>
                                    <span class="ladda-spinner"></span><div class="ladda-progress" style="width: 0px;"></div>
                                </button>
							</div>
						</div>
												<div class="line_p collapse" id="projectBaseInfoHide" aria-expanded=false>
							<div class="form-group">
								 <!-- 日期 -->
				                <label class="col-md-1 control-label">
				                	<spring:message code='label.chickinginManager.cardRecord.time' />:
				                </label>
				                <div class="col-md-2 text-left">
				                	<div class=" input-group input-large">
										<input type="text" 
										data-size="10"
											id="beginTime" 
											name="beginTime" 
											placeholder="<spring:message code='common.label.from'/>" 
											class="date-picker form-control dateSelect " 
											data-date-format="yyyy-mm-dd ">
									    <span class="input-group-addon">to</span>
									    <input type="text" 
									    data-size="10"
									    	id="endTime" 
									    	name="endTime" 
									    	placeholder="<spring:message code='common.label.to'/>" 
									    	class="date-picker form-control dateSelect" 
									    	data-date-format="yyyy-mm-dd">
									</div>
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
                 <span class="caption-subject bold uppercase"><spring:message code='label.chickinginManager.cardRecord.chickinBaseinfo'/></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">  
	                <div class="actions">
	                     <div class="btn-group btn-group-devided" data-toggle="buttons">
							<auth:auth resourceCode="R014_01_OPERATION_ALLOT">	
								<a href="<%=request.getContextPath()%>/checkinginManage/chickinBaseInfoEdit?operate=add" data-target="#project-modal" 
								data-toggle="modal" class="btn btn-circle green-haze">
								<span class="hidden-sm hidden-xs">补签</span></a>
							</auth:auth>
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
	                    <table class="table table-striped table-bordered table-hover" id="chickinBaseInfoMianTableId"></table>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<!-- 弹出框 --> 
<div id="newExcelModalId" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:30%;top: 50px;" >
		<div class="modal-content" >
		</div>
	</div>
</div>
<!-- 弹出框 --> 
<div id="project-modal" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
    <div class="modal-dialog">
         <div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
    </div>
</div> 
<script type="text/javascript">
 $("#delete").click(function(){
		 var jsonData={};
         $.ajax({
             type: 'POST',
             url:basePath+'/checkinginManage/deleteChickin',
				dataType: 'json',
				data:{id:'<%=loginUser.getId() %>'},
				success:function(event){
				alert("success");
				}
				
         });
	});
</script>
<!-- 参数列表 --> 
<script type="text/javascript">
	var chickinBaseInfoMain_state = "<spring:message code='label.sysmanage.status' />";   //状态  
	var chickinBaseInfoMain_name = "<spring:message code='label.chickinginManager.cardRecord.name' />";   //姓名
	var chickinBaseInfoMain_time = "<spring:message code='label.chickinginManager.cardRecord.time' />";   //日期
	var chickinBaseInfoMain_type = "<spring:message code='label.chickinginManager.cardRecord.type' />";   //类型（上班、下班）
	var chickinBaseInfoMain_reason = "<spring:message code='common.label.operate' />";   //操作
	var chickinBaseInfoMain_deleteProjectMsg = "<spring:message code='label.projectManager.deleteProjectMsg' />";   //确认删除该项目吗？
	var chickinBaseInfoMain_passBtn = "<spring:message code='label.projectManager.passBtn' />";   //通过
	var chickinBaseInfoMain_surePassMsg = "<spring:message code='lable.projectManager.surePassMsg' />";   //确定审核通过该项目吗？
	var gridchickinBaseInfo = new Datatable();//项目维护Datatable
	var hasEditChickinBaseInfoAuth = isUserHasAuth("R012_01_OPERATION_EDIT"); //编辑权限
	var hasRemoveChickinBaseInfoAuth = isUserHasAuth("R012_01_OPERATION_DEL"); //删除权限
	var hasAuditChickinBaseInfoAuth = isUserHasAuth("R012_01_OPERATION_AUTH"); //审核权限 
	//$("#chickinBaseInfoMainFormId #chickinPhase").initDic(null,codeBasicInfo.chickinPhase);//项目阶段
	$("#chickinBaseInfoMainFormId #chickinState").initDic(null,codeBasicInfo.chinkinStatus);//状态	
	$("#chickinBaseInfoMainFormId #chickinType").initDic(null,codeBasicInfo.chickinType);//类型
</script>
<!-- 引用js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/checkinginManage/chickinBaseinfoManager/chickinBaseinfoMain.js"></script>
