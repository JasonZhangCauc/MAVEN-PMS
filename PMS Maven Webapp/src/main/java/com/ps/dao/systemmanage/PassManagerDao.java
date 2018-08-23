package com.ps.dao.systemmanage;

import org.apache.ibatis.annotations.Param;

import com.ps.result.systemmanage.PasswordVo;
import com.ps.result.systemmanage.UserVo;


/**
 * @Description:    密码管理数据访问接口类
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
public interface PassManagerDao {

	/**
	 * @Description: 根据登录名验证是否首次登陆
	 * @author:      HuangPeng
	 * @param:       userAccount 登录名
	 * @return:      
	 * @date:        2017年6月17日
	 */
	String validateUserFirstLoginOrNot(@Param("userAccount") String userAccount);
	
	/**
	 * @Description: 重置密码
	 * @author:      HuangPeng
	 * @param:       UserVo 用户实体类
	 * @return:      
	 * @date:        2017年6月17日
	 */
	void resetPassword(UserVo vo);
	
	/**
	 * @Description: 修改密码
	 * @author:      HuangPeng
	 * @param:       PasswordVo 密码实体类
	 * @return:      
	 * @date:        2017年6月17日
	 */
	void updatePassword(PasswordVo vo);
}
