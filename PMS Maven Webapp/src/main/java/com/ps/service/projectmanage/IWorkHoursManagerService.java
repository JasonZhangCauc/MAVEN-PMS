package com.ps.service.projectmanage;

import java.util.List;
import java.util.Map;

import com.ps.result.projectmanage.WorkHoursVo;

/**
 * @Description:    接口类
 * @author:         ZHOUMIN
 * @date:           2018-03-15
 */
public interface IWorkHoursManagerService {

	/**
	 * @Description: 查询列表信息
	 * @author:      ZHOUMIN
	 * @param:       WorkHoursManagerVo
	 * @return:      List<WorkHoursManagerVo>数据列表   
	 * @date:        2018-03-15
	 */
	List<WorkHoursVo> queryWorkHoursInfoByParam(WorkHoursVo param);
	
	/**
	 * @Description: 根据ID查询数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      WorkHoursVo数据   
	 * @date:        2018-03-15
	 */
	WorkHoursVo queryWorkHoursInfoById(String id);
	
	/**
	 * @Description: 保存信息
	 * @author:      ZHOUMIN
	 * @param:       WorkHoursVo   
	 * @date:        2018-03-15
	 */
	void saveWorkHours(WorkHoursVo vo);
	
	/**
	 * @Description: 根据ID删除信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-03-15
	 */
	void deleteWorkHoursById(String id);

	/**
		 * @Description: 导出工时统计信息
		 * @author:      jczou
		 * @param:       request
		 * @return:      URL
		 * @date:        2018-3-21 下午3:34:07
		 */
	Map<String, Object> exportWorkHoursInfo(WorkHoursVo vo);
}

