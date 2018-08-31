package com.ps.service.projectmanage;

import java.util.List;

import com.ps.result.projectmanage.DeliveriesVo;
import com.ps.result.projectmanage.MilepostVo;
import com.ps.result.projectmanage.ProjectVo;

/**
 * @Description:    项目业务接口类
 * @author:         ZHOUMIN
 * @date:           2018-03-19
 */
public interface IProjectManagerService {

	/**
	 * @Description: 查询项目列表信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectVo
	 * @return:      List<ProjectVo>数据列表   
	 * @date:        2018-03-19
	 */
	List<ProjectVo> queryProjectInfoByParam(ProjectVo param);
	
	/**
	 * @Description: 根据ID查询项目数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      ProjectVo数据   
	 * @date:        2018-03-19
	 */
	ProjectVo queryProjectInfoById(String id);
	
	/**
	 * @Description: 保存项目信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectVo   
	 * @date:        2018-03-19
	 */
	ProjectVo saveProject(ProjectVo vo);
	
	/**
	 * @Description: 根据ID删除项目信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-03-19
	 */
	void deleteProjectById(String id);
	
	/**
	 * @Description: 查询所有已审核项目列表信息
	 * @author:      ZHOUMIN
	 * @return:      List<ProjectVo>数据列表   
	 * @date:        2018-03-19
	 */
	List<ProjectVo> getAllProjectInfo();
	/**
	 * @Description: 项目立项审批
	 * @author:      raomingyi
	 * @param:       ProjectVo   
	 * @date:        2018-03-15
	 */
	void updateProjectSendStatus(ProjectVo vo);
	
	/**
	 * @Description: 根据项目id查询交付物信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      ProjectVo数据   
	 * @date:        2018-03-19
	 */
	List<DeliveriesVo> queryDeliveriesInfoByParam(DeliveriesVo deliveriesVo);
	
	/**
	 * @Description: 根据项目id查询里程碑信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      ProjectVo数据   
	 * @date:        2018-03-19
	 */
	List<MilepostVo> queryMilepostInfoByParam(MilepostVo milepostVo);
	
	/**
	 * @Description: 根据ID查询里程碑数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      MilepostVo数据   
	 * @date:        2018-03-19
	 */
	MilepostVo queryMilepostInfoById(String id);
	
	/**
	 * @Description: 根据ID查询交付物数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      DeliveriesVo数据   
	 * @date:        2018-03-19
	 */
	DeliveriesVo queryDeliveriesInfoById(String id);
	
	/**
	 * @Description: 保存里程碑信息
	 * @author:      ZHOUMIN
	 * @param:       MilepostVo   
	 * @date:        2018-03-19
	 */
	void saveMilepost(MilepostVo milepostVo);
	
	/**
	 * @Description: 根据ID删除里程碑信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-03-19
	 */
	void deleteMilepost(String id);
	
	/**
	 * @Description: 保存交付物信息
	 * @author:      ZHOUMIN
	 * @param:       DeliveriesVo   
	 * @date:        2018-03-19
	 */
	void saveDeliveries(DeliveriesVo deliveriesVo);
	
	/**
	 * @Description: 根据ID删除交付物信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-03-19
	 */
	void deleteDeliveries(String id);
	
	/**
	 * @Description: 提交项目信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-03-19
	 */
	void submitProject(String id);

	/**
	 * @Description:  验证里程碑是否重复
	 * @param projectId
	 * @param projectStadge
	 * @return 
	 */
	int getMilepostProjectStadgeCounts(String projectId, String projectStadge);	
}

