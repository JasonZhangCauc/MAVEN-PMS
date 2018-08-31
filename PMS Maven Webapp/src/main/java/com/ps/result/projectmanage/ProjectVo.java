package com.ps.result.projectmanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 项目VO
 * @author：		ZHOUMIN
 * @date：		2018-03-19 
 */
public class ProjectVo extends PageParaVo<ProjectVo>{

	private String projectNo;			//项目编号
	private String projectStage;		//项目阶段   数据来源于字典维护
	private String projectStageName;    //项目阶段名称
	private String projectTitle;		//项目说明
	private String belongCustomerid;	//所属客户ID
	private String belongCustomerName;	//所属客户名称
	private String belongProduct;		//所属产品
	private String belongProductName;	//所属产品名称
	private String scopeDescription;	//范围说明
	private String riskAssessment;		//风险评估
	private String remark;				//描述
	private String projectDate;			//立项日期
	private String contractId;			//合同ID
	private String updateBy;			//更新人
	private String updateDate;			//更新日期
	private String projectName;			//项目标题
	private String implementHead;		//实施负责人ID
	private String implementHeadName;	//实施负责人姓名
	private String exploitHead;			//研发负责人ID
	private String exploitHeadName;	    //研发负责人姓名
	private String planWorkHours;		//计划工时
	private String projectStatus;		//项目状态 0编辑中 1待审核 2已立项
	private String projectFlag;			//项目有效性 0有效 1无效
	private String projectBeginDate;	//立项开始日期
	private String projectEndDate;		//立项结束日期
	private String contractNo;			//合同编号
	
	
	
	public String getBelongProductName() {
		return belongProductName;
	}
	public void setBelongProductName(String belongProductName) {
		this.belongProductName = belongProductName;
	}
	public String getProjectStageName() {
		return projectStageName;
	}
	public void setProjectStageName(String projectStageName) {
		this.projectStageName = projectStageName;
	}
	public String getBelongCustomerName() {
		return belongCustomerName;
	}
	public void setBelongCustomerName(String belongCustomerName) {
		this.belongCustomerName = belongCustomerName;
	}
	public String getImplementHeadName() {
		return implementHeadName;
	}
	public void setImplementHeadName(String implementHeadName) {
		this.implementHeadName = implementHeadName;
	}
	public String getExploitHeadName() {
		return exploitHeadName;
	}
	public void setExploitHeadName(String exploitHeadName) {
		this.exploitHeadName = exploitHeadName;
	}
	public String getContractNo() {
		return contractNo;
	}
	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}
	public String getProjectBeginDate() {
		return projectBeginDate;
	}
	public void setProjectBeginDate(String projectBeginDate) {
		this.projectBeginDate = projectBeginDate;
	}
	public String getProjectEndDate() {
		return projectEndDate;
	}
	public void setProjectEndDate(String projectEndDate) {
		this.projectEndDate = projectEndDate;
	}
	public String getProjectFlag() {
		return projectFlag;
	}
	public void setProjectFlag(String projectFlag) {
		this.projectFlag = projectFlag;
	}
	public String getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	public String getImplementHead() {
		return implementHead;
	}
	public void setImplementHead(String implementHead) {
		this.implementHead = implementHead;
	}
	public String getExploitHead() {
		return exploitHead;
	}
	public void setExploitHead(String exploitHead) {
		this.exploitHead = exploitHead;
	}
	public String getPlanWorkHours() {
		return planWorkHours;
	}
	public void setPlanWorkHours(String planWorkHours) {
		this.planWorkHours = planWorkHours;
	}
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	public String getProjectStage() {
		return projectStage;
	}
	public void setProjectStage(String projectStage) {
		this.projectStage = projectStage;
	}
	public String getProjectTitle() {
		return projectTitle;
	}
	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}
	public String getBelongCustomerid() {
		return belongCustomerid;
	}
	public void setBelongCustomerid(String belongCustomerid) {
		this.belongCustomerid = belongCustomerid;
	}
	public String getBelongProduct() {
		return belongProduct;
	}
	public void setBelongProduct(String belongProduct) {
		this.belongProduct = belongProduct;
	}
	public String getScopeDescription() {
		return scopeDescription;
	}
	public void setScopeDescription(String scopeDescription) {
		this.scopeDescription = scopeDescription;
	}
	public String getRiskAssessment() {
		return riskAssessment;
	}
	public void setRiskAssessment(String riskAssessment) {
		this.riskAssessment = riskAssessment;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getProjectDate() {
		return projectDate;
	}
	public void setProjectDate(String projectDate) {
		this.projectDate = projectDate;
	}
	public String getContractId() {
		return contractId;
	}
	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
}
