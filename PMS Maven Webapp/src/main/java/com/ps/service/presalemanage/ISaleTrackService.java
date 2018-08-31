package com.ps.service.presalemanage;

import java.util.List;

import com.ps.result.presalemanage.SaleTrackVo;

/**
 * @Description:    销售跟踪接口类
 * @author:         raomingyi
 * @date:           2018-03-09
 */
public interface ISaleTrackService {

	/**
	 * @Description: 查询销售跟踪列表信息
	 * @author:      raomingyi
	 * @param:       SaleTrackVo
	 * @return:      List<SaleTrackVo>数据列表   
	 * @date:        2018-03-09
	 */
	List<SaleTrackVo> querySaleTrackInfoByParam(SaleTrackVo param);
	
	/**
	 * @Description: 根据ID查询销售跟踪数据信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      SaleTrackVo数据   
	 * @date:        2018-03-09
	 */
	SaleTrackVo querySaleTrackInfoById(String id);
	
	/**
	 * @Description: 保存销售跟踪信息
	 * @author:      raomingyi
	 * @param:       SaleTrackVo   
	 * @date:        2018-03-09
	 */
	void saveSaleTrack(SaleTrackVo vo);
	
	/**
	 * @Description: 根据ID删除销售跟踪信息
	 * @author:      raomingyi
	 * @param:       id 
	 * @date:        2018-03-09
	 */
	void deleteSaleTrackById(String id);
}

