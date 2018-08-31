package com.ps.dao.projectmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.projectmanage.ProjectVo;

/**
 * @Description:    项目审批访问DAO接口 
 * @author:         raomingyi
 * @date:           2018-03-26
 */
public interface ProjectCheckDao{
	
	/**
	 * @Description: 根据参数查询项目列表信息
	 * @author:      raomingyi
	 * @param:       ProjectVo
	 * @return:      ProjectVo 列表信息
	 * @date:        2018-03-26
	 */
	List<ProjectVo> queryProjectCheckInfoByParam(ProjectVo param);
	
	/**
	 * @Description: 根据ID查询项目信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      ProjectVo 数据信息
	 * @date:        2018-03-26
	 */
	public ProjectVo queryProjectCheckById(@Param("id")String id);
		
	/**@Description: 项目立项审批
	 * @author:      raomingyi
	 * @param:       ProjectVo
	 * @date:        2018-03-26
	 */
	public void updateProjectStatus(ProjectVo vo);
}
