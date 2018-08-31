package com.util.tool;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * @Description:    国际化工具类
 * @author          HuangPeng
 * @date:           2017年4月15日
 */
public class MessageUtil{
	
	private static ResourceBundle resourceBundle;
	
	/**
	 * @Description:获取国际化文字(不带参数)
	 * @author:     HuangPeng
	 * @date:       2017年4月15日
	 */	
	public static String getMessage(String code){
		HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String message="";
		MessageSource messageSource = (MessageSource)AppUtil.getBean("messageSource");
        String[] args = null;
        Object language= request.getSession().getAttribute("language");
        if(language!=null && language.toString().equals("zh")){
        	message = messageSource.getMessage(code, args, Locale.CHINA);
        }else if(language!=null && language.toString().equals("en")){
        	message = messageSource.getMessage(code, args, Locale.US);
        }else{
        	message = messageSource.getMessage(code, args, Locale.CHINA);
        }
        
        return message;
	}
	 
	/**
	 * @Description:获取国际化文字(带参数)
	 * @author:     HuangPeng
	 * @date:       2017年4月15日
	 */	
	public static String getMessage(String code,String[] args){
		HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String message="";
		MessageSource messageSource = (MessageSource)AppUtil.getBean("messageSource");
		Object language= request.getSession().getAttribute("language");
        if(language!=null && language.toString().equals("zh")){
        	message = messageSource.getMessage(code, args, Locale.CHINA);
        }else if(language!=null && language.toString().equals("en")){
        	message = messageSource.getMessage(code, args, Locale.US);
        }else{
        	message = messageSource.getMessage(code, args, Locale.CHINA);
        }
		
        return message;
	}
	
	public static String getSysKey(String code){
		if(resourceBundle==null){
			resourceBundle=ResourceBundle.getBundle("system");
		}
		return resourceBundle.getString(code);
	}
}
