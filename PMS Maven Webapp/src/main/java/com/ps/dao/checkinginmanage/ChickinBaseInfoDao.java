package com.ps.dao.checkinginmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.ps.result.checkinginmanage.ChickinBaseInfoVo;


/**
 * 
 * @Description:    打卡记录DAO接口 
 * ChickinBaseInfoDao
 * @author：JasonZhang
 * @date：2018-8-2-下午4:44:55 
 *
 */
public interface ChickinBaseInfoDao{
	
	
	/**
	 * 
	 * @Description:根据参数查询打卡记录列表信息
	 * @author：JasonZhang 
	 * @date：2018-8-2-下午4:46:18 
	 * @param param
	 * @return List<ChickinBaseInfoVo>列表信息
	 * @exception
	 */
	List<ChickinBaseInfoVo> queryChickinBaseInfoInfoByParam(ChickinBaseInfoVo param);
	
	List<ChickinBaseInfoVo> queryChickinByParam(ChickinBaseInfoVo param);

	void saveChickin(ChickinBaseInfoVo vo);
	
	void updateChickin(ChickinBaseInfoVo vo);

	void deleteChickinByTime(ChickinBaseInfoVo vo);

	void deleteChickinById(@Param("id")String id);

	ChickinBaseInfoVo queryChickinBaseInfoById(@Param("id")String id);
	
	public int queryChickinBaseInfoInfoByCount(ChickinBaseInfoVo param);
	
}
