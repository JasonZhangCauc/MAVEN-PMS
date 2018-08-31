package com.ps.result.common;

import java.io.Serializable;

/**
 * 查询条件参数继承该类
 * @author WB010
 */
public class PageBaseVo implements Serializable{
	private static final long serialVersionUID = 1L;
	//公共信息
	private String id;					//主键
	private String startTime;           //开始时间
	private String endTime;             //结束时间 	
	//创建人信息
	private String createBy;			//创建人
	private String createDate;			//创建时间
	private String createDept;			//创建部门
	private String createByName;		//创建人姓名
	private String createDeptName;		//创建部门名称
	//权限参数
	private String userId; //用户ID
	private String deptId; //部门ID
	private Integer authority; //权限 1：查看本人  2：查看本单位 3：查看所有
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public String getCreateDept() {
		return createDept;
	}
	public void setCreateDept(String createDept) {
		this.createDept = createDept;
	}
	public String getCreateByName() {
		return createByName;
	}
	public void setCreateByName(String createByName) {
		this.createByName = createByName;
	}
	public String getCreateDeptName() {
		return createDeptName;
	}
	public void setCreateDeptName(String createDeptName) {
		this.createDeptName = createDeptName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public Integer getAuthority() {
		return authority;
	}
	public void setAuthority(Integer authority) {
		this.authority = authority;
	}
}
