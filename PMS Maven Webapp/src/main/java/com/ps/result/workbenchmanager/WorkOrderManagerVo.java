package com.ps.result.workbenchmanager;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 安全监察报告VO
 * @author：		ZHOUMIN
 * @date：		2018-07-25 
 */
public class WorkOrderManagerVo extends PageParaVo<WorkOrderManagerVo>{

	private String workOrderNum;			//工作单编号
	private String putForwardDate;			//提出时间
	private String putForwardBy;			//提出人
	private String belongUnit;			//所属单位
	private String projectType;			//项目类别
	private String workType;			//工作类别
	private String priority;			//优先级
	private String workContent;			//工作内容
	private String processingOpinion;			//处理意见
	private String workStatus;			//工作状态
	public String getWorkOrderNum() {
		return workOrderNum;
	}
	public void setWorkOrderNum(String workOrderNum) {
		this.workOrderNum = workOrderNum;
	}
	public String getPutForwardDate() {
		return putForwardDate;
	}
	public void setPutForwardDate(String putForwardDate) {
		this.putForwardDate = putForwardDate;
	}
	public String getPutForwardBy() {
		return putForwardBy;
	}
	public void setPutForwardBy(String putForwardBy) {
		this.putForwardBy = putForwardBy;
	}
	public String getBelongUnit() {
		return belongUnit;
	}
	public void setBelongUnit(String belongUnit) {
		this.belongUnit = belongUnit;
	}
	public String getProjectType() {
		return projectType;
	}
	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getWorkContent() {
		return workContent;
	}
	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}
	public String getProcessingOpinion() {
		return processingOpinion;
	}
	public void setProcessingOpinion(String processingOpinion) {
		this.processingOpinion = processingOpinion;
	}
	public String getWorkStatus() {
		return workStatus;
	}
	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}
}
