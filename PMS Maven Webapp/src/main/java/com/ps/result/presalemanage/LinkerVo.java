package com.ps.result.presalemanage;
import com.ps.result.common.PageParaVo;
/** 
 *@Description: 客户联系人VO
 * @author：		raomingyi
 * @date：		2018-03-02 
 */
public class LinkerVo extends PageParaVo<LinkerVo>{

	private String updateBy;			//更新人
	private String updateDate;			//更新时间
	private String email;			//邮箱
	private String qqCard;			//qq号
	private String remark;			//描述
	private String createBy;			//录入人
	private String createDate;			//录入日期
	private String status;			//状态 0有效 1无效
	private String customerId;			//客户ID
	private String contactName;			//联系人姓名
	private String mobilePhone;			//移动电话
	private String positionDescribe;			//职务描述
	private String fixedPhone;			//固定电话
	private String customerIdNew;//新增联系人传递客户id
	private String customName; 			//客户名称
	private String contactCustome;			//查询以客户为主还是联系人为主
	
	public String getContactCustome() {
		return contactCustome;
	}
	public void setContactCustome(String contactCustome) {
		this.contactCustome = contactCustome;
	}
	public String getCustomName() {
		return customName;
	}
	public void setCustomName(String customName) {
		this.customName = customName;
	}
	public String getCustomerIdNew() {
		return customerIdNew;
	}
	public void setCustomerIdNew(String customerIdNew) {
		this.customerIdNew = customerIdNew;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQqCard() {
		return qqCard;
	}
	public void setQqCard(String qqCard) {
		this.qqCard = qqCard;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getPositionDescribe() {
		return positionDescribe;
	}
	public void setPositionDescribe(String positionDescribe) {
		this.positionDescribe = positionDescribe;
	}
	public String getFixedPhone() {
		return fixedPhone;
	}
	public void setFixedPhone(String fixedPhone) {
		this.fixedPhone = fixedPhone;
	}
	
}
