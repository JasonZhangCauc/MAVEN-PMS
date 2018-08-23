package com.ps.result.contractmanage;

import com.ps.result.common.PageParaVo;

/** 
 * @Description: 收款节点VO
 * @author：		raomingyi
 * @date：		2018-03-19 
 */
public class ReceiveNodeVo extends PageParaVo<ReceiveNodeVo>{
	
	private String updateBy;			//修改人
	private String updateDate;			//修改时间
	private String receivablesNo;			//收款节点编号
	private String receivablesName;			//收款节点名称
	private String projectStage;			//项目阶段   数据来源于字典维护
	private String receivableAmount;			//应收金额
	private String receivableDate;			//收款时间
	private String receivableStatus;			//收款状态  数据来源于字典维护
	private String responsibleBy;			//负责人id
	private String responsibleName;		//负责人姓名
	private String billingDate;			//开票时间
	private String billingBy;			//开票人
	private String paymentRemark;			//付款说明
	private String createBy;			//录入人
	private String createDate;			//录入日期
	private String contractId;			//合同ID
	private String belongProduct;			//所属产品
	private String belongCustomerid;     //所属客户
	
	
	public String getResponsibleName() {
		return responsibleName;
	}
	public void setResponsibleName(String responsibleName) {
		this.responsibleName = responsibleName;
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
	public String getReceivablesNo() {
		return receivablesNo;
	}
	public void setReceivablesNo(String receivablesNo) {
		this.receivablesNo = receivablesNo;
	}
	public String getReceivablesName() {
		return receivablesName;
	}
	public void setReceivablesName(String receivablesName) {
		this.receivablesName = receivablesName;
	}
	public String getProjectStage() {
		return projectStage;
	}
	public void setProjectStage(String projectStage) {
		this.projectStage = projectStage;
	}
	public String getReceivableAmount() {
		return receivableAmount;
	}
	public void setReceivableAmount(String receivableAmount) {
		this.receivableAmount = receivableAmount;
	}
	public String getReceivableDate() {
		return receivableDate;
	}
	public void setReceivableDate(String receivableDate) {
		this.receivableDate = receivableDate;
	}
	public String getReceivableStatus() {
		return receivableStatus;
	}
	public void setReceivableStatus(String receivableStatus) {
		this.receivableStatus = receivableStatus;
	}
	public String getResponsibleBy() {
		return responsibleBy;
	}
	public void setResponsibleBy(String responsibleBy) {
		this.responsibleBy = responsibleBy;
	}
	public String getBillingDate() {
		return billingDate;
	}
	public void setBillingDate(String billingDate) {
		this.billingDate = billingDate;
	}
	public String getBillingBy() {
		return billingBy;
	}
	public void setBillingBy(String billingBy) {
		this.billingBy = billingBy;
	}
	public String getPaymentRemark() {
		return paymentRemark;
	}
	public void setPaymentRemark(String paymentRemark) {
		this.paymentRemark = paymentRemark;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getContractId() {
		return contractId;
	}
	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
		
}
