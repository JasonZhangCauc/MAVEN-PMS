package com.ps.dao.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ps.result.systemmanage.ResourceVo;
import com.ps.result.systemmanage.UserRoleVo;

/**
 * @Description:    权限配置类数据访问接口类
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
public interface UserDao {

	/**
	 * @Description 根据用户登录名得到用户拥有的所有角色
	 * @param userAccount 登录名
	 * @return List<String> 
	 * @author HuangPeng
	 * @date 2017年4月15日
	 */
	public List<String> getUserRolesByUserAccount(String userAccount);

	/**
	 * @Description 获取一个用户拥有的所有资源
	 * @param map 
	 * @return List<ResourceVo> 
	 * @author HuangPeng
	 * @date 2017年4月15日
	 */
	public List<ResourceVo> getUserResources(Map<String, Object> map);

	/**
	 * @Description 查询某用户拥有某资源的数量
	 * @param userId 用户ID, resourceCode 角色标识
	 * @return List<ResourceVo> 
	 * @author HuangPeng
	 * @date 2017年4月15日
	 */
	int getByLoginIdandResourceCode(@Param("userId")String userId,@Param("resourceCode") String resourceCode);

	/**
	 * @Description 根据用户ID查询角色用户关系表
	 * @param userId 用户ID
	 * @return List<UserRoleVo>
	 * @author HuangPeng
	 * @date 2017年4月15日
	 */
	List<UserRoleVo> queryUserRoleByUserId(@Param("userId")String userId);
	
	/**
	 * @Description 根据用户帐号，更新国际化的语言选择（ 0中 1英）
	 * @param userAccount：帐号
	 * @param userLanguage：语言
	 */
	public void updateLanguageByUserAccount(@Param("userAccount")String userAccount,@Param("userLanguage")String userLanguage);
	
	/**
	 * 根据用户ID及菜单Code查询所有按钮权限
	 * @param userId
	 * @param resCode
	 * @return
	 */
	public List<String> getUserAuthByMenuCode(@Param("userId")String userId,@Param("sourceCode") String sourceCode);
	
	/**
	 * 根据用户ID及菜单Code查询最大查看权限值
	 * @param userId
	 * @param resCode
	 * @return
	 */
	public String getMaxViewAuthorityByMenuCode(@Param("userId")String userId,@Param("sourceCode") String sourceCode);
}
