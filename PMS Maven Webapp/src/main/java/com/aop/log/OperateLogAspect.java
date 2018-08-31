package com.aop.log;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.ps.dao.systemmanage.LogerManagerDao;
import com.ps.result.systemmanage.OperateLogVo;
import com.ps.result.systemmanage.UserVo;
import com.util.coder.EncryptPkUtil;
import com.util.tool.AppUtil;


/**
 * @Description:    AOP注解报告流转
 * @author:         011770
 * @date:           2018年2月5日
 */
@Aspect //该注解标示该类为切面类 
@Component //注入依赖
public class OperateLogAspect{
	@After("within(com.ps..*) && @annotation(trv)") 
    public void operateLog(JoinPoint jp, OperateLog trv) throws IOException, ServletException{  
		HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		UserVo loginUser = (UserVo)request.getSession().getAttribute("user");
		if(loginUser!=null){
			String remark=trv.remark();            //功能操作描述
			String cateGory=trv.cateGory();        //功能
			String operateType=trv.operateType();  //操作类型
			String cateGoryType=trv.cateGoryType();//功能类型
			OperateLogVo vo=new OperateLogVo();
			vo.setOperateBy(EncryptPkUtil.decodeId(loginUser.getId()));
			vo.setOperateName(loginUser.getUserName());
			vo.setOperateCategory(cateGory);
			vo.setOperateContent(remark);
			vo.setOperateType(operateType);
			vo.setOperateCategoryType(cateGoryType);
			((LogerManagerDao)AppUtil.getBean("logerManagerDao")).saveOperateLog(vo);
		}
	}  
}
