package com.ps.result.projectmanage;

import com.ps.result.common.PageBaseVo;
import com.ps.result.common.PageParaVo;


/** 
 *@Description: 安全监察报告VO
 * @author：		zhangm
 * @date：		2018-08-03 
 */
public class ProjectMoniInfoVo extends PageParaVo<ProjectMoniInfoVo>{
	private static final long serialVersionUID = 1L;

	private String id;			//ID
	private String moniStatus;			//状态
	private String moniStatusStr;			//状态
	private String moniTitle;			//标题
	private String moniStartDate;			//开始时间
	private String moniEndDate;			//结束时间
	private String moniInstruction;			//说明
	private String createBy;			//录入人
	private String createDate;			//录入时间
	private String updateBy;			//修改人
	private String updateDate;			//修改时间
	private String projectBaseinfoId;			//关联项目id
	
	public String getMoniStatusStr() {
		return moniStatusStr;
	}
	public void setMoniStatusStr(String moniStatusStr) {
		this.moniStatusStr = moniStatusStr;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMoniStatus() {
		return moniStatus;
	}
	public void setMoniStatus(String moniStatus) {
		this.moniStatus = moniStatus;
	}
	public String getMoniTitle() {
		return moniTitle;
	}
	public void setMoniTitle(String moniTitle) {
		this.moniTitle = moniTitle;
	}
	public String getMoniStartDate() {
		return moniStartDate;
	}
	public void setMoniStartDate(String moniStartDate) {
		this.moniStartDate = moniStartDate;
	}
	public String getMoniEndDate() {
		return moniEndDate;
	}
	public void setMoniEndDate(String moniEndDate) {
		this.moniEndDate = moniEndDate;
	}
	public String getMoniInstruction() {
		return moniInstruction;
	}
	public void setMoniInstruction(String moniInstruction) {
		this.moniInstruction = moniInstruction;
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
	public String getProjectBaseinfoId() {
		return projectBaseinfoId;
	}
	public void setProjectBaseinfoId(String projectBaseinfoId) {
		this.projectBaseinfoId = projectBaseinfoId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
