package com.ps.dao.projectmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.ps.result.projectmanage.TrackingVo;

/**
 * @Description:    跟踪表DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-08-08
 */
public interface TrackingManagerDao{
	
	/**
	 * @Description: 根据参数查询跟踪表列表信息
	 * @author:      ZHOUMIN
	 * @param:       TrackingManagerVo
	 * @return:      TrackingManagerVo 列表信息
	 * @date:        2018-08-08
	 */
	List<TrackingVo> queryTrackingInfoByParam(TrackingVo param);
	
	/**
	 * @Description: 根据ID查询跟踪表列表信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      TrackingManagerVo 数据信息
	 * @date:        2018-08-08
	 */
	public TrackingVo queryTrackingById(@Param("id")String id);
	
	/**
	 * @Description: 新增跟踪表信息
	 * @author:      ZHOUMIN
	 * @param:       TrackingManagerVo
	 * @date:        2018-08-08
	 */
	public void insertTracking(TrackingVo vo);
	
	/**
	 * @Description: 修改跟踪表信息
	 * @author:      ZHOUMIN
	 * @param:       TrackingManagerVo
	 * @date:        2018-08-08
	 */
	public void updateTracking(TrackingVo vo);
	
	/**
	 * @Description: 删除跟踪表信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @date:        2018-08-08
	 */
	public void deleteTrackingById(@Param("id")String id);
}
