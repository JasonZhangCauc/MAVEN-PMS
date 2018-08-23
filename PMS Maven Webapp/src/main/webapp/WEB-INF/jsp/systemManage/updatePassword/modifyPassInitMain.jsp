<!-- 修改密码 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<%@ page import="com.util.coder.RSAUtils,com.ps.result.common.RSAkeyVo"%>
<%
	RSAkeyVo rsavo=RSAUtils.getPublicKey();
%>
<script type="text/javascript">
	var message="<spring:message code='message.operatesuccess' />";//保存成功
	var message1="<spring:message code='label.peoplemanage.newpasswordandconfirmationpasswordareinconsistent' />";//新密码与确认密码不一致
	var message2="<spring:message code='label.peoplemanage.oidpassworderror' />";//原密码有误
	var message3="<spring:message code='label.systemmanagement.passworsdnotpattern' />";//密码不匹配
    var message4="<spring:message code='label.peoplemanage.oldpasswordempty' />";//原密码不能为空
    var message5="<spring:message code='label.peoplemanage.newpasswordenpty' />";//新密码不能为空
    var message6="<spring:message code='label.peoplemanage.confirmpasswordempty' />";//确认密码不能为空
    var message7="<spring:message code='label.peoplemanage.oldpasswordisequalnewpassword' />";//新密码与原密码不能相同
</script>
<script type="text/javascript">
    var keys;
	$(function(){
		var modulus='<%=rsavo.getModules()%>';
		var exponent= '<%=rsavo.getExponent()%>';
		keys = RSAUtils.getKeyPair(exponent, '', modulus);
			
		//保存
		$("#passWordModalId #savePassId").click(function(){
			$("#passMianFormId").submit();
		});
		
		$("#closeUpdatePassword").click(function(){
			window.location=basePath+"/common/welcome";
		});
		 
		$("#passMianFormId").on('valid.form', function(){
				$("#passWordModalId #savePassId").attr("disabled",true);
			    var oldPassword=$("#passMianFormId #oldPassword0").val();
			    var pwd=$("#passMianFormId #newPassword0").val();
	            var confirmpwd=$("#passMianFormId #confirmPass0").val();
	             
	            if(oldPassword ==''){
	                bootbox.alert(message4);
	                 $("#passWordModalId #savePassId").attr("disabled",false);
	                return;
	            }
	            if(pwd ==''){
	                bootbox.alert(message5);
	                 $("#passWordModalId #savePassId").attr("disabled",false);
	                return;
	            }
	            if(confirmpwd ==''){
	                bootbox.alert(message6);
	                 $("#passWordModalId #savePassId").attr("disabled",false);
	                return;
	            }
	            
	            if(oldPassword !=''){
	               $("#passMianFormId #oldPassword").val(RSAUtils.encryptedString(keys,oldPassword));
	            }
			    if(pwd!=''){
			       $("#passMianFormId #newPassword").val(RSAUtils.encryptedString(keys,pwd));
			    }
			    if(confirmpwd!=''){
			       $("#passMianFormId #confirmPass").val(RSAUtils.encryptedString(keys,confirmpwd)); 
			    }
			
				$.ajax({
					url: basePath+'/systemManage/updatePassword',
					type: 'POST',
					dataType: 'json',
					data: $("#passMianFormId").serialize()
				})
				.done(function(data) {
				    $("#passWordModalId #savePassId").attr("disabled",false);
					if(data=="ok"){
						bootbox.alert(message);
						window.setTimeout(function() {
						    window.location.href=basePath+"/common/logout";
						}, 1000);
					}else if(data=="error"){
						bootbox.alert(message1);
					}else if(data=="fail"){
						bootbox.alert(message2);
					}else if(data=="notmatch"){
						bootbox.alert(message3);
					}else if(data=="same"){
						bootbox.alert(message7);
					}
				})
				.fail(function(data) {
				    $("#passWordModalId #savePassId").attr("disabled",false);
					showError(data.responseText);
				})
				.always(function() {
				});
		});
		$("input").maxlength({
            alwaysShow: true,
            warningClass: "label label-success",
            limitReachedClass: "label label-danger",
            separator: " / ",
            placement: 'top-right'
        });
   })
