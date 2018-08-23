package com.ps.dao.performancemanager;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.performancemanage.MonthReportVo;

/**
 * @Description:    月报数据访问DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-03-14
 */
public interface MonthReportManagerDao{
	
	/**
	 * @Description: 根据参数查询月报列表信息
	 * @author:      ZHOUMIN
	 * @param:       MonthReportManagerVo
	 * @return:      MonthReportManagerVo 列表信息
	 * @date:        2018-03-14
	 */
	List<MonthReportVo> queryMonthReportInfoByParam(MonthReportVo param);
	
	/**
	 * @Description: 根据ID查询月报信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      MonthReportManagerVo 数据信息
	 * @date:        2018-03-14
	 */
	public MonthReportVo queryMonthReportById(@Param("id")String id);
	
	/**
	 * @Description: 新增月报信息
	 * @author:      ZHOUMIN
	 * @param:       MonthReportManagerVo
	 * @date:        2018-03-14
	 */
	public void insertMonthReport(MonthReportVo vo);
	
	/**
	 * @Description: 修改月报信息
	 * @author:      ZHOUMIN
	 * @param:       MonthReportManagerVo
	 * @date:        2018-03-14
	 */
	public void updateMonthReport(MonthReportVo vo);
	
	/**
	 * @Description: 修改月报状态
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @date:        2018-03-14
	 */
	public void updateMonthReportStatus(@Param("id")String id);
}
