package com.ps.dao.performancemanager;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.performancemanage.DailyReportVo;

/**
 * @Description:    日报数据访问DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-03-13
 */
public interface DailyReportManagerDao{
	
	/**
	 * @Description: 根据参数查询日报列表信息
	 * @author:      ZHOUMIN
	 * @param:       DailyReportManagerVo
	 * @return:      DailyReportManagerVo 列表信息
	 * @date:        2018-03-13
	 */
	List<DailyReportVo> queryDailyReportInfoByParam(DailyReportVo param);
	
	/**
	 * @Description: 根据ID查询日报信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      DailyReportManagerVo 数据信息
	 * @date:        2018-03-13
	 */
	public DailyReportVo queryDailyReportById(@Param("id")String id);
	
	/**
	 * @Description: 新增日报信息
	 * @author:      ZHOUMIN
	 * @param:       DailyReportManagerVo
	 * @date:        2018-03-13
	 */
	public void insertDailyReport(DailyReportVo vo);
	
	/**
	 * @Description: 修改日报信息
	 * @author:      ZHOUMIN
	 * @param:       DailyReportManagerVo
	 * @date:        2018-03-13
	 */
	public void updateDailyReport(DailyReportVo vo);
	
	/**
	 * @Description: 删除日报信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @date:        2018-03-13
	 */
	public void updateDailyReportStatus(@Param("id")String id);
}
