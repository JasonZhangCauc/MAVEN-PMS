package com.ps.dao.home;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.home.ServiceTicketVo;

/**
 * @Description:    服务单DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-07-25
 */
public interface ServiceTicketDao{
	
	/**
	 * @Description: 根据参数查询服务单列表信息
	 * @author:      ZHOUMIN
	 * @param:       ServiceTicketVo
	 * @return:      ServiceTicketVo 列表信息
	 * @date:        2018-07-25
	 */
	List<ServiceTicketVo> queryServiceTicketByParam(ServiceTicketVo param);
	
	/**
	 * @Description: 新增服务单信息
	 * @author:      ZHOUMIN
	 * @param:       ServiceTicketVo
	 * @date:        2018-07-25
	 */
	public void insertServiceTicket(ServiceTicketVo vo);
	
	/**
	 * @Description: 删除服务单信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @date:        2018-07-25
	 */
	public void deleteServiceTicketById(@Param("id")String id);
	
	/**
	 * @Description: 根据ID查询服务单信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      ServiceTicketVo数据列表   
	 * @date:        2018-07-25
	 */
	ServiceTicketVo queryServiceTicketById(@Param("id")String id);
}
