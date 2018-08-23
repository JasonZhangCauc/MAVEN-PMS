package com.ps.dao.taskManage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.taskmanage.WorkhoursRecordVo;


/**
 * @Description:    DAO接口 
 * @author:         RAOMINGYI
 * @date:           2018-07-02
 */
public interface WorkhoursRecordDao{
	
	/**
	 * @Description: 根据参数查询列表信息
	 * @author:      RAOMINGYI
	 * @param:       WorkhoursRecordVo
	 * @return:      WorkhoursRecordVo 列表信息
	 * @date:        2018-07-02
	 */
	List<WorkhoursRecordVo> queryWorkhoursRecordInfoByParam(WorkhoursRecordVo param);
	
	/**
	 * @Description: 根据ID查询列表信息
	 * @author:      RAOMINGYI
	 * @param:       id
	 * @return:      WorkhoursRecordVo 数据信息
	 * @date:        2018-07-02
	 */
	public WorkhoursRecordVo queryWorkhoursRecordById(@Param("id")String id);
	
	/**
	 * @Description: 新增信息
	 * @author:      RAOMINGYI
	 * @param:       WorkhoursRecordVo
	 * @date:        2018-07-02
	 */
	public void insertWorkhoursRecord(WorkhoursRecordVo vo);
	
	/**
	 * @Description: 修改信息
	 * @author:      RAOMINGYI
	 * @param:       WorkhoursRecordVo
	 * @date:        2018-07-02
	 */
	public void updateWorkhoursRecord(WorkhoursRecordVo vo);
	
	/**
	 * @Description: 删除信息
	 * @author:      RAOMINGYI
	 * @param:       id
	 * @date:        2018-07-02
	 */
	public void deleteWorkhoursRecordById(@Param("id")String id);
	
	
	/**
	 * @Description: 修改信息
	 * @author:      RAOMINGYI
	 * @param:       WorkhoursRecordVo
	 * @date:        2018-07-02
	 */
	public void updateRecordStatus(WorkhoursRecordVo vo);
	/**
	 * @Description: 获取总项目工时
	 * @author:      RAOMINGYI
	 * @param:       String
	 * @date:        2018-07-02
	 */
	public String queryWorkhoursTotalByParam(WorkhoursRecordVo vo);
}
