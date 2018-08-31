package com.ps.dao.presalemanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.presalemanage.SalesActivityVo;

/**
 * @Description:    销售活动DAO接口 
 * @author:         raomingyi
 * @date:           2018-03-02
 */
public interface SalesActivityDao{
	
	/**
	 * @Description: 根据参数查询销售活动信息
	 * @author:      raomingyi
	 * @param:       SalesActivityVo
	 * @return:      SalesActivityVo 列表信息
	 * @date:        2018-03-02
	 */
	List<SalesActivityVo> querySalesActivityByParam(SalesActivityVo param);
	
	/**
	 * @Description: 根据ID查询销售活动信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      SalesActivityVo
	 * @date:        2018-03-02
	 */
	public SalesActivityVo querySalesActivityById(@Param("id")String id);
	
	/**
	 * @Description: 新增销售活动信息
	 * @author:      raomingyi
	 * @param:       SalesActivityVo
	 * @date:        2018-03-02
	 */
	public void insertSalesActivity(SalesActivityVo vo);
	
	/**
	 * @Description: 修改销售活动信息
	 * @author:      raomingyi
	 * @param:       SalesActivityVo
	 * @date:        2018-03-02
	 */
	public void updateSalesActivity(SalesActivityVo vo);
	
	/**
	 * @Description: 删除销售活动信息
	 * @author:      raomingyi
	 * @param:       id
	 * @date:        2018-03-02
	 */
	public void deleteSalesActivityById(@Param("id")String id);
}
