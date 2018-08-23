package com.ps.service.projectmanage;

import java.util.List;

import com.ps.result.projectmanage.TrackingVo;

/**
 * @Description:    跟踪表信息业务接口类
 * @author:         ZHOUMIN
 * @date:           2018-08-08
 */
public interface ITrackingManagerService {

	/**
	 * @Description: 查询跟踪表列表信息
	 * @author:      ZHOUMIN
	 * @param:       TrackingManagerVo
	 * @return:      List<TrackingManagerVo>数据列表   
	 * @date:        2018-08-08
	 */
	List<TrackingVo> queryTrackingInfoByParam(TrackingVo param);
	
	/**
	 * @Description: 根据ID查询跟踪表数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      TrackingManagerVo数据   
	 * @date:        2018-08-08
	 */
	TrackingVo queryTrackingInfoById(String id);
	
	/**
	 * @Description: 保存跟踪表信息
	 * @author:      ZHOUMIN
	 * @param:       TrackingVo   
	 * @date:        2018-08-08
	 */
	TrackingVo saveTracking(TrackingVo vo);
	
	/**
	 * @Description: 根据ID删除跟踪表信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-08-08
	 */
	void deleteTrackingById(String id);
}

