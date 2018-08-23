package com.ps.result.systemmanage;

import com.ps.result.common.PageParaVo;


/**
 * @Description: 角色实体类
 * @author: WB083
 * @date: 2017年8月24日
 */
public class RoleVo extends PageParaVo<RoleVo>{
	
	private String roleCode;			//角色标识码
	private String roleCname;			//角色中文名
	private String roleEname;			//角色英文名
	private String roleName;			//角色名称
	private String roleFlag;			//角色是否状态 0 是 1 否
	private String roleDesc;			//角色描述
	private String updateBy;			//更新人
	private String updateDate;			//更新时间
	private String flag;				//角色是否选中
	private String userId;
	private String id;					//角色id
	private String userType;			//用户类别 0:用户、1:客户
	
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getRoleCname() {
		return roleCname;
	}
	public void setRoleCname(String roleCname) {
		this.roleCname = roleCname;
	}
	public String getRoleEname() {
		return roleEname;
	}
	public void setRoleEname(String roleEname) {
		this.roleEname = roleEname;
	}
	public String getRoleFlag() {
		return roleFlag;
	}
	public void setRoleFlag(String roleFlag) {
		this.roleFlag = roleFlag;
	}
	public String getRoleDesc() {
		return roleDesc;
	}
	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
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
