package com.ps.service.taskmanage;

import java.util.List;

import com.ps.result.taskmanage.WorkhoursRecordVo;

/**
 * @Description:    接口类
 * @author:         RAOMINGYI
 * @date:           2018-07-02
 */
public interface IWorkhoursRecordService {

	/**
	 * @Description: 查询列表信息
	 * @author:      RAOMINGYI
	 * @param:       WorkhoursRecordVo
	 * @return:      List<WorkhoursRecordVo>数据列表   
	 * @date:        2018-07-02
	 */
	List<WorkhoursRecordVo> queryWorkhoursRecordInfoByParam(WorkhoursRecordVo param);
	
	/**
	 * @Description: 根据ID查询数据信息
	 * @author:      RAOMINGYI
	 * @param:       id
	 * @return:      WorkhoursRecordVo数据   
	 * @date:        2018-07-02
	 */
	WorkhoursRecordVo queryWorkhoursRecordInfoById(String id);
	
	/**
	 * @Description: 保存信息
	 * @author:      RAOMINGYI
	 * @param:       WorkhoursRecordVo   
	 * @date:        2018-07-02
	 */
	void saveWorkhoursRecord(WorkhoursRecordVo vo);
	
	/**
	 * @Description: 根据ID删除信息
	 * @author:      RAOMINGYI
	 * @param:       id 
	 * @date:        2018-07-02
	 */
	void deleteWorkhoursRecordById(String id);
	
	/**
	 * @Description:  工时审核状态修改 
	 * @author:      RAOMINGYI
	 * @param:       WorkhoursRecordVo   
	 * @date:        2018-07-02
	 */
	void updateRecordStatus(WorkhoursRecordVo vo);
	/**
	 * @Description: 获取总工时
	 * @author:      RAOMINGYI
	 * @param:       WorkhoursRecordVo   
	 * @date:        2018-07-07
	 */
	
	String queryWorkhoursTotalByParam(WorkhoursRecordVo vo);
}

