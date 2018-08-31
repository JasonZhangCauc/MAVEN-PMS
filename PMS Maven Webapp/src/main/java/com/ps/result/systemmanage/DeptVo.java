package com.ps.result.systemmanage;

import com.ps.result.common.PageParaVo;

/** 
 * @Description: 部门实体类
 * @author：		 ZHOUMIN
 * @date：		 2018-03-06 
 */
public class DeptVo extends PageParaVo<DeptVo>{

	private String deptPid;				//父级ID
	private String deptPName; 			//父级部门名称
	private String deptName;			//部门名称
	private String deptFlag;			//部门状态
	private String updateBy;			//修改人
	private String updateDate;			//修改时间
	private boolean checked; 			//是否选中
	private boolean nocheck;			//不选中
	private String name;
	private String pId;
	private String isUser;				//是否用户
	
	public String getIsUser() {
		return isUser;
	}

	public void setIsUser(String isUser) {
		this.isUser = isUser;
	}

	//初始化
	public DeptVo(){}
	
	//带参数初始化
	public DeptVo(String id, String pid, String name){
		this.setId(id);
		this.setpId(deptPid);
		this.setName(deptName);
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getDeptPid() {
		return deptPid;
	}
	public void setDeptPid(String deptPid) {
		this.deptPid = deptPid;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
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
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public boolean isNocheck() {
		return nocheck;
	}

	public void setNocheck(boolean nocheck) {
		this.nocheck = nocheck;
	}

	public String getDeptPName() {
		return deptPName;
	}

	public void setDeptPName(String deptPName) {
		this.deptPName = deptPName;
	}

	public String getDeptFlag() {
		return deptFlag;
	}

	public void setDeptFlag(String deptFlag) {
		this.deptFlag = deptFlag;
	}
}
