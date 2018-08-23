package com.aop.exception;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.ps.result.systemmanage.SystemLogerVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.systemmanage.ILogerManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.AppUtil;
/**
 * @Description:    异常处理方式
 * @author:         011770
 * @date:           2018年2月5日
 */
public class ExceptionHandler implements HandlerExceptionResolver {
	
	private Logger logger=Logger.getLogger(ExceptionHandler.class);
	
	@Autowired
	private ILogerManagerService logerManagerService;
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception exp) {
		String message = "";
		
		if (exp instanceof AccessDeniedException) {
			message = getMessage("exception.accessdeniedexception");
		} else if (exp instanceof PermissionDeniedException) {
			message = getMessage("exception.permissiondeniedexception");
		} else if (exp instanceof NullPointerException) {
			message = getMessage("exception.nullpointerexception");
		} else if(exp instanceof BussinessException){
			message = ((BussinessException) exp).getExceptionMessage();
		} else if(exp instanceof NoSuchMethodException){
			message = "NoSuchMethodException";
		}else if(exp instanceof SecurityException){
			message = "SecurityException";
		}else if(exp instanceof ClassNotFoundException){
			message = "ClassNotFoundException";
		}else if(exp instanceof IllegalAccessException){
			message = "IllegalAccessException";
		}else if(exp instanceof IllegalArgumentException){
			message = "IllegalArgumentException";
		}else if(exp instanceof InvocationTargetException){
			message = "InvocationTargetException";
		}else if(exp instanceof AuthenticationServiceException){
			message=((AuthenticationServiceException) exp).getMessage();
		}else {
		   String msg = exp.getMessage();
		  if(StringUtils.isNotEmpty(msg)){
			  message=msg;
		  }else{
			message = getMessage("exception.syserror");
		  }
		}
		
		//获取用户信息异常时，登出
		if("nologin".equals(message)){
			logger.error("对不起，您的用户已过期！", exp);
			request.getSession().invalidate();
			ModelAndView mav = new ModelAndView("common/login");
			return mav;
		}
		
		logger.error(message, exp);
		
		UserVo userVo = (UserVo) request.getSession().getAttribute("user");
		SystemLogerVo vo = new SystemLogerVo();
		vo.setOperateBy(EncryptPkUtil.decodeId(userVo.getId()));
		vo.setOperateName(userVo.getUserName());
		StackTraceElement[] trace = exp.getStackTrace();
		vo.setOperateClass(trace[0].getClassName());
		vo.setOperateMethod(trace[0].getMethodName());
		StringBuilder sb = new StringBuilder();
		for (StackTraceElement s : trace) {
			sb.append(s);
			sb.append("</br>");
		}
		String mes = sb.toString();
		mes = mes.replaceAll("<", "&lt;");
		mes = mes.replaceAll(">", "&gt;");
		vo.setErrorInfo(mes);
		logerManagerService.saveSystemLog(vo);
		
		String requestType = request.getHeader("X-Requested-With");
		if (requestType != null && requestType.equals("XMLHttpRequest")) {
			// 此请求为ajax请求
			try {
				PrintWriter writer = response.getWriter();
				writer.write(message);
			} catch (IOException e) {
				logger.error(e.getMessage(), e);
			}
			return null;
		} else {
			
			ModelAndView mav = new ModelAndView("common/error");
			if(StringUtils.isEmpty(message)){
				message = "页面出错了";
			}
			request.setAttribute("message", message);
			mav.addObject("message", message);
			return mav;
		}
	}

	/**
	 * 获取国际化文字(不带参数)
	 * 
	 * @author yuanlixin
	 * @param code
	 * 
	 */
	public String getMessage(String code) {
		String message = "";
		MessageSource messageSource = (MessageSource) AppUtil
				.getBean("messageSource");
		String[] args = null;
		message = messageSource.getMessage(code, args, Locale.CHINA);
		return message;
	}
}
