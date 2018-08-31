package com.ps.dao.projectmanage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ps.result.projectmanage.OtherCostManagerVo;

/**
 * @Description:    其他成本DAO接口 
 * @author:         jczou
 * @date:           2018-03-19
 */
public interface OtherCostManagerDao{
	
	/**
	 * @Description: 根据参数查询其他成本列表信息
	 * @author:      jczou
	 * @param:       OtherCostManagerVo
	 * @return:      OtherCostManagerVo 列表信息
	 * @date:        2018-03-19
	 */
	List<OtherCostManagerVo> queryOtherCostManagerInfoByParam(OtherCostManagerVo vo);
	
	/**
	 * @Description: 根据ID查询其他成本列表信息
	 * @author:      jczou
	 * @param:       id
	 * @return:      OtherCostManagerVo 数据信息
	 * @date:        2018-03-19
	 */
	public OtherCostManagerVo queryOtherCostManagerById(@Param("id")String id);
	
	/**
	 * @Description: 新增其他成本信息
	 * @author:      jczou
	 * @param:       OtherCostManagerVo
	 * @date:        2018-03-19
	 */
	public void insertOtherCostManager(OtherCostManagerVo vo);
	
	/**
	 * @Description: 修改其他成本信息
	 * @author:      jczou
	 * @param:       OtherCostManagerVo
	 * @date:        2018-03-19
	 */
	public void updateOtherCostManager(OtherCostManagerVo vo);
	
	/**
	 * @Description: 删除其他成本信息
	 * @author:      jczou
	 * @param:       id
	 * @date:        2018-03-19
	 */
	public void deleteOtherCostManagerById(@Param("id")String id);
	
	/**
	 * @Description: 根据查询条件项目数据信息
	 * @author:      jczou
	 * @param:       OtherCostManagerVo   
	 * @date:        2018-03-19
	 */
	List<Map<String,Object>> getProjectInfo(OtherCostManagerVo otherCostVo);
	
	/**
	 * @Description: 根据查询条件成本数据信息
	 * @author:      jczou
	 * @param:       OtherCostManagerVo   
	 * @date:        2018-03-19
	 */
	List<Map<String,Object>> getOtherCostInfo(OtherCostManagerVo otherCostVo);
}
