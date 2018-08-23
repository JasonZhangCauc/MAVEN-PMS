package com.ps.result.systemmanage;

import java.io.Serializable;

/**
 * @Description: 资源与角色关联实体类
 * @author: HuangPeng
 * @date: 2017年7月28日
 */
public class RoleResourcesVo implements Serializable{

	private static final long serialVersionUID = -4239194759789256956L;
	private String roleId;    //角色ID
	private String resourceId;//资源ID
	
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getResourceId() {
		return resourceId;
	}
	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
}
