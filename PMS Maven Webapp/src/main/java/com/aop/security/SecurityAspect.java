package com.aop.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.aop.exception.BussinessException;
import com.aop.exception.BussinessExceptionBean;
import com.ps.dao.common.UserDao;
import com.ps.result.systemmanage.UserVo;
import com.util.coder.EncryptPkUtil;
import com.util.tool.AppUtil;

/**
 * @Description:    AOP注解权限控制
 * @author:         011770
 * @date:           2018年2月5日
 */
@Aspect //该注解标示该类为切面类 
@Component //注入依赖
public class SecurityAspect{
	@Before("within(com.ps.controller..*) && @annotation(sv)") 
    public void resourceValid(JoinPoint jp, SecurityValid sv) throws IOException, ServletException{  
		String sourceCode=sv.resourceCode();//获取参数
		HttpServletRequest request=SysContent.getRequest();
        HttpServletResponse response = SysContent.getResponse(); 
		UserVo loginUser = (UserVo)request.getSession().getAttribute("user");
		if(loginUser !=null){
			String userId= EncryptPkUtil.decodeId(loginUser.getId());
			int count=((UserDao)AppUtil.getBean("userDao")).getByLoginIdandResourceCode(userId, sourceCode);
			if(count<=0){
				 response.setHeader("sessionstatus", "timeout");
				 throw new BussinessException(new BussinessExceptionBean("exception.error.accessdenied"));
			}
		}else{
			 response.setHeader("sessionstatus", "timeout");
			 throw new BussinessException(new BussinessExceptionBean("exception.error.accessdenied"));
		}
  
    }  

}
