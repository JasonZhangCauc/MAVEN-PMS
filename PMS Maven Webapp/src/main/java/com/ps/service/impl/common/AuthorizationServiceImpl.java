/**
 * 
 */
package com.ps.service.impl.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.ps.dao.common.UserDao;
import com.ps.result.systemmanage.UserVo;
import com.util.coder.EncryptPkUtil;
import com.util.tag.AuthorizationService;
import com.util.tool.AppUtil;

/**
 * @Description:    自定义标签权限
 * @author:         HuangPeng
 * @date:           2017年7月28日
 */
@Service
public class AuthorizationServiceImpl implements AuthorizationService {
	@Override
	public boolean validAuthorizaiton(String resourceCode) {
		HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		if(request==null){
			return false;
		}else{
			UserVo loginUser = (UserVo)request.getSession().getAttribute("user");
			if(loginUser !=null){
				int count=((UserDao)AppUtil.getBean("userDao"))
						.getByLoginIdandResourceCode(EncryptPkUtil.decodeId(loginUser.getId()), resourceCode);
				if(count>0){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
	}
}
