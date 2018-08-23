package com.ps.result.presalemanage;
import com.ps.result.common.PageParaVo;




/** 
 *@Description:  销售项目信息VO
 * @author：		raomingyi
 * @date：		2018-03-02 
 */
public class SaleTrackVo extends PageParaVo<SaleTrackVo>{
	
	private String stakeholder;			//干系人
	private String linker;			    //联系人
	private String projectno;			//项目编号
	private String updateBy;			//更新人
	private String updateDate;			//更新日期
	private String decisionMaker;		//项目决策者
	private String id;			         //销售项目ID
	private String customerId;			//客户信息ID
	private String projectName;			//项目名称
	private String saleResponsible;		//项目负责人ID
	private String projectBudget;		//项目预算
	private String currency;			//币种
	private String saleStatus;			//销售状态：0 进行中、1 招标中、2 已中标、3 签约中、4 已签约、5 已取消
	private String remark;			    //备注
	private String createBy;			//录入人
	private String createDate;			//录入日期
	private String belongProduct;       //所属产品
	private String productName;         //产品名称
	private String saleResponsibleName;  //项目负责人姓名
	private String decisionMakerName;   //项目决策者姓名
	private String linkerName;          //联系人姓名
	private String stakeholderName;     //干系人姓名
	private String customerName;        //客户简称
	
	
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getDecisionMakerName() {
		return decisionMakerName;
	}
	public void setDecisionMakerName(String decisionMakerName) {
		this.decisionMakerName = decisionMakerName;
	}
	public String getLinkerName() {
		return linkerName;
	}
	public void setLinkerName(String linkerName) {
		this.linkerName = linkerName;
	}
	public String getStakeholderName() {
		return stakeholderName;
	}
	public void setStakeholderName(String stakeholderName) {
		this.stakeholderName = stakeholderName;
	}
	public String getSaleResponsibleName() {
		return saleResponsibleName;
	}
	public void setSaleResponsibleName(String saleResponsibleName) {
		this.saleResponsibleName = saleResponsibleName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getStakeholder() {
		return stakeholder;
	}
	public void setStakeholder(String stakeholder) {
		this.stakeholder = stakeholder;
	}
	public String getLinker() {
		return linker;
	}
	public void setLinker(String linker) {
		this.linker = linker;
	}
	public String getProjectno() {
		return projectno;
	}
	public void setProjectno(String projectno) {
		this.projectno = projectno;
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
	public String getDecisionMaker() {
		return decisionMaker;
	}
	public void setDecisionMaker(String decisionMaker) {
		this.decisionMaker = decisionMaker;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getSaleResponsible() {
		return saleResponsible;
	}
	public void setSaleResponsible(String saleResponsible) {
		this.saleResponsible = saleResponsible;
	}
	public String getProjectBudget() {
		return projectBudget;
	}
	public void setProjectBudget(String projectBudget) {
		this.projectBudget = projectBudget;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getSaleStatus() {
		return saleStatus;
	}
	public void setSaleStatus(String saleStatus) {
		this.saleStatus = saleStatus;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public String getBelongProduct() {
		return belongProduct;
	}
	public void setBelongProduct(String belongProduct) {
		this.belongProduct = belongProduct;
	}
		
}
