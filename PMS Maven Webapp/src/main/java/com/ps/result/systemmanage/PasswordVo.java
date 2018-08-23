package com.ps.result.systemmanage;

import java.io.Serializable;

/**
 * @Description: 密码信息实体类
 * @author: HuangPeng
 * @date: 2017年7月28日
 */
public class PasswordVo implements Serializable {
	
	private static final long serialVersionUID = -7780679957569654380L;
	private String oldPassword;  //旧密码
	private String newPassword;  //新密码
	private String confirmPass;  //确认密码
	private String userId;       //用户id
	private String loginPassword;//登录密码
	
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getConfirmPass() {
		return confirmPass;
	}
	public void setConfirmPass(String confirmPass) {
		this.confirmPass = confirmPass;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	
	
}	
