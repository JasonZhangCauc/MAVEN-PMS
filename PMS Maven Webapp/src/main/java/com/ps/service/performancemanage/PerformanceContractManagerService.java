package com.ps.service.performancemanage;

import java.util.List;

import com.ps.result.performancemanage.PerformanceContractVo;

/**
 * @Description: 绩效合约管理接口类
 * @author:   	 zlshi
 * @date:        2018-8-9
 *
 */
public interface PerformanceContractManagerService {
	/**
	 * @Description:   查询给定条件的绩效合约信息
	 * @author:        zlshi
	 * @param:         PerformanceContractVO
	 * @return:        List<PerformanceContractVO>
	 * @date:		   2018-8-9
	 */
	public List<PerformanceContractVo> getAllPerformanceContract(PerformanceContractVo tbVO);
	
	/**
	 * @Description:   保存绩效合约信息
	 * @author:        zlshi
	 * @param:         PerformanceContractVO
	 * @return:        
	 * @date:		   2018-8-9
	 */
	public void savePerformanceContract(PerformanceContractVo tbVO);
	
	/**
	 * @Description:   删除绩效合约
	 * @author:        zlshi
	 * @date:		   2018-8-9
	 */
	public void deletePerformanceContract(PerformanceContractVo VO);

	/**
	 * @Description:   根据ID查询绩效合约
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-9
	 */
	public PerformanceContractVo getPerformanceContractById(String id);
	
	/**
	 * @Description:   提交绩效合约
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-9
	 */
	public void submitPerformanceContract(PerformanceContractVo tbVO);
	
	/**
	 * @Description:   更新绩效合约状态
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-9
	 */
	public void auditPerformanceContract(PerformanceContractVo tbVO);
}
