package com.ps.dao.performancemanager;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.performancemanage.PerformanceVo;

/**
 * @Description:    DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-03-12
 */
public interface PerformanceManagerDao{
	
	/**
	 * @Description: 根据参数查询績效管理列表信息
	 * @author:      ZHOUMIN
	 * @param:       PerformanceManagerVo
	 * @return:      PerformanceManagerVo 列表信息
	 * @date:        2018-03-12
	 */
	List<PerformanceVo> queryPerformanceInfoByParam(PerformanceVo param);
	
	/**
	 * @Description: 根据ID查询績效管理列表信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      PerformanceManagerVo 数据信息
	 * @date:        2018-03-12
	 */
	public PerformanceVo queryPerformanceById(@Param("id")String id);
	
	/**
	 * @Description: 新增績效管理信息
	 * @author:      ZHOUMIN
	 * @param:       PerformanceManagerVo
	 * @date:        2018-03-12
	 */
	public void insertPerformance(PerformanceVo vo);
	
	/**
	 * @Description: 根据ID修改績效管理信息
	 * @author:      ZHOUMIN
	 * @param:       PerformanceManagerVo
	 * @date:        2018-03-12
	 */
	public void updatePerformance(PerformanceVo vo);
	
}
