package com.ps.result.taskmanage;


import com.ps.result.common.PageParaVo;

/**
 * 调整记录信息表
 * 018234
 * 2018-08-27
 */
public class AdjustRecordVo extends PageParaVo<AdjustRecordVo>{
	
	private String id;
	
	private String adjustOldTime;
	
	private String adjustLastTime;
	
	private String adjustWhy;
	
	private String adjustPerson;
	
	private String adjustPersonName;
	
	private String adjustTime;
	
	private String overseeAdjustId;

	public String getAdjustPersonName() {
		return adjustPersonName;
	}

	public void setAdjustPersonName(String adjustPersonName) {
		this.adjustPersonName = adjustPersonName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getAdjustOldTime() {
		return adjustOldTime;
	}

	public void setAdjustOldTime(String adjustOldTime) {
		this.adjustOldTime = adjustOldTime;
	}

	public String getAdjustLastTime() {
		return adjustLastTime;
	}

	public void setAdjustLastTime(String adjustLastTime) {
		this.adjustLastTime = adjustLastTime;
	}

	public String getAdjustWhy() {
		return adjustWhy;
	}

	public void setAdjustWhy(String adjustWhy) {
		this.adjustWhy = adjustWhy;
	}

	public String getAdjustPerson() {
		return adjustPerson;
	}

	public void setAdjustPerson(String adjustPerson) {
		this.adjustPerson = adjustPerson;
	}

	public String getAdjustTime() {
		return adjustTime;
	}

	public void setAdjustTime(String adjustTime) {
		this.adjustTime = adjustTime;
	}

	public String getOverseeAdjustId() {
		return overseeAdjustId;
	}

	public void setOverseeAdjustId(String overseeAdjustId) {
		this.overseeAdjustId = overseeAdjustId;
	}

}
