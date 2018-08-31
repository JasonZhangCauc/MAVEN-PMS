package com.ps.result.systemmanage;

import com.ps.result.common.PageParaVo;

public class CodeVo extends PageParaVo<UserVo>{
	
	private String codeZh;			//字典中文
	private String codeEn;			//字典英文
	private String codeValue;			//字典值
	private String codeType;			//字典类型
	private String codeFlag;			//字典状态 0有效 1无效
	private String codeRemark;			//字典备注
	private String updateBy;			//更新人
	private String updateDate;			//更新日期
	private String whetherParent;		//是否父级
	private String codeTypeName;		//字典类型名称
	
	public String getCodeTypeName() {
		return codeTypeName;
	}
	public void setCodeTypeName(String codeTypeName) {
		this.codeTypeName = codeTypeName;
	}
	public String getWhetherParent() {
		return whetherParent;
	}
	public void setWhetherParent(String whetherParent) {
		this.whetherParent = whetherParent;
	}
	public String getCodeZh() {
		return codeZh;
	}
	public void setCodeZh(String codeZh) {
		this.codeZh = codeZh;
	}
	public String getCodeEn() {
		return codeEn;
	}
	public void setCodeEn(String codeEn) {
		this.codeEn = codeEn;
	}
	public String getCodeValue() {
		return codeValue;
	}
	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}
	public String getCodeType() {
		return codeType;
	}
	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}
	public String getCodeFlag() {
		return codeFlag;
	}
	public void setCodeFlag(String codeFlag) {
		this.codeFlag = codeFlag;
	}
	public String getCodeRemark() {
		return codeRemark;
	}
	public void setCodeRemark(String codeRemark) {
		this.codeRemark = codeRemark;
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
