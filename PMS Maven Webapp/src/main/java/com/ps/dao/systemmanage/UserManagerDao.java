package com.ps.dao.systemmanage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ps.result.systemmanage.UserVo;


/**
 * @Description:    用户管理数据访问接口类
 * @author:         ZHOUMIN
 * @date:           2018年2月26日
 */
public interface UserManagerDao {

	/**
	 * @Description: 根据查询条件获取用户信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年2月26日
	 */
	List<UserVo> queryUserInfoByParam(UserVo vo);
	
	/**
	 * @Description: 根据用户ID获取用户对象
	 * @param:  	 userId 用户Id
	 * @return: 	 UserVo 用户信息
	 * @author: 	 ZHOUMIN
	 * @date: 		 2018年2月26日
	 */
	UserVo queryUserInfoById(@Param("id") String id);
	
	/**
	 * @Description: 根据用户登录名获取用户对象
	 * @param:  	 userAccount 用户登录名
	 * @return:		 UserVo 用户信息
	 * @author:		 ZHOUMIN
	 * @date: 		 2018年2月26日
	 */
	UserVo queryUserInfoByAccount(@Param("userAccount") String userAccount);
	
	/**
	 * @Description: 插入用户
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:       
	 * @date:        2018年2月26日
	 */
	void insertUser(UserVo vo);

	/**
	 * @Description: 根据ID更新用户信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:       
	 * @date:        2018年2月26日
	 */
	void updateUser(UserVo vo);
	
	/**
	 * @Description: 分配角色
	 * @author:      ZHOUMIN
	 * @param:       userId 用户ID,rvoList 角色集
	 * @return:       
	 * @date:        2018年2月26日
	 */
	void saveUserRole(@Param("userId") String userId,@Param("rvoList")String[] rvoList);
	
	/**
	 * @Description: 删除用户角色
	 * @param: 	 	 userAccount 登录名
	 * @return:		 UserVo 用户信息
	 * @author:		 ZHOUMIN
	 * @date:		 2018年2月26日
	 */
	void deleteUserRole(@Param("userId") String userId);
	
	/**
	 * @Description: 根据用户ID更新用户状态
	 * @author:      ZHOUMIN
	 * @param:       roleId 用户ID, zero 禁用/启用
	 * @return:      
	 * @date:        2018年2月26日
	 */
	void updateUserStatus(@Param("userId")String userId,@Param("status") String status);
	
	/**
	 * @Description: 重置密码
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:      
	 * @date:        2018年2月26日
	 */
	void resetPassword(UserVo vo);
	
	/**
	 * @Description: 	通过登录名查询用户
	 * @param: 			userIdcard 身份证号码
	 * @return: 		UserVo 用户信息
	 * @author: 		ZHOUMIN
	 * @date: 			2017年4月15日
	 */
	UserVo verificationIdentityCard(@Param("userIdcard")String userIdcard);
	
	/**
	 * @Description: 	修改用户ip地址
	 * @param: 			UserVo 用户信息
	 * @author: 		ZHOUMIN
	 * @date: 			2017年4月15日
	 */
	void updateUserIp(UserVo userVo);
	
	/**
	 * @Description: 插入用户
	 * @author:      zhangm
	 * @param:       UserVo 用户信息
	 * @return:       
	 * @date:        2018年7月24日
	 */
	void saveUser(UserVo vo);
	
	/**
	 * 批量删除联系人信息
	 * @param ids
	 */
	void deleteUserByContactId(@Param("ids")String [] ids);
	
	/**
	 * @Description: 删除用户
	 * @param: 	 	 userAccount 登录名
	 * @return:		 UserVo 用户信息
	 * @author:		 zhangm
	 * @date:		 2018年7月25日
	 */
	void deleteUserByContactIdPhysical(@Param("contactId") String contactId);
	
	/**
	 * @Description: 根据联系人id更新用户信息
	 * @author:      zhangm
	 * @param:       UserVo 用户信息
	 * @return:       
	 * @date:        2018年7月25日
	 */
	void updateUserByContactId(UserVo vo);
	
	/**
	 * 添加客户权限
	 * @author:      zhangm
	 * @param vo
	 ** @date:        2018年7月25日
	 */
	void saveUserRoleOneToOne(UserVo vo);
	
	/**
	 * @Description: 根据查询条件获取用户信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年2月26日
	 */
	List<UserVo> queryUserInfoByParamSale(UserVo vo);
	
	/**
	 * @Description: 根据组织架构获取用户信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:      Map<String, Object> 
	 * @date:        2017年4月15日
	 */
	Map<String, String> queryUserByDept(@Param("deptId") String deptId);
	
	/**
	 * @Description: 初始化销售负责人
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年2月26日
	 */
	List<UserVo> businessPeople(UserVo vo);
	
	/**
	 * @Description: 初始化项目负责人
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年2月26日
	 */
	List<UserVo> projectPeople(UserVo vo);
	
	/**
	 * @Description: 初始化次要负责人
	 * @author:      zhangm
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年8月09日
	 */
	List<UserVo> responsibleSecondary(UserVo vo);
	
	/**
	 * @Description: 初始化产品经理
	 * @author:      zhangm
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年8月09日
	 */
	List<UserVo> productManager(UserVo vo);
	
	
}
