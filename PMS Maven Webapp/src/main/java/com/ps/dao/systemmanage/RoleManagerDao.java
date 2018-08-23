package com.ps.dao.systemmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.systemmanage.ResourceVo;
import com.ps.result.systemmanage.RoleVo;
import com.ps.result.systemmanage.UserVo;


/**
 * @Description:    角色管理数据访问接口类
 * @author:         WB083
 * @date:           2017年8月24日
 */
public interface RoleManagerDao {
	
	/**
	 * @Description: 根据用户获取对应角色信息
	 * @author:      WB083
	 * @param:       RoleVo 角色信息
	 * @return:      List<RoleVo> 角色列表  
	 * @date:        2017年8月24日
	 */
	List<RoleVo> queryRoleInfoByUser(UserVo vo);
	
	/**
	 * @Description: 根据查询条件获取角色信息
	 * @author:      WB083
	 * @param:       RoleVo 角色
	 * @return:      List<RoleVo> 角色列表
	 * @date:        2017年8月17日
	 */
	List<RoleVo> queryRoleInfoByParam(RoleVo vo);
	
	/**
	 * @Description: 根据ID查询角色信息
	 * @author:      WB083
	 * @param:       roleId 角色ID
	 * @return:      RoleVo 角色信息
	 * @date:        2017年8月24日
	 */
	RoleVo getRoleInfoById(@Param("roleId")String roleId);
	
	/**
	 * @Description: 根据角色ID更新角色状态
	 * @author:      WB083
	 * @param:       roleId 角色ID, roleFlag 禁用/启用
	 * @return:      
	 * @date:        2017年8月24日
	 */
	void updateRoleFlag(@Param("roleId")String roleId,@Param("roleFlag")String roleFlag);
	
	/**
	 * @Description: 新增角色信息
	 * @author:      WB083
	 * @param:       RoleVo角色信息
	 * @return:      
	 * @date:        2017年8月24日
	 */
	void addRoleInfo(RoleVo roleVo);
	
	/**
	 * @Description: 根据角色ID修改角色信息
	 * @author:      WB083
	 * @param:       RoleVo角色信息
	 * @return:      
	 * @date:        2017年8月24日
	 */
	void updateRoleInfo(RoleVo roleVo);
	
	/**
	 * @Description: 通过角色编码获取角色
	 * @author:      WB083
	 * @param:       RoleVo角色信息
	 * @return:      
	 * @date:        2017年8月24日
	 */
	RoleVo getRoleInfoByRoleCode(RoleVo vo);
	
	/**
	 * @Description: 加载资源树
	 * @author:      WB083
	 * @param:       
	 * @return:      List<ResourceVo> 资源列表
	 * @date:        2017年8月24日
	 */
	List<ResourceVo> loadRoleResourceTree();
	
	/**
	 * @Description: 根据角色ID获取对应资源
	 * @author:      WB083
	 * @param:       roleId 角色ID
	 * @return:      List<String> 角色对应资源列表
	 * @date:        2017年8月24日
	 */
	List<String> loadRoleResourceId(@Param("roleId")String roleId);
	
	/**
	 * @Description: 根据角色ID删除资源
	 * @author:      WB083
	 * @param:       roleId 角色ID
	 * @return:      
	 * @date:        2017年8月24日
	 */
	void deleteRoleResources(@Param("roleId")String roleId);
	
	/**
	 * @Description: 分配角色资源
	 * @author:      WB083
	 * @param:       roleId 角色ID rsvoList资源列
	 * @return:      
	 * @date:        2017年8月24日
	 */
	void addRoleResource(@Param("roleId") String roleId,@Param("rsvoList")String[] rsvoList);
}
