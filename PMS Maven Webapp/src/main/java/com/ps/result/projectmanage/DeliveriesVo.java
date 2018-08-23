package com.ps.result.projectmanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 交付物VO
 * @author：		ZHOUMIN
 * @date：		2018-03-19 
 */
public class DeliveriesVo extends PageParaVo<DeliveriesVo>{
	
	private String updateBy;				//更新人
	private String updateDate;				//更新日期
	private String projectId;				//项目ID
	private String deliveriesName;			//交付物名称
	private String planDeliveriesDate;		//计划交付时间
	private String whetherContract;			//是否记入合同 0是 1否
	private String personLiable;			//责任人
	private String whetherDeliver;			//是否已交付 0是 1否
	private String actualDeliveriesDate;	//实际交付时间
	private String remark;					//备注
	private String personLiableName;		//责任人名称
	
	public String getPersonLiableName() {
		return personLiableName;
	}
	public void setPersonLiableName(String personLiableName) {
		this.personLiableName = personLiableName;
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
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getDeliveriesName() {
		return deliveriesName;
	}
	public void setDeliveriesName(String deliveriesName) {
		this.deliveriesName = deliveriesName;
	}
	public String getPlanDeliveriesDate() {
		return planDeliveriesDate;
	}
	public void setPlanDeliveriesDate(String planDeliveriesDate) {
		this.planDeliveriesDate = planDeliveriesDate;
	}
	public String getWhetherContract() {
		return whetherContract;
	}
	public void setWhetherContract(String whetherContract) {
		this.whetherContract = whetherContract;
	}
	public String getPersonLiable() {
		return personLiable;
	}
	public void setPersonLiable(String personLiable) {
		this.personLiable = personLiable;
	}
	public String getWhetherDeliver() {
		return whetherDeliver;
	}
	public void setWhetherDeliver(String whetherDeliver) {
		this.whetherDeliver = whetherDeliver;
	}
	public String getActualDeliveriesDate() {
		return actualDeliveriesDate;
	}
	public void setActualDeliveriesDate(String actualDeliveriesDate) {
		this.actualDeliveriesDate = actualDeliveriesDate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
