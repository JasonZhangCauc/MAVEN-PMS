package com.util.coder;

import org.apache.commons.lang.StringUtils;

import com.spring.SpringEncryptor;

/**
 * @Description:    EncryptPk加解密工具类
 * @author          HuangPeng
 * @date:           2017年4月15日
 */
@SuppressWarnings("all")
public class EncryptPkUtil {
	private static SpringEncryptor sEncryptor = null;
	//解密
	public static String decodeId(String id) {
		if (sEncryptor == null) {
			sEncryptor = new SpringEncryptor();
		}
		if(StringUtils.isNotEmpty(id)){
			id = sEncryptor.decode(id);
		}
		return id;
	}
    //加密
	public static String encodeId(String id) {
		if (sEncryptor == null) {
			sEncryptor = new SpringEncryptor();
		}
		if(StringUtils.isNotEmpty(id)){
			id = sEncryptor.encode(id);
		}
		return id;
	}
	//解密(数字)
	public static String decodeNum(String id) {
		if (sEncryptor == null) {
			sEncryptor = new SpringEncryptor();
		}
		if(!id.matches("[0-9]+")){
			id = sEncryptor.decode(id);
		}
		return id;
	}
    //加密(数字)
	public static String encodeNum(String id) {
		if (sEncryptor == null) {
			sEncryptor = new SpringEncryptor();
		}
		if(id.matches("[0-9]+")){
			id = sEncryptor.encode(id);
		}
		return id;
	}
}
