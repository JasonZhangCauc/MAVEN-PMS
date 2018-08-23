package com.base.listener;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;

public class WebContextListener extends org.springframework.web.context.ContextLoaderListener {
	
	private static final Logger logger = Logger.getLogger(WebContextListener.class);
	
	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
		StringBuilder sb = new StringBuilder();
		sb.append("\r\n======================================================================\r\n");
		sb.append("\r\n    欢迎使用内部管理系统PMS   - Powered By http://www.xy.com\r\n");
		sb.append("\r\n======================================================================\r\n");
		logger.info(sb.toString());
		return super.initWebApplicationContext(servletContext);
	}
}
