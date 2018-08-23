package com.util.tool;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
 
/**
 * @Description:    APP
 * @author          HuangPeng
 * @version         1.0.0
 * @date:           2017年4月15日
 */
public class AppUtil implements ApplicationContextAware {
	public static ApplicationContext ac;
	
	@Override
	public void setApplicationContext(ApplicationContext arg0)
			throws BeansException {
		if(AppUtil.ac==null){
			AppUtil.ac=arg0;
		}
	}
	/**
	 * 返回ApplicationContext实例<br>
	 * @return ApplicationContext实例<br>
	 */
	public static ApplicationContext getApplicationContext(){
		return AppUtil.ac;
	}
	
	/**
	 * 返回ApplicationContext容器维护的bean实例<br>
	 * @param beanName bean的标识<br>
	 * @return 需要获取的bean实例<br>
	 */
	public static Object getBean(String beanName){
		return AppUtil.ac.getBean(beanName);
	}
	/**
	 * 获取HttpServletRequest请求对象
	 * @return HttpServletRequest
	 * @author shuchang
	 * @date 2016年8月22日
	 */
	public static HttpServletRequest getHttpServletRequest (){
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}
	
	/**
	 * 获取应用服务器物理路径
	 * @return String
	 * @author shuchang
	 * @date 2016年8月22日
	 */
	public static String getServletContextPath (){
		return getHttpServletRequest().getServletContext().getRealPath("");
	}
	
}
