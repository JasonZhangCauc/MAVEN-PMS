package com.ps.service.projectmanage;

import java.util.List;

import com.ps.result.projectmanage.CostManagementVo;

/**
 * @Description:    单价业务接口类
 * @author:         jczou
 * @date:           2018-02-28
 */
public interface ICostManagementService {

	/**
	 * @Description: 查询单价管理信息
	 * @author:      jczou
	 * @param:       CostManagementVo
	 * @return:      List<CostManagementVo>数据列表   
	 * @date:        2018-02-28
	 */
	List<CostManagementVo> queryCostManagementInfoByParam(CostManagementVo param);
	
	/**
	 * @Description: 根据ID查询单价数据信息
	 * @author:      jczou
	 * @param:       id
	 * @return:      CostManagementVo数据   
	 * @date:        2018-02-28
	 */
	CostManagementVo queryCostManagementInfoById(String id);
	
	/**
	 * @Description: 保存单价管理信息
	 * @author:      jczou
	 * @param:       CostManagementVo   
	 * @date:        2018-02-28
	 */
	void saveCostManagement(CostManagementVo vo);
	
	/**
	 * @Description: 根据ID删除单价信息
	 * @author:      jczou
	 * @param:       id 
	 * @date:        2018-02-28
	 */
	void deleteCostManagementById(String id);
}

