package com.ps.service.systemmanage;

import java.util.List;

import com.ps.result.systemmanage.ResourceVo;


/**
 * @Description:    资源管理接口类
 * @author:         ZHOUMIN
 * @date:           2018-03-02
 */
public interface IResourceManagerService {

	/**
	 * @Description: 加载资源树
	 * @author:      WB083
	 * @param:       language 语言
	 * @return:      List<ResourceVo> 资源列表
	 * @date:        2017年8月24日
	 */
	List<ResourceVo> loadResourceTree(String language);
	
	/**
	 * @Description: 资源移动
	 * @author:      WB066
	 * @param:       resourceId 数据ID
	 * @param:       targetId 目标ID
	 * @date:        2017年8月24日
	 */
	void resourceMobile(String resourceId, String targetId);
	
	/**
	 * @Description: 禁用/停用资源
	 * @author:      WB066
	 * @param:       resourceId 数据ID
	 * @param:       resourceFlag 资源状态
	 * @date:        2017年8月24日
	 */
	void resourceDisableOrEnable(String resourceId,String resourceFlag);
	
	/**
	 * @Description:	根据资源id查询资源信息
	 * @author:      	WB066
	 * @param: 			resourceId 资源id
	 * @return: 		ResourceVo
	 * @date:        	2017年8月24日
	 */
	ResourceVo queryResourceById(String resourceId,String pId);
	
	/**
	 * @Description: 保存资源
	 * @author:      WB066
	 * @param:       resourceVo 资源信息
	 * @date:        2017年8月24日
	 */
	void saveResource(ResourceVo resourceVo);
}

