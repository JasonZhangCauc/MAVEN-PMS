package com.ps.dao.taskManage;


import java.util.List;

import com.ps.result.taskmanage.AdjustRecordVo;


/**
 * @Description:    调整记录DAO接口 
 * @author:         zhangm
 * @date:           2018-07-27
 */
public interface AdjustRecordDao {
	
	/**
	 * @Description: 根据督办id查询调整记录
	 * @author:      zhangm
	 * @param:       OverseeVo
	 * @return:      List<projectBaseInfoVo>督办列表   
	 * @date:        2018-07-27
	 */
	List<AdjustRecordVo> queryAdjustRecordVoByParam(AdjustRecordVo param);
	
	/**
	 * 添加调整记录
	 */
	void insertAdjustRecord(AdjustRecordVo param);

}
