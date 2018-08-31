package com.base.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.ps.dao.common.UserDao;
import com.ps.result.systemmanage.UserVo;
import com.util.coder.EncryptPkUtil;
import com.util.tool.AppUtil;
/**
 * 页面权限控制参数
 * @Description 
 * @Company: 小翼科技
 * @author  wb010
 * @Date    2017-9-6
 */
public class AuthorizationTag extends TagSupport {

	private static final long serialVersionUID = 1994827370769047404L;
	private static final Logger logger = Logger
			.getLogger(AuthorizationTag.class);
	
	private String resourceCode; 	//资源code
	
	private UserVo user; 		//用户
	private UserDao userDao;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getResourceCode() {
		return resourceCode;
	}
	public void setResourceCode(String resourceCode) {
		this.resourceCode = resourceCode;
	}
	public UserDao getUserDao() {
		if(userDao==null){
			userDao = (UserDao)AppUtil.getBean("userDao");
		}
		return userDao;
	}
	/**
	 * 获取当前用户信息
	 * @return
	 */
	public UserVo getUser() {
		HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		user = (UserVo)request.getSession().getAttribute("user");
		return user;
	}
	
	@Override
	public int doStartTag() throws JspException {
		try {
			String userId = EncryptPkUtil.decodeId(this.getUser().getId());
			int count = this.getUserDao().getByLoginIdandResourceCode(userId, resourceCode);
			if (count>0) {
				return EVAL_BODY_INCLUDE;	// 若返回true,拥有权限，则显示标签中内容
			} else {
				return SKIP_BODY;			// 若返回false,无权限，则不显示标签中内容
			}
		} catch (Exception e) {
			if (e instanceof ClassNotFoundException) {
				logger.error(e);
				logger.error("ClassNotFoundException:未找到该类!");
			} else if (e instanceof SecurityException) {
				logger.error(e);
				logger.error("SecurityException:存在安全风险!");
			} else if (e instanceof NoSuchMethodException) {
				logger.error(e);
				logger.error("NoSuchMethodException:未找到该方法!");
			} else {
				logger.error(e);
				logger.error("Exception:其他报错!");
			}
		}
		// 默认返回true,拥有权限，则显示标签中内容
		return EVAL_BODY_INCLUDE;
	}
}
