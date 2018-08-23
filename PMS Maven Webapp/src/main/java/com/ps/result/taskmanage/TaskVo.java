package com.ps.result.taskmanage;

import com.ps.result.common.PageParaVo;
/** 
 *@Description: 任务VO
 * @author：		ZHOUMIN
 * @date：		2018-03-15 
 */
public class TaskVo extends PageParaVo<TaskVo>{

	private String originator;			//任务发起人
	private String recipient;			//任务接收人
	private String reqFinitionDate;		//要求完成日期
	private String emergency;			//紧急程度 0一般1紧急
	private String taskDesc;			//任务描述
	private String feedback;			//反馈情况
	private String isClose;				//是否关闭 0否 1是
	private String closeDate;			//关闭日期
	private String remarks;				//备注
	private String updateBy;			//修改人
	private String updateDate;			//修改时间
	private String status;				//状态 0有效1无效
	private String sendStatus;			//发送状态 0未发送 1已发送
	private String reqFinitionBeginDate;//要求开始完成日期
	private String reqFinitionEndDate;	//要求接送完成日期
	private String recipientName;		//任务发起人名称
	private String originatorName;		//任务接收人名称
	
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getOriginatorName() {
		return originatorName;
	}
	public void setOriginatorName(String originatorName) {
		this.originatorName = originatorName;
	}
	public String getReqFinitionBeginDate() {
		return reqFinitionBeginDate;
	}
	public void setReqFinitionBeginDate(String reqFinitionBeginDate) {
		this.reqFinitionBeginDate = reqFinitionBeginDate;
	}
	public String getReqFinitionEndDate() {
		return reqFinitionEndDate;
	}
	public void setReqFinitionEndDate(String reqFinitionEndDate) {
		this.reqFinitionEndDate = reqFinitionEndDate;
	}
	public String getOriginator() {
		return originator;
	}
	public void setOriginator(String originator) {
		this.originator = originator;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getReqFinitionDate() {
		return reqFinitionDate;
	}
	public void setReqFinitionDate(String reqFinitionDate) {
		this.reqFinitionDate = reqFinitionDate;
	}
	public String getEmergency() {
		return emergency;
	}
	public void setEmergency(String emergency) {
		this.emergency = emergency;
	}
	public String getTaskDesc() {
		return taskDesc;
	}
	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public String getIsClose() {
		return isClose;
	}
	public void setIsClose(String isClose) {
		this.isClose = isClose;
	}
	public String getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSendStatus() {
		return sendStatus;
	}
	public void setSendStatus(String sendStatus) {
		this.sendStatus = sendStatus;
	}
}
