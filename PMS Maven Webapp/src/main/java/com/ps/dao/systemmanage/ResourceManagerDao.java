package com.ps.dao.systemmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.systemmanage.ResourceVo;


/**
 * @Description:    资源管理DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-03-02
 */
public interface ResourceManagerDao{
	
	/**
	 * @Description: 加载资源树
	 * @author:      WB083
	 * @param:       
	 * @return:      List<ResourceVo> 资源列表
	 * @date:        2017年8月24日
	 */
	List<ResourceVo> loadResourceTree();
	
	/**
	 * @Description: 资源移动
	 * @author:      WB066
	 * @param:       resourceId 数据ID
	 * @param:       targetId 目标ID
	 * @date:        2017年8月24日
	 */
	void updateResourcePid(@Param("resourceId")String resourceId,@Param("targetId")String targetId);
	
	/**
	 * @Description: 停用/启用资源
	 * @author:      WB066
	 * @param:       resourceId 数据ID
	 * @param:       resourceFlag 资源状态
	 * @date:        2017年8月24日
	 */
	void updateResourceFlag(@Param("resourceId")String resourceId,@Param("resourceFlag")String resourceFlag);
	
	/**
	 * @Description:	根据资源id查询资源信息
	 * @author:      	WB066
	 * @param: 			resourceId 资源id
	 * @return: 		ResourceVo
	 * @date:        	2017年8月24日
	 */
	ResourceVo queryResourceById(@Param("id")String resourceId);
	
	/**
	 * @Description:	新增资源信息
	 * @author:      	WB066
	 * @param: 			resourceVo 资源信息
	 * @date:        	2017年8月24日
	 */
	void insertResource(ResourceVo resourceVo);
	
	/**
	 * @Description:	修改资源信息
	 * @author:      	WB066
	 * @param: 			resourceVo 资源信息
	 * @date:        	2017年8月24日
	 */
	void updateResource(ResourceVo resourceVo);
}
