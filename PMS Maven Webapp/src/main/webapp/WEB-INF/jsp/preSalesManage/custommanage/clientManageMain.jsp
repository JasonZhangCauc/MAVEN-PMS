<!-- 客户管理 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %> 
<div class="row">
    <div class="col-md-8">
        <div class="portlet light portlet-fit portlet-datatable bordered">
            <div class="portlet-title">
            	<div class="caption">
	                 <i class="fa fa-filter font-red"></i>
	                 <span class="caption-subject font-red sbold uppercase"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">维护信息</font></font></span>
	             </div>
	             <div class="actions">
	                  <auth:auth resourceCode="R002_01_OPERATION_EDIT">	 
                         	<div class="btn-group btn-group-devided" data-toggle="buttons">
	                          	<a href="<%=request.getContextPath()%>/preSalesManage/customManageEdit?operate=add" data-target="#newCustomModalIdss" 
									data-toggle="modal" class="btn green-haze btn-outline btn-circle btn-sm"> 新增客户 
								</a>
							</div>
					  </auth:auth>
                      <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
	             </div>
            </div>
            <div class="portlet-title">
                <div class="portlet-title tabbable-line">
                     <div class="portlet-body form collapse">
				         <form class="form-horizontal nice-validator n-default" id="customMianFormId" method="post">
				         	<input type="hidden" name="customeContact" value="1" id="customeContact" class="form-control form-filter spinner" /> 
				         	<input type="hidden" name="contactCustome" value="0" id="contactCustome" class="form-control form-filter spinner" /> 
					         <div class="form-body">
						         <div class="form-group">
						         	<input type="hidden" name="customeContact" value="1" id="customeContact"/>
				         			<input type="hidden" name="contactCustome" value="0" id="contactCustome"/>
					            </div>
					         </div>
				         </form>  
			         </div>
                     <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-1" data-toggle="tab" onclick="custome();"> 客户 </a>
                        </li>
                        <li>
                            <a href="#tab-2" data-toggle="tab" onclick="contact()"> 联系人 </a>
                        </li>
                    </ul>
                </div>
            </div>
            
            <div class="portlet-body" style="height: 550px;">
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-1" style="display: block;"> 
                        <div class="mt-actions">
                            <div class="mt-action">
                                <table class="table table-striped table-bordered table-hover" id="customMianTableId"></table>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-2">
                        <!-- BEGIN:Completed-->
                        <div class="table-container">
		                    <table class="table table-striped table-bordered table-hover" id="linkerMianTableIds"></table>
		                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
         <div class="portlet light portlet-fit bordered">
              <div class="portlet-title">
                  <div class="caption font-green-haze">
                      <i class="icon-settings font-green-haze"></i>
                      <span class="caption-subject bold uppercase"> 信息查看</span>
                  </div>
                  <div class="actions">
                      <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
                  </div>
              </div>
              <div class="portlet-body form">
                  <form role="form" class="form-horizontal">
                      <div class="form-body" id="kehu">
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.shortName' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly id="customShortName" placeholder="<spring:message code='lable.customManage.shortName' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.companyName' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly id="customName" placeholder="<spring:message code='lable.customManage.companyName' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.second' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly id="second" placeholder="<spring:message code='lable.customManage.second' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.shortCode' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly id="customCode" placeholder="<spring:message code='lable.customManage.shortCode' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.address' /></label>
                              <div class="col-md-8">
                                  <textarea class="form-control" readonly rows="3" id="customAddress" placeholder="<spring:message code='lable.customManage.address' />"></textarea>
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.taxpayerName' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" disabled id="taxpayerName" placeholder="<spring:message code='lable.customManage.taxpayerName' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.taxpayerNumber' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly value="" id="taxpayerNumber" placeholder="<spring:message code='lable.customManage.taxpayerNumber' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.taxpayerPhone' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly value="" id="taxpayerPhone" placeholder="<spring:message code='lable.customManage.taxpayerPhone' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.taxpayerAddress' /></label>
                              <div class="col-md-8">
                                  <textarea class="form-control" readonly rows="3" id="taxpayerAddress" placeholder="<spring:message code='lable.customManage.taxpayerAddress' />"></textarea>
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.phone' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly id="contactPhone" placeholder="<spring:message code='lable.customManage.phone' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.taxpayerBank' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly value="" id="taxpayerBank" placeholder="<spring:message code='lable.customManage.taxpayerBank' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.email' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly value="" id="email" placeholder="<spring:message code='lable.customManage.email' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.taxpayerAccount' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly value="" id="taxpayerAccount" placeholder="<spring:message code='lable.customManage.taxpayerAccount' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.remark' /></label>
                              <div class="col-md-8">
                             	  <textarea class="form-control" readonly rows="3" id="remark" placeholder="<spring:message code='lable.customManage.remark' />"></textarea>
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          
                      </div>
                      
                      <div class="form-body" id="cont" style="display: none">
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.linker.name' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly id="contactName" placeholder="<spring:message code='lable.linker.name' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.linker.mobilephone' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly id="mobilePhone" placeholder="<spring:message code='lable.linker.mobilephone' />">
                                  <div class="form-control-focus"> </div>
                                  <span class="help-block">Some help goes here...</span>
                              </div>
                          </div>
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.linker.jobDesc' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly id="positionDescribe" placeholder="<spring:message code='lable.linker.jobDesc' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.linker.telephone' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly id="fixedPhone" placeholder="<spring:message code='lable.linker.telephone' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.linker.mailbox' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly id="emailLink" placeholder="<spring:message code='lable.linker.mailbox' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.linker.qqNo' /></label>
                              <div class="col-md-8">
                                  <input type="text" class="form-control" readonly id="qqCard" placeholder="<spring:message code='lable.linker.qqNo' />">
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                          
                          <div class="form-group form-md-line-input has-success">
                              <label class="col-md-4 control-label" for="form_control_1"><spring:message code='lable.customManage.remark' /></label>
                              <div class="col-md-8">
                                  <textarea class="form-control" readonly rows="3" id="remarkLink" placeholder="<spring:message code='lable.customManage.remark' />"></textarea>
                                  <div class="form-control-focus"> </div>
                              </div>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
				<div class="portlet light portlet-fit bordered" style="display: none" id="cont">
				     <div class="portlet-title">
			             <div class="caption">
			                 <i class="fa fa-info-circle font-red"></i>
			                 <span class="caption-subject font-red sbold uppercase">
				                 <font style="vertical-align: inherit;">
			                 		<spring:message code='信息查看' />
			                 	</font>
			                 </span>
			             </div>
			             <div class="tools">
			                 <a href="javascript:;" class="collapse"> </a>
			                 <a href="javascript:;" class="reload"> </a>
			             </div>
			         </div>
			         <div class="portlet-body form">
						<form class="form-horizontal  form-bordered" id="linkerEditFormId" autocomplete="off" 
					    data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
							<%-- <input type="hidden" value="${vo.id}" name="id" id="idContact"/>
							<input type="hidden" value="${vo.customerId}" name="customerId" id="customerId"/> --%>
					    	<input type="hidden" value="" name="changeDetails" id="changeDetails" />
							
							<div class="form-body">
								<div class="form-group">
									<!-- 联系人姓名 -->
									<label class="control-label col-md-4"> 
										<spring:message code='lable.linker.name' /> 
									</label>
									<div class="col-md-8">
										    <span id="contactName"></span>
									</div>
									
								</div>
								
								
								<div class="form-group">
									<!-- 移动电话 -->
									<label class="control-label col-md-4"> 
										<spring:message code='lable.linker.mobilephone' /> 
									</label>
									<div class="col-md-8">
										    <span id="mobilePhone"></span>
									</div>
								</div>
								
								<div class="form-group">
									<!-- 职务描述 -->
									<label class="control-label col-md-4"> 
										<spring:message code='lable.linker.jobDesc' /> 
									</label>
									<div class="col-md-8">
										    <span id="positionDescribe"></span>
									</div>
								</div>
								
								<div class="form-group">
									<!-- 固定电话 -->
									<label class="control-label col-md-4"> 
										<spring:message code='lable.linker.telephone' /> 
									</label>
									<div class="col-md-8">
										    <span id="fixedPhone"></span>
									</div>
								</div>
								
								<div class="form-group">
									<!-- 邮箱 -->
									<label class="control-label col-md-4"> 
										<spring:message code='lable.linker.mailbox' /> 
									</label>
									<div class="col-md-8">
										    <span id="email"></span>
									</div>
									
								</div>
								
								<div  class="form-group">
									<!-- QQ号 -->
									<label class="control-label col-md-4"> 
										<spring:message code='lable.linker.qqNo' /> 
									</label>
									<div class="col-md-8">
										    <span id="qqCard"></span>
									</div>
								</div>
								
								<div class="form-group">
									<!-- 备注 -->
									<label class="control-label col-md-4"> 
										<spring:message code='lable.customManage.remark' /> 
									</label>
									<div class="col-md-8">
										    <span id="remark"></span>
									</div>
								</div>
								
								<%-- <div class="form-actions">
									<div class="modal-footer">
										<div class="col-md-offset-2 col-md-9">
										<button type="button" class="btn blue" id="saveLinkerBtnId">
											<i class="fa fa-check"></i>
											<spring:message code='btn.common.save' />
										</button>
										</div>
									</div>
								</div> --%>
								
							</div>
						</form>
					</div>
			</div>
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


