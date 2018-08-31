package com.ps.service.performancemanage;

import java.util.List;

import com.ps.result.performancemanage.MonthReportVo;

/**
 * @Description:    月报业务接口类
 * @author:         ZHOUMIN
 * @date:           2018-03-14
 */
public interface IMonthReportManagerService {

	/**
	 * @Description: 查询月报列表信息
	 * @author:      ZHOUMIN
	 * @param:       MonthReportVo
	 * @return:      List<MonthReportVo>数据列表   
	 * @date:        2018-03-14
	 */
	List<MonthReportVo> queryMonthReportInfoByParam(MonthReportVo param);
	
	/**
	 * @Description: 根据ID查询月报数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      MonthReportManagerVo数据   
	 * @date:        2018-03-14
	 */
	MonthReportVo queryMonthReportInfoById(String id);
	
	/**
	 * @Description: 保存月报信息
	 * @author:      ZHOUMIN
	 * @param:       MonthReportManagerVo   
	 * @date:        2018-03-14
	 */
	void saveMonthReport(MonthReportVo vo);
	
	/**
	 * @Description: 根据ID删除月报信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-03-14
	 */
	void deleteMonthReportById(String id);
}

