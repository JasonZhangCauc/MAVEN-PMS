package com.ps.dao.taskManage;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.taskmanage.OverseeVo;


/**
 * @Description:    督办DAO接口 
 * @author:         zhangm
 * @date:           2018-07-27
 */
public interface OverseeDao {
	
	/**
	 * @Description: 根据参数查询督办列表信息
	 * @author:      zhangm
	 * @param:       OverseeVo
	 * @return:      OverseeVo 列表信息
	 * @date:        2018-07-27
	 */
	List<OverseeVo> queryOverseeInfoInfoByParam(OverseeVo param);
	
	
	/**
	 * @Description: 根据ID查询督办列表信息
	 * @author:      zhangm
	 * @param:       id
	 * @return:      OverseeVo 数据信息
	 * @date:        2018-07-27
	 */
	public OverseeVo queryOverseeInfoById(@Param("id")String id);
	
	/**
	 * @Description: 新增督办信息
	 * @author:      zhangm
	 * @param:       OverseeVo
	 * @date:        2018-07-27
	 */
	public void insertSuperviseInfo(OverseeVo vo);
	
	
	/**
	 * @Description: 修改督办信息
	 * @author:      zhangm
	 * @param:       OverseeVo
	 * @date:        2018-07-27
	 */
	public void updateSuperviseInfo(OverseeVo vo);
	
	/**
	 * @Description: 审批督办信息
	 * @author:      zhangm
	 * @param:       OverseeVo
	 * @date:        2018-07-27
	 */
	public void updateSuperviseInfoList(OverseeVo vo);
	
	/**
	 * @Description: 删除督办信息
	 * @author:      zhangm
	 * @param:       id
	 * @date:        2018-07-27
	 */
	public void deleteSuperviseInfo(@Param("id")String id);
	
	/**
	 * @Description: 调整督办信息
	 * @author:      zhangm
	 * @param:       OverseeVo
	 * @date:        2018-07-27
	 */
	public void updateSuperviseInfoById(OverseeVo vo);

}
