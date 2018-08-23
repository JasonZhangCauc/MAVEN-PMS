package com.ps.dao.projectmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.projectmanage.DeliveriesVo;
import com.ps.result.projectmanage.MilepostVo;
import com.ps.result.projectmanage.ProjectVo;

/**
 * @Description:    项目数据访问DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-03-19
 */
public interface ProjectManagerDao{
	
	/**
	 * @Description: 根据参数查询项目列表信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectVo
	 * @return:      ProjectVo 列表信息
	 * @date:        2018-03-19
	 */
	List<ProjectVo> queryProjectInfoByParam(ProjectVo param);
	
	/**
	 * @Description: 根据ID查询项目信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      ProjectVo 数据信息
	 * @date:        2018-03-19
	 */
	public ProjectVo queryProjectById(@Param("id")String id);
	
	/**
	 * @Description: 新增项目信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectVo
	 * @date:        2018-03-19
	 */
	public void insertProject(ProjectVo vo);
	
	/**
	 * @Description: 修改项目信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectVo
	 * @date:        2018-03-19
	 */
	public void updateProject(ProjectVo vo);
	
	/**
	 * @Description: 删除项目信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @date:        2018-03-19
	 */
	public void deleteProjectById(@Param("id")String id);
	
	/**
	 * @Description: 查询所有已审核项目列表信息
	 * @author:      ZHOUMIN
	 * @return:      List<ProjectVo>数据列表   
	 * @date:        2018-03-19
	 */
	public List<ProjectVo> getAllProjectInfo();
	
	/**@Description: 提交项目立项
	 * @author:      raomingyi
	 * @param:       ProjectVo
	 * @date:        2018-03-26
	 */
	public void updateProjectSendStatus(ProjectVo vo);
	
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
	MilepostVo queryMilepostInfoById(@Param("id")String id);
	
	/**
	 * @Description: 根据ID查询交付物数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      DeliveriesVo数据   
	 * @date:        2018-03-19
	 */
	DeliveriesVo queryDeliveriesInfoById(@Param("id")String id);
	
	/**
	 * @Description: 查询项目编号
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      项目编号   
	 * @date:        2018-03-19
	 */
	String getProjectNo(@Param("belongProduct")String belongProduct);
	
	/**
	 * @Description: 新增里程碑信息
	 * @author:      ZHOUMIN
	 * @param:       MilepostVo
	 * @date:        2018-03-19
	 */
	void insertMilepost(MilepostVo milepostVo);
	
	/**
	 * @Description: 修改里程碑信息
	 * @author:      ZHOUMIN
	 * @param:       MilepostVo
	 * @date:        2018-03-19
	 */
	void updateMilepost(MilepostVo milepostVo);
	
	/**
	 * @Description: 根据ID删除里程碑信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-03-19
	 */
	void deleteMilepost(@Param("id")String id);
	
	/**
	 * @Description: 新增交付物信息
	 * @author:      ZHOUMIN
	 * @param:       DeliveriesVo
	 * @date:        2018-03-19
	 */
	void insertDeliveries(DeliveriesVo deliveriesVo);
	
	/**
	 * @Description: 修改交付物信息
	 * @author:      ZHOUMIN
	 * @param:       DeliveriesVo
	 * @date:        2018-03-19
	 */
	void updateDeliveries(DeliveriesVo deliveriesVo);
	
	/**
	 * @Description: 根据ID删除交付物信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-03-19
	 */
	void deleteDeliveries(@Param("id")String id);
	
	/**
	 * @Description: 根据ID修改项目状态
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @param:       projectStatus 项目状态	
	 * @date:        2018-03-19
	 */
	void updateProjectStatus(@Param("id")String id,@Param("projectStatus")String projectStatus);
	
	/**
	 * @Description: 根据ID修改合同状态状态
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @param:       contractStatus 合同状态状态	
	 * @date:        2018-03-19
	 */
	void updateContractStatus(@Param("id")String id,@Param("contractStatus")String contractStatus);
	
	/**
	 * @Description: 根据项目ID项目对应阶段
	 * @author:      ZHOUMIN
	 * @param:       projectId
	 * @param:       projectStadge 项目阶段	
	 * @return 
	 * @date:        2018-03-19
	 */
	 int getMilepostProjectStadgeCounts(@Param("projectId")String projectId,@Param("projectStadge")String projectStadge);
}
