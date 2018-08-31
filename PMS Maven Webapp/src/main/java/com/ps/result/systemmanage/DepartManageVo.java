package com.ps.result.systemmanage;

import java.util.List;

import com.ps.result.common.PageBaseVo;

public class DepartManageVo extends PageBaseVo{
	private static final long serialVersionUID = 1L;

	private String id;			//ID
	private String departCname;			//部门名称
	private String departEname;			//英文名称
	private String departSname;			//部门简称
	private String departParentId;		//上级部门ID
	private String departStatus;		//状态 0-启用 1-禁用
	private String createBy;			//创建人
	private String createDept;			//创建部门
	private String createDate;			//创建时间
	private List<ResourceVo> resources; //用户资源
	private String editType;			//操作类型
	private String departId;
	
	
	
	public String getDepartId() {
		return departId;
	}
	public void setDepartId(String departId) {
		this.departId = departId;
	}
	public List<ResourceVo> getResources() {
		return resources;
	}
	public void setResources(List<ResourceVo> resources) {
		this.resources = resources;
	}
	public String getEditType() {
		return editType;
	}
	public void setEditType(String editType) {
		this.editType = editType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDepartCname() {
		return departCname;
	}
	public void setDepartCname(String departCname) {
		this.departCname = departCname;
	}
	public String getDepartEname() {
		return departEname;
	}
	public void setDepartEname(String departEname) {
		this.departEname = departEname;
	}
	public String getDepartSname() {
		return departSname;
	}
	public void setDepartSname(String departSname) {
		this.departSname = departSname;
	}
	public String getDepartParentId() {
		return departParentId;
	}
	public void setDepartParentId(String departParentId) {
		this.departParentId = departParentId;
	}
	public String getDepartStatus() {
		return departStatus;
	}
	public void setDepartStatus(String departStatus) {
		this.departStatus = departStatus;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public String getCreateDept() {
		return createDept;
	}
	public void setCreateDept(String createDept) {
		this.createDept = createDept;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
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
}
