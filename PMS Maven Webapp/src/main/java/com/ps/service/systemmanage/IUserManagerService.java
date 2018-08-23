package com.ps.service.systemmanage;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ps.result.systemmanage.UserRoleVo;
import com.ps.result.systemmanage.UserVo;

/**
 * @Description:    用户管理业务逻辑接口类
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
public interface IUserManagerService {

	/**
	 * @Description: 根据查询条件获取所有用户信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年2月26日
	 */
	List<UserVo> queryUserInfoByParam(UserVo vo);
	
	/**
	 * @Description: 根据查询条件获取所有用户信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年2月26日
	 */
	List<UserVo> queryUserSelectByParam(UserVo vo);
	
	/**
	 * @Description: [更新/新增]保存用户信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:       
	 * @date:        2018年2月26日
	 */
	UserVo saveUser(List<MultipartFile> files,UserVo vo);
	
	/**
	 * @Description: 根据ID查询用户
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户
	 * @return:      Map<String, Object>  
	 * @date:        2018年2月26日
	 */
	UserVo queryUserInfoById(String userId);
	
	
	/**
	 * @Description: 根据用户ID更新用户状态
	 * @author:      ZHOUMIN
	 * @param:       roleId 用户ID, status 禁用/启用
	 * @return:      
	 * @date:        2018年2月26日
	 */
	void updateUserStatus(String roleId,String status);	
	
	/**
	 * @Description: 用户分配角色
	 * @author:      HuangPeng
	 * @param:       UserRoleVo 用户角色关联关系信息
	 * @return:       
	 * @date:        2017年4月15日
	 */
	void saveUserRole(UserRoleVo vo);
	
	/**
	 * @Description: 重置密码
	 * @author:      HuangPeng
	 * @param:       userId 用户ID
	 * @return:       
	 * @date:        2017年4月15日
	 */
	String resetPassword(String userId);
	
	/**
	 * @Description: 根据工号判断用户是否存在
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:      返回MAP格式验证参数
	 * @date:        2017年10月17日
	 */
	Map<Object,Object> queryUserInfoByChecking(UserVo vo);
	
	/**
	 * @Description: 身份证号码唯一标识验证
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:      Map<String, Object> 
	 * @date:        2017年4月15日
	 */
	Map<String, Object> verificationIdentityCard(UserVo vo);
	
	/**
	 * @Description: 根据查询条件获取所有用户信息
	 * @author:      zhangm
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年8月01日
	 */
	List<UserVo> queryUserInfoByParamSale(UserVo vo);
	
	/**
	 * @Description: 根据组织架构获取用户信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户信息
	 * @return:      Map<String, Object> 
	 * @date:        2017年4月15日
	 */
	Map<String, String> queryUserByDept(String deptId);
	
	/**
	 * @Description: 初始化销售负责人
	 * @author:      zhangm
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年8月01日
	 */
	List<UserVo> businessPeople(UserVo vo);
	
	/**
	 * @Description: 初始化项目负责人
	 * @author:      zhangm
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年8月01日
	 */
	List<UserVo> projectPeople(UserVo vo);
	
	/**
	 * @Description: 初始化项目负责人
	 * @author:      zhangm
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年8月01日
	 */
	List<UserVo> responsibleSecondary(UserVo vo);
	
	/**
	 * @Description: 初始化产品经理
	 * @author:      zhangm
	 * @param:       UserVo 用户信息
	 * @return:      List<UserVo> 用户信息集合
	 * @date:        2018年8月01日
	 */
	List<UserVo> productManager(UserVo vo);
	
	
}
