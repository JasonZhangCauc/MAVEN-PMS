package com.ps.result.projectmanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 安全监察报告VO
 * @author：		ZHOUMIN
 * @date：		2018-03-15 
 */
public class WorkHoursVo extends PageParaVo<WorkHoursVo>{

	private String projectId;			//项目ID
	private String projectName;         //项目标题
	private String workingType;			//工时类型
	private String workingHours;		//工时总计
	private String involvingResource;	//涉及资源
	private String beginDate;			//开始时间
	private String endDate;				//结束时间
	private String updateBy;			//更新人
	private String updateDate;			//更新日期
	private String projectNo;			//项目编号
	
	
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
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
	 * @return the workingType
	 */
	public String getWorkingType() {
		return workingType;
	}
	/**
	 * @param workingType the workingType to set
	 */
	public void setWorkingType(String workingType) {
		this.workingType = workingType;
	}
	/**
	 * @return the workingHours
	 */
	public String getWorkingHours() {
		return workingHours;
	}
	/**
	 * @param workingHours the workingHours to set
	 */
	public void setWorkingHours(String workingHours) {
		this.workingHours = workingHours;
	}
	/**
	 * @return the involvingResource
	 */
	public String getInvolvingResource() {
		return involvingResource;
	}
	/**
	 * @param involvingResource the involvingResource to set
	 */
	public void setInvolvingResource(String involvingResource) {
		this.involvingResource = involvingResource;
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
