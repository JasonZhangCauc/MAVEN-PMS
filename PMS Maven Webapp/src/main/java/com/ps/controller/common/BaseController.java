package com.ps.controller.common;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.aop.exception.BussinessException;
import com.aop.exception.BussinessExceptionBean;
import com.ps.dao.systemmanage.UserManagerDao;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.systemmanage.UserVo;
import com.util.coder.EncryptPkUtil;
import com.util.tool.AppUtil;

/**
 * @Description: 数据封装类
 * @author: HuangPeng
 * @date: 2017年4月15日
 */
@Controller
public class BaseController {

	@Autowired
	private SessionRegistry sessionRegistry;
	
	@Autowired
	private UserManagerDao userManagerDao;
	
	/**
	 * 返回当前活跃用户数
	 * 
	 * @Description: HuangPeng
	 * @return:当前活跃用户数
	 * @date: 2017年7月13日
	 */
	@ModelAttribute("numUsers")
	public int getNumberOfUsers() {
		return sessionRegistry.getAllPrincipals().size();
	}

	/**
	 * 获取登录用户信息
	 * @param request
	 * @return
	 * @throws BussinessException
	 */
	public UserVo getLoginUser(HttpServletRequest request) throws BussinessException{
		UserVo loginUser = (UserVo)request.getSession().getAttribute("user");
		if (loginUser==null){//增加错误处理
			//用户异常时抛出nologin标志，使其登出
			throw new BussinessException(new BussinessExceptionBean("exception.nologinUserFlag"),new Throwable());
		}
		return loginUser;
	}
	
	/**
	 * 重新加载登录用户信息
	 * @author HuangPeng
	 * @param request
	 * @param user
	 *
	 */	
	public void reloadLoginUser(HttpServletRequest request,UserVo user){
		request.getSession().setAttribute("user", user);
	}
	
	/**
	 * 获取国际化文字(不带参数)
	 * @author HuangPeng
	 * @param code
	 *
	 */	
	public  String getMessage(String code){
		String message="";
		MessageSource messageSource = (MessageSource)AppUtil.getBean("messageSource");
	    String[] args = null;
	    message = messageSource.getMessage(code, args, Locale.CHINA);
	    return message;
	}
	/**
	 * 获取国际化文字(带参数)
	 * @author HuangPeng
	 * @param code
	 * @param args
	 *
	 */	
	public String getMessage(String code,String[] args){
		String message="";
		MessageSource messageSource = (MessageSource)AppUtil.getBean("messageSource");
		message = messageSource.getMessage(code, args, Locale.CHINA);
	    return message;
	} 
	
	/**
	 * form提交时返回信息
	 * 前端接收data后，可通过 data.statusCode获取状态码值，data.attachObj获取数据值
	 * @param statusCode 状态码： 空值可输入null，此字段可作为返回状态码进行判断使用；
	 * @param attachObj  返回值： 空值可输入null，此字段可作为返回消息、返回数据灵活使用；
	 * @return
	 */
	public OperateStatusVo returnOperateData(String statusCode,Object attachObj){
		OperateStatusVo retVo = new OperateStatusVo();
	    return retVo.returnOperateData(statusCode,attachObj);
	} 
	
	/**
	 * 返回当前活跃用户数
	 * 
	 * @Description: zhujiejie
	 * @return:当前活跃用户数
	 * @date: 2017年7月13日
	 */
	@ModelAttribute("activeUsers")
	public List<UserVo> getNumberOfUsers(HttpServletRequest request,Model model) {
		//获取用户的真实ip，更新到数据库中
		UserVo boolUser =(UserVo) request.getSession().getAttribute("user");
		if(null !=boolUser){
			UserVo newUser=new UserVo();
			newUser.setUserIp(request.getRemoteAddr());
			newUser.setId(EncryptPkUtil.decodeId(boolUser.getId()));
			userManagerDao.updateUserIp(newUser);
		}
		//获取登录名列表
		Set<String> userNameSet=new HashSet<String>();
		for (Object principal : sessionRegistry.getAllPrincipals()) {
			UserDetails userDetails=(UserDetails) principal;
			userNameSet.add(userDetails.getUsername());
		}
		//根据登录名查询用户
		List<UserVo> activeUsers=new ArrayList<UserVo>();
		for (String name : userNameSet) {
			UserVo userVo=userManagerDao.queryUserInfoByAccount(name);
			if(null !=userVo){
				activeUsers.add(userVo);
			}
		}
		return activeUsers;
	}
}
