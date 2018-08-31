package com.aop.exception;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.util.tool.AppUtil;
 
/**
 * @Description:    获取国际化文件
 * @author:         011770
 * @date:           2018年2月5日
 */
public class BussinessExceptionBean {

	private String errorMessage;

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public BussinessExceptionBean(String errorCode) {
		setErrorMessage(getMessage(errorCode));
	}

	public BussinessExceptionBean(String errorCode, String[] args) {
		setErrorMessage(getMessage(errorCode, args));
	}

	/**
	 * @Description: 获取国际化文字(不带参数)
	 * @author       HuangPeng
	 * @param        code
	 */
	private String getMessage(String code) {

		return getMessage(code, null);
	}

	/**
	 * @Description: 获取国际化文字(带参数)
	 * @author:      HuangPeng
	 * @date:        2017年4月15日
	 */
	private String getMessage(String code, String[] args) {
		HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		Object language= request.getSession().getAttribute("language");
		String message = "";
		MessageSource messageSource = (MessageSource) AppUtil
				.getBean("messageSource");
		if(language!=null && language.toString().equals("zh")){
        	message = messageSource.getMessage(code, args, Locale.CHINA);
        }else if(language!=null && language.toString().equals("en")){
        	message = messageSource.getMessage(code, args, Locale.US);
        }else{
        	message = messageSource.getMessage(code, args, Locale.CHINA);
        }
		return message;
	}
}
