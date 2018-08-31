package com.ps.result.performancemanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 绩效VO
 * @author：		ZHOUMIN
 * @date：		2018-03-12 
 */
public class PerformanceVo extends PageParaVo<PerformanceVo>{

	private String grade;			//绩效等级，分为A、B、C、D
	private String kpiKind;			//KPI属性0是正数，1表示负数
	private String kpiNumbers;			//KPI数量
	private String comments;			//评语
	private String remarks;			//备注
	private String month;			//绩效月份
	private String updateBy;			//修改人
	private String updateDate;			//修改时间
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getKpiKind() {
		return kpiKind;
	}
	public void setKpiKind(String kpiKind) {
		this.kpiKind = kpiKind;
	}
	public String getKpiNumbers() {
		return kpiNumbers;
	}
	public void setKpiNumbers(String kpiNumbers) {
		this.kpiNumbers = kpiNumbers;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
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
