package com.ps.service.projectmanage;

import java.util.List;
import java.util.Map;

import com.ps.result.projectmanage.OtherCostManagerVo;

/**
 * @Description:    其他成本接口类
 * @author:         jczou
 * @date:           2018-03-19
 */
public interface IOtherCostManagerService {

	/**
	 * @Description: 查询其他成本列表信息
	 * @author:      jczou
	 * @param:       OtherCostManagerVo
	 * @return:      List<OtherCostManagerVo>数据列表   
	 * @date:        2018-03-19
	 */
	List<OtherCostManagerVo> queryOtherCostManagerInfoByParam(OtherCostManagerVo param);
	
	/**
	 * @Description: 根据ID查询其他成本数据信息
	 * @author:      jczou
	 * @param:       id
	 * @return:      OtherCostManagerVo数据   
	 * @date:        2018-03-19
	 */
	OtherCostManagerVo queryOtherCostManagerInfoById(String id);
	
	/**
	 * @Description: 保存其他成本信息
	 * @author:      jczou
	 * @param:       OtherCostManagerVo   
	 * @date:        2018-03-19
	 */
	void saveOtherCostManager(OtherCostManagerVo vo);
	
	/**
	 * @Description: 根据ID删除其他成本信息
	 * @author:      jczou
	 * @param:       id 
	 * @date:        2018-03-19
	 */
	void deleteOtherCostManagerById(String id);
	
	/**
	 * @Description: 根据查询条件获取导出数据
	 * @author:      jczou
	 * @param:       OtherCostManagerVo   
	 * @date:        2018-03-19
	 */
	Map<String,Object> exportOtherCostInfo(OtherCostManagerVo otherCostVo);
}

