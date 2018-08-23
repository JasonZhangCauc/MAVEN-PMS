package com.ps.result.projectmanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 里程碑调整VO
 * @author：		ZHOUMIN
 * @date：		2018-03-19 
 */
public class MilepostAdjustVo extends PageParaVo<MilepostAdjustVo> {
	
	private String milepostId;			//里程碑ID
	private String adjustDate;			//调整时间
	private String adjustRemark;		//调整原因
	private String isComplete;			//是否顺延
	private String approvalBy;			//批准人
	private String approvalByName;		//批准人名称
	private String approvalDate;		//批准时间
	private String remark;				//备注
	private String updateBy;			//更新人
	private String updateDate;			//更新时间
	
	public String getApprovalByName() {
		return approvalByName;
	}
	public void setApprovalByName(String approvalByName) {
		this.approvalByName = approvalByName;
	}
	public String getMilepostId() {
		return milepostId;
	}
	public void setMilepostId(String milepostId) {
		this.milepostId = milepostId;
	}
	public String getAdjustDate() {
		return adjustDate;
	}
	public void setAdjustDate(String adjustDate) {
		this.adjustDate = adjustDate;
	}
	public String getAdjustRemark() {
		return adjustRemark;
	}
	public void setAdjustRemark(String adjustRemark) {
		this.adjustRemark = adjustRemark;
	}
	public String getIsComplete() {
		return isComplete;
	}
	public void setIsComplete(String isComplete) {
		this.isComplete = isComplete;
	}
	public String getApprovalBy() {
		return approvalBy;
	}
	public void setApprovalBy(String approvalBy) {
		this.approvalBy = approvalBy;
	}
	public String getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(String approvalDate) {
		this.approvalDate = approvalDate;
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
