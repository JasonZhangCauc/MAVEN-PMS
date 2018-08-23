package com.ps.result.applymanage;

import com.ps.result.common.PageParaVo;

public class TaxiBillVo extends PageParaVo<TaxiBillVo>{
	
	private String departTime;			//上车时间
	private String arriveTime;			//下车时间
	private String taxiMatter;			//打车事由
	private String taxiAmount;			//打车发票金额
	private String taxibillStatus;		//报销状态：编辑中/待审核/已审核
	private String reimburseDate;		//打车报销的时间
	private String reimburseBy;			//报销人
	private String reimburseName;		//报销人名称
	private String projectId;			//项目ID
	private String projectName;			//项目名称
	private String createDate;			//提交日期
	
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getReimburseName() {
		return reimburseName;
	}
	public void setReimburseName(String reimburseName) {
		this.reimburseName = reimburseName;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getDepartTime() {
		return departTime;
	}
	public void setDepartTime(String departTime) {
		this.departTime = departTime;
	}
	public String getArriveTime() {
		return arriveTime;
	}
	public void setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
	}
	public String getTaxiMatter() {
		return taxiMatter;
	}
	public void setTaxiMatter(String taxiMatter) {
		this.taxiMatter = taxiMatter;
	}
	public String getTaxiAmount() {
		return taxiAmount;
	}
	public void setTaxiAmount(String taxiAmount) {
		this.taxiAmount = taxiAmount;
	}
	public String getTaxibillStatus() {
		return taxibillStatus;
	}
	public void setTaxibillStatus(String taxibillStatus) {
		this.taxibillStatus = taxibillStatus;
	}
	public String getReimburseDate() {
		return reimburseDate;
	}
	public void setReimburseDate(String reimburseDate) {
		this.reimburseDate = reimburseDate;
	}
	public String getReimburseBy() {
		return reimburseBy;
	}
	public void setReimburseBy(String reimburseBy) {
		this.reimburseBy = reimburseBy;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
}
