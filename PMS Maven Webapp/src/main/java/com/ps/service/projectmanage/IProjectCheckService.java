package com.ps.service.projectmanage;

import java.util.List;

import com.ps.result.projectmanage.ProjectVo;

/**
 * @Description:    项目审批业务接口类
 * @author:         raomingyi
 * @date:           2018-03-26
 */
public interface IProjectCheckService {

	/**
	 * @Description: 查询项目列表信息
	 * @author:      raomingyi
	 * @param:       ProjectVo
	 * @return:      List<ProjectVo>数据列表   
	 * @date:        2018-03-26
	 */
	List<ProjectVo> queryProjectCheckInfoByParam(ProjectVo param);
	
	/**
	 * @Description: 根据ID查询项目数据信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      ProjectVo数据   
	 * @date:        2018-03-26
	 */
	ProjectVo queryProjectCheckInfoById(String id);
		
	/**
	 * @Description: 项目立项审批
	 * @author:      raomingyi
	 * @param:       ProjectVo   
	 * @date:        2018-03-15
	 */
	void updateProjectStatus(ProjectVo vo);
}

