package com.ps.dao.contractmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.contractmanage.ContractVo;

/**
 * @Description:    合同维护DAO接口 
<<<<<<< HEAD
 * @author:         raomingyi
 * @date:           2018-03-13
 */
public interface ContractManageDao{
	
	/**
	 * @Description: 根据参数查询合同信息
	 * @author:      raomingyi
	 * @param:       ContractVo
	 * @return:      ContractVo 列表信息
	 * @date:        2018-03-13
	 */
	List<ContractVo> queryContractInfoByParam(ContractVo param);
	
	/**
	 * @Description: 根据ID查询合同信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      ContractVo 数据信息
	 * @date:        2018-03-13
	 */
	public ContractVo queryContractById(@Param("id")String id);
	
	/**
	 * @Description: 新增合同信息
	 * @author:      raomingyi
	 * @param:       ContractVo
	 * @date:        2018-03-13
	 */
	public void insertContract(ContractVo vo);
	
	/**
	 * @Description: 修改合同信息
	 * @author:      raomingyi
	 * @param:       ContractVo
	 * @date:        2018-03-13
	 */
	public void updateContract(ContractVo vo);
	
	/**
	 * @Description: 删除合同信息
	 * @author:      raomingyi
	 * @param:       id
	 * @date:        2018-03-13
	 */
	public void deleteContractById(@Param("id")String id);
	/**
	 * @Description: 提交合同
	 * @author:      raomingyi
=======
 * @author:         Jasonzhang
 * @date:           2018-03-13
 */
public interface ContractManageDao{
	
	/**
	 * @Description: 根据参数查询合同信息
	 * @author:      Jasonzhang
	 * @param:       ContractVo
	 * @return:      ContractVo 列表信息
	 * @date:        2018-03-13
	 */
	List<ContractVo> queryContractInfoByParam(ContractVo param);
	
	/**
	 * @Description: 根据ID查询合同信息
	 * @author:      Jasonzhang
	 * @param:       id
	 * @return:      ContractVo 数据信息
	 * @date:        2018-03-13
	 */
	public ContractVo queryContractById(@Param("id")String id);
	
	/**
	 * @Description: 新增合同信息
	 * @author:      Jasonzhang
	 * @param:       ContractVo
	 * @date:        2018-03-13
	 */
	public void insertContract(ContractVo vo);
	
	/**
	 * @Description: 修改合同信息
	 * @author:      Jasonzhang
	 * @param:       ContractVo
	 * @date:        2018-03-13
	 */
	public void updateContract(ContractVo vo);
	
	/**
	 * @Description: 删除合同信息
	 * @author:      Jasonzhang
	 * @param:       id
	 * @date:        2018-03-13
	 */
	public void deleteContractById(@Param("id")String id);
	/**
	 * @Description: 提交合同
	 * @author:      Jasonzhang
>>>>>>> branch 'master' of https://github.com/JasonZhangCauc/MAVEN-PMS.git
	 * @param:       id
	 * @date:        2018-03-13
	 */
	public void updateContractSendStatus(@Param("id")String id);
}
