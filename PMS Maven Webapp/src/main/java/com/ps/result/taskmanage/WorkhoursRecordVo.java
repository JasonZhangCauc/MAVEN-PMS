package com.ps.result.taskmanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 工时登记VO
 * @author：		RAOMINGYI
 * @date：		2018-07-02 
 */
public class WorkhoursRecordVo extends PageParaVo<WorkhoursRecordVo>{


	private String workerId;			//人员工号
	private String workerName;			//人员姓名
	private String projectId;			//项目ID
	private String projectName;			//项目名称
	private String workingType;			//工作类型
	private String workingHours;		//耗时
	private String workingHoursTotal;   //当日总工时
	private String workDesc;			//工作内容
	private String workDate;			//日期
	private String status;			    //状态
	private String remark;			    //备注
	private String updateBy;			//最后修改人
	private String updateDate;			//最后修改日期
	private String beginWorkDate;		//开始日期
	private String endWorkDate;			//结束日期
	
	public String getBeginWorkDate() {
		return beginWorkDate;
	}
	public void setBeginWorkDate(String beginWorkDate) {
		this.beginWorkDate = beginWorkDate;
	}
	public String getEndWorkDate() {
		return endWorkDate;
	}
	public void setEndWorkDate(String endWorkDate) {
		this.endWorkDate = endWorkDate;
	}
	public String getWorkingHoursTotal() {
		return workingHoursTotal;
	}
	public void setWorkingHoursTotal(String workingHoursTotal) {
		this.workingHoursTotal = workingHoursTotal;
	}
	public String getWorkerName() {
		return workerName;
	}
	public void setWorkerName(String workerName) {
		this.workerName = workerName;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getWorkerId() {
		return workerId;
	}
	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getWorkingType() {
		return workingType;
	}
	public void setWorkingType(String workingType) {
		this.workingType = workingType;
	}
	public String getWorkingHours() {
		return workingHours;
	}
	public void setWorkingHours(String workingHours) {
		this.workingHours = workingHours;
	}
	public String getWorkDesc() {
		return workDesc;
	}
	public void setWorkDesc(String workDesc) {
		this.workDesc = workDesc;
	}
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
