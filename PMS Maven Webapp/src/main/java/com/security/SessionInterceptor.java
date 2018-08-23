package com.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ps.result.systemmanage.UserVo;

/**
 * @Description:    Session超时拦截
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
public class SessionInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public void afterCompletion(HttpServletRequest req,
			HttpServletResponse rsp, Object obj, Exception e)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse rsp,
			Object obj, ModelAndView mode) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
			UserVo loginUser = (UserVo)request.getSession().getAttribute("user");
			if(loginUser==null){
			    response.setHeader("sessionstatus", "timeout");
			}
		    return true;
	}
}
