package com.ps.service.projectmanage;

import java.util.List;

import com.ps.result.projectmanage.ProjectMoniInfoVo;


/**
 * @Description:    接口类
 * @author:         zhangm
 * @date:           2018-08-03
 */
public interface IProjectMoniInfoService {

	/**
	 * @Description: 查询列表信息
	 * @author:      zhangm
	 * @param:       ProjectMoniInfoVo
	 * @return:      List<ProjectMoniInfoVo>数据列表   
	 * @date:        2018-08-03
	 */
	List<ProjectMoniInfoVo> queryProjectMoniInfoInfoByParam(ProjectMoniInfoVo param);
	
	/**
	 * @Description: 根据ID查询数据信息
	 * @author:      zhangm
	 * @param:       id
	 * @return:      ProjectMoniInfoVo数据   
	 * @date:        2018-08-03
	 */
	ProjectMoniInfoVo queryProjectMoniInfoInfoById(String id);
	
	/**
	 * @Description: 保存信息
	 * @author:      zhangm
	 * @param:       ProjectMoniInfoVo   
	 * @date:        2018-08-03
	 */
	void saveProjectMoniInfo(ProjectMoniInfoVo vo);
	
	/**
	 * @Description: 根据ID删除信息
	 * @author:      zhangm
	 * @param:       id 
	 * @date:        2018-08-03
	 */
	void deleteProjectMoniInfoById(String id);
}

