package com.ps.result.taskmanage;


import com.ps.result.common.PageParaVo;

/**
 * 项目基本信息
 * 018234
 * 2018-08-27
 */
public class OverseeVo extends PageParaVo<OverseeVo>{
	
	private String id;					//id
	
	private String initiateBy;			//发起人
	
	private String initiateByName;		//发起人中文
		
	private String numberDate;			//发起时间
	
	private String responsibleMain;		//主要责任人
	
	private String responsibleMainmh;		//责任人模糊查询
	
	private String responsibleMainName;		//主要责任人中文
	
	private String responsibleSecondary;//次要负责人
	
	private String responsibleSecondaryName;//次要负责人中文
	
	private String responsibilityDepartment;	//责任部门
	
	private String taskSource;					//任务来源
	
	private String relevanceProject;			//项目
	
	private String relevanceProjectName;			//项目
	
	private String priority;					//优先级
	
	private String priorityName;					//优先级
	
	private String taskDefinition;				//任务内容
	
	private String requiredDate;				//要求完成时间
	
	private String requiredDateOld;				//记录完成时间
	
	private String requiredDateShow;				//要求完成时间显示
	
	private String adjustReason;				//调整原因
	
	private String actualDate;					//实际完成时间
	
	private String whetherDelay;				//是否延期
	
	private String delayDay;					//延期天数
	
	private String whetherAdvance;				//是否提前完成
	
	private String advanceDate;					//提前完成时间
	
	private String conclusion;					//结论
	
	private String performance;					//奖惩绩效
	
	private String delayTime;					//申请延长前截止日期
	
	private String createBy;					//录入人
	
	private String createByName;					//录入人中文
	
	private String createDate;					//录入日期
	
	private String accepter;					//验收人
	
	private String accepterName;					//验收人中文
	
	private String beginTime;					//时间-开始
	
	private String endTime;						//时间-结束
	
	private String status;						//状态:0编辑中，1已提交，2已审核，3已退回
	
	private String statusCode;					//状态中文
	
	private String projectId;					//项目ID
	
	private String adjustPerson;				//是调整人再添加记录
	
	private String responsibleMainId;			//主要责任id


	public String getResponsibleMainId() {
		return responsibleMainId;
	}

	public void setResponsibleMainId(String responsibleMainId) {
		this.responsibleMainId = responsibleMainId;
	}

	public String getAdjustPerson() {
		return adjustPerson;
	}

	public void setAdjustPerson(String adjustPerson) {
		this.adjustPerson = adjustPerson;
	}

	public String getRequiredDateOld() {
		return requiredDateOld;
	}

	public void setRequiredDateOld(String requiredDateOld) {
		this.requiredDateOld = requiredDateOld;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getRequiredDateShow() {
		return requiredDateShow;
	}

	public void setRequiredDateShow(String requiredDateShow) {
		this.requiredDateShow = requiredDateShow;
	}

	public String getResponsibleMainmh() {
		return responsibleMainmh;
	}

	public void setResponsibleMainmh(String responsibleMainmh) {
		this.responsibleMainmh = responsibleMainmh;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPriorityName() {
		return priorityName;
	}

	public void setPriorityName(String priorityName) {
		this.priorityName = priorityName;
	}

	public String getRelevanceProjectName() {
		return relevanceProjectName;
	}

	public void setRelevanceProjectName(String relevanceProjectName) {
		this.relevanceProjectName = relevanceProjectName;
	}

	public String getInitiateByName() {
		return initiateByName;
	}

	public void setInitiateByName(String initiateByName) {
		this.initiateByName = initiateByName;
	}

	public String getResponsibleMainName() {
		return responsibleMainName;
	}

	public void setResponsibleMainName(String responsibleMainName) {
		this.responsibleMainName = responsibleMainName;
	}

	public String getResponsibleSecondaryName() {
		return responsibleSecondaryName;
	}

	public void setResponsibleSecondaryName(String responsibleSecondaryName) {
		this.responsibleSecondaryName = responsibleSecondaryName;
	}

	public String getCreateByName() {
		return createByName;
	}

	public void setCreateByName(String createByName) {
		this.createByName = createByName;
	}

	public String getAccepterName() {
		return accepterName;
	}

	public void setAccepterName(String accepterName) {
		this.accepterName = accepterName;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getAccepter() {
		return accepter;
	}

	public void setAccepter(String accepter) {
		this.accepter = accepter;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getInitiateBy() {
		return initiateBy;
	}

	public void setInitiateBy(String initiateBy) {
		this.initiateBy = initiateBy;
	}

	public String getNumberDate() {
		return numberDate;
	}

	public void setNumberDate(String numberDate) {
		this.numberDate = numberDate;
	}

	public String getResponsibleMain() {
		return responsibleMain;
	}

	public void setResponsibleMain(String responsibleMain) {
		this.responsibleMain = responsibleMain;
	}

	public String getResponsibleSecondary() {
		return responsibleSecondary;
	}

	public void setResponsibleSecondary(String responsibleSecondary) {
		this.responsibleSecondary = responsibleSecondary;
	}

	public String getResponsibilityDepartment() {
		return responsibilityDepartment;
	}

	public void setResponsibilityDepartment(String responsibilityDepartment) {
		this.responsibilityDepartment = responsibilityDepartment;
	}

	public String getTaskSource() {
		return taskSource;
	}

	public void setTaskSource(String taskSource) {
		this.taskSource = taskSource;
	}

	public String getRelevanceProject() {
		return relevanceProject;
	}

	public void setRelevanceProject(String relevanceProject) {
		this.relevanceProject = relevanceProject;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getTaskDefinition() {
		return taskDefinition;
	}

	public void setTaskDefinition(String taskDefinition) {
		this.taskDefinition = taskDefinition;
	}

	public String getRequiredDate() {
		return requiredDate;
	}

	public void setRequiredDate(String requiredDate) {
		this.requiredDate = requiredDate;
	}

	public String getAdjustReason() {
		return adjustReason;
	}

	public void setAdjustReason(String adjustReason) {
		this.adjustReason = adjustReason;
	}

	public String getActualDate() {
		return actualDate;
	}

	public void setActualDate(String actualDate) {
		this.actualDate = actualDate;
	}

	public String getWhetherDelay() {
		return whetherDelay;
	}

	public void setWhetherDelay(String whetherDelay) {
		this.whetherDelay = whetherDelay;
	}

	public String getDelayDay() {
		return delayDay;
	}

	public void setDelayDay(String delayDay) {
		this.delayDay = delayDay;
	}

	public String getWhetherAdvance() {
		return whetherAdvance;
	}

	public void setWhetherAdvance(String whetherAdvance) {
		this.whetherAdvance = whetherAdvance;
	}

	public String getAdvanceDate() {
		return advanceDate;
	}

	public void setAdvanceDate(String advanceDate) {
		this.advanceDate = advanceDate;
	}

	public String getConclusion() {
		return conclusion;
	}

	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}

	public String getPerformance() {
		return performance;
	}

	public void setPerformance(String performance) {
		this.performance = performance;
	}

	public String getDelayTime() {
		return delayTime;
	}

	public void setDelayTime(String delayTime) {
		this.delayTime = delayTime;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

}
