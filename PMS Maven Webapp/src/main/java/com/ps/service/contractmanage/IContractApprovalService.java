package com.ps.service.contractmanage;

import java.util.List;

import com.ps.result.contractmanage.ContractApprovalVo;

/**
 * @Description:    合同审批接口类
 * @author:         raomingyi
 * @date:           2018-03-15
 */
public interface IContractApprovalService {

	/**
	 * @Description: 查询合同信息
	 * @author:      raomingyi
	 * @param:       ContractApprovalVo
	 * @return:      List<ContractApprovalVo>数据列表   
	 * @date:        2018-03-15
	 */
	List<ContractApprovalVo> queryContractAppInfoByParam(ContractApprovalVo param);
	/**
	 * @Description: 根据ID查询合同数据信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      ContractApprovalVo数据   
	 * @date:        2018-03-13
	 */
	ContractApprovalVo queryContractAppInfoById(String id);
	
	/**
	 * @Description: 合同审批
	 * @author:      raomingyi
	 * @param:       ContractApprovalVo   
	 * @date:        2018-03-15
	 */
	void updateContractStatus(ContractApprovalVo vo);
	
}

