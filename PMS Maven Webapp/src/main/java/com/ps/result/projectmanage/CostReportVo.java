package com.ps.result.projectmanage;

import com.ps.result.common.PageParaVo;

/**
 * 成本报表实体类
 * wb066
 * 2018-07-02
 */
public class CostReportVo extends PageParaVo<CostReportVo>{
	
	private String projectName; //项目名称
	
	private String projectPhase; //项目阶段
	
	private String projectStatus; //项目状态
	
	private String estimatedWorkload;//预估工时
	
	private String workTime;//工期
	
	private String beginTime;//工期-开始日期
	
	private String endTime;//工期-结束日期
	
	private String periodWorkHours;//期内工作量
	
	private String cumulativeWorkHours;//累计工作量
	
	private String periodCost;//期内成本
	
	private String cumulativeCost;//累计成本
	
	private String profitTargets;//利润率指标
	
	private String profitMargin;//利润率
	
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

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectPhase() {
		return projectPhase;
	}

	public void setProjectPhase(String projectPhase) {
		this.projectPhase = projectPhase;
	}

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	public String getEstimatedWorkload() {
		return estimatedWorkload;
	}

	public void setEstimatedWorkload(String estimatedWorkload) {
		this.estimatedWorkload = estimatedWorkload;
	}

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public String getPeriodWorkHours() {
		return periodWorkHours;
	}

	public void setPeriodWorkHours(String periodWorkHours) {
		this.periodWorkHours = periodWorkHours;
	}

	public String getCumulativeWorkHours() {
		return cumulativeWorkHours;
	}

	public void setCumulativeWorkHours(String cumulativeWorkHours) {
		this.cumulativeWorkHours = cumulativeWorkHours;
	}

	public String getPeriodCost() {
		return periodCost;
	}

	public void setPeriodCost(String periodCost) {
		this.periodCost = periodCost;
	}

	public String getCumulativeCost() {
		return cumulativeCost;
	}

	public void setCumulativeCost(String cumulativeCost) {
		this.cumulativeCost = cumulativeCost;
	}

	public String getProfitTargets() {
		return profitTargets;
	}

	public void setProfitTargets(String profitTargets) {
		this.profitTargets = profitTargets;
	}

	public String getProfitMargin() {
		return profitMargin;
	}

	public void setProfitMargin(String profitMargin) {
		this.profitMargin = profitMargin;
	}
}
