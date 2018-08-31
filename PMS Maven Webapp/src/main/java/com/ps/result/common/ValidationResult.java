package com.ps.result.common;

import java.util.Map;

/**
 * @Description  校验实体返回结果  
 * @author zhujiejie
 * @date  2017年9月1日
 */
public class ValidationResult {

	//校验结果是否有错
	private boolean hasErrors;
	
	//校验错误信息
	private Map<String,String> errorMsg;

	public boolean isHasErrors() {
		return hasErrors;
	}

	public void setHasErrors(boolean hasErrors) {
		this.hasErrors = hasErrors;
	}

	public Map<String, String> getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(Map<String, String> errorMsg) {
		this.errorMsg = errorMsg;
	}

	@Override
	public String toString() {
		return "ValidationResult [hasErrors=" + hasErrors + ", errorMsg="
				+ errorMsg + "]";
	}

}
