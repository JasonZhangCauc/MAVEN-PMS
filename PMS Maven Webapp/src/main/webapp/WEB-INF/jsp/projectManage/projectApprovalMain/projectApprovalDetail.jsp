<!-- 客户管理 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %> 
<style>
	.wit{ 
		height:260px;
	}
	.rit{
		text-align: right;
	}
</style>
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-equalizer font-green-haze"></i>
                    <span class="caption-subject font-green-haze bold uppercase">${vo.projectName}</span>
                    <span class="caption-helper">${vo.createDate}</span>
                </div>
                <div class="tools">
                    <a href="" class="collapse" data-original-title="" title=""> </a>
                    <a href="" class="reload" data-original-title="" title=""> </a>
                    <a href="" class="fullscreen" data-original-title="" title=""> </a>
                </div>
            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form class="form-horizontal" role="form">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">状态:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static"> <span class='label label-success'> ${vo.projectPhaseStr}</span> </p>
                                        
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">工期:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static"> ${vo.workTime} </p>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <!--/row-->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">创建于:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static"> ${vo.createDate} </p>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">项目经理:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static"> ${vo.projectManagerName} </p>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <!--/row-->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">团队成员:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static"> ${vo.projectResourceName} </p>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">已耗工时:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static"> ${vo.expiredHours }	 </p>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
         </div>
    </div>
</div>
<div class="row">
    <div class="col-md-8">
        <div class="portlet light bordered">
            <input type="hidden" name="moniDucId" id="moniDucId"/>
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-social-dribbble font-green"></i>
                    <span class="caption-subject font-green bold uppercase">项目监控</span>
                </div>
                <div class="tools">
                    <a href="" class="collapse" data-original-title="" title=""> </a>
                    <a href="" class="reload" data-original-title="" title=""> </a>
                    <a href="" class="fullscreen" data-original-title="" title=""> </a>
                </div>
            </div>
            <div class="portlet-body">
                 <table class="table table-striped table-bordered table-hover" id="customMianTableIdA"></table>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="portlet light bordered">
            <input type="hidden" name="moniDucId" id="moniDucId"/>
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-social-dribbble font-green"></i>
                    <span class="caption-subject font-green bold uppercase">监控文档上传</span>
                </div>
                <div class="tools">
                    <a href="" class="collapse" data-original-title="" title=""> </a>
                    <a href="" class="reload" data-original-title="" title=""> </a>
                    <a href="" class="fullscreen" data-original-title="" title=""> </a>
                </div>
            </div>
            <div class="portlet-body">
                 <div class="portlet-body">
                     <div id="milepostModuleGallery" class="editableGallery"></div>
	                 <div id="milepostUploaderDivId" class="editableGallery">        
                         <div class="queueList">
                             <div id="dndArea" class="placeholder" style="display: none">
                                 <div id="milepostFilePicker"></div>
                                 <p>单次最多可选10张</p>
                             </div>
                             <div id="dndAreas" class="placeholder">
                                 <div id="milepostFilePicker"></div>
                                 <p>选择监控项上传附件</p>
                             </div>
                         </div>
                         <div class="statusBar" id="statusBar" style="display:none;">
                             <div class="progress">
                                 <span class="text">0%</span> <span class="percentage"></span>
                             </div>
                             <div class="info"></div>
                             <div class="btns">
                                 <div id="milepostFilePicker2" class="addFileBtn"></div>
                             </div>
                         </div>
	                  </div>
                 </div>
            </div>
        </div>
    </div>
</div>
<!-- BEGIN 弹框 --> 
<div id="addProjectApproval" class="modal fade todo-task-modal" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="height: 100%;" data-always-visible="1" data-rail-visible="0"></div>
	</div>
</div>
<div id="serviceTicked-modal" class="modal fade" tabindex="-1"
	data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width:45%;top: 50px;height:80%;">
		<div class="modal-content"></div>
	</div>
</div>

