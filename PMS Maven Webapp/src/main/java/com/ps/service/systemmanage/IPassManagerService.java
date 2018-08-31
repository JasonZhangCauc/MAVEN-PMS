package com.ps.service.systemmanage;

import com.ps.result.systemmanage.PasswordVo;
import com.ps.result.systemmanage.UserVo;

/**
 * @Description:    密码管理业务逻辑接口类
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
public interface IPassManagerService {

	/**
	 * 判断用户是否是第一次登陆
	 * @param userid
	 * @return
	 */
	boolean validateUserFirstLoginOrNot(String loginId);
	
	/**
	 * 修改密码
	 * @param vo
	 * @param loginUser 
	 */
	UserVo updatePassword(PasswordVo vo, UserVo loginUser);
}
