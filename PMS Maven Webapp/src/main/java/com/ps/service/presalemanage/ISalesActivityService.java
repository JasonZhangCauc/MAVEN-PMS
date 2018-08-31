package com.ps.service.presalemanage;

import java.util.List;

import com.ps.result.presalemanage.SalesActivityVo;

/**
 * @Description:    销售活动接口类
 * @author:         raomingyi
 * @date:           2018-03-02
 */
public interface ISalesActivityService {

	/**
	 * @Description: 查询销售活动信息
	 * @author:      raomingyi
	 * @param:       SalesActivityVo
	 * @return:      List<SalesActivityVo>数据列表   
	 * @date:        2018-03-02
	 */
	List<SalesActivityVo> querySalesActivityByParam(SalesActivityVo param);
	
	/**
	 * @Description: 根据ID查询销售活动数据信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      SalesActivityVo数据   
	 * @date:        2018-03-02
	 */
	SalesActivityVo querySalesActivityById(String id);
	
	/**
	 * @Description: 保存销售活动信息
	 * @author:      raomingyi
	 * @param:       SalesActivityVo   
	 * @date:        2018-03-02
	 */
	void saveSalesActivity(SalesActivityVo vo);
	
	/**
	 * @Description: 根据ID删除销售活动信息
	 * @author:      raomingyi
	 * @param:       id 
	 * @date:        2018-03-02
	 */
	void deleteSalesActivityById(String id);
}

