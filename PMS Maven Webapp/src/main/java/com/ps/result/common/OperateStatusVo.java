package com.ps.result.common;

import java.io.Serializable;

/**
 * @Description: 消息状态实体类
 * @author: HuangPeng
 * @date: 2017年4月15日
 */
public class OperateStatusVo implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
     * 请求成功状态码，200为成功
     */
	private String statusCode;
	/**
	 * navtab id 如果是刷新本页面 该字段写null 如果是刷新多个，中间用逗号隔开
	 */
	private String tabid;
	/**
	 * dialog id 用法同tabid
	 */
	private String dialogid;
	/**
	 * 是否关闭当前页面
	 */
	private boolean closeCurrent;
	/**
	 * 请求成功返回后要跳转的url
	 */
	private String forward;
	/**
	 * 请求成功返回后要跳转url的确认信息
	 */
	private String forwardConfirm;
	/**
	 * 请求成功后附带的自定义对象
	 */
	private Object attachObj;

	public OperateStatusVo() {

	}
	
	/**
	 * 返回数据信息
	 * @param closeCurrent：是否关闭当前页面
	 * @param attachObj：返回的数据
	 * @return
	 */
	public OperateStatusVo returnOperateData(String statusCode,Object attachObj) {
		this.statusCode = statusCode;
		this.attachObj = attachObj;
		return this;
	}
	
	public OperateStatusVo(String statusCode,String tabid,
			String dialogid, boolean closeCurrent, String forward,
			String forwardConfirm, Object attachObj) {
		super();
		this.statusCode = statusCode;
		this.tabid = tabid;
		this.dialogid = dialogid;
		this.closeCurrent = closeCurrent;
		this.forward = forward;
		this.forwardConfirm = forwardConfirm;
		this.attachObj = attachObj;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getTabid() {
		return tabid;
	}

	public void setTabid(String tabid) {
		this.tabid = tabid;
	}

	public String getDialogid() {
		return dialogid;
	}

	public void setDialogid(String dialogid) {
		this.dialogid = dialogid;
	}

	public boolean isCloseCurrent() {
		return closeCurrent;
	}

	public void setCloseCurrent(boolean closeCurrent) {
		this.closeCurrent = closeCurrent;
	}

	public String getForward() {
		return forward;
	}

	public void setForward(String forward) {
		this.forward = forward;
	}

	public String getForwardConfirm() {
		return forwardConfirm;
	}

	public void setForwardConfirm(String forwardConfirm) {
		this.forwardConfirm = forwardConfirm;
	}

	public Object getAttachObj() {
		return attachObj;
	}

	public void setAttachObj(Object attachObj) {
		this.attachObj = attachObj;
	}

}
