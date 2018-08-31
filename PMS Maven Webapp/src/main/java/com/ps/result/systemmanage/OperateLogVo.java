package com.ps.result.systemmanage;

import com.ps.result.common.PageParaVo;

/**
 * @Description: 日志输出实体类
 * @author: HuangPeng
 * @date: 2017年7月28日
 */
public class OperateLogVo extends PageParaVo<OperateLogVo>{
	
	private String operateBy;          //操作者ID
	private String operateName;        //操作者名称
	private String operateDeptName;    //操作者部门
	private String operateTime;        //操作時間
	private String operateType;        //操作类型
	private String operateCategory;    //功能
	private String operateContent;     //操作功能描述
	private String operateCategoryType;//功能类型
	private String operateBeginDate;    //操作开始时间
	private String operateEndDate;		//操作结束时间
    
	public String getOperateBy() {
		return operateBy;
	}
	public void setOperateBy(String operateBy) {
		this.operateBy = operateBy;
	}
	public String getOperateName() {
		return operateName;
	}
	public void setOperateName(String operateName) {
		this.operateName = operateName;
	}
	public String getOperateTime() {
		return operateTime;
	}
	public void setOperateTime(String operateTime) {
		this.operateTime = operateTime;
	}
	public String getOperateType() {
		return operateType;
	}
	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	public String getOperateCategory() {
		return operateCategory;
	}
	public void setOperateCategory(String operateCategory) {
		this.operateCategory = operateCategory;
	}
	public String getOperateContent() {
		return operateContent;
	}
	public void setOperateContent(String operateContent) {
		this.operateContent = operateContent;
	}
	public String getOperateCategoryType() {
		return operateCategoryType;
	}
	public void setOperateCategoryType(String operateCategoryType) {
		this.operateCategoryType = operateCategoryType;
	}
	public String getOperateDeptName() {
		return operateDeptName;
	}
	public void setOperateDeptName(String operateDeptName) {
		this.operateDeptName = operateDeptName;
	}
	public String getOperateBeginDate() {
		return operateBeginDate;
	}
	public void setOperateBeginDate(String operateBeginDate) {
		this.operateBeginDate = operateBeginDate;
	}
	public String getOperateEndDate() {
		return operateEndDate;
	}
	public void setOperateEndDate(String operateEndDate) {
		this.operateEndDate = operateEndDate;
	}
}
