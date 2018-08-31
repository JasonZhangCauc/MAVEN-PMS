package com.ps.dao.applymanage;

import java.util.List;

import com.ps.result.applymanage.TaxiBillVo;

/**
 * 
 * @Description: 打车报销接口
 * @author:   	 zlshi
 * @date:        2018-8-2 
 *
 */
public interface TaxiBillManagerDao {
	
	/**
	 * @Description:   查询给定条件的打车报销
	 * @author:        zlshi
	 * @param:         TaxiBillVO
	 * @return:        List<TaxiBillVO>
	 * @date:		   2018-8-2
	 */
	public List<TaxiBillVo> getAllTaxiBill(TaxiBillVo tbVO);
	
	/**
	 * @Description:   添加一条打车报销单
	 * @author:        zlshi
	 * @param:         TaxiBillVO
	 * @return:        
	 * @date:		   2018-8-2
	 */
	public void addTaxiBill(TaxiBillVo tbVO);
	
	/**
	 * @Description:   保存打车报销单
	 * @author:        zlshi
	 * @param:         TaxiBillVO
	 * @return:        
	 * @date:		   2018-8-2
	 */
	public void updateTaxiBill(TaxiBillVo tbVO);
	
	/**
	 * @Description:   删除打车报销单
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-2
	 */
	public void deleteTaxiBill(TaxiBillVo tbVO);

	/**
	 * @Description:   根据ID查询的打车报销
	 * @author:        zlshi
	 * @param:         id
	 * @return:        TaxiBillVO
	 * @date:		   2018-8-2
	 */
	public TaxiBillVo getTaxiBillById(String id);
	
	/**
	 * @Description:   更新打车报销状态
	 * @author:        zlshi
	 * @param:         id
	 * @return:        TaxiBillVO
	 * @date:		   2018-8-2
	 */
	public void updateTaxiBillStatus(TaxiBillVo tbVO);
	
	
	
}
