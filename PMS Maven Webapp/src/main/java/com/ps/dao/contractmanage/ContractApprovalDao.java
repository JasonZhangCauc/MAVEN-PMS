package com.ps.dao.contractmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.contractmanage.ContractApprovalVo;

/**
 * @Description:    合同审批DAO接口 
 * @author:         raomingyi
 * @date:           2018-03-13
 */
public interface ContractApprovalDao{
	
	/**
	 * @Description: 根据参数查询合同信息
	 * @author:      raomingyi
	 * @param:       ContractApprovalVo
	 * @return:      ContractApprovalVo 列表信息
	 * @date:        2018-03-13
	 */
	List<ContractApprovalVo> queryContractAppInfoByParam(ContractApprovalVo param);
	
	/**
	 * @Description: 根据ID查询合同信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      ContractApprovalVo 数据信息
	 * @date:        2018-03-13
	 */
	public ContractApprovalVo queryContractAppById(@Param("id")String id);
	/**
	 * @Description: 合同审批
	 * @author:      raomingyi
	 * @param:       ContractApprovalVo
	 * @date:        2018-03-13
	 */
	public void updateContractStatus(ContractApprovalVo vo);
	
}
