package com.ps.result.projectmanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 里程碑VO
 * @author：		ZHOUMIN
 * @date：		2018-03-19 
 */
public class MilepostVo extends PageParaVo<MilepostVo>{
	
	private String projectId;				//项目ID
	private String milepostName;			//里程碑名称
	private String planCompletedate;		//计划完成时间
	private String correspondingPhase;		//对应阶段   数据来源于字典维护
	private String milepostStatus;			//里程碑状态    数据来源于字典维护
	private String milepostDescribe;		//里程碑描述
	private String remark;					//备注
	private String whetherDelay;			//是否延误  0是 1否
	private String adjustDate;				//调整时间
	private String deviationDay;			//偏差时长 
	private String updateBy;				//更新人
	private String updateDate;				//更新日期
	
	public String getAdjustDate() {
		return adjustDate;
	}
	public void setAdjustDate(String adjustDate) {
		this.adjustDate = adjustDate;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getMilepostName() {
		return milepostName;
	}
	public void setMilepostName(String milepostName) {
		this.milepostName = milepostName;
	}
	public String getPlanCompletedate() {
		return planCompletedate;
	}
	public void setPlanCompletedate(String planCompletedate) {
		this.planCompletedate = planCompletedate;
	}
	public String getCorrespondingPhase() {
		return correspondingPhase;
	}
	public void setCorrespondingPhase(String correspondingPhase) {
		this.correspondingPhase = correspondingPhase;
	}
	public String getMilepostStatus() {
		return milepostStatus;
	}
	public void setMilepostStatus(String milepostStatus) {
		this.milepostStatus = milepostStatus;
	}
	public String getMilepostDescribe() {
		return milepostDescribe;
	}
	public void setMilepostDescribe(String milepostDescribe) {
		this.milepostDescribe = milepostDescribe;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getWhetherDelay() {
		return whetherDelay;
	}
	public void setWhetherDelay(String whetherDelay) {
		this.whetherDelay = whetherDelay;
	}
	public String getDeviationDay() {
		return deviationDay;
	}
	public void setDeviationDay(String deviationDay) {
		this.deviationDay = deviationDay;
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
