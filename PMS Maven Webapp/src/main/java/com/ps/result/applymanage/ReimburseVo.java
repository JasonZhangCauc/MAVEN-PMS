package com.ps.result.applymanage;

import com.ps.result.common.PageParaVo;

/**
 * 
 * @Description: 报销实体类
 * @author lanjunjie
 * @date: 2018-8-2
 */
public class ReimburseVo extends PageParaVo<ReimburseVo>{
	
	private String applyNo;  			//报销申请单id
	private String reimburseNo;			//报销单号
	private String reimburseType;		//报销类型
	private String userName;			//申请人姓名
	private String userNo;				//申请人工号
	private String projectName;			//报销申请所属项目
	private String departPlace;			//出发地点
	private String arrivePlace;			//到达地点
	private String applyTime;			//申请时间
	private String amount;				//预计报销金额
	private String remark;				//报销说明
	private String status;				//申请单所处状态
	
	public String getApplyNo() {
		return applyNo;
	}
	public void setApplyNo(String applyNo) {
		this.applyNo = applyNo;
	}
	public String getReimburseNo() {
		return reimburseNo;
	}
	public void setReimburseNo(String reimburseNo) {
		this.reimburseNo = reimburseNo;
	}
	public String getReimburseType() {
		return reimburseType;
	}
	public void setReimburseType(String reimburseType) {
		this.reimburseType = reimburseType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getDepartPlace() {
		return departPlace;
	}
	public void setDepartPlace(String departPlace) {
		this.departPlace = departPlace;
	}
	public String getArrivePlace() {
		return arrivePlace;
	}
	public void setArrivePlace(String arrivePlace) {
		this.arrivePlace = arrivePlace;
	}
	public String getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}

	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
