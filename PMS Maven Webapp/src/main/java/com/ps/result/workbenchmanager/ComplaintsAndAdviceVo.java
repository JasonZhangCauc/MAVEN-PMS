package com.ps.result.workbenchmanager;

import com.ps.result.common.PageParaVo;

/**
 * @Description 投诉与建议Vo
 * @author zhujiejie
 * @date 2018年7月25日
 */
public class ComplaintsAndAdviceVo extends PageParaVo<ComplaintsAndAdviceVo> {

	private String id;				//主键id
	private String createDate;		//创建时间
	private String createDateBegin;	//创建开始时间
	private String createDateEnd;	//创建结束时间
	private String createBy;		//创建人
	private String createByStr;		//创建人中文名
	private String updateDate;		//修改时间
	private String updateBy;		//修改人
	private String advicesContent; //内容
	private String advicesType;	//类型,0-投诉 1-建议
	private String advicesTypeStr;//类型中文接受字段
	
	public String getCreateByStr() {
		return createByStr;
	}
	public void setCreateByStr(String createByStr) {
		this.createByStr = createByStr;
	}
	public String getAdvicesTypeStr() {
		return advicesTypeStr;
	}
	public void setAdvicesTypeStr(String advicesTypeStr) {
		this.advicesTypeStr = advicesTypeStr;
	}
	public String getCreateDateBegin() {
		return createDateBegin;
	}
	public void setCreateDateBegin(String createDateBegin) {
		this.createDateBegin = createDateBegin;
	}
	public String getCreateDateEnd() {
		return createDateEnd;
	}
	public void setCreateDateEnd(String createDateEnd) {
		this.createDateEnd = createDateEnd;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public String getAdvicesContent() {
		return advicesContent;
	}
	public void setAdvicesContent(String advicesContent) {
		this.advicesContent = advicesContent;
	}
	public String getAdvicesType() {
		return advicesType;
	}
	public void setAdvicesType(String advicesType) {
		this.advicesType = advicesType;
	}
}
