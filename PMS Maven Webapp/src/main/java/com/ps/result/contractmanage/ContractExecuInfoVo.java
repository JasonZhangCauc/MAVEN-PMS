package com.ps.result.contractmanage;

import com.ps.result.common.PageParaVo;

/** 
 * @Description: 合同跟踪VO
<<<<<<< HEAD
 * @author：		raomingyi
 * @date：		2018-03-21 
=======
 * @author：		Jasonzhang
 * @date：		2018-08-21 
>>>>>>> branch 'master' of https://github.com/JasonZhangCauc/MAVEN-PMS.git
 */
public class ContractExecuInfoVo extends PageParaVo<ContractExecuInfoVo>{
	
	private String contractId;			//合同ID
	private String projectStage;		//项目阶段，字典维护，项目立项、启动会、概念培训、需求调研、数据收集、项目开发、试运行、项目上线、项目验收
	private String persondayCounts;		//使用人天数量
	private String remark;			    //备注
	private String createBy;			//操作人
	private String createDate;			//操作时间
	private String updateBy;			//更新人
	private String updateDate;			//更新时间
	private String status;              //状态，0有效1无效
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getContractId() {
		return contractId;
	}
	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	public String getProjectStage() {
		return projectStage;
	}
	public void setProjectStage(String projectStage) {
		this.projectStage = projectStage;
	}
	public String getPersondayCounts() {
		return persondayCounts;
	}
	public void setPersondayCounts(String persondayCounts) {
		this.persondayCounts = persondayCounts;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
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
