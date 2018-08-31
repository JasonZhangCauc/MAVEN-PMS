package com.ps.service.performancemanage;

import java.util.List;

import com.ps.result.performancemanage.PerformanceVo;
import com.ps.result.systemmanage.UserVo;

/**
 * @Description:    績效管理业务接口类
 * @author:         ZHOUMIN
 * @date:           2018-03-12
 */
public interface IPerformanceManagerService {
	
	/**
	 * @Description: 查询所有绩效的用户信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 
	 * @return:      List<UserVo>用户信息
	 * @date:        2018-03-12
	 */
	List<UserVo> queryPerformanceUserByParam(UserVo userVo);

	/**
	 * @Description: 查询績效管理列表信息
	 * @author:      ZHOUMIN
	 * @param:       PerformanceManagerVo
	 * @return:      List<PerformanceManagerVo>数据列表   
	 * @date:        2018-03-12
	 */
	List<PerformanceVo> queryPerformanceInfoByParam(PerformanceVo param);
	
	/**
	 * @Description: 根据ID查询績效管理数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      PerformanceManagerVo数据   
	 * @date:        2018-03-12
	 */
	PerformanceVo queryPerformanceInfoById(String id);
	
	/**
	 * @Description: 保存績效管理信息
	 * @author:      ZHOUMIN
	 * @param:       PerformanceManagerVo   
	 * @date:        2018-03-12
	 */
	void savePerformance(PerformanceVo vo);
	
	/**
	 * @Description: 生成当月绩效信息
	 * @author:      ZHOUMIN
	 * @param:       userIds需生成用户  
	 * @date:        2018-03-12
	 */
	void generateTheSameMonthPerformance(String userIds);
}

