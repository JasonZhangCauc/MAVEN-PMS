package com.ps.result.systemmanage;

import java.io.Serializable;

/**
 * @Description: 用户与角色关联实体类
 * @author: WB083
 * @date: 2017年8月24日
 */
public class UserRoleVo implements Serializable{
	
	private static final long serialVersionUID = -4239194759789256956L;
	private String roleId;//角色ID
	private String userId;//用户ID
	
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
