package com.ps.service.impl.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.ps.result.systemmanage.UserVo;
import com.util.coder.EncryptPkUtil;

@Service
public class BaseServiceImpl{
	/**
	 * 获取登录人信息
	 * @return
	 * @throws Exception
	 */
	public UserVo getLoginUser(){
		HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		UserVo loginUser = (UserVo)request.getSession().getAttribute("user");
		if(loginUser == null){
			try {
				throw new Exception();
			} catch (Exception e) {

			}
		}else{
			//解密
			loginUser.setCreateBy(EncryptPkUtil.decodeId(loginUser.getCreateBy()));
		}
		return loginUser;
	}
}
