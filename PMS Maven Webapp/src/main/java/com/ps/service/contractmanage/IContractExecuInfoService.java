package com.ps.service.contractmanage;

import java.util.List;

import com.ps.result.contractmanage.ContractExecuInfoVo;
import com.ps.result.contractmanage.ContractVo;

/**
 * @Description:    合同执行情况业务接口类
 * @author:         raomingyi
 * @date:           2018-03-21
 */
public interface IContractExecuInfoService {

	/**
	 * @Description: 通过参数查询合同执行信息
	 * @author:      raomingyi
	 * @param:       ContractVo
	 * @return:      List<ContractVo>数据列表   
	 * @date:        2018-03-21
	 */
	List<ContractVo> queryContractExecuInfoByParam(ContractVo param);
	
	/**
	 * @Description: 根据ID查询合同合同执行信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      ContractVo数据   
	 * @date:        2018-03-21
	 */
	ContractVo queryContractExecuInfoById(String id);
	
	/**
	 * @Description: 查询合同跟踪信息
	 * @author:      raomingyi
	 * @param:       ContractExecuInfoVo
	 * @return:      List<ContractExecuInfoVo>数据列表   
	 * @date:        2018-03-21
	 */
	List<ContractExecuInfoVo> queryContractTrackInfoByParam(ContractExecuInfoVo param);
	
	/**
	 * @Description: 根据ID查询合同跟踪信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      ContractTrackVo数据   
	 * @date:        2018-03-21
	 */
	ContractExecuInfoVo queryContractTrackInfoById(String id);
	
	/**
	 * @Description: 保存合同跟踪信息
	 * @author:      raomingyi
	 * @param:       ContractExecuInfoVo   
	 * @date:        2018-03-21
	 */
	void saveContractTrack(ContractExecuInfoVo vo);
	
	/**
	 * @Description: 根据ID删除合同跟踪信息
	 * @author:      raomingyi
	 * @param:       id 
	 * @date:        2018-03-21
	 */
	void deleteContractTrackById(String id);
}

