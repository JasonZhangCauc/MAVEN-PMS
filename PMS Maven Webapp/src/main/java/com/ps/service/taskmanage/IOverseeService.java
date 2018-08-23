package com.ps.service.taskmanage;

import java.util.List;

import com.ps.result.taskmanage.AdjustRecordVo;
import com.ps.result.taskmanage.OverseeVo;

/**
 * @Description:    督办接口类
 * @author:         zhangm
 * @date:           2018-07-27
 */
public interface IOverseeService {
	
	/**
	 * @Description: 查询督办列表信息
	 * @author:      zhangm
	 * @param:       OverseeVo
	 * @return:      List<projectBaseInfoVo>督办列表   
	 * @date:        2018-07-27
	 */
	List<OverseeVo> queryOverseeInfoByParam(OverseeVo param);
	
	/**
	 * @Description: 根据督办id查询调整记录
	 * @author:      zhangm
	 * @param:       OverseeVo
	 * @return:      List<projectBaseInfoVo>督办列表   
	 * @date:        2018-07-27
	 */
	List<AdjustRecordVo> queryAdjustRecordVoByParam(AdjustRecordVo param);
	
	/**
	 * @Description: 根据ID查询督办数据信息
	 * @author:      zhangm
	 * @param:       id
	 * @return:      OverseeVo数据   
	 * @date:        2018-07-27
	 */
	public OverseeVo queryOverseeBaseInfoById(String id);
	
	/**
	 * @Description: 保存督办信息
	 * @author:      zhangm
	 * @param:       OverseeVo   
	 * @date:        2018-07-27
	 */
	void saveSuperviseInfo(OverseeVo vo);
	
	/**
	 * @Description: 调整
	 * @author:      zhangm
	 * @param:       OverseeVo   
	 * @date:        2018-07-27
	 */
	void updateSuperviseInfo(OverseeVo vo);
	
	/**
	 * @Description: 根据ID删除督办信息
	 * @author:      zhangm
	 * @param:       id 
	 * @date:        2018-07-27
	 */
	void deleteSuperviseInfo(String id);
	
	/**
	 * 督办审批
	 * @param vo
	 */
	void updateSuperviseInfoStatus(OverseeVo vo);

	/**
	 * @Description: 保存督办信息
	 * @author:      zhangm
	 * @param:       OverseeVo   
	 * @date:        2018-07-27
	 */
	void saveSuperviseInfoCL(OverseeVo vo);
}
