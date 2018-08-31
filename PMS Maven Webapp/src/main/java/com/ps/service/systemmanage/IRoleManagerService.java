package com.ps.service.systemmanage;

import java.util.List;
import java.util.Map;

import com.ps.result.systemmanage.ResourceVo;
import com.ps.result.systemmanage.RoleVo;
import com.ps.result.systemmanage.UserVo;

/**
 * @Description:    角色管理业务逻辑接口类
 * @author:         ZHOUMIN
 * @date:           2018年02月27日
 */
public interface IRoleManagerService {
	
	/**
	 * @Description: 根据用户获取对应角色信息
	 * @author:      WB083
	 * @param:       RoleVo 角色信息
	 * @return:      List<RoleVo> 角色列表  
	 * @date:        2017年8月24日
	 */
	List<RoleVo> queryRoleInfoByUser(UserVo vo);
	
	/**
	 * @Description: 根据查询条件查询角色信息
	 * @author:      WB083
	 * @param:       RoleVo 角色信息
	 * @return:      List<RoleVo> 角色列表  
	 * @date:        2017年8月24日
	 */
	List<RoleVo> queryRoleInfoByParam(RoleVo vo);
	
	/**
	 * @Description: 根据ID查询角色信息
	 * @author:      WB083
	 * @param:       roleId 角色ID
	 * @return:      RoleVo 角色信息
	 * @date:        2017年8月24日
	 */
	RoleVo getRoleInfoById(String roleId);
	
	/**
	 * @Description: 根据角色ID更新角色状态
	 * @author:      WB083
	 * @param:       roleId 角色ID, roleFlag 禁用/启用
	 * @return:      
	 * @date:        2017年8月24日
	 */
	void updateRoleFlag(String roleId,String roleFlag);
	
	/**
	 * @Description: 保存角色信息
	 * @author:      WB083
	 * @param:       RoleVo角色信息
	 * @return:      
	 * @date:        2017年8月24日
	 */
	void saveRole(RoleVo roleVo);
	
	/**
	 * @Description: 判断角色唯一性
	 * @author:      WB083
	 * @param:       RoleVo角色信息
	 * @return:      Map<Object, Object> 编号是否存在返回信息
	 * @date:        2017年8月24日
	 */
	Map<Object, Object> queryRoleInfoByChecking(RoleVo roleVo);
	
	/**
	 * @Description: 加载资源树
	 * @author:      WB083
	 * @param:       language 语言
	 * @return:      List<ResourceVo> 资源列表
	 * @date:        2017年8月24日
	 */
	List<ResourceVo> loadRoleResourceTree(String language);
	
	/**
	 * @Description: 根据角色ID获取对应资源
	 * @author:      WB083
	 * @param:       roleId 角色ID
	 * @return:      List<String> 角色对应资源列表
	 * @date:        2017年8月24日
	 */
	List<String> loadRoleResourceId(String roleId);
	
	/**
	 * @Description: 保存角色分配资源
	 * @author:      WB083
	 * @param:       roleId 角色ID resourceId角色对应资源ID
	 * @return:      
	 * @date:        2017年8月24日
	 */
	void assignRoleResources(String roleId, String resourceId);
}
