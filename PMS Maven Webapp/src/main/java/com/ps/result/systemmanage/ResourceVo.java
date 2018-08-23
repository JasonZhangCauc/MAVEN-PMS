package com.ps.result.systemmanage;

import java.io.Serializable;
import java.util.List;

/**
 * @Description: 资源信息实体类
 * @author: HuangPeng
 * @date: 2017年7月28日
 */
public class ResourceVo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String id;             //资源id
	private String resourceCode;   //资源标识码
	private String resourceUrl;    //资源路径
	private String resourceType;   //类型
	private String resourceDescch; //资源中文名
	private String resourceDescen; //资源英文名
	private String pId;    //父级id
	private String resourceIcon;   //图标
	private String resourceIsshow; //是否显示
	private String resourceOrder;  //资源排序
	private String roleId;         //角色id
	private List<String> operations; 
	private List<ResourceVo> resourceList;//用户二级菜单
	private String name;
	
	public ResourceVo() {}
	
    public ResourceVo(String resourceUrl, String roleId) {
		this.resourceUrl = resourceUrl;
		this.roleId = roleId;
	}
    
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getResourceUrl() {
		return resourceUrl;
	}

	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}

	public String getResourceType() {
		return resourceType;
	}

	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}

	public String getResourceDescch() {
		return resourceDescch;
	}

	public void setResourceDescch(String resourceDescch) {
		this.resourceDescch = resourceDescch;
	}

	public String getResourceDescen() {
		return resourceDescen;
	}

	public void setResourceDescen(String resourceDescen) {
		this.resourceDescen = resourceDescen;
	}
	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public List<String> getOperations() {
		return operations;
	}

	public void setOperations(List<String> operations) {
		this.operations = operations;
	}

	public String getResourceCode() {
		return resourceCode;
	}

	public void setResourceCode(String resourceCode) {
		this.resourceCode = resourceCode;
	}

	public String getResourceIcon() {
		return resourceIcon;
	}

	public void setResourceIcon(String resourceIcon) {
		this.resourceIcon = resourceIcon;
	}

	public List<ResourceVo> getResourceList() {
		return resourceList;
	}

	public void setResourceList(List<ResourceVo> resourceList) {
		this.resourceList = resourceList;
	}

	public String getResourceIsshow() {
		return resourceIsshow;
	}

	public void setResourceIsshow(String resourceIsshow) {
		this.resourceIsshow = resourceIsshow;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getResourceOrder() {
		return resourceOrder;
	}

	public void setResourceOrder(String resourceOrder) {
		this.resourceOrder = resourceOrder;
	}
	
}
