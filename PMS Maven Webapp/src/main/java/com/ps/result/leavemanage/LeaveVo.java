package com.ps.result.leavemanage;

import com.ps.result.checkinginmanage.ChickinBaseInfoVo;
import com.ps.result.common.PageParaVo;
/**
 * 
 * 请假管理
 * LeaveBaseInfoVo
 * @author：JasonZhang
 * @date：2018-8-13-上午10:16:05 
 *
 */
public class LeaveVo extends PageParaVo<ChickinBaseInfoVo>{
	private String id;
	
	private String leaveState;//状态(1编辑中/2已提交/3已批准)
	
	private String leaveBy;//签到人
	
	private String leaveType;//请假类型(1调休/2年假/3产检/4出差/5丧假/6产假/7婚假/8事假/9病假)
	
	private String beginTime;//开始时间
	
	private String endTime;//结束时间
	
	private String  leaveReason;//请假理由
	
	private String updateDate;		   //更新时间
	
	private String updateBy;		   //更新人
	
	private String leaveByName;//签到人中文
	
	private String signStartDate;//查询用日期
	
	private String signStartDateNext;//查询用日期后一天
	
	public String getSignStartDateNext() {
		return signStartDateNext;
	}

	public void setSignStartDateNext(String signStartDateNext) {
		this.signStartDateNext = signStartDateNext;
	}

	private String userName;//姓名显示
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSignStartDate() {
		return signStartDate;
	}

	public void setSignStartDate(String signStartDate) {
		this.signStartDate = signStartDate;
	}

	public String getLeaveByName() {
		return leaveByName;
	}

	public void setLeaveByName(String leaveByName) {
		this.leaveByName = leaveByName;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLeaveState() {
		return leaveState;
	}

	public void setLeaveState(String leaveState) {
		this.leaveState = leaveState;
	}

	public String getLeaveBy() {
		return leaveBy;
	}

	public void setLeaveBy(String leaveBy) {
		this.leaveBy = leaveBy;
	}

	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
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


	
}
