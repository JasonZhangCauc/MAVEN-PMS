<!-- 客户管理 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!-- Begin: Query conditions -->
<style>
        /* .portlet > .portlet-title > .gd > a.expand {
        background-image: url(/METRONIC_DEMO/assets/global/img/portlet-expand-icon.png);
        width: 14px;
        visibility: visible; } */
        /* .portlet > .portlet-title > .tools > a.collapse {
        background-image: url(/METRONIC_DEMO/assets/global/img/portlet-expand-icon.png);
        width: 14px;
        visibility: visible; } */
        
        /* .portlet > .portlet-title > .gd > a:hover {
        text-decoration: none;
        -webkit-transition: all 0.1s ease-in-out;
        -moz-transition: all 0.1s ease-in-out;
        -o-transition: all 0.1s ease-in-out;
        -ms-transition: all 0.1s ease-in-out;
        transition: all 0.1s ease-in-out;
        opacity: 0.8 ;
        filter: alpha(opacity=80) ; } */
        
        /* .portlet > .portlet-title > .gd > a {
        display: inline-block;
        height: 16px;
        margin-left: 5px;
        opacity: 1 ;
        filter: alpha(opacity=100) ; } */
        
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
	                 <span class="caption-subject font-red sbold uppercase"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">查询条件</font></font></span>
	             </div>
	             <div class="tools">
	                 <a href="javascript:;" class="collapse"> </a>
	                 <a href="javascript:;" class="reload"> </a>
	             </div>
	         </div>
	         <div class="portlet-body form">
		         <form class="form-horizontal" id="customMianFormId" method="post">
			         <div class="form-body">
				         <div class="form-group">
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.customManage.shortName'/>:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="customShortName" class="form-control form-filter spinner" 
			                    	placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                <label class="col-md-1 control-label">
			                	<spring:message code='lable.customManage.companyName'/>:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="customName" class="form-control form-filter spinner" 
			                    	placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div>
			                 <%-- <label class="col-md-1 control-label">
			                	<spring:message code='lable.linker.name'/>:
			                </label>
			                <div class="col-md-2 text-left">
			                    <input type="text" name="linkerName" class="form-control form-filter spinner" 
			                    	placeholder="<spring:message code='message.pleaseinput'/>"> 
			                </div> --%>
			                <div class="col-md-1 text-left">
							    <button type="button" class="btn btn-primary mt-ladda-btn ladda-button" data-style="slide-left" id="searchCustomBtn">
                                   <span class="ladda-label"><i class="fa fa-search"></i> 搜索</span>
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
<!-- End: Query conditions -->
<!-- Begin: The query results -->
<div class="row">
    <div class="col-md-12">
    	<div class="mt-element-ribbon bg-grey-steel">
            <div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
                 <div class="ribbon-sub ribbon-clip"></div> 
                 <span class="caption-subject bold uppercase"><spring:message code='lable.customManage.customTable'/></span> 
	        </div>
	        <div class="portlet light portlet-fit portlet-datatable bordered">
	            <div class="portlet-title">  
	                <div class="actions">
	                    <div class="btn-group btn-group-devided" data-toggle="buttons">
							<auth:auth resourceCode="R002_01_OPERATION_EDIT">	 
	                         	<div class="btn-group btn-group-devided" data-toggle="buttons">
		                          	<a href="<%=request.getContextPath()%>/preSalesManage/customManageEdit?operate=add" data-target="#newCustomModalIdss" 
										data-toggle="modal" class="btn green-haze btn-outline btn-circle btn-sm"><i class="fa fa-plus"></i> <spring:message code='lable.customManage.addCustome' />
									</a>
								</div>
						  </auth:auth>
	                    </div>
	                </div>
	            </div>
	            <div class="portlet-body">
	                <div class="table-container">
	                   	 <table class="table table-striped table-bordered table-hover" id="customMianTableId"></table>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>

<div class="row">
	<form id="form_id">
		<div class="col-md-12">
	        <div class="portlet light portlet-fit portlet-datatable bordered mt-element-ribbon"> 
	        	<div class="ribbon ribbon-border-hor ribbon-clip ribbon-color-danger uppercase">
	                 <div class="ribbon-sub ribbon-clip"></div> 
	                 <span class="caption-subject bold uppercase"><spring:message code='label.custom.info'/></span> 
		        </div>  
	        	<div class="portlet-title"> 
		             <div class="tools" >
		                 <a href="javascript:;" id="shou" onclick="replaceImageCustome(this)" style="width: 14px;visibility: visible;"> </a> 
		             </div>
		         </div>       
		         
		        <div class="portlet light portlet-fit portlet-datatable bordered" id="customTab1" style="display: none;">
		            <div class="portlet-title">
		                <div class="portlet-title tabbable-line">
		                     <ul class="nav nav-tabs">
		                        <li class="active">
		                            <a href="#tab-1" data-toggle="tab" onclick="custome();"><spring:message code='label.projectManager.projectInfo' /> </a>
		                        </li>
		                        <li>
		                            <a href="#tab-2" data-toggle="tab" onclick="contact()"><spring:message code='lable.customManage.linker' /> </a>
		                        </li>
		                    </ul>
		                </div>
		            </div>
		            
		            <div class="portlet-body" style="height: 550px;">
		                <div class="tab-content">
		                    <div class="tab-pane active" id="tab-1" style="display: block;"> 
		                        <div class="mt-actions">
		                            <div class="mt-action">
		                                <table class="table table-striped table-bordered table-hover" id="saleTrackId"></table>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="tab-pane" id="tab-2">
		                        <!-- BEGIN:Completed-->
		                        <div class="table-container">
				                    <table class="table table-striped table-bordered table-hover" id="linkerMianTableIdByCustom"></table>
				                </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		         
		         
		         
		            <!-- <div class="portlet-body form" id="tab1" style="display: none;">
		                <div class="table-container">
		                    <table class="table table-striped table-bordered table-hover" id="linkerMianTableIdByCustom"></table>
		                </div>
		            </div>   -->
	        </div>
	    </div>
    </form>
