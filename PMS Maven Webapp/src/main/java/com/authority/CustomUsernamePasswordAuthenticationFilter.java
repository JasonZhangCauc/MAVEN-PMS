package com.authority;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.GlobalConstants;
import com.ps.dao.common.UserDao;
import com.ps.dao.systemmanage.UserManagerDao;
import com.ps.result.systemmanage.ResourceVo;
import com.ps.result.systemmanage.UserVo;
import com.util.coder.EncryptPkUtil;
import com.util.coder.MD5;
import com.util.coder.RSAUtils;
import com.util.tool.MessageUtil;

/**
 * @Description:    登录页面验证方法，判断用户登录
 * @author:         011770
 * @date:           2017年4月15日
 */
public class CustomUsernamePasswordAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
	
	public static final String USERNAME = "j_username";
	public static final String PASSWORD = "j_password";
    //public static final String VERIFYCODE = "j_verifyCode";
	private Logger logger = Logger.getLogger(CustomUsernamePasswordAuthenticationFilter.class);

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private UserManagerDao userManagerDao;

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request,
			HttpServletResponse response) throws AuthenticationException {
		if (!"POST".equals(request.getMethod())) {
			throw new AuthenticationServiceException(
					"Authentication method not supported: "
							+ request.getMethod());
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			logger.error("不支持编码:" + e1.getMessage());
		}

		String username = obtainUsername(request);// 获取解密后的用户名
		String password = obtainPassword(request);// 获取解密后密码原文
		String remember = request.getParameter("j_remember");
		// 设置语言和session
		setLanguage(request, response, new UserVo());
				
		// 验证用户账号与密码是否对应
		username = username.trim();
		UserVo userInfo = null;
		try {
			userInfo = userManagerDao.queryUserInfoByAccount(username);
			if(userInfo != null ){
				userInfo.setRoleList(userDao.getUserRolesByUserAccount(username));
				if (userInfo.getRoleList() != null && !userInfo.getRoleList().isEmpty()) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("roleList", userInfo.getRoleList());
					userInfo.setResources(userDao.getUserResources(map));
				}
			}else{
				request.getSession().setAttribute("username", username);
				request.getSession().setAttribute("loginError", MessageUtil.getMessage("exception.error.wronguserorpassword"));
				throw new AuthenticationServiceException(MessageUtil.getMessage("exception.error.wronguserorpassword"));
			}
		} catch (Exception e) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("loginError", MessageUtil.getMessage("exception.error.wronguserorpassword"));//获取用户信息异常
			logger.error(MessageUtil.getMessage("exception.error.wronguserorpassword"),e);//获取用户信息异常
			throw new AuthenticationServiceException(MessageUtil.getMessage("exception.error.wronguserorpassword")); //获取用户信息异常
		}
		// 输入参数验证（验证码、用户名、密码）
		validInputParameters(request, response, username, password, userInfo);
		if (userInfo == null || !password.equals(userInfo.getUserPassword().toUpperCase())) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("loginError", MessageUtil.getMessage("exception.error.wronguserorpassword"));
			throw new AuthenticationServiceException(MessageUtil.getMessage("exception.error.wronguserorpassword"));
		} else if (!StringUtils.equals(GlobalConstants.ZERO, userInfo.getUserFlag())) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("loginError", MessageUtil.getMessage("exception.error.userinactive"));
			throw new AuthenticationServiceException(MessageUtil.getMessage("exception.error.userinactive"));
		} else if (userInfo.getRoleList() == null || userInfo.getRoleList().size() == 0) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("loginError", MessageUtil.getMessage("exception.error.accessdenied"));
			throw new AuthenticationServiceException(MessageUtil.getMessage("exception.error.accessdenied"));
		}   

		UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);

		// 允许子类设置详细属性
		setDetails(request, authRequest);

		// 设置cookie
		setCookie(request, response, remember, username);
		userInfo.setId(EncryptPkUtil.encodeId(userInfo.getId()));
		request.getSession().setAttribute("user", userInfo);

		// 设置语言和session
		setLanguage(request, response, userInfo);

		this.setUserPermissionToSession(request, userInfo);
		
		return this.getAuthenticationManager().authenticate(authRequest);
	}

	public void setUserPermissionToSession(HttpServletRequest request,
			UserVo userDto) {
		if (userDto != null) {
			List<String> myPermissionUrls = new ArrayList<String>();
			for (ResourceVo resource : userDto.getResources()) {
				addPermissionUrl(resource, myPermissionUrls);
			}
		}
	}

	private void addPermissionUrl(ResourceVo resource, List<String> list) {
		if ("1".equals(resource.getResourceType())
				&& StringUtils.isNotBlank(resource.getResourceUrl())
				&& !"root".equals(resource.getResourceUrl())) {
			list.add(resource.getResourceUrl());
		}
	}

	public void setLanguage(HttpServletRequest request,
			HttpServletResponse response, UserVo userInfo) {
		String language = request.getParameter("languagesupport");
		if (GlobalConstants.ONE.equals(language)) {// 设置中文
			// 设置语言为中文
			Locale locale = new Locale("zh", "CN");
			request.getSession().setAttribute("language", "zh");
			request.getSession().setAttribute("pagelanguage", "zh-CN");
			request.getSession()
					.setAttribute(
							SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,
							locale);
			userInfo.setUserLanguage("zh");
			request.getSession().setAttribute("user", userInfo);
		} else if (GlobalConstants.TWO.equals(language)) {// 设置英文
			// 设置语言为英文
			Locale locale = new Locale("en", "US");
			request.getSession().setAttribute("language", "en");
			request.getSession().setAttribute("pagelanguage", "");
			request.getSession()
					.setAttribute(
							SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,
							locale);
			userInfo.setUserLanguage("en");
			request.getSession().setAttribute("user", userInfo);
		}
	}

	/**
	 * 设置cookie属性值
	 * 
	 * @param request
	 * @param response
	 */
	public void setCookie(HttpServletRequest request,
			HttpServletResponse response, String remember, String username) {
		if ("yes".equals(remember)) {
			try {
				Cookie cookie = new Cookie(GlobalConstants.sysName,URLEncoder.encode(username,"UTF-8"));
				cookie.setMaxAge(60 * 60 * 24 * 7);
				cookie.setPath("/");
				response.addCookie(cookie);
				response.addHeader("SET-COOKIE", "JSESSIONID=" + username
						+ ";Path=/;HttpOnly");
			} catch (Exception e) {
				logger.error(MessageUtil.getMessage("exception.error.userinfoerror"),e);//获取用户信息异常
				throw new AuthenticationServiceException(MessageUtil.getMessage("exception.error.userinfoerror")); //获取用户信息异常
			}
		}else{
			try {
				Cookie cookie = new Cookie(GlobalConstants.sysName,null);
				cookie.setMaxAge(60 * 60 * 24 * 7);
				cookie.setPath("/");
				response.addCookie(cookie);
				response.addHeader("SET-COOKIE", "JSESSIONID=" + username
						+ ";Path=/;HttpOnly");
			} catch (Exception e) {
				logger.error(MessageUtil.getMessage("exception.error.userinfoerror"),e);//获取用户信息异常
				throw new AuthenticationServiceException(MessageUtil.getMessage("exception.error.userinfoerror")); //获取用户信息异常
			}
		}
	}

	/**
	 * inputValid输入参数验证（验证码、用户名、密码）
	 * 
	 * @param request
	 * @param response
	 */
	public void validInputParameters(HttpServletRequest request,
			HttpServletResponse response, String username, String password, UserVo vo) {

		//String checkVerifyCode = ChunQiuTool.obj2String(request.getSession().getAttribute("verifyCode"));
		/*String verifyCode = request.getParameter(VERIFYCODE);*/
		if (StringUtils.isEmpty(username)) {
			request.getSession().setAttribute("loginError",
					MessageUtil.getMessage("common.label.nameisnull"));// 用户名不能为空
			throw new AuthenticationServiceException(
					MessageUtil.getMessage("common.label.nameisnull"));// 用户名不能为空
		}
		if (StringUtils.isEmpty(password)) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("loginError",
					MessageUtil.getMessage("common.label.passwordisnull"));// 密码不能为空
			throw new AuthenticationServiceException(
					MessageUtil.getMessage("common.label.passwordisnull")); // 密码不能为空
		}
		/*if (!checkVerifyCode.toLowerCase().equals(verifyCode.toLowerCase())) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("loginError",
					MessageUtil.getMessage("common.label.wrongverifycode"));// 验证码不正确
			throw new AuthenticationServiceException(
					MessageUtil.getMessage("common.label.wrongverifycode")); // 验证码不正确
		}*/
	}
	
	@Override
	protected String obtainUsername(HttpServletRequest request) {
		Object obj = request.getParameter(USERNAME);
		return null == obj ? "" : obj.toString();
	}

	@Override
	protected String obtainPassword(HttpServletRequest request) {
		Object obj = request.getParameter(PASSWORD);
		return null == obj ? "" : MD5.getMD5Encode(RSAUtils
				.decryptStringByJs(obj.toString()));
	}

}
