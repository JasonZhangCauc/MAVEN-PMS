package com.ps.result.performancemanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 月报VO
 * @author：		ZHOUMIN
 * @date：		2018-03-14 
 */
public class MonthReportVo extends PageParaVo<MonthReportVo>{
	
	private String proId;				//项目ID
	private String proNum;				//项目编号
	private String proAttendees;		//项目参与人
	private String proReporter;			//填报人
	private String reportMonth;			//填报月份
	private String updateBy;			//更新人
	private String updateDate;			//更新日期
	private String reportBeginMonth;	//填报开始月份
	private String reportEndMonth;		//填报结束月份
	private String belongCustomer;		//所属客户
	private String belongProduct;		//所属产品
	private String proReporterName;		//填报人名称
	private String reporterStatus;		//报告状态
	
	public String getProId() {
		return proId;
	}
	public void setProId(String proId) {
		this.proId = proId;
	}
	public String getReporterStatus() {
		return reporterStatus;
	}
	public void setReporterStatus(String reporterStatus) {
		this.reporterStatus = reporterStatus;
	}
	public String getProReporterName() {
		return proReporterName;
	}
	public void setProReporterName(String proReporterName) {
		this.proReporterName = proReporterName;
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
	public String getReportBeginMonth() {
		return reportBeginMonth;
	}
	public void setReportBeginMonth(String reportBeginMonth) {
		this.reportBeginMonth = reportBeginMonth;
	}
	public String getReportEndMonth() {
		return reportEndMonth;
	}
	public void setReportEndMonth(String reportEndMonth) {
		this.reportEndMonth = reportEndMonth;
	}
	public String getProNum() {
		return proNum;
	}
	public void setProNum(String proNum) {
		this.proNum = proNum;
	}
	public String getProAttendees() {
		return proAttendees;
	}
	public void setProAttendees(String proAttendees) {
		this.proAttendees = proAttendees;
	}
	public String getProReporter() {
		return proReporter;
	}
	public void setProReporter(String proReporter) {
		this.proReporter = proReporter;
	}
	public String getReportMonth() {
		return reportMonth;
	}
	public void setReportMonth(String reportMonth) {
		this.reportMonth = reportMonth;
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
