package com.ps.service.contractmanage;

import java.util.List;

import com.ps.result.contractmanage.ReceiveNodeVo;

/**
 * @Description:    接口类
 * @author:         raomingyi
 * @date:           2018-03-19
 */
public interface IReceiveNodeManageService {

	/**
	 * @Description: 查询列表信息
	 * @author:      raomingyi
	 * @param:       ReceiveNodeVo
	 * @return:      List<ReceiveNodeVo>数据列表   
	 * @date:        2018-03-19
	 */
	List<ReceiveNodeVo> queryReceiveNodeInfoByParam(ReceiveNodeVo param);
	
	/**
	 * @Description: 根据ID查询数据信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      ReceiveNodeVo数据   
	 * @date:        2018-03-19
	 */
	ReceiveNodeVo queryReceiveNodeInfoById(String id);
	
	/**
	 * @Description: 保存信息
	 * @author:      raomingyi
	 * @param:       ReceiveNodeVo   
	 * @date:        2018-03-19
	 */
	void saveReceiveNode(ReceiveNodeVo vo);
	
	/**
	 * @Description: 根据ID删除信息
	 * @author:      raomingyi
	 * @param:       id 
	 * @date:        2018-03-19
	 */
	void deleteReceiveNodeById(String id);
}

