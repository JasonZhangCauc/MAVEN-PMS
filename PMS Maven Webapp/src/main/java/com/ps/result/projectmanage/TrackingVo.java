package com.ps.result.projectmanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 跟踪表VO
 * @author：		ZHOUMIN
 * @date：		2018-08-08 
 */
public class TrackingVo extends PageParaVo<TrackingVo>{

	private String causeClassification;			//原因分类
	private String causeAnalysis;				//原因分析
	private String feedbackDate;				//反馈时间
	private String expectedTime;				//预估工时
	private String cancelDate;					//已取消时间
	private String plannedLineDate;				//计划上线时间
	private String actuallyLineDate;			//实际上线时间
	private String completeDate;				//更新完成时间
	private String actualWorkingHours;			//实际工时
	private String batchNo;						//批次号
	private String customerId;					//客户ID
	private String customerName;				//客户名称
	private String projectId;					//项目ID
	private String projectName;					//项目名称
	private String putDept;						//提出部门
	private String putBy;						//提出人
	private String registerBy;					//登记人
	private String putDate;						//提出日期
	private String putBeginDate;				//提出开始日期
	private String putEndDate;					//提出结束日期
	private String requirementType;				//类型
	private String describe;					//描述
	private String priority;					//优先级
	private String whetherPhaseIi;				//是否二期
	private String expectOnlineDate;			//预计上线时间
	private String whetherScope;				//是否验收范围
	private String whetherContract;				//是否合同
	private String feedbackWay;					//反馈方式
	private String requirementStatus;			//状态
	private String demandNum;					//编号
	
	public String getActuallyLineDate() {
		return actuallyLineDate;
	}
	public void setActuallyLineDate(String actuallyLineDate) {
		this.actuallyLineDate = actuallyLineDate;
	}
	public String getDemandNum() {
		return demandNum;
	}
	public void setDemandNum(String demandNum) {
		this.demandNum = demandNum;
	}
	public String getPutBeginDate() {
		return putBeginDate;
	}
	public void setPutBeginDate(String putBeginDate) {
		this.putBeginDate = putBeginDate;
	}
	public String getPutEndDate() {
		return putEndDate;
	}
	public void setPutEndDate(String putEndDate) {
		this.putEndDate = putEndDate;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getCauseClassification() {
		return causeClassification;
	}
	public void setCauseClassification(String causeClassification) {
		this.causeClassification = causeClassification;
	}
	public String getCauseAnalysis() {
		return causeAnalysis;
	}
	public void setCauseAnalysis(String causeAnalysis) {
		this.causeAnalysis = causeAnalysis;
	}
	public String getFeedbackDate() {
		return feedbackDate;
	}
	public void setFeedbackDate(String feedbackDate) {
		this.feedbackDate = feedbackDate;
	}
	public String getExpectedTime() {
		return expectedTime;
	}
	public void setExpectedTime(String expectedTime) {
		this.expectedTime = expectedTime;
	}
	public String getCancelDate() {
		return cancelDate;
	}
	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}
	public String getPlannedLineDate() {
		return plannedLineDate;
	}
	public void setPlannedLineDate(String plannedLineDate) {
		this.plannedLineDate = plannedLineDate;
	}
	public String getCompleteDate() {
		return completeDate;
	}
	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
	}
	public String getActualWorkingHours() {
		return actualWorkingHours;
	}
	public void setActualWorkingHours(String actualWorkingHours) {
		this.actualWorkingHours = actualWorkingHours;
	}
	public String getBatchNo() {
		return batchNo;
	}
	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getPutDept() {
		return putDept;
	}
	public void setPutDept(String putDept) {
		this.putDept = putDept;
	}
	public String getPutBy() {
		return putBy;
	}
	public void setPutBy(String putBy) {
		this.putBy = putBy;
	}
	public String getRegisterBy() {
		return registerBy;
	}
	public void setRegisterBy(String registerBy) {
		this.registerBy = registerBy;
	}
	public String getPutDate() {
		return putDate;
	}
	public void setPutDate(String putDate) {
		this.putDate = putDate;
	}
	public String getRequirementType() {
		return requirementType;
	}
	public void setRequirementType(String requirementType) {
		this.requirementType = requirementType;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getWhetherPhaseIi() {
		return whetherPhaseIi;
	}
	public void setWhetherPhaseIi(String whetherPhaseIi) {
		this.whetherPhaseIi = whetherPhaseIi;
	}
	public String getExpectOnlineDate() {
		return expectOnlineDate;
	}
	public void setExpectOnlineDate(String expectOnlineDate) {
		this.expectOnlineDate = expectOnlineDate;
	}
	public String getWhetherScope() {
		return whetherScope;
	}
	public void setWhetherScope(String whetherScope) {
		this.whetherScope = whetherScope;
	}
	public String getWhetherContract() {
		return whetherContract;
	}
	public void setWhetherContract(String whetherContract) {
		this.whetherContract = whetherContract;
	}
	public String getFeedbackWay() {
		return feedbackWay;
	}
	public void setFeedbackWay(String feedbackWay) {
		this.feedbackWay = feedbackWay;
	}
	public String getRequirementStatus() {
		return requirementStatus;
	}
	public void setRequirementStatus(String requirementStatus) {
		this.requirementStatus = requirementStatus;
	}
	
}
