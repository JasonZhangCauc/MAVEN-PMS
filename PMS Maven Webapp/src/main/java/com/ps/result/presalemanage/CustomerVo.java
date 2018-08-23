package com.ps.result.presalemanage;
import com.ps.result.common.PageParaVo;


/** 
 * @Description: 客户管理VO
 * @author：		raomingyi
 * @date：		2018-03-02 
 */
 
public class CustomerVo extends PageParaVo<CustomerVo>{
	
	private String taxpayerName;			//开票名称
	private String taxpayerNumber;			//纳税人识别号
	private String taxpayerAddress;			//开票地址
	private String taxpayerPhone;			//开票电话
	private String taxpayerBank;			//开户银行
	private String taxpayerAccount;			//开户账号
	private String customShortName;			//客户简称
	private String customName;			    //客户全称
	private String customAddress;			//所在地址
	private String customCode;			    //客户简码
	private String contactPhone;			//联系电话
	private String email;			       	//邮箱
	private String remark;			       	//备注
	private String updateBy;               	//更新人
	private String updateDate;             	//更新日期
	private String linkerName;            	//联系人
	private String status;				  	//客户状态
	private String second;					//客户二字码
	private String customeContact;			//查询以客户为主还是联系人为主
	private String userPic;					//公司log
	
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public String getCustomeContact() {
		return customeContact;
	}
	public void setCustomeContact(String customeContact) {
		this.customeContact = customeContact;
	}
	public String getSecond() {
		return second;
	}
	public void setSecond(String second) {
		this.second = second;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLinkerName() {
		return linkerName;
	}
	public void setLinkerName(String linkerName) {
		this.linkerName = linkerName;
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
	public String getTaxpayerName() {
		return taxpayerName;
	}	
	public void setTaxpayerName(String taxpayerName) {
		this.taxpayerName = taxpayerName;
	}
	
	public String getTaxpayerNumber() {
		return taxpayerNumber;
	}
	public void setTaxpayerNumber(String taxpayerNumber) {
		this.taxpayerNumber = taxpayerNumber;
	}
	public String getTaxpayerAddress() {
		return taxpayerAddress;
	}
	public void setTaxpayerAddress(String taxpayerAddress) {
		this.taxpayerAddress = taxpayerAddress;
	}
	public String getTaxpayerPhone() {
		return taxpayerPhone;
	}
	public void setTaxpayerPhone(String taxpayerPhone) {
		this.taxpayerPhone = taxpayerPhone;
	}
	public String getTaxpayerBank() {
		return taxpayerBank;
	}
	public void setTaxpayerBank(String taxpayerBank) {
		this.taxpayerBank = taxpayerBank;
	}
	public String getTaxpayerAccount() {
		return taxpayerAccount;
	}
	public void setTaxpayerAccount(String taxpayerAccount) {
		this.taxpayerAccount = taxpayerAccount;
	}
	public String getCustomName() {
		return customName;
	}
	public void setCustomName(String customName) {
		this.customName = customName;
	}
	public String getCustomAddress() {
		return customAddress;
	}
	public void setCustomAddress(String customAddress) {
		this.customAddress = customAddress;
	}
	public String getCustomCode() {
		return customCode;
	}
	public void setCustomCode(String customCode) {
		this.customCode = customCode;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCustomShortName() {
		return customShortName;
	}
	public void setCustomShortName(String customShortName) {
		this.customShortName = customShortName;
	}	
}
