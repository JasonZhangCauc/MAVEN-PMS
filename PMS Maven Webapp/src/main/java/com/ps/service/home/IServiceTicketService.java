package com.ps.service.home;

import java.util.List;

import com.ps.result.home.ServiceTicketVo;

/**
 * @Description:    接口类
 * @author:         ZHOUMIN
 * @date:           2018-07-25
 */
public interface IServiceTicketService {

	/**
	 * @Description: 根据参数查询服务单列表信息
	 * @author:      ZHOUMIN
	 * @param:       ServiceTicketVo
	 * @return:      List<ServiceTicketVo>数据列表   
	 * @date:        2018-07-25
	 */
	List<ServiceTicketVo> queryServiceTicketByParam(ServiceTicketVo param);
	
	/**
	 * @Description: 根据ID查询服务单信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      ServiceTicketVo数据列表   
	 * @date:        2018-07-25
	 */
	ServiceTicketVo queryServiceTicketById(String id);
	
	/**
	 * @Description: 保存服务单信息
	 * @author:      ZHOUMIN
	 * @param:       ServiceTicketVo   
	 * @date:        2018-07-25
	 */
	void saveServiceTicket(ServiceTicketVo vo);
	
	/**
	 * @Description: 根据ID删除服务单信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-07-25
	 */
	void deleteServiceTicketById(String id);
}

