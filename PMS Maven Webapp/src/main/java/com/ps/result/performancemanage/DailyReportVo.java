package com.ps.result.performancemanage;

import com.ps.result.common.PageParaVo;


/** 
 *@Description: 安全监察报告VO
 * @author：		ZHOUMIN
 * @date：		2018-03-13 
 */
public class DailyReportVo extends PageParaVo<DailyReportVo>{
	
	private String proNum;					//项目编号
	private String proId;					//项目ID
	private String proReporter;				//填报人
	private String reportDate;				//填报日期
	private String reportType;				//日报类型,字典维护
	private String taskToday;				//当天任务
	private String questionToday;			//当天问题
	private String conclusionToday;			//当日小结
	private String planTomorrow;			//明日计划
	private String updateBy;				//更新人
	private String updateDate;				//更新日期
	private String belongCustomer;			//所属客户
	private String belongProduct;			//所属产品
	private String reportBeginDate;			//填报开始日期
	private String reportEndDate;			//填报结束日期
	private String proReporterName;			//填报人名称
	private String reportStatus;			//日报状态
	
	public String getProId() {
		return proId;
	}
	public void setProId(String proId) {
		this.proId = proId;
	}
	public String getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}
	public String getProReporterName() {
		return proReporterName;
	}
	public void setProReporterName(String proReporterName) {
		this.proReporterName = proReporterName;
	}
	public String getReportBeginDate() {
		return reportBeginDate;
	}
	public void setReportBeginDate(String reportBeginDate) {
		this.reportBeginDate = reportBeginDate;
	}
	public String getReportEndDate() {
		return reportEndDate;
	}
	public void setReportEndDate(String reportEndDate) {
		this.reportEndDate = reportEndDate;
	}
	public String getBelongCustomer() {
		return belongCustomer;
	}
	public void setBelongCustomer(String belongCustomer) {
		this.belongCustomer = belongCustomer;
	}
	public String getBelongProduct() {
		return belongProduct;
	}
	public void setBelongProduct(String belongProduct) {
		this.belongProduct = belongProduct;
	}
	public String getProNum() {
		return proNum;
	}
	public void setProNum(String proNum) {
		this.proNum = proNum;
	}
	public String getProReporter() {
		return proReporter;
	}
	public void setProReporter(String proReporter) {
		this.proReporter = proReporter;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getTaskToday() {
		return taskToday;
	}
	public void setTaskToday(String taskToday) {
		this.taskToday = taskToday;
	}
	public String getQuestionToday() {
		return questionToday;
	}
	public void setQuestionToday(String questionToday) {
		this.questionToday = questionToday;
	}
	public String getConclusionToday() {
		return conclusionToday;
	}
	public void setConclusionToday(String conclusionToday) {
		this.conclusionToday = conclusionToday;
	}
	public String getPlanTomorrow() {
		return planTomorrow;
	}
	public void setPlanTomorrow(String planTomorrow) {
		this.planTomorrow = planTomorrow;
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
	
}
