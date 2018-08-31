package com.ps.result.performancemanage;

import com.ps.result.common.PageParaVo;

public class PerformanceContractVo extends PageParaVo<PerformanceContractVo>{
	
	private String pcTargettype;//指标类别
	private String pcTargetcontent;//指标内容
	private String pcCheckcontent;//考核内容
	private String pcWeight;//考核权重
	private String pcFrequency;//考核频度
	private String pcStatus;//状态
	private String pcTone;//T1指标
	private String pcTwo;//T2指标
	private String pcThree;//T3指标
	private String pcBy;//提交人
	private String pcName;//提交人姓名
	private String pcCreateDate;//创建时间
	private String pcLevel;//考评等级
	private String pcGreade;//考核得分
	
	public String getPcLevel() {
		return pcLevel;
	}
	public void setPcLevel(String pcLevel) {
		this.pcLevel = pcLevel;
	}
	public String getPcGreade() {
		return pcGreade;
	}
	public void setPcGreade(String pcGreade) {
		this.pcGreade = pcGreade;
	}
	public String getPcCreateDate() {
		return pcCreateDate;
	}
	public void setPcCreateDate(String pcCreateDate) {
		this.pcCreateDate = pcCreateDate;
	}
	
	public String getPcTargettype() {
		return pcTargettype;
	}
	public void setPcTargettype(String pcTargettype) {
		this.pcTargettype = pcTargettype;
	}
	public String getPcTargetcontent() {
		return pcTargetcontent;
	}
	public void setPcTargetcontent(String pcTargetcontent) {
		this.pcTargetcontent = pcTargetcontent;
	}
	public String getPcCheckcontent() {
		return pcCheckcontent;
	}
	public void setPcCheckcontent(String pcCheckcontent) {
		this.pcCheckcontent = pcCheckcontent;
	}
	public String getPcWeight() {
		return pcWeight;
	}
	public void setPcWeight(String pcWeight) {
		this.pcWeight = pcWeight;
	}
	public String getPcFrequency() {
		return pcFrequency;
	}
	public void setPcFrequency(String pcFrequency) {
		this.pcFrequency = pcFrequency;
	}
	public String getPcStatus() {
		return pcStatus;
	}
	public void setPcStatus(String pcStatus) {
		this.pcStatus = pcStatus;
	}
	public String getPcTone() {
		return pcTone;
	}
	public void setPcTone(String pcTone) {
		this.pcTone = pcTone;
	}
	public String getPcTwo() {
		return pcTwo;
	}
	public void setPcTwo(String pcTwo) {
		this.pcTwo = pcTwo;
	}
	public String getPcThree() {
		return pcThree;
	}
	public void setPcThree(String pcThree) {
		this.pcThree = pcThree;
	}
	public String getPcBy() {
		return pcBy;
	}
	public void setPcBy(String pcBy) {
		this.pcBy = pcBy;
	}
	public String getPcName() {
		return pcName;
	}
	public void setPcName(String pcName) {
		this.pcName = pcName;
	}
	
	
}
