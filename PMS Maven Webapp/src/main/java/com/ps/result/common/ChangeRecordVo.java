package com.ps.result.common;

/** 
 *@Description: 变更记录VO
 * @author：		ZHOUMIN
 * @date：		2018-03-14 
 */
public class ChangeRecordVo extends PageParaVo<ChangeRecordVo> {
	
	private String changeType;				//变更类型
	private String changeBy;				//变更人
	private String changeByName;			//变更人名称
	private String changeByIcon;			//变更人图标
	private String changeDate;				//变更日期
	private String changeContent;			//变更内容
	private String changeId;				//变更ID
	
	
	public String getChangeByIcon() {
		return changeByIcon;
	}
	public void setChangeByIcon(String changeByIcon) {
		this.changeByIcon = changeByIcon;
	}
	public String getChangeByName() {
		return changeByName;
	}
	public void setChangeByName(String changeByName) {
		this.changeByName = changeByName;
	}
	public String getChangeId() {
		return changeId;
	}
	public void setChangeId(String changeId) {
		this.changeId = changeId;
	}
	public String getChangeType() {
		return changeType;
	}
	public void setChangeType(String changeType) {
		this.changeType = changeType;
	}
	public String getChangeBy() {
		return changeBy;
	}
	public void setChangeBy(String changeBy) {
		this.changeBy = changeBy;
	}
	public String getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}
	public String getChangeContent() {
		return changeContent;
	}
	public void setChangeContent(String changeContent) {
		this.changeContent = changeContent;
	}
	
}
