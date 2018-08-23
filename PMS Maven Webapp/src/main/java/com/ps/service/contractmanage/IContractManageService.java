package com.ps.service.contractmanage;

import java.util.List;

import com.ps.result.contractmanage.ContractVo;

/**
 * @Description:    合同维护接口类
 * @author:         raomingyi
 * @date:           2018-03-13
 */
public interface IContractManageService {

	/**
	 * @Description: 查询合同信息
	 * @author:      raomingyi
	 * @param:       ContractVo
	 * @return:      List<ContractVo>数据列表   
	 * @date:        2018-03-13
	 */
	List<ContractVo> queryContractInfoByParam(ContractVo param);
	
	/**
	 * @Description: 根据ID查询合同数据信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      ContractManageVo数据   
	 * @date:        2018-03-13
	 */
	ContractVo queryContractInfoById(String id);
	
	/**
	 * @Description: 保存合同信息
	 * @author:      raomingyi
	 * @param:       ContractVo   
	 * @date:        2018-03-13
	 */
	void saveContract(ContractVo vo);
	
	/**
	 * @Description: 根据ID删除合同信息
	 * @author:      raomingyi
	 * @param:       id submmitContract
	 * @date:        2018-03-13
	 */
	void deleteContractById(String id);
	
	/**
	 * @Description: 根据提交合同
	 * @author:      raomingyi
	 * @param:       id submmitContract
	 * @date:        2018-03-13
	 */
	void updateContractSendStatus(String id);
}

