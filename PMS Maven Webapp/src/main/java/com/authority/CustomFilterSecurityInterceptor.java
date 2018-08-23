package com.authority;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
 
/**
 * @Description:    
       一个自定义filterSecurityInterceptor
        必须包含authenticationManager, accessDecisionManager,securityMetadataSource三个属性
        用于security拦截，验证用户是否有权限
 * @author:         011770
 * @date:           2017年4月15日
 */
public class CustomFilterSecurityInterceptor extends
		AbstractSecurityInterceptor implements Filter {
	
	private FilterInvocationSecurityMetadataSource securityMetadataSource;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		FilterInvocation fi = new FilterInvocation(request, response, chain);
		invoke(fi);
	}
	
	@Override
	public Class<? extends Object> getSecureObjectClass() {
		//下面的supports方面必须放回true,否则会提醒类型错误
		return FilterInvocation.class;
	}
    //调用accessDecisionManager的decide方法和securityMetadataSource的getAttributes方法
	public void invoke(FilterInvocation fi) throws IOException,
			ServletException {
		InterceptorStatusToken token = super.beforeInvocation(fi);
		try {
			fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
		} finally {
			super.afterInvocation(token, null);
		}
	}
	@Override
	public SecurityMetadataSource obtainSecurityMetadataSource() {
		return this.securityMetadataSource;
	}
	
	@Override
	public void destroy() {
	}

	@Override
	public void init(FilterConfig filterconfig) throws ServletException {
	}

	public FilterInvocationSecurityMetadataSource getSecurityMetadataSource() {
		return securityMetadataSource;
	}

	public void setSecurityMetadataSource(
			FilterInvocationSecurityMetadataSource securityMetadataSource) {
		this.securityMetadataSource = securityMetadataSource;
	}
}