package com.ps.result.systemmanage;

import java.util.List;

import com.ps.result.common.PageParaVo;

/**
 * @Description: 用户实体类
 * @author: HuangPeng
 * @date: 2017年7月28日
 */
public class UserVo extends PageParaVo<UserVo>{
	private String userAccount;			//用户账户
	private String userName;			//用户姓名
	private String userPassword;		//用户密码
	private String userSex;				//用户性别 0女 1男
	private String userEmail;			//用户邮箱
	private String userLanguage;		//用户语言 0 中文 1 英文
	private String userPhone;			//固定电话
	private String userPlace;           //籍贯
	private String userFace;			//政治面貌
	private String userRecord;			//学历
	private String diplomaSchool;		//毕业院校
	private String diplomaDate; 		//毕业时间
	private String userAddress;			//用户地址
	private String userIdcard;			//用户身份证号
	private String userPic;				//用户头像
	private String deptId;				//用户部门ID
	private String userFlag;			//用户状态 1激活 0禁止
	private String userCount;			//用户登录次数
	private String userRemark;			//用户备注
	private String userPosition;		//岗位
	private String userAge;				//年龄
	private String userBirth;			//出生日期
	private String entryDate;			//入职日期
	private String userMobile;			//手机
	private String userRemake;			//备注
	private String updateBy;			//更新人
	private String updateDate; 			//更新日期
	private List<ResourceVo> resources;//用户资源
	private List<String> roleList;     //用户角色
	private String flag;			    //状态
	private String userNature;			//用户性质
	private String userIp;				//用户ip
	private String userType;			//用户类别0 用户 1客户
	private String contactId;			//联系人id
	private String userId;				//用户id
	private String roleId;				//角色id
	private String radio;				//是否只差项目经理岗位
	private String toDivision;			//部门id
	
	/**
	 * @Description: 辅助字段
	 * @author: 006492
	 * @date: 2017-8-24
	 */
	private String deptName;     		//用户部门名称
	private String userModuleName;		//用户模块名称
	
	public String getToDivision() {
		return toDivision;
	}
	public void setToDivision(String toDivision) {
		this.toDivision = toDivision;
	}
	public String getRadio() {
		return radio;
	}
	public void setRadio(String radio) {
		this.radio = radio;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getContactId() {
		return contactId;
	}
	public void setContactId(String contactId) {
		this.contactId = contactId;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public boolean hasAuth(String menuId,String auth){
		boolean has = false;
		for(ResourceVo resource:resources){
			if(String.valueOf(resource.getpId()).equals(menuId) 
			   && auth.equals(resource.getResourceUrl())){
				has = true;
				break;
			}
		}
		return has;
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

	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserIdcard() {
		return userIdcard;
	}
	public void setUserIdcard(String userIdcard) {
		this.userIdcard = userIdcard;
	}
	public String getUserRemark() {
		return userRemark;
	}
	public void setUserRemark(String userRemark) {
		this.userRemark = userRemark;
	}
	public String getUserLanguage() {
		return userLanguage;
	}
	public void setUserLanguage(String userLanguage) {
		this.userLanguage = userLanguage;
	}
	public List<ResourceVo> getResources() {
		return resources;
	}
	public void setResources(List<ResourceVo> resources) {
		this.resources = resources;
	}
	public List<String> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<String> roleList) {
		this.roleList = roleList;
	}
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getUserFlag() {
		return userFlag;
	}
	public void setUserFlag(String userFlag) {
		this.userFlag = userFlag;
	}
	public String getUserCount() {
		return userCount;
	}
	public void setUserCount(String userCount) {
		this.userCount = userCount;
	}
	public String getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	public String getUserPosition() {
		return userPosition;
	}
	public void setUserPosition(String userPosition) {
		this.userPosition = userPosition;
	}
	public String getUserAge() {
		return userAge;
	}
	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getUserModuleName() {
		return userModuleName;
	}
	public void setUserModuleName(String userModuleName) {
		this.userModuleName = userModuleName;
	}
	public String getUserPlace() {
		return userPlace;
	}
	public void setUserPlace(String userPlace) {
		this.userPlace = userPlace;
	}
	public String getUserFace() {
		return userFace;
	}
	public void setUserFace(String userFace) {
		this.userFace = userFace;
	}
	public String getUserRecord() {
		return userRecord;
	}
	public void setUserRecord(String userRecord) {
		this.userRecord = userRecord;
	}
	public String getDiplomaSchool() {
		return diplomaSchool;
	}
	public void setDiplomaSchool(String diplomaSchool) {
		this.diplomaSchool = diplomaSchool;
	}
	public String getDiplomaDate() {
		return diplomaDate;
	}
	public void setDiplomaDate(String diplomaDate) {
		this.diplomaDate = diplomaDate;
	}
	public String getUserRemake() {
		return userRemake;
	}
	public void setUserRemake(String userRemake) {
		this.userRemake = userRemake;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getUserNature() {
		return userNature;
	}
	public void setUserNature(String userNature) {
		this.userNature = userNature;
	}
	public String getUserIp() {
		return userIp;
	}
	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}
	
}
