package com.ps.dao.workbenchmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.workbenchmanager.WorkOrderManagerVo;

/**
 * @Description:    DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-07-25
 */
public interface WorkOrderManagerDao{
	
	/**
	 * @Description: 根据参数查询列表信息
	 * @author:      ZHOUMIN
	 * @param:       workOrderManagerVo
	 * @return:      workOrderManagerVo 列表信息
	 * @date:        2018-07-25
	 */
	List<WorkOrderManagerVo> queryWorkOrderByParam(WorkOrderManagerVo param);
	
	/**
	 * @Description: 根据ID查询列表信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      workOrderManagerVo 数据信息
	 * @date:        2018-07-25
	 */
	public WorkOrderManagerVo queryWorkOrderById(@Param("id")String id);
	
	/**
	 * @Description: 新增信息
	 * @author:      ZHOUMIN
	 * @param:       workOrderManagerVo
	 * @date:        2018-07-25
	 */
	public void insertWorkOrder(WorkOrderManagerVo vo);
	
	/**
	 * @Description: 修改信息
	 * @author:      ZHOUMIN
	 * @param:       workOrderManagerVo
	 * @date:        2018-07-25
	 */
	public void updateWorkOrder(WorkOrderManagerVo vo);
	
	/**
	 * @Description: 删除信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @date:        2018-07-25
	 */
	public void deleteWorkOrderById(@Param("id")String id);
}
