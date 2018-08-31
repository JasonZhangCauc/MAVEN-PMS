package com.ps.result.systemmanage;

import com.ps.result.common.PageParaVo;

/**
 * @Description: 系统日志输出实体类
 * @author: 	 HuangPeng
 * @date: 		 2017年7月28日
 */
public class SystemLogerVo extends PageParaVo<SystemLogerVo>{
	
	private String operateBy;			//操作人ID
	private String operateName;			//操作人名称
	private String operateDeptName;		//操作部门
	private String operateTime;			//操作时间
	private String functionModule;		//功能模块id
	private String functionModuleName;	//功能模块名称
	private String operateClass;		//类名
	private String operateMethod;		//方法名
	private String errorInfo;			//错误信息
	private String operateBeginDate;	//操作开始时间
	private String operateEndDate;		//操作结束时间
	
	public String getOperateBy() {
		return operateBy;
	}
	public void setOperateBy(String operateBy) {
		this.operateBy = operateBy;
	}
	public String getOperateName() {
		return operateName;
	}
	public void setOperateName(String operateName) {
		this.operateName = operateName;
	}
	public String getOperateDeptName() {
		return operateDeptName;
	}
	public void setOperateDeptName(String operateDeptName) {
		this.operateDeptName = operateDeptName;
	}
	public String getFunctionModule() {
		return functionModule;
	}
	public void setFunctionModule(String functionModule) {
		this.functionModule = functionModule;
	}
	public String getFunctionModuleName() {
		return functionModuleName;
	}
	public void setFunctionModuleName(String functionModuleName) {
		this.functionModuleName = functionModuleName;
	}
	public String getOperateClass() {
		return operateClass;
	}
	public void setOperateClass(String operateClass) {
		this.operateClass = operateClass;
	}
	public String getOperateMethod() {
		return operateMethod;
	}
	public void setOperateMethod(String operateMethod) {
		this.operateMethod = operateMethod;
	}
	public String getErrorInfo() {
		return errorInfo;
	}
	public void setErrorInfo(String errorInfo) {
		this.errorInfo = errorInfo;
	}
	public String getOperateTime() {
		return operateTime;
	}
	public void setOperateTime(String operateTime) {
		this.operateTime = operateTime;
	}
	public String getOperateBeginDate() {
		return operateBeginDate;
	}
	public void setOperateBeginDate(String operateBeginDate) {
		this.operateBeginDate = operateBeginDate;
	}
	public String getOperateEndDate() {
		return operateEndDate;
	}
	public void setOperateEndDate(String operateEndDate) {
		this.operateEndDate = operateEndDate;
	}
}
