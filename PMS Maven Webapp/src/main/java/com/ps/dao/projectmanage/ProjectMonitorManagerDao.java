package com.ps.dao.projectmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.projectmanage.MilepostAdjustVo;
import com.ps.result.projectmanage.ProjectVo;

/**
 * @Description:    项目监控数据访问DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-03-19
 */
public interface ProjectMonitorManagerDao {

	/**
	 * @Description: 根据参数查询项目监控列表信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectVo
	 * @return:      ProjectVo 列表信息
	 * @date:        2018-03-19
	 */
	List<ProjectVo> queryProjectMonitorByParam(ProjectVo param);
	
	/**
	 * @Description: 根据里程碑查询里程碑调整列表信息
	 * @author:      ZHOUMIN
	 * @param:       MilepostAdjustVo
	 * @return:      List<MilepostAdjustVo>数据列表   
	 * @date:        2018-03-19
	 */
	List<MilepostAdjustVo> queryMilepostAdjustByParam(MilepostAdjustVo param);
	
	/**
	 * @Description: 根据ID查询里程碑调整信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      ProjectVo数据   
	 * @date:        2018-03-19
	 */
	MilepostAdjustVo queryMilepostAdjustById(@Param("id")String id);
	
	/**
	 * @Description: 新增里程碑调整信息
	 * @author:      ZHOUMIN
	 * @param:       MilepostAdjustVo
	 * @return:      
	 * @date:        2018-03-19
	 */
	void insertMilepostAdjust(MilepostAdjustVo param);
	
	/**
	 * @Description: 修改里程碑调整信息
	 * @author:      ZHOUMIN
	 * @param:       MilepostAdjustVo
	 * @return:      
	 * @date:        2018-03-19
	 */
	void updateMilepostAdjust(MilepostAdjustVo param);
}
