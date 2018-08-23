package com.ps.dao.projectmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.projectmanage.CostManagementVo;

/**
 * @Description:    单价数据访问接口 
 * @author:         jczou
 * @date:           2018-02-28
 */
public interface CostManagementDao{
	
	/**
	 * @Description: 查询单价管理信息
	 * @author:      jczou
	 * @param:       CostManagementVo
	 * @return:      CostManagementVo 列表信息
	 * @date:        2018-02-28
	 */
	List<CostManagementVo> queryCostManagementInfoByParam(CostManagementVo vo);
	
	/**
	 * @Description: 根据ID查询单价数据信息
	 * @author:      jczou
	 * @param:       id
	 * @return:      CostManagementVo 数据信息
	 * @date:        2018-02-28
	 */
	public CostManagementVo queryCostManagementById(@Param("id")String id);
	
	/**
	 * @Description: 保存单价管理信息
	 * @author:      jczou
	 * @param:       CostManagementVo
	 * @date:        2018-02-28
	 */
	public void insertCostManagement(CostManagementVo vo);
	
	/**
	 * @Description: 修改单价管理信息
	 * @author:      jczou
	 * @param:       CostManagementVo
	 * @date:        2018-02-28
	 */
	public void updateCostManagement(CostManagementVo vo);
	
	/**
	 * @Description: 删除单价管理信息
	 * @author:      jczou
	 * @param:       id
	 * @date:        2018-02-28
	 */
	public void deleteCostManagementById(@Param("id")String id);
}
