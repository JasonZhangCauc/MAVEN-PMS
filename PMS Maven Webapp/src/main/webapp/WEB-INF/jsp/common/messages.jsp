<%-- jsp头部引用文件-公共使用 --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="com.GlobalConstants"%>
<%@ page import="com.ps.result.systemmanage.UserVo"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	UserVo loginUser = (UserVo) request.getSession().getAttribute("user");
%>
<script type="text/javascript">
  //公共变量初始化
  var commonOk = "<spring:message code='btn.common.ok'/>";			 		 //确定
  var commonCancel = "<spring:message code='btn.common.cancel'/>";			 //取消
  var commonSaveBtn = "<spring:message code='btn.common.save'/>";             //保存
  var commonCloseBtn = "<spring:message code='btn.common.close'/>";           //关闭
  var commonRestBtn = "<spring:message code='btn.common.rest'/>";             //重置
  var commonRemindInfo = "<spring:message code='common.label.remindInfo'/>";  //提示信息
  var commonRemindError = "<spring:message code='common.label.remindError'/>";//警告信息
  var commonSuccessMsg = "<spring:message code='message.operatesuccess'/>";   //操作成功
  var commonFailMsg = "<spring:message code='message.operatefail'/>";         //操作失败
  var commonRequiredMsg = "<spring:message code='message.valid.required' />"; //您有必填项未填！
  var commonValid="<spring:message code='common.label.valid' />";       //有效
  var commonInvalid="<spring:message code='common.label.invalid' />";   //无效
  var commonDisable="<spring:message code='label.sysmanage.disable' />";//停用
  var commonEnable="<spring:message code='label.sysmanage.enable' />";  //启用
  var commonDownload="<spring:message code='btn.common.download' />";  //下载
  var commonYes="<spring:message code='common.label.yes' />";  //是
  var commonNo="<spring:message code='common.label.no' />";  //否
  var commonStatus="<spring:message code='label.sysmanage.status' />";  //状态
  var commonDisablesuccess="<spring:message code='label.sysmanage.disablesuccess' />";      //停用成功
  var commonEnablesuccess="<spring:message code='label.sysmanage.enablesuccess' />";        //激活成功
  var commonRemark="<spring:message code='label.remark' />";                                //备注
  var commonConfirmTodelete="<spring:message code='message.confirmdeletemsg' />";           //你确定要删除这条记录吗？
  var commonQueryResult = "<spring:message code='label.queryresult'/>"; //查询结果
  var commonAddBtn = "<spring:message code='btn.common.add'/>";      	//新增
  var commonEditBtn="<spring:message code='btn.common.edit' />";     	//编辑
  var commonViewBtn="<spring:message code='btn.common.view' />";     	//查看
  var commonDelBtn = "<spring:message code='btn.common.delete'/>";   	//删除
  var commonSubmitBtn = "<spring:message code='btn.common.submit'/>";   		//提交
  var commonDealBtn = "<spring:message code='btn.todoTask.dealWith'/>"; //处理
  var commonOperate="<spring:message code='common.label.operate' />";	//操作
  var commonExport="<spring:message code='btn.common.export' />";		//导出
  var commonImport="<spring:message code='btn.common.import' />";		//导入
  var commonPrintBtn="<spring:message code='btn.common.print' />";		//打印
  var commonSend = "<spring:message code='btn.common.send' />";			//发送
   var commonPassBtn = "<spring:message code='btn.common.pass' />";	  //通过
  var commonRejectBtn = "<spring:message code='btn.common.reject' />";	//回退
  var commonEndBtn = "<spring:message code='btn.common.end' />";	 	//归档
  var commonSelect = "<spring:message code='btn.common.select' />";	 	//选择
  var commonConfirmBtn = "<spring:message code='btn.common.confirm' />";//确认
  var commonDatalogBtn = "<spring:message code='btn.common.datalog' />";//数据日志
  var commonWrongOperationBtn = "<spring:message code='btn.common.wrongOperation' />";//取消
  var commonIConfirmBtn = "<spring:message code='btn.common.IConfirm' />";//确认
  var commonRelativeReportBtn = "<spring:message code='btn.common.relativeReport' />";	 	//关联报告
  var commRelativeEventBtn = "<spring:message code='btn.common.relativeEvent' />";			//关联事件
  var commonProcessLog="<spring:message code='btn.common.processLog' />";					//流程日志
  var commonProcessChart = "<spring:message code='btn.common.processChart' />";	
  var commonDataNodata="<spring:message code='label.datatable.noentries' />"; //没有数据
  var commonDatadi="<spring:message code='label.datatable.di' />"; //第
  var commonDatatiaoto="<spring:message code='label.datatable.tiaoto' />"; //条至
  var commonDatatiao="<spring:message code='label.datatable.tiao' />"; //条
  var commonDatatotal="<spring:message code='label.datatable.total' />"; //共
  var commonDatatiaoshuju="<spring:message code='label.datatable.tiaoshuju' />"; //条数据
  var commonNumber="<spring:message code='label.number' />"; //序号
  var commonCreateBy="<spring:message code='common.laber.createBy' />"; //录入人
  var commonCreateDate="<spring:message code='common.laber.createDate' />"; //录入日期
  var pleaseselect="<spring:message code='message.pleaseselect' />"; //请选择
  var commonPageLength = 10;
  var commonMaxPageLength = 10000;
  var codeBasicInfo; //基础数据维护信息
  var deptJson; //部门信息
  var userBasicInfo; //用户数据
  var customerBasicInfo; //客户数据
  var initUserInfoSale;//销售人员信息
  var businessPeople;//商务人员信息
  var projectPeople;//项目负责人
  var responsibleSecondary;//次要责任人
  var productManager;//产品经理
  //提示语初始化
  var datorInputError="<spring:message code='common.message.inputError'/>";
  var datorDigitsWarn = "<spring:message code='common.message.digitsWarn'/>";
  var datorLettersWarn = "<spring:message code='common.message.lettersWarn'/>";
  var datorDateWarn = "<spring:message code='common.message.dateWarn'/>";
  var datorTimeWarn = "<spring:message code='common.message.timeWarn'/>";
  var datorEmailWarn = "<spring:message code='common.message.emailWarn'/>";
  var datorUrlWarn = "<spring:message code='common.message.urlWarn'/>";
  var datorQqWarn = "<spring:message code='common.message.qqWarn'/>";
  var datorIdentityCardWarn="<spring:message code='common.message.identityCardWarn'/>";
  var datorTelWarn="<spring:message code='common.message.telWarn'/>";
  var datorMobileWarn="<spring:message code='common.message.mobileWarn' />";
  var datorContactWarn="<spring:message code='common.message.contactWarn' />";
  var datorZipcodeWarn="<spring:message code='common.message.zipcodeWarn' />";
  var datorChineseWarn = "<spring:message code='common.message.chineseWarn'/>";
  var datorUsernameWarn = "<spring:message code='common.message.usernameWarn'/>";
  var datorPasswordWarn = "<spring:message code='common.message.passwordWarn'/>";
  var datorMoneyWarn = "<spring:message code='common.message.moneyWarn'/>";
  var datorMoneyfourWarn = "<spring:message code='common.message.moneyfourWarn'/>";
  var datorIpWarn = "<spring:message code='common.message.ipWarn'/>";
  var datorEnnumWarn = "<spring:message code='common.message.ennumWarn'/>";
  var datorAddcutWarn="<spring:message code='common.message.addcutWarn'/>";
  var datorIllegalCharWarn="<spring:message code='common.message.illegalCharWarn'/>";
  var datorGradeWarn = "<spring:message code='common.message.gradeWarn'/>";
  var datorStaureWarn = "<spring:message code='common.message.statureWarn'/>";
  var datorWeightWarn = "<spring:message code='common.message.weightWarn'/>";
  var datorWarningRuleLimitDays = "<spring:message code='common.message.warningRuleLimitDays'/>";
  var datorFilterSpecialCharWarn = "<spring:message code='common.message.filterSpecialCharWarn'/>";
  var chooseFileFirstWarn = "<spring:message code='message.userManagement.chooseFileFirst'/>";
  var uploadFileDelMsg = "<spring:message code='message.uploadfile.del'/>";//确定要删除该附件吗?
  var noRecordWarn = "<spring:message code='common.message.noRecord'/>";					//该记录不存在！
  var systemErrorWarn = "<spring:message code='common.message.systemError'/>";				//系统异常！
  var wrongStatusWarn = "<spring:message code='common.message.wrongStatus'/>";		//该记录状态不对，请刷新数据后重新操作！
  var positiveNumWarn = "<spring:message code='common.message.positiveNumWarn'/>";		//请填写正数！
  var importantOperatingWarn = "<spring:message code='common.message.importantOperating'/>";		//重要操作,请谨慎！
  var basePath = '<%=path%>';
  var chickinBy = '<%=loginUser.getId()%>';
</script>