package com.ps.result.presalemanage;

import com.ps.result.common.PageParaVo;

/** 
 *@Description: 销售活动VO
 * @author：		raomingyi
 * @date：		2018-03-02 
 */
public class SalesActivityVo extends PageParaVo<SalesActivityVo>{

	private String updateBy;			//更新人
	private String updateDate;			//更新日期
	private String id;			//销售活动ID
	private String salesprojectId;			//销售项目ID
	private String activityBegindate;			//活动开始时间
	private String activityEnddate;			//活动结束时间
	private String activityName;			//活动名称 
	private String activityType;			//活动类型 来源于字典维护
	private String salesPersonnelId;			//销售人员ID
	private String salesPersonnelNames;			//销售人员姓名
	private String customerBehalf;			//客户代表
	private String activityDescribe;			//活动描述
	private String activityResults;			//活动成果
	private String remark;			//备注
	private String createBy;			//录入人
	private String createDate;			//录入日期
	private String status;			//状态：0有效 1无效
	private String activityTypeStr;	//活动状态中文
	private String userPic;		//录入人头像
	
	
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public String getActivityTypeStr() {
		return activityTypeStr;
	}
	public void setActivityTypeStr(String activityTypeStr) {
		this.activityTypeStr = activityTypeStr;
	}
	public String getSalesPersonnelNames() {
		return salesPersonnelNames;
	}
	public void setSalesPersonnelNames(String salesPersonnelNames) {
		this.salesPersonnelNames = salesPersonnelNames;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSalesprojectId() {
		return salesprojectId;
	}
	public void setSalesprojectId(String salesprojectId) {
		this.salesprojectId = salesprojectId;
	}
	public String getActivityBegindate() {
		return activityBegindate;
	}
	public void setActivityBegindate(String activityBegindate) {
		this.activityBegindate = activityBegindate;
	}
	public String getActivityEnddate() {
		return activityEnddate;
	}
	public void setActivityEnddate(String activityEnddate) {
		this.activityEnddate = activityEnddate;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public String getActivityType() {
		return activityType;
	}
	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}
	public String getSalesPersonnelId() {
		return salesPersonnelId;
	}
	public void setSalesPersonnelId(String salesPersonnelId) {
		this.salesPersonnelId = salesPersonnelId;
	}
	public String getCustomerBehalf() {
		return customerBehalf;
	}
	public void setCustomerBehalf(String customerBehalf) {
		this.customerBehalf = customerBehalf;
	}
	public String getActivityDescribe() {
		return activityDescribe;
	}
	public void setActivityDescribe(String activityDescribe) {
		this.activityDescribe = activityDescribe;
	}
	public String getActivityResults() {
		return activityResults;
	}
	public void setActivityResults(String activityResults) {
		this.activityResults = activityResults;
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
	
}
