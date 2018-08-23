package com.ps.result.checkinginmanage;


import com.ps.result.common.PageParaVo;

/**
 * 
 * 打卡记录
 * ChickinBaseInfoVo
 * @author：JasonZhang
 * @date：2018-8-2-下午4:02:50 
 *
 */
public class ChickinBaseInfoVo extends PageParaVo<ChickinBaseInfoVo>{
	
	private String id;
	
	private String chickinState;//状态
	
	private String chickinBy;//名字
	
	private String chickinByName;//名字中文
	
	private String beginTime;//开始时间
	
	private String endTime;//结束时间
	
	private String bqType;//正常签到还是补签
	
	public String getBqType() {
		return bqType;
	}


	public void setBqType(String bqType) {
		this.bqType = bqType;
	}


	public String getBeginTime() {
		return beginTime;
	}


	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	private String chickinTime;//时间
	
	private String chickinTimeAddDay;//日期后一天
	
	private String chickinType;//类型
	
	
	private String chickinReason;//补签理由
	
	private String chickinStateStr; //状态中文
	
	private String chickinTypeStr; //类型中文
	
	private String userName;
	public String getChickinByName() {
		return chickinByName;
	}


	public void setChickinByName(String chickinByName) {
		this.chickinByName = chickinByName;
	}


	public String getChickinTypeStr() {
		return chickinTypeStr;
	}


	public void setChickinTypeStr(String chickinTypeStr) {
		this.chickinTypeStr = chickinTypeStr;
	}

	public String getChickinTimeAddDay() {
		return chickinTimeAddDay;
	}


	public void setChickinTimeAddDay(String chickinTimeAddDay) {
		this.chickinTimeAddDay = chickinTimeAddDay;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getChickinStateStr() {
		return chickinStateStr;
	}


	public void setChickinStateStr(String chickinStateStr) {
		this.chickinStateStr = chickinStateStr;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getChickinState() {
		return chickinState;
	}


	public void setChickinState(String chickinState) {
		this.chickinState = chickinState;
	}


	public String getChickinBy() {
		return chickinBy;
	}


	public void setChickinBy(String chickinBy) {
		this.chickinBy = chickinBy;
	}


	public String getChickinTime() {
		return chickinTime;
	}


	public void setChickinTime(String chickinTime) {
		this.chickinTime = chickinTime;
	}


	public String getChickinType() {
		return chickinType;
	}


	public void setChickinType(String chickinType) {
		this.chickinType = chickinType;
	}


	public String getChickinReason() {
		return chickinReason;
	}


	public void setChickinReason(String chickinReason) {
		this.chickinReason = chickinReason;
	}

	
	
}