<script type="text/javascript">
	var projectId = '${vo.id}';
	var objectVal=$("#CustomEditFormId").serializeFormJson();
	var t1="<spring:message code='lable.moni.moniStatus' />";//状态
	var t2="<spring:message code='lable.moni.moniTitle' />";//标题
	var t3="<spring:message code='lable.moni.moniStartDate' />";//开始时间
	var t4="<spring:message code='lable.moni.moniEndDate' />";//结束时间
	var t5="<spring:message code='lable.moni.moniInstruction' />";//说明
	var tt="<spring:message code='lable.moni.moniInstruction' />";//说明
	var t10="<spring:message code='lable.moni.moniInstruction' />";//说明
	
	var addActivityBtn="<spring:message code='lable.Activity.addContact' />";//新增销售活动
	var updateCustome="<spring:message code='lable.Activity.updateCustome' />";//修改客户

    var deleteCustomBtn="<spring:message code='lable.customManage.delete' />";//删除客户
    var addLinkerBtn="<spring:message code='lable.linker.add' />";//新增联系人
    var deleteLinkerBtn="<spring:message code='lable.linker.delete' />";//删除联系人
	var deleteCustomerConfirmMsg="<spring:message code='message.custommanage.sureDeleteCustomer' />";//确定删除该用户吗
	var deleteLinkerConfirmMsg="<spring:message code='message.custommanage.sureDeletelinker' />";//确定删除该联系人吗
	var gridCustomer = new Datatable();//用户管理Datatable
	var gridLinker = new Datatable();//联系人Datatable
	var hasEditCustomAuth =isUserHasAuth("R004_01_OPERATION_EDITJK");//新增/编辑项目监控
	var hasDeleteCustomAuth = isUserHasAuth("R002_01_OPERATION_DELC");//删除客户权限
	var hasEditLinkerAuth = isUserHasAuth("R002_01_OPERATION_EDITP");//新增/编辑联系人权限
	var hasDeleteLinkerAuth =isUserHasAuth("R002_01_OPERATION_DELP");//删除联系人权限
	
	function replaceImage(e){
		if(e.id=="shou"){
			 $(e).attr('id',"fang");
			 $(e).css({"background-image":"url(/PMS/assets/global/img/portlet-collapse-icon.png)"});
			 $("#tab1").slideDown("fast");
		}else if(e.id="fang"){
			 $(e).attr('id',"shou");
			 $(e).css({"background-image":"url(/PMS/assets/global/img/portlet-expand-icon.png)"});
			 $("#tab1").slideUp("fast"); 
		}
	}
	
	function contact(){
		$("#tab-1").hide();
		$("#kehu").hide(); 
		$("#cont").show(); 
		$("#contactCustome").val(1);//联系人主表
		$("#customeContact").val(0);//客户非主表
	}
	function custome(){ 
		$("#tab-1").show(); 
		$("#kehu").show(); 
		$("#cont").hide(); 
		$("#contactCustome").val(0);//联系人非主表
		$("#customeContact").val(1);//客户主表
	}
	
	var customColumn = { 
		customShortName : "<spring:message code='lable.customManage.shortName' />", 
		taxpayerName : "<spring:message code='lable.customManage.taxpayerName' />",
		customName : "<spring:message code='lable.customManage.companyName' />",
		taxpayerNumber : "<spring:message code='lable.customManage.taxpayerNumber' />",
		customAddress : "<spring:message code='lable.customManage.address' />",
		taxpayerAddress : "<spring:message code='lable.customManage.taxpayerAddress' />",
		customCode : "<spring:message code='lable.customManage.shortCode' />",
		taxpayerPhone : "<spring:message code='lable.customManage.taxpayerPhone' />",
		contactPhone : "<spring:message code='lable.customManage.phone' />",
		taxpayerBank : "<spring:message code='lable.customManage.taxpayerBank' />",
		email : "<spring:message code='lable.customManage.email' />",
		taxpayerAccount : "<spring:message code='lable.customManage.taxpayerAccount' />",
		remark : "<spring:message code='lable.customManage.remark' />"
	};
	
	var linkerOldVal=$("#linkerEditFormId").serializeFormJson();
	var linkerField = { 
		contactName:"<spring:message code='lable.linker.name' />",
		mobilePhone:"<spring:message code='lable.linker.mobilephone' />",
		positionDescribe:"<spring:message code='lable.linker.jobDesc' />",
		fixedPhone:"<spring:message code='lable.linker.telephone' />",
		email:"<spring:message code='lable.linker.mailbox' />",
		qqCard:"<spring:message code='lable.linker.qqNo' />",
		remark:"<spring:message code='lable.customManage.remark' />"
	};
</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/projectManage/projectApprovalManager/projectApprovalDetail.js"></script>