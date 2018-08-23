package com.ps.dao.projectmanage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ps.result.projectmanage.WorkHoursVo;

/**
 * @Description:    DAO接口 
 * @author:         jczou
 * @date:           2018-03-15
 */
public interface WorkHoursManagerDao{
	
	/**
	 * @Description: 根据参数查询列表信息
	 * @author:      jczou
	 * @param:       WorkHoursManagerVo
	 * @return:      WorkHoursManagerVo 列表信息
	 * @date:        2018-03-15
	 */
	List<WorkHoursVo> queryWorkHoursInfoByParam(WorkHoursVo param);
	
	/**
	 * @Description: 根据ID查询列表信息
	 * @author:      jczou
	 * @param:       id
	 * @return:      WorkHoursVo 数据信息
	 * @date:        2018-03-15
	 */
	public WorkHoursVo queryWorkHoursById(@Param("id")String id);
	
	/**
	 * @Description: 新增信息
	 * @author:      jczou
	 * @param:       WorkHoursVo
	 * @date:        2018-03-15
	 */
	public void insertWorkHours(WorkHoursVo vo);
	
	/**
	 * @Description: 修改信息
	 * @author:      jczou
	 * @param:       WorkHoursVo
	 * @date:        2018-03-15
	 */
	public void updateWorkHours(WorkHoursVo vo);
	
	/**
	 * @Description: 删除信息
	 * @author:      jczou
	 * @param:       id
	 * @date:        2018-03-15
	 */
	public void deleteWorkHoursById(@Param("id")String id);

	/**
	 * @Description:	根据查询条件查询项目信息
	 * @author:    		ZHOUMIN
	 * @param: 			vo 查询条件
	 * @return: 		List<Map<String,Object>>项目信息
	 * @date:        	2018-3-21 下午3:45:38
	 */
	List<Map<String,Object>> getProjectInfo(WorkHoursVo vo);
	
	/**
	 * @Description: 根据项目ID及查询条件查询工时信息
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      List<Map<String, Object>> 工时信息
	 * @date:        2018-3-21 下午3:45:38
	 */
	List<Map<String, Object>> getWorkHoursInfo(WorkHoursVo vo);
}
