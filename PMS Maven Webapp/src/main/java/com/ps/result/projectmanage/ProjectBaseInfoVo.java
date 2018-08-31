package com.ps.result.projectmanage;

import com.ps.result.common.PageParaVo;

/**
 * 项目基本信息
 * wb066
 * 2018-07-02
 */
public class ProjectBaseInfoVo extends PageParaVo<ProjectBaseInfoVo>{
	
	private String projectName;//项目名称
	
	private String toDivision;//所属事业部
	
	private String projectHead;//项目负责人
	
	private String projectHeadName;//项目负责人名称
	
	private String businessPeople;//商务人员
	
	private String businessPeopleName;//商务人员名称
	
	private String projectManager;//项目经理
	
	private String projectManagerName;//项目经理名称
	
	private String projectResource;//项目资源
	
	private String projectResourceName;//项目经理名称
	
	private String productManager;//产品经理
	
	private String productManagerName;//产品经理名称
	
	private String beginTime;//工期-开始
	
	private String endTime;//工期-结束
	
	private String workTime;//工期
	
	private String estimatedWorkload;//预估工作量
	
	private String expiredHours;//已耗工时
	
	private String contractAmount;//合同金额
	
	private String profitTargets;//利润指标
	
	private String projectPhase;//项目阶段
	
	private String naturallyCost;//人天成本
	
	private String projectStatus;//项目状态
	
	private String expirationDate;//超期时间
	
	private String auditStatus;//审核状态
	
	private String toDivisionName; //所属部门名称
	
	private String projectPhaseStr;//项目中文
	
	private String belongCustomId;		//意向客户
	
	private String saleResponsible;		//销售客户
	
	private String belongProduct;		//所属产品

	public String getBelongProduct() {
		return belongProduct;
	}

	public void setBelongProduct(String belongProduct) {
		this.belongProduct = belongProduct;
	}

	public String getBelongCustomId() {
		return belongCustomId;
	}

	public void setBelongCustomId(String belongCustomId) {
		this.belongCustomId = belongCustomId;
	}

	public String getSaleResponsible() {
		return saleResponsible;
	}

	public void setSaleResponsible(String saleResponsible) {
		this.saleResponsible = saleResponsible;
	}

	public String getToDivisionName() {
		return toDivisionName;
	}

	public String getProjectPhaseStr() {
		return projectPhaseStr;
	}

	public void setProjectPhaseStr(String projectPhaseStr) {
		this.projectPhaseStr = projectPhaseStr;
	}

	public void setToDivisionName(String toDivisionName) {
		this.toDivisionName = toDivisionName;
	}

	public String getAuditStatus() {
		return auditStatus;
	}

	public void setAuditStatus(String auditStatus) {
		this.auditStatus = auditStatus;
	}

	public String getProductManager() {
		return productManager;
	}

	public void setProductManager(String productManager) {
		this.productManager = productManager;
	}

	public String getProductManagerName() {
		return productManagerName;
	}

	public void setProductManagerName(String productManagerName) {
		this.productManagerName = productManagerName;
	}

	public String getProjectHeadName() {
		return projectHeadName;
	}

	public void setProjectHeadName(String projectHeadName) {
		this.projectHeadName = projectHeadName;
	}

	public String getBusinessPeopleName() {
		return businessPeopleName;
	}

	public void setBusinessPeopleName(String businessPeopleName) {
		this.businessPeopleName = businessPeopleName;
	}

	public String getProjectManagerName() {
		return projectManagerName;
	}

	public void setProjectManagerName(String projectManagerName) {
		this.projectManagerName = projectManagerName;
	}

	public String getProjectResourceName() {
		return projectResourceName;
	}

	public void setProjectResourceName(String projectResourceName) {
		this.projectResourceName = projectResourceName;
	}

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getToDivision() {
		return toDivision;
	}

	public void setToDivision(String toDivision) {
		this.toDivision = toDivision;
	}

	public String getProjectHead() {
		return projectHead;
	}

	public void setProjectHead(String projectHead) {
		this.projectHead = projectHead;
	}

	public String getBusinessPeople() {
		return businessPeople;
	}

	public void setBusinessPeople(String businessPeople) {
		this.businessPeople = businessPeople;
	}

	public String getProjectManager() {
		return projectManager;
	}

	public void setProjectManager(String projectManager) {
		this.projectManager = projectManager;
	}

	public String getProjectResource() {
		return projectResource;
	}

	public void setProjectResource(String projectResource) {
		this.projectResource = projectResource;
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

	public String getEstimatedWorkload() {
		return estimatedWorkload;
	}

	public void setEstimatedWorkload(String estimatedWorkload) {
		this.estimatedWorkload = estimatedWorkload;
	}

	public String getExpiredHours() {
		return expiredHours;
	}

	public void setExpiredHours(String expiredHours) {
		this.expiredHours = expiredHours;
	}

	public String getContractAmount() {
		return contractAmount;
	}

	public void setContractAmount(String contractAmount) {
		this.contractAmount = contractAmount;
	}

	public String getProfitTargets() {
		return profitTargets;
	}

	public void setProfitTargets(String profitTargets) {
		this.profitTargets = profitTargets;
	}

	public String getProjectPhase() {
		return projectPhase;
	}

	public void setProjectPhase(String projectPhase) {
		this.projectPhase = projectPhase;
	}

	public String getNaturallyCost() {
		return naturallyCost;
	}

	public void setNaturallyCost(String naturallyCost) {
		this.naturallyCost = naturallyCost;
	}

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	public String getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}

}
