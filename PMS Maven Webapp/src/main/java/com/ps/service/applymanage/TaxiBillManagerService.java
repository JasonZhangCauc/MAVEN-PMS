package com.ps.service.applymanage;

import java.util.List;

import com.ps.result.applymanage.TaxiBillVo;

/**
 * 
 * @Description: 打车报销接口类
 * @author:   	 zlshi
 * @date:        2018-8-2 
 *
 */
public interface TaxiBillManagerService {
	/**
	 * @Description:   查询给定条件的打车报销信息
	 * @author:        zlshi
	 * @param:         TaxiBillVO
	 * @return:        List<TaxiBillVO>
	 * @date:		   2018-8-2
	 */
	public List<TaxiBillVo> getAllTaxiBill(TaxiBillVo tbVO);
	
	/**
	 * @Description:   保存打车报销单信息
	 * @author:        zlshi
	 * @param:         TaxiBillVO
	 * @return:        
	 * @date:		   2018-8-2
	 */
	public void saveTaxiBill(TaxiBillVo tbVO);
	
	/**
	 * @Description:   删除打车报销单
	 * @author:        zlshi
	 * @date:		   2018-8-2
	 */
	public void deleteTaxiBill(TaxiBillVo tbVO);

	/**
	 * @Description:   根据ID查询打车报销单s
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-7
	 */
	public TaxiBillVo getTaxiBillByID(String id);
	
	/**
	 * @Description:   提交打车报销单
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-7
	 */
	public void updateTaxiBill(TaxiBillVo tbVO);
	
	/**
	 * @Description:   更新打车报销单状态
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-7
	 */
	public void updateTaxiBillStatus(TaxiBillVo tbVO);

	public void submitTaxiBill(TaxiBillVo tbVO);
	
	
}
