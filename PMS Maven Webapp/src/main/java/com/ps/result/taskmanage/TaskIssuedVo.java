package com.ps.result.taskmanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 任务控制台VO
 * @author：		ZHOUMIN
 * @date：		2018-08-01 
 */
public class TaskIssuedVo extends PageParaVo<TaskIssuedVo>{

	private String responsible;				//责任人
	private String theme;					//主题
	private String describe;				//描述
	private String status;					//状态 0新建/1进行中/2已关闭
	private String tasktype;				//研发类型 
	private String priority;				//难易度  低/中/高
	private String taskBeginDate;			//任务开始时间
	private String taskEndDate;				//任务结束时间
	private String whyType;					//原因类型
	private String expectedTime;			//预期工时
	private String actualHour;				//实际工时
	private String completeDegree;			//完成度
	private String instructions;			//说明
	private String backgroundColor;			//背景颜色
	
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getCompleteDegree() {
		return completeDegree;
	}
	public void setCompleteDegree(String completeDegree) {
		this.completeDegree = completeDegree;
	}
	public String getInstructions() {
		return instructions;
	}
	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}
	public String getResponsible() {
		return responsible;
	}
	public void setResponsible(String responsible) {
		this.responsible = responsible;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTasktype() {
		return tasktype;
	}
	public void setTasktype(String tasktype) {
		this.tasktype = tasktype;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getTaskBeginDate() {
		return taskBeginDate;
	}
	public void setTaskBeginDate(String taskBeginDate) {
		this.taskBeginDate = taskBeginDate;
	}
	public String getTaskEndDate() {
		return taskEndDate;
	}
	public void setTaskEndDate(String taskEndDate) {
		this.taskEndDate = taskEndDate;
	}
	public String getWhyType() {
		return whyType;
	}
	public void setWhyType(String whyType) {
		this.whyType = whyType;
	}
	public String getExpectedTime() {
		return expectedTime;
	}
	public void setExpectedTime(String expectedTime) {
		this.expectedTime = expectedTime;
	}
	public String getActualHour() {
		return actualHour;
	}
	public void setActualHour(String actualHour) {
		this.actualHour = actualHour;
	}
	
}
