package com.ps.dao.presalemanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.presalemanage.SaleTrackVo;

/**
 * @Description:    销售跟踪DAO接口 
 * @author:         raomingyi
 * @date:           2018-03-09
 */
public interface SaleTrackDao{
	
	/**
	 * @Description: 根据参数查询销售跟踪信息
	 * @author:      raomingyi
	 * @param:       SaleTrackVo
	 * @return:      SaleTrackVo
	 * @date:        2018-03-09
	 */
	List<SaleTrackVo> querySaleTrackInfoByParam(SaleTrackVo param);
	
	/**
	 * @Description: 根据ID查询销售跟踪信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      SaleTrackVo
	 * @date:        2018-03-09
	 */
	public SaleTrackVo querySaleTrackById(@Param("id")String id);
	
	/**
	 * @Description: 新增销售跟踪信息
	 * @author:      raomingyi
	 * @param:       SaleTrackVo
	 * @date:        2018-03-09
	 */
	public void insertSaleTrack(SaleTrackVo vo);
	
	/**
	 * @Description: 修改销售跟踪信息
	 * @author:      raomingyi
	 * @param:       SaleTrackVo
	 * @date:        2018-03-09
	 */
	public void updateSaleTrack(SaleTrackVo vo);
	
	/**
	 * @Description: 删除销售跟踪信息
	 * @author:      raomingyi
	 * @param:       id
	 * @date:        2018-03-09
	 */
	public void deleteSaleTrackById(@Param("id")String id);
	
	/**
	 * @Description: 根据所属产品查询销售项目最大编号
	 * @author:      raomingyi
	 * @param:       belongProduct项目所属产品
	 * @return:      String
	 * @date:        2018-03-09
	 */
	public String getMaxProjectNo(@Param("belongProduct")String belongProduct);
	
	/**
	 * @Description: 根据产品id查询产品名称
	 * @author:      raomingyi
	 * @param:       belongProduct项目所属产品
	 * @return:      String
	 * @date:        2018-03-09
	 */
	public String getProductNameByCode(@Param("belongProduct")String belongProduct);
	
}
