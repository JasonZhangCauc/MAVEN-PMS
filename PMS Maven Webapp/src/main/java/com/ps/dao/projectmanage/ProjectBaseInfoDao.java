package com.ps.dao.projectmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.projectmanage.CostReportVo;
import com.ps.result.projectmanage.ProjectBaseInfoVo;
import com.ps.result.taskmanage.WorkhoursRecordVo;

/**
 * @Description:    项目维护DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-07-02
 */
public interface ProjectBaseInfoDao{
	
	/**
	 * @Description: 根据参数查询项目维护列表信息
	 * @author:      ZHOUMIN
	 * @param:       projectBaseInfoVo
	 * @return:      projectBaseInfoVo 列表信息
	 * @date:        2018-07-02
	 */
	List<ProjectBaseInfoVo> queryProjectBaseInfoInfoByParam(ProjectBaseInfoVo param);
	
	/**
	 * @Description: 根据ID查询项目维护列表信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      projectBaseInfoVo 数据信息
	 * @date:        2018-07-02
	 */
	public ProjectBaseInfoVo queryProjectBaseInfoById(@Param("id")String id);
	
	/**
	 * @Description: 新增项目维护信息
	 * @author:      ZHOUMIN
	 * @param:       projectBaseInfoVo
	 * @date:        2018-07-02
	 */
	public void insertProjectBaseInfo(ProjectBaseInfoVo vo);
	
	/**
	 * @Description: 修改项目维护信息
	 * @author:      ZHOUMIN
	 * @param:       projectBaseInfoVo
	 * @date:        2018-07-02
	 */
	public void updateProjectBaseInfo(ProjectBaseInfoVo vo);
	
	/**
	 * @Description: 删除项目维护信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @date:        2018-07-02
	 */
	public void deleteProjectBaseInfoById(@Param("id")String id);
	
	/**
	 * @Description: 根据查询条件查询成本报表
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-07-02
	 */
	List<CostReportVo> queryCostReprotByParam(CostReportVo param);
	
	/**
	 * @Description: 根据查询条件查询成本明细
	 * @author:      ZHOUMIN
	 * @param:       ProjectBaseInfoVo 
	 * @date:        2018-07-02
	 */
	List<WorkhoursRecordVo> queryCostDetailByParam(WorkhoursRecordVo param);
	
	/**
	 * @Description: 根据用户查询用户id
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-07-02
	 */
	String getUserIdByUserName(@Param("userNames")String userNames);
	/**
	 * @Description: 查询所有已维护的项目
	 * @author:      raomingyi
	 * @param:       id 
	 * @date:        2018-07-06
	 */
	List<ProjectBaseInfoVo> getAllRecordProjectInfo();
	
	/**
	 * @Description: 审核项目
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-07-02
	 */
	void updateProjectBaseInfoStatus(ProjectBaseInfoVo projectBaseInfoVo);
}
