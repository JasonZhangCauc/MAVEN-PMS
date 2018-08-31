package com.ps.dao.projectmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.projectmanage.ProjectMoniInfoVo;


/**
 * @Description:    DAO接口 
 * @author:         zhangm
 * @date:           2018-08-03
 */
public interface ProjectMoniInfoDao{
	
	/**
	 * @Description: 根据参数查询列表信息
	 * @author:      zhangm
	 * @param:       ProjectMoniInfoVo
	 * @return:      ProjectMoniInfoVo 列表信息
	 * @date:        2018-08-03
	 */
	List<ProjectMoniInfoVo> queryProjectMoniInfoInfoByParam(ProjectMoniInfoVo param);
	
	/**
	 * @Description: 根据ID查询列表信息
	 * @author:      zhangm
	 * @param:       id
	 * @return:      ProjectMoniInfoVo 数据信息
	 * @date:        2018-08-03
	 */
	public ProjectMoniInfoVo queryProjectMoniInfoById(@Param("id")String id);
	
	/**
	 * @Description: 新增信息
	 * @author:      zhangm
	 * @param:       ProjectMoniInfoVo
	 * @date:        2018-08-03
	 */
	public void insertProjectMoniInfo(@Param("vo")ProjectMoniInfoVo vo);
	
	/**
	 * @Description: 修改信息
	 * @author:      zhangm
	 * @param:       ProjectMoniInfoVo
	 * @date:        2018-08-03
	 */
	public void updateProjectMoniInfo(ProjectMoniInfoVo vo);
	
	/**
	 * @Description: 删除信息
	 * @author:      zhangm
	 * @param:       id
	 * @date:        2018-08-03
	 */
	public void deleteProjectMoniInfoById(@Param("id")String id);
}
