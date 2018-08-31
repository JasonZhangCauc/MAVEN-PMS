package com.ps.service.workbenchmanage;

import java.util.List;

import com.ps.result.workbenchmanager.WorkOrderManagerVo;

/**
 * @Description:    接口类
 * @author:         ZHOUMIN
 * @date:           2018-07-25
 */
public interface IWorkOrderManagerService {

	/**
	 * @Description: 查询列表信息
	 * @author:      ZHOUMIN
	 * @param:       workOrderManagerVo
	 * @return:      List<workOrderManagerVo>数据列表   
	 * @date:        2018-07-25
	 */
	List<WorkOrderManagerVo> queryWorkOrderByParam(WorkOrderManagerVo param);
	
	/**
	 * @Description: 根据ID查询数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      workOrderManagerVo数据   
	 * @date:        2018-07-25
	 */
	WorkOrderManagerVo queryWorkOrderById(String id);
	
	/**
	 * @Description: 保存信息
	 * @author:      ZHOUMIN
	 * @param:       workOrderManagerVo   
	 * @date:        2018-07-25
	 */
	void saveWorkOrder(WorkOrderManagerVo vo);
	
	/**
	 * @Description: 根据ID删除信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-07-25
	 */
	void deleteWorkOrderById(String id);
}