<script type="text/javascript">
	var objectVal=$("#CustomEditFormId").serializeFormJson();
	var t1="<spring:message code='lable.customManage.shortName' />";//客户简称
	var t2="<spring:message code='lable.customManage.companyName' />";//公司全称
	var t3="<spring:message code='lable.customManage.address' />";//所在地址
	var t4="<spring:message code='lable.customManage.phone' />";//联系电话
	var t5="<spring:message code='lable.customManage.email' />";//邮箱
	var t6="<spring:message code='lable.customManage.remark' />";//备注
	var t7="<spring:message code='common.label.operate' />";//操作
	var tt = "<spring:message code='lable.customManage.info' />";//职务描述
	var tl = "<spring:message code='label.dailyReportManager.customLog' />";//公司log
	
	var t8="<spring:message code='lable.linker.name' />";//联系人姓名
	var t9="<spring:message code='lable.linker.jobDesc' />";//职务描述
	var t10="<spring:message code='lable.linker.mobilephone' />";//移动电话
	var t11="<spring:message code='lable.linker.telephone' />";//固定电话
	var t12="<spring:message code='lable.linker.mailbox' />";//邮箱
	var t13="<spring:message code='lable.linker.qqNo' />";//QQ号
	var t14="<spring:message code='lable.customManage.remark' />";//备注
	var t15="<spring:message code='common.label.operate' />";//操作
	var t16="<spring:message code='lable.customManage.second' />";//二字码
	var addActivityBtn="<spring:message code='lable.Activity.addContact' />";//新增销售活动
	var updateCustome="<spring:message code='lable.Activity.updateCustome' />";//修改客户

    var deleteCustomBtn="<spring:message code='lable.customManage.delete' />";//删除客户
    var addLinkerBtn="<spring:message code='lable.linker.add' />";//新增联系人
    var deleteLinkerBtn="<spring:message code='lable.linker.delete' />";//删除联系人
	var deleteCustomerConfirmMsg="<spring:message code='message.custommanage.sureDeleteCustomer' />";//确定删除该用户吗
	var deleteLinkerConfirmMsg="<spring:message code='message.custommanage.sureDeletelinker' />";//确定删除该联系人吗
	var gridCustomer = new Datatable();//用户管理Datatable
	var gridLinker = new Datatable();//联系人Datatable
	var hasEditCustomAuth =isUserHasAuth("R002_01_OPERATION_EDIT");//新增/编辑客户权限
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

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/preSalesManage/custommanage/clientManageMain.js"></script>