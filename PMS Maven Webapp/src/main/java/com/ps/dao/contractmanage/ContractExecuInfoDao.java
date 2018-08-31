package com.ps.dao.contractmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.contractmanage.ContractExecuInfoVo;
import com.ps.result.contractmanage.ContractVo;

/**
 * @Description:    合同执行情况DAO接口 
 * @author:         raomingyi
 * @date:           2018-03-21
 */
public interface ContractExecuInfoDao{
	
	
	/**
	 * @Description: 根据参数查询合同执行情况信息
	 * @author:      raomingyi
	 * @param:       ContractVo
	 * @return:      ContractVo 列表信息
	 * @date:        2018-03-21
	 */
	List<ContractVo> queryContractExecuInfoByParam(ContractVo param);
	
	/**
	 * @Description: 根据ID查询合同执行情况信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      ContractVo
	 * @date:        2018-03-21
	 */
	public ContractVo queryContractExecuInfoById(@Param("contractId")String contractId);
	
	/**
	 * @Description: 根据参数查询合同跟踪信息
	 * @author:      raomingyi
	 * @param:       ContractExecuInfoVo
	 * @return:      ContractExecuInfoVo 列表信息
	 * @date:        2018-03-21
	 */
	List<ContractExecuInfoVo> queryContractTrackInfoByParam(ContractExecuInfoVo param);
	
	/**
	 * @Description: 根据ID查询合同跟踪信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      ContractExecuInfoVo
	 * @date:        2018-03-21
	 */
	public ContractExecuInfoVo queryContractTrackById(@Param("id")String id);
	
	/**
	 * @Description: 新增合同跟踪信息
	 * @author:      raomingyi
	 * @param:       ContractExecuInfoVo
	 * @date:        2018-03-21
	 */
	public void insertContractTrack(ContractExecuInfoVo vo);
	
	/**
	 * @Description: 修改合同跟踪信息
	 * @author:      raomingyi
	 * @param:       ContractExecuInfoVo
	 * @date:        2018-03-21
	 */
	public void updateContractTrack(ContractExecuInfoVo vo);
	
	/**
	 * @Description: 删除合同跟踪信息
	 * @author:      raomingyi
	 * @param:       id
	 * @date:        2018-03-21
	 */
	public void deleteContractTrackById(@Param("id")String id);
}
