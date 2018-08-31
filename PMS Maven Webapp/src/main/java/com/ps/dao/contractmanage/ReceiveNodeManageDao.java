package com.ps.dao.contractmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.contractmanage.ReceiveNodeVo;

/**
 * @Description:    收款节点管理DAO接口 
 * @author:         raomingyi
 * @date:           2018-03-19
 */
public interface ReceiveNodeManageDao{
	
	/**
	 * @Description: 根据参数查询收款节点信息
	 * @author:      raomingyi
	 * @param:       ReceiveNodeVo
	 * @return:      ReceiveNodeVo
	 * @date:        2018-03-19
	 */
	List<ReceiveNodeVo> queryReceiveNodeInfoByParam(ReceiveNodeVo param);
	
	/**
	 * @Description: 根据ID查询收款节点信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      ReceiveNodeVo
	 * @date:        2018-03-19
	 */
	public ReceiveNodeVo queryReceiveNodeById(@Param("id")String id);
	
	/**
	 * @Description: 新增收款节点信息
	 * @author:      raomingyi
	 * @param:       ReceiveNodeVo
	 * @date:        2018-03-19
	 */
	public void insertReceiveNode(ReceiveNodeVo vo);
	
	/**
	 * @Description: 修改收款节点信息
	 * @author:      raomingyi
	 * @param:       ReceiveNodeVo
	 * @date:        2018-03-19
	 */
	public void updateReceiveNode(ReceiveNodeVo vo);
	
	/**
	 * @Description: 删除收款节点信息
	 * @author:      raomingyi
	 * @param:       id
	 * @date:        2018-03-19
	 */
	public void deleteReceiveNodeById(@Param("id")String id);
	/**
	 * @Description: 获取客户简码，生成节点编号用
	 * @author:      raomingyi
	 * @param:       id
	 * @date:        2018-03-19
	 */
	public String getCustomCode(@Param("belongCustomerid")String belongCustomerid);
	/**
	 * @Description: 获取编号最大值，生成节点编号用
	 * @author:      raomingyi
	 * @param:       ReceiveNodeVo
	 * @date:        2018-03-19
	 */
	public String getMaxNodeNum(ReceiveNodeVo vo);
	
}
