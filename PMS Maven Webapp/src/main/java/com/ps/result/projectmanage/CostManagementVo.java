package com.ps.result.projectmanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 单价管理VO
 * @author：		jczou
 * @date：		2018-02-28 
 */
public class CostManagementVo extends PageParaVo<CostManagementVo>{

	private String supplierId;	//供应商ID
	private String priceType;	//单价类型
	private String price;		//单价
	private String currency;	//币种
	private String beginDate;	//开始日期
	private String endDate;		//结束日期
	private String remark;		//备注
	private String updateBy;	//修改人
	private String updateDate;	//修改时间
	private String startTime;	//有效期开始日期
	private String endTime;		//有效期结束日期
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	public String getPriceType() {
		return priceType;
	}
	public void setPriceType(String priceType) {
		this.priceType = priceType;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	
}
