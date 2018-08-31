package com.ps.result.common;

/**
 * @Description: RSA算法加密实体类
 * @author: HuangPeng
 * @date: 2017年4月15日
 */
public class RSAkeyVo {

	private String modules;
	private String exponent;

	public RSAkeyVo(String modules, String exponent) {
		super();
		this.modules = modules;
		this.exponent = exponent;
	}

	public String getModules() {
		return modules;
	}

	public void setModules(String modules) {
		this.modules = modules;
	}

	public String getExponent() {
		return exponent;
	}

	public void setExponent(String exponent) {
		this.exponent = exponent;
	}

}
