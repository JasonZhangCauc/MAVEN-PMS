package com.ps.result.projectmanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 其他成本VO类
 * @author：		jczou
 * @date：		2018-03-19 
 */
public class OtherCostManagerVo extends PageParaVo<OtherCostManagerVo>{

	private String id;					//其他成本ID
	private String projectId;			//项目ID
	private String projectName;         //项目标题
	private String costSports;			//收费大项
	private String costEvents;			//收费小项
	private String totalAmount;			//总金额
	private String currency;			//币种
	private String beginDate;			//开始日期
	private String endDate;				//结束日期
	private String peopleConcerned;		//报销人
	private String whetherInvoice;		//是否发票 0是 1否
	private String costDescribe;		//费用说明
	private String remark;			 	//备注
	private String createBy;			//录入人
	private String createDate;			//录入日期
	private String updateBy;			//修改人
	private String updateDate;			//修改时间
	private String projectNo;			//项目编号
	private String peopleName;			//报销人名称
	private String startTime;			//日期范围-开始
	private String endTime;				//日期范围-结束
	
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	
	public String getPeopleName() {
		return peopleName;
	}
	public void setPeopleName(String peopleName) {
		this.peopleName = peopleName;
	}
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the projectId
	 */
	public String getProjectId() {
		return projectId;
	}
	/**
	 * @param projectId the projectId to set
	 */
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	/**
	 * @return the projectName
	 */
	public String getProjectName() {
		return projectName;
	}
	/**
	 * @param projectName the projectName to set
	 */
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	/**
	 * @return the costSports
	 */
	public String getCostSports() {
		return costSports;
	}
	/**
	 * @param costSports the costSports to set
	 */
	public void setCostSports(String costSports) {
		this.costSports = costSports;
	}
	/**
	 * @return the costEvents
	 */
	public String getCostEvents() {
		return costEvents;
	}
	/**
	 * @param costEvents the costEvents to set
	 */
	public void setCostEvents(String costEvents) {
		this.costEvents = costEvents;
	}
	/**
	 * @return the totalAmount
	 */
	public String getTotalAmount() {
		return totalAmount;
	}
	/**
	 * @param totalAmount the totalAmount to set
	 */
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	/**
	 * @return the currency
	 */
	public String getCurrency() {
		return currency;
	}
	/**
	 * @param currency the currency to set
	 */
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	/**
	 * @return the beginDate
	 */
	public String getBeginDate() {
		return beginDate;
	}
	/**
	 * @param beginDate the beginDate to set
	 */
	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}
	/**
	 * @return the endDate
	 */
	public String getEndDate() {
		return endDate;
	}
	/**
	 * @param endDate the endDate to set
	 */
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	/**
	 * @return the peopleConcerned
	 */
	public String getPeopleConcerned() {
		return peopleConcerned;
	}
	/**
	 * @param peopleConcerned the peopleConcerned to set
	 */
	public void setPeopleConcerned(String peopleConcerned) {
		this.peopleConcerned = peopleConcerned;
	}
	/**
	 * @return the whetherInvoice
	 */
	public String getWhetherInvoice() {
		return whetherInvoice;
	}
	/**
	 * @param whetherInvoice the whetherInvoice to set
	 */
	public void setWhetherInvoice(String whetherInvoice) {
		this.whetherInvoice = whetherInvoice;
	}
	/**
	 * @return the costDescribe
	 */
	public String getCostDescribe() {
		return costDescribe;
	}
	/**
	 * @param costDescribe the costDescribe to set
	 */
	public void setCostDescribe(String costDescribe) {
		this.costDescribe = costDescribe;
	}
	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * @return the createBy
	 */
	public String getCreateBy() {
		return createBy;
	}
	/**
	 * @param createBy the createBy to set
	 */
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	/**
	 * @return the createDate
	 */
	public String getCreateDate() {
		return createDate;
	}
	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	/**
	 * @return the updateBy
	 */
	public String getUpdateBy() {
		return updateBy;
	}
	/**
	 * @param updateBy the updateBy to set
	 */
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	/**
	 * @return the updateDate
	 */
	public String getUpdateDate() {
		return updateDate;
	}
	/**
	 * @param updateDate the updateDate to set
	 */
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
}
