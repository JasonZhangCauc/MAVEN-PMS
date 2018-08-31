package com.ps.result.contractmanage;

import com.ps.result.common.PageParaVo;

/** 
 * @Description: 合同维护VO
 * @author：		raomingyi
 * @date：		2018-03-13 
 */
public class ContractVo extends PageParaVo<ContractVo>{

	private String laborPrice;			//人天单价
	private String freeservicePeriod;	//免费服务期阶段
	private String costserviceTime;		//收费服务期时长(月)
	private String updateDate;		   //更新时间
	private String updateBy;		   //更新人
	private String contractNo;		  //合同编号
	private String signedDate;		  //签署日期
	private String belongCustomerid;  //所属客户ID
	private String belongProduct;	 //所属产品   数据来源于字典维护
	private String contractTitle;	 //合同标题
	private String contractAmount;	 //合同金额
	private String currency;		 //币种    数据来源于字典维护
	private String effectiveDate;	 //有效期
	private String freeLimit;		//免费服务期（月）
	private String giveDay;			//赠送天数
	private String paymentRemark;	//付款说明
	private String remark;			//备注
	private String contractStatus;	//合同状态：1编辑中、2待审批、3已审批、4已退回、5已删除、6已立项
	private String examineBy;		//审核人
	private String examineDate;		//审核日期
	private String signStartDate;   //签订合同时间范围开始时间
	private String signEndDate;   //签订合同时间范围结束时间
	private String status; 			//合同有效性 0有效 1无效
	private String projectStage;    //项目阶段
	private String receivableStatus;//收款状态
	private String customName;//所属客户名称
	private String receivedMoney;//已收到金额
	private String restSenddays;//剩余赠送人天
	private String restEffectivedays;//剩余免费服务期天数
	
	
	public String getReceivedMoney() {
		return receivedMoney;
	}
	public void setReceivedMoney(String receivedMoney) {
		this.receivedMoney = receivedMoney;
	}
	public String getRestSenddays() {
		return restSenddays;
	}
	public void setRestSendDays(String restSenddays) {
		this.restSenddays = restSenddays;
	}
	public String getRestEffectivedays() {
		return restEffectivedays;
	}
	public void setRestEffectivedays(String restEffectivedays) {
		this.restEffectivedays = restEffectivedays;
	}
	public String getCustomName() {
		return customName;
	}
	public void setCustomName(String customName) {
		this.customName = customName;
	}
	public String getProjectStage() {
		return projectStage;
	}
	public void setProjectStage(String projectStage) {
		this.projectStage = projectStage;
	}
	public String getReceivableStatus() {
		return receivableStatus;
	}
	public void setReceivableStatus(String receivableStatus) {
		this.receivableStatus = receivableStatus;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSignStartDate() {
		return signStartDate;
	}
	public void setSignStartDate(String signStartDate) {
		this.signStartDate = signStartDate;
	}
	public String getSignEndDate() {
		return signEndDate;
	}
	public void setSignEndDate(String signEndDate) {
		this.signEndDate = signEndDate;
	}
	public String getLaborPrice() {
		return laborPrice;
	}
	public void setLaborPrice(String laborPrice) {
		this.laborPrice = laborPrice;
	}
	public String getFreeservicePeriod() {
		return freeservicePeriod;
	}
	public void setFreeservicePeriod(String freeservicePeriod) {
		this.freeservicePeriod = freeservicePeriod;
	}
	public String getCostserviceTime() {
		return costserviceTime;
	}
	public void setCostserviceTime(String costserviceTime) {
		this.costserviceTime = costserviceTime;
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
	public String getContractNo() {
		return contractNo;
	}
	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}
	public String getSignedDate() {
		return signedDate;
	}
	public void setSignedDate(String signedDate) {
		this.signedDate = signedDate;
	}
	public String getBelongCustomerid() {
		return belongCustomerid;
	}
	public void setBelongCustomerid(String belongCustomerid) {
		this.belongCustomerid = belongCustomerid;
	}
	public String getBelongProduct() {
		return belongProduct;
	}
	public void setBelongProduct(String belongProduct) {
		this.belongProduct = belongProduct;
	}
	public String getContractTitle() {
		return contractTitle;
	}
	public void setContractTitle(String contractTitle) {
		this.contractTitle = contractTitle;
	}
	public String getContractAmount() {
		return contractAmount;
	}
	public void setContractAmount(String contractAmount) {
		this.contractAmount = contractAmount;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getEffectiveDate() {
		return effectiveDate;
	}
	public void setEffectiveDate(String effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	public String getFreeLimit() {
		return freeLimit;
	}
	public void setFreeLimit(String freeLimit) {
		this.freeLimit = freeLimit;
	}
	public String getGiveDay() {
		return giveDay;
	}
	public void setGiveDay(String giveDay) {
		this.giveDay = giveDay;
	}
	public String getPaymentRemark() {
		return paymentRemark;
	}
	public void setPaymentRemark(String paymentRemark) {
		this.paymentRemark = paymentRemark;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public String getContractStatus() {
		return contractStatus;
	}
	public void setContractStatus(String contractStatus) {
		this.contractStatus = contractStatus;
	}
	public String getExamineBy() {
		return examineBy;
	}
	public void setExamineBy(String examineBy) {
		this.examineBy = examineBy;
	}
	public String getExamineDate() {
		return examineDate;
	}
	public void setExamineDate(String examineDate) {
		this.examineDate = examineDate;
	}
	
}