</script>
<div class="row">
   <div class="col-md-12">
       <!-- BEGIN PORTLET-->
       <div class="portlet light form-fit ">
           <div class="portlet-title">
               <div class="actions">
                   <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                       <i class="icon-cloud-upload"></i>
                   </a>
                   <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                       <i class="icon-wrench"></i>
                   </a>
                   <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                       <i class="icon-trash"></i>
                   </a>
               </div>
           </div>
           <div class="portlet-body form">
               <form class="form-horizontal form-bordered" id="passMianFormId" autocomplete="off"
				data-validator-option="{theme:'yellow_right_effect',focusCleanup:true}">
                   <div class="form-group">
                       <label class="col-sm-3 control-label"><spring:message code='label.peoplemanage.oidpassword' />：</label>
                       <div class="col-sm-5">
                           <div class="input-group">
                               <span class="input-group-addon">
                                   <i class="fa fa-user"></i>
                               </span>
                               <input id="oldPassword0" 
                                    maxlength="20" 
									autocomplete="off"
									data-msg-required="<spring:message code='label.peoplemanage.pleaseenteroidpassword' />"
									data-rule="required;oldPassword0;"
									type="password" 
									class="form-control" 
									placeholder="<spring:message code='label.peoplemanage.pleaseenteroidpassword' />"/>
							   <input id="oldPassword" name="oldPassword" type="hidden" class="form-control" placeholder="<spring:message code='label.peoplemanage.pleaseenteroidpassword' />"/>
                           </div>
                       </div>
                   </div>
                   <div class="form-group">
                       <label class="col-sm-3 control-label"><spring:message code='label.peoplemanage.newpassword' />：</label>
                       <div class="col-sm-5">
                           <div class="input-group">
                               <span class="input-group-addon">
                                   <i class="fa fa-search"></i>
                               </span>
                               <input id="newPassword0"
                                    maxlength="20" 
								    data-rule="<spring:message code='label.peoplemanage.newpassword' />: required;newPassword0;" 
								    data-msg-required="<spring:message code='label.peoplemanage.pleaseenternewpassword' />"
								    data-rule-newPassword0="[/^(?![0-9]+$)(?![A-Za-z]+$)(?![^A-Za-z0-9]+$)([^\f\n\r\t\v\s]){6,20}$/,'<spring:message code='label.systemmanagement.newpassworsdreeor' />']"
								    type="password" 
								    class="form-control" 
								    placeholder="<spring:message code='label.systemmanagement.newpassworsdreeor' />"/>
							   <input id="newPassword" name="newPassword" type="hidden" class="form-control" placeholder="<spring:message code='label.peoplemanage.pleaseenternewpassword' />"/>
                           </div>
                       </div>
                   </div>
                   <div class="form-group">
                       <label class="col-sm-3 control-label"><spring:message code='label.peoplemanage.confirmpassword' />：</label>
                       <div class="col-sm-5">
                           <div class="input-group">
                               <span class="input-group-addon">
                                   <i class="fa fa-cogs"></i>
                               </span>
                               <input id="confirmPass0"
                                    maxlength="20" 
									data-msg-required="<spring:message code='label.peoplemanage.pleaseenterconfirmpassword' />"
									data-rule="<spring:message code='label.peoplemanage.confirmpassword' />: required;confirmPass0;match(newPassword0)" 
									type="password" 
									class="form-control"
									placeholder="<spring:message code='label.systemmanagement.newpassworsdreeor' />"/>
									<input id="confirmPass" name="confirmPass" type="hidden" class="form-control" placeholder="<spring:message code='label.peoplemanage.pleaseenterconfirmpassword' />"/>
                           </div>
                       </div>
                   </div>
                   <div class="form-actions">
                      <div class="row">
                          <div class="col-md-offset-3 col-md-9">
                                <label class="control-label">
									<span class="required"><!--注 -->
									<spring:message code='label.record' />
									<spring:message code='label.systemmanagement.newpassworsdreeor' />
									</span>
								</label>
                          </div>
                      </div>
                  </div>
               </form>
           </div>
       </div>
       <!-- END PORTLET-->
    </div>
</div>
<div class="modal-footer" style="text-align:center" id="passWordModalId">
    <div class="row" >
	    <div class="col-md-offset-2 col-md-4">
		    <button type="button" class="btn green" id="savePassId">
				<i class="fa fa-check"></i>
				<spring:message code='btn.common.save' />
			</button>
			<button type="button" data-dismiss="modal" class="btn btn-outline grey-salsa" id="closeUpdatePassword">
				<spring:message code='btn.common.cancel' />
			</button>
	    </div>
    </div>
</div>