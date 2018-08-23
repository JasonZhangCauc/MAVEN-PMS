package com.ps.service.systemmanage;

import java.util.List;

import com.ps.result.systemmanage.UpdateLogVo;

/**
 * @Description:    接口类
 * @author:         ZHOUMIN
 * @date:           2018-07-23
 */
public interface IUpdateLogService {

	/**
	 * @Description: 查询更新日志列表信息
	 * @author:      ZHOUMIN
	 * @param:       UpdateLogVo
	 * @return:      List<UpdateLogVo>数据列表   
	 * @date:        2018-07-23
	 */
	List<UpdateLogVo> queryUpdateLogByParam(UpdateLogVo param);
	
	/**
	 * @Description: 根据ID查询更新日志数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      UpdateLogVo数据   
	 * @date:        2018-07-23
	 */
	UpdateLogVo queryUpdateLogInfoById(String id);
	
	/**
	 * @Description: 保存更新日志信息
	 * @author:      ZHOUMIN
	 * @param:       UpdateLogVo   
	 * @date:        2018-07-23
	 */
	void saveUpdateLog(UpdateLogVo vo);
	
	/**
	 * @Description: 根据ID删除更新日志信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-07-23
	 */
	void deleteUpdateLogById(String id);
	
	/**
	 * @Description: 查询更新日志信息
	 * @author:      ZHOUMIN
	 * @param:       UpdateLogVo
	 * @return:      List<UpdateLogVo>数据列表   
	 * @date:        2018-07-23
	 */
	List<UpdateLogVo> queryUpdateLogInfo();
}

