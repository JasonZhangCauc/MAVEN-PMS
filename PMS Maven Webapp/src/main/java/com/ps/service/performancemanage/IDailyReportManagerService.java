package com.ps.service.performancemanage;

import java.util.List;

import com.ps.result.performancemanage.DailyReportVo;

/**
 * @Description:    日报业务接口类
 * @author:         ZHOUMIN
 * @date:           2018-03-13
 */
public interface IDailyReportManagerService {

	/**
	 * @Description: 查询日报列表信息
	 * @author:      ZHOUMIN
	 * @param:       DailyReportVo
	 * @return:      List<DailyReportVo>日报数据列表   
	 * @date:        2018-03-13
	 */
	List<DailyReportVo> queryDailyReportInfoByParam(DailyReportVo param);
	
	/**
	 * @Description: 根据ID查询日报信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      DailyReportVo日报数据   
	 * @date:        2018-03-13
	 */
	DailyReportVo queryDailyReportInfoById(String id);
	
	/**
	 * @Description: 保存日报信息
	 * @author:      ZHOUMIN
	 * @param:       DailyReportVo   
	 * @date:        2018-03-13
	 */
	void saveDailyReport(DailyReportVo vo);
	
	/**
	 * @Description: 根据ID删除日报信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-03-13
	 */
	void deleteDailyReportById(String id);
}

