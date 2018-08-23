package com.ps.service.projectmanage;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.ps.result.projectmanage.CostReportVo;
import com.ps.result.projectmanage.ProjectBaseInfoVo;
import com.ps.result.taskmanage.WorkhoursRecordVo;

/**
 * @Description:    项目维护接口类
 * @author:         ZHOUMIN
 * @date:           2018-07-02
 */
public interface IProjectBaseInfoService {

	/**
	 * @Description: 查询项目维护列表信息
	 * @author:      ZHOUMIN
	 * @param:       projectBaseInfoVo
	 * @return:      List<projectBaseInfoVo>数据列表   
	 * @date:        2018-07-02
	 */
	List<ProjectBaseInfoVo> queryProjectBaseInfoInfoByParam(ProjectBaseInfoVo param);
	
	/**
	 * @Description: 根据ID查询项目维护数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      projectBaseInfoVo数据   
	 * @date:        2018-07-02
	 */
	ProjectBaseInfoVo queryProjectBaseInfoInfoById(String id);
	
	/**
	 * @Description: 保存项目维护信息
	 * @author:      ZHOUMIN
	 * @param:       projectBaseInfoVo   
	 * @date:        2018-07-02
	 */
	void saveProjectBaseInfo(ProjectBaseInfoVo vo);
	
	/**
	 * @Description: 根据ID删除项目维护信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-07-02
	 */
	void deleteProjectBaseInfoById(String id);
	
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
	 * @param:       id 
	 * @date:        2018-07-02
	 */
	List<WorkhoursRecordVo> queryCostDetailByParam(WorkhoursRecordVo param);
	
	/**
	 * @Description: 导入项目维护信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-07-02
	 */
	List<String> importTitleFile(List<Map<Integer, Collection<?>>> dataList);
	
	
	/**
	 * @Description: 查询所有已维护项目列表信息
	 * @author:      raomingyi
	 * @return:      List<ProjectBaseInfoVo>数据列表   
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