</div>
<!-- End: The query results -->
<!-- BEGIN 弹框 --> 
<div id="newCustomModalId" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
	</div>
</div>
<div id="addLinkerModalId" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
	</div>
</div>
<div id="LookCustomModalId" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
	</div>
</div>
<div id="LookLinkerModalId" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
	</div>
</div>
<!-- BEGIN 弹框 --> 
<div id="newCustomModalIdss" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
	</div>
</div>
<div id="addLinkerModalIdss" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
	</div>
</div>
<!-- END 弹框 --> 
<script type="text/javascript">
	
	var t1="<spring:message code='lable.customManage.shortName' />";//客户简称
	var t2="<spring:message code='lable.customManage.companyName' />";//公司全称
	var t3="<spring:message code='lable.customManage.address' />";//所在地址
	var t4="<spring:message code='lable.customManage.phone' />";//联系电话 
	var t5="<spring:message code='lable.customManage.email' />";//邮箱
	var t6="<spring:message code='lable.customManage.remark' />";//备注
	var t7="<spring:message code='common.label.operate' />";//操作
	var tproResponser="<spring:message code='lable.saleTrack.proResponser' />";//销售负责人
	var tproStatus="<spring:message code='lable.saleTrack.proStatus' />";//项目状态
	var t8="<spring:message code='lable.linker.name' />";//联系人姓名
	var t9="<spring:message code='lable.linker.jobDesc' />";//职务描述
	var t10="<spring:message code='lable.linker.mobilephone' />";//移动电话
	var t11="<spring:message code='lable.linker.telephone' />";//固定电话
	var t12="<spring:message code='lable.linker.mailbox' />";//邮箱
	var t13="<spring:message code='lable.linker.qqNo' />";//QQ号
	var t14="<spring:message code='lable.customManage.remark' />";//备注
	var t15="<spring:message code='common.label.operate' />";//操作
	var t16="<spring:message code='lable.customManage.second' />";//二字码
	
	var tprojectName="<spring:message code='lable.saleTrack.projectName' />";//项目名称
    var deleteCustomBtn="<spring:message code='lable.customManage.delete' />";//删除客户
    var addLinkerBtn="<spring:message code='lable.linker.add' />";//新增联系人
    var deleteLinkerBtn="<spring:message code='lable.linker.delete' />";//删除联系人
	var deleteCustomerConfirmMsg="<spring:message code='message.custommanage.sureDeleteCustomer' />";//确定删除该用户吗
	var deleteLinkerConfirmMsg="<spring:message code='message.custommanage.sureDeletelinker' />";//确定删除该联系人吗
	var gridCustomer = new Datatable();//用户管理Datatable
	var gridLinker = new Datatable();//联系人Datatable
	var gridSaleTrack = new Datatable();//销售项目table
	var addActivityBtn="<spring:message code='lable.Activity.addContact' />";//新增销售活动
	
	var hasEditCustomAuth =isUserHasAuth("R002_01_OPERATION_EDIT");//新增/编辑客户权限
	var hasDeleteCustomAuth = isUserHasAuth("R002_01_OPERATION_DELC");//删除客户权限
	var hasEditLinkerAuth = isUserHasAuth("R002_01_OPERATION_EDITP");//新增/编辑联系人权限
	var hasDeleteLinkerAuth =isUserHasAuth("R002_01_OPERATION_DELP");//删除联系人权限
	var deleteInfo = "<spring:message code='btn.common.delete' />";
	function replaceImageCustome(e){ 
		if(e.id=="shou"){
			 $(e).attr('id',"fang");
			 $(e).css({"background-image":"url(/PMS/assets/global/img/portlet-collapse-icon.png)"});
			 $("#customTab1").slideDown("fast");
		}else if(e.id="fang"){
			 $(e).attr('id',"shou");
			 $(e).css({"background-image":"url(/PMS/assets/global/img/portlet-expand-icon.png)"});
			 $("#customTab1").slideUp("fast"); 
		}
	}
	
	function contact(){
		$("#tab-1").hide();
		$("#tab-2").show();
	}
	function custome(){ 
		$("#tab-1").show(); 
		$("#tab-2").hide();
	}
	
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/preSalesManage/custommanage/clientManageMain.js"></script>