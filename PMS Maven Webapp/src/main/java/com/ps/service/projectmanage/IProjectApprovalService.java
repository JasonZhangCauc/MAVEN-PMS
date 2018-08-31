package com.ps.service.projectmanage;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.ps.result.projectmanage.ProjectBaseInfoVo;


/**
 * @Description:    项目立项接口类
 * @author:         zhangm
 * @date:           2018-08-02
 */
public interface IProjectApprovalService {
	
	/**
	 * @Description: 查询项目立项列表信息
	 * @author:      zhangm
	 * @param:       projectBaseInfoVo
	 * @return:      List<projectBaseInfoVo>数据列表   
	 * @date:        2018-08-02
	 */
	List<ProjectBaseInfoVo> queryProjectApprovalByParam(ProjectBaseInfoVo param);
	
	/**
	 * @Description: 根据ID查询项目维护数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      projectBaseInfoVo数据   
	 * @date:        2018-07-02
	 */
	ProjectBaseInfoVo queryProjectApprovalfoById(String id);
	
	/**
	 * @Description: 根据ID删除项目立项信息
	 * @author:      zhangm
	 * @param:       id 
	 * @date:        2018-08-02
	 */
	void deleteProjectApproval(String id);
	
	/**
	 * @Description: 审核项目
	 * @author:      zhangm
	 * @param:       id 
	 * @date:        2018-08-02
	 */
	void updateProjectApprovalStatus(ProjectBaseInfoVo projectBaseInfoVo);
	
	/**
	 * @Description: 导入项目维护信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-07-02
	 */
	List<String> importTitleFile(List<Map<Integer, Collection<?>>> dataList);
	
	/**
	 * @Description: 保存项目立项信息
	 * @author:      zhangm
	 * @param:       projectBaseInfoVo   
	 * @date:        2018-08-02
	 */
	void saveProjectApproval(ProjectBaseInfoVo vo);
	

}
