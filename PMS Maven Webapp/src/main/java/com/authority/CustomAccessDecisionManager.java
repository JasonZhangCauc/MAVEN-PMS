package com.authority;

import java.util.Collection;
import java.util.Iterator;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
/**
 * @Description: 权限决策，如果不存在该资源定义直接放行，否则，找到正确角色即拥有权限并放行
 * @author:      011770
 * @param:       userRole为用户拥有角色，resRole为资源拥有角色
 * @return:      URL
 * @date:        2017年4月15日
 */
public class CustomAccessDecisionManager implements AccessDecisionManager {
	@Override
	public void decide(Authentication authentication, Object object,
			Collection<ConfigAttribute> configAttributes)
			throws AccessDeniedException, InsufficientAuthenticationException {
		if (configAttributes == null) {
			return;
		}
		Iterator<ConfigAttribute> ite = configAttributes.iterator();
		while (ite.hasNext()) {
			ConfigAttribute ca =  ite.next();
			String resRole = ((SecurityConfig) ca).getAttribute();
			for (GrantedAuthority userRole : authentication.getAuthorities()) {
				if (resRole.trim().equals(userRole.getAuthority().trim())) {
					return;
				}
			}
		}
		throw new AccessDeniedException("没有权限访问！");
	}

	@Override
	public boolean supports(ConfigAttribute attribute) {
		return true;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}
}