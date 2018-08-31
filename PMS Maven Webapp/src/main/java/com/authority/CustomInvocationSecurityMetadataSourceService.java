package com.authority;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Service;

import com.google.common.base.Strings;
import com.ps.dao.common.ResourceDao;
import com.ps.result.systemmanage.ResourceVo;

@Service
public class CustomInvocationSecurityMetadataSourceService implements FilterInvocationSecurityMetadataSource {
	
	private static Logger logger = Logger.getLogger(CustomInvocationSecurityMetadataSourceService.class);
	
	@Autowired
	private ResourceDao resourceDao;

	private static Map<String, Collection<ConfigAttribute>> resourceMap;

	public CustomInvocationSecurityMetadataSourceService() {
		super();
	}

	public CustomInvocationSecurityMetadataSourceService(
			ResourceDao resourceDao) {
		this.resourceDao = resourceDao;
		loadResourceDefine();
	}

	// web启动时加载所有资源权限
	private void loadResourceDefine() {
		resourceMap = new LinkedHashMap<String, Collection<ConfigAttribute>>();
		List<ResourceVo> resList = new ArrayList<ResourceVo>();
		try {
			resList = resourceDao.getAllResource();
		} catch (Exception e) {
			logger.error(e);
			logger.error("加载资源权限异常!");
		}
		if (resList == null) {
			logger.error("加载资源返回为null!");
			logger.error("加载资源权限异常!");
			return;
		} else {
			for (ResourceVo res : resList) {
				String resString = res.getResourceUrl() == null ? "" : res
						.getResourceUrl().toLowerCase();
				String roleName = res.getRoleId();
				if (Strings.isNullOrEmpty(roleName)) {
					continue;
				}
				if (resourceMap.containsKey(resString)) {
					SecurityConfig sc = new SecurityConfig(roleName);
					Collection<ConfigAttribute> collect = resourceMap
							.get(resString);
					collect.add(sc);
				} else {
					Collection<ConfigAttribute> configAttributes = new ArrayList<ConfigAttribute>();
					SecurityConfig sc = new SecurityConfig(roleName);
					configAttributes.add(sc);
					resourceMap.put(resString, configAttributes);
				}
			}
		}
		return;
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return new ArrayList<ConfigAttribute>();
	}

	/**
	 * @Description 根据URL找到对应的权限配置
	 * @author HuangPeng
	 * @date 2016年8月25日
	 */
	@Override
	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {
		String url = ((FilterInvocation) object).getRequestUrl().toLowerCase();
		int firstMark = url.indexOf("?");
		if (firstMark > -1) {
			url = url.substring(0, firstMark);
		}
		if (resourceMap == null) {
			loadResourceDefine();
		}
		return resourceMap.get(url);
	}

	@Override
	public boolean supports(Class<?> arg0) {
		return true;
	}

	/**
	 * @Description 刷新内存
	 * @author HuangPeng
	 * @date 2016年8月25日
	 */
	public static void refresh() {
		resourceMap = null;
	}

	public ResourceDao getResourceMapper() {
		return resourceDao;
	}

	public void setResourceMapper(ResourceDao resourceDao) {
		this.resourceDao = resourceDao;
	}
}
