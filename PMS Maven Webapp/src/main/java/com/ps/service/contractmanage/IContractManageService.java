package com.ps.service.contractmanage;

import java.util.List;

import com.ps.result.contractmanage.ContractVo;

/**
 * @Description:    合同维护接口类
 * @author:         Jasonzhang
 * @date:           2018-08-13
 */
public interface IContractManageService {

	/**
	 * @Description: 查询合同信息
	 * @author:      Jasonzhang
	 * @param:       ContractVo
	 * @return:      List<ContractVo>数据列表   
	 * @date:        2018-08-13
	 */
	List<ContractVo> queryContractInfoByParam(ContractVo param);
	
	/**
	 * @Description: 根据ID查询合同数据信息
	 * @author:      Jasonzhang
	 * @param:       id
	 * @return:      ContractManageVo数据   
	 * @date:        2018-08-13
	 */
	ContractVo queryContractInfoById(String id);
	
	/**
	 * @Description: 保存合同信息
	 * @author:      Jasonzhang
	 * @param:       ContractVo   
	 * @date:        2018-08-13
	 */
	void saveContract(ContractVo vo);
	
	/**
	 * @Description: 根据ID删除合同信息
	 * @author:      Jasonzhang
	 * @param:       id submmitContract
	 * @date:        2018-08-13
	 */
	void deleteContractById(String id);
	
	/**
	 * @Description: 根据提交合同
	 * @author:      Jasonzhang
	 * @param:       id submmitContract
	 * @date:        2018-08-13
	 */
	void updateContractSendStatus(String id);
}

