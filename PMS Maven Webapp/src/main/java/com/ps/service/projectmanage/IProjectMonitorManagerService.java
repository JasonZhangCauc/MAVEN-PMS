package com.ps.service.projectmanage;

import java.util.List;

import com.ps.result.projectmanage.MilepostAdjustVo;
import com.ps.result.projectmanage.ProjectVo;

/**
 * @Description:    项目监控业务接口类
 * @author:         ZHOUMIN
 * @date:           2018-03-19
 */
public interface IProjectMonitorManagerService {
	
	/**
	 * @Description: 查询项目监控列表信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectVo
	 * @return:      List<ProjectVo>数据列表   
	 * @date:        2018-03-19
	 */
	List<ProjectVo> queryProjectMonitorByParam(ProjectVo param);
	
	/**
	 * @Description: 根据ID查询项目数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      ProjectVo数据   
	 * @date:        2018-03-19
	 */
	ProjectVo queryProjectMonitorById(String id);
	
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
	 * @param:       milepostId 里程碑ID
	 * @return:      ProjectVo数据   
	 * @date:        2018-03-19
	 */
	MilepostAdjustVo queryMilepostAdjustById(String id,String milepostId);
	
	/**
	 * @Description: 保存里程碑调整信息
	 * @author:      ZHOUMIN
	 * @param:       MilepostAdjustVo
	 * @return:      
	 * @date:        2018-03-19
	 */
	void saveMilepostAdjust(MilepostAdjustVo param);
}
