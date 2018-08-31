package com.ps.result.systemmanage;

import com.ps.result.common.PageBaseVo;

/** 
 *@Description: 相关方管理VO
 * @author：		邵国松
 * @date：		2017-08-29
 */
public class CorrelationManagerVo extends PageBaseVo{
	private static final long serialVersionUID = 1L;

	private String id;							//主键
	private String correlationUnit;				//单位名称
	private String correlationCorporateman;		//法人代表
	private String correlationContactphone;		//联系电话
	private String contractDutydepartment;		//责任部门（准入和合约管理部门）
	private String contractDutymodule;			//责任模块（准入和合约管理部门）
	private String contractDutypeople;			//责任人（准入和合约管理部门）
	private String safeDutydepartment;			//责任部门（安全监管）
	private String safeDutymodule;				//责任模块（安全监管）
	private String safeDutypeople;				//责任人（安全监管）
	private String protocolDutydepartment;		//责任部门（合约/协议兑现）
	private String protocolDutymodule;			//责任模块（合约/协议兑现）
	private String protocolDutypeople;			//责任人（合约/协议兑现）
	private String createBy;					//创建人
	private String createDept;					//创建部门
	private String createDate;					//创建时间
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCorrelationUnit() {
		return correlationUnit;
	}
	public void setCorrelationUnit(String correlationUnit) {
		this.correlationUnit = correlationUnit;
	}
	public String getCorrelationCorporateman() {
		return correlationCorporateman;
	}
	public void setCorrelationCorporateman(String correlationCorporateman) {
		this.correlationCorporateman = correlationCorporateman;
	}
	public String getCorrelationContactphone() {
		return correlationContactphone;
	}
	public void setCorrelationContactphone(String correlationContactphone) {
		this.correlationContactphone = correlationContactphone;
	}
	public String getContractDutydepartment() {
		return contractDutydepartment;
	}
	public void setContractDutydepartment(String contractDutydepartment) {
		this.contractDutydepartment = contractDutydepartment;
	}
	public String getContractDutymodule() {
		return contractDutymodule;
	}
	public void setContractDutymodule(String contractDutymodule) {
		this.contractDutymodule = contractDutymodule;
	}
	public String getContractDutypeople() {
		return contractDutypeople;
	}
	public void setContractDutypeople(String contractDutypeople) {
		this.contractDutypeople = contractDutypeople;
	}
	public String getSafeDutydepartment() {
		return safeDutydepartment;
	}
	public void setSafeDutydepartment(String safeDutydepartment) {
		this.safeDutydepartment = safeDutydepartment;
	}
	public String getSafeDutymodule() {
		return safeDutymodule;
	}
	public void setSafeDutymodule(String safeDutymodule) {
		this.safeDutymodule = safeDutymodule;
	}
	public String getSafeDutypeople() {
		return safeDutypeople;
	}
	public void setSafeDutypeople(String safeDutypeople) {
		this.safeDutypeople = safeDutypeople;
	}
	public String getProtocolDutydepartment() {
		return protocolDutydepartment;
	}
	public void setProtocolDutydepartment(String protocolDutydepartment) {
		this.protocolDutydepartment = protocolDutydepartment;
	}
	public String getProtocolDutymodule() {
		return protocolDutymodule;
	}
	public void setProtocolDutymodule(String protocolDutymodule) {
		this.protocolDutymodule = protocolDutymodule;
	}
	public String getProtocolDutypeople() {
		return protocolDutypeople;
	}
	public void setProtocolDutypeople(String protocolDutypeople) {
		this.protocolDutypeople = protocolDutypeople;
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
	
}
