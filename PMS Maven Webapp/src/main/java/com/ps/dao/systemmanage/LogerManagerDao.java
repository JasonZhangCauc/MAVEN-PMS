package com.ps.dao.systemmanage;

import java.util.List;

import com.ps.result.systemmanage.OperateLogVo;
import com.ps.result.systemmanage.SystemLogerVo;

/**
 * @Description:    日志管理数据访问接口类
 * @author:         ZHOUMIN
 * @date:           2018年3月5日
 */
public interface LogerManagerDao {

	/**
	 * @Description: 操作日志新增
	 * @author:      ZHOUMIN
	 * @param:       OperateLogVo 操作日志信息
	 * @return:       
	 * @date:        2018年3月5日
	 */
	public void saveOperateLog(OperateLogVo vo);
	
	/**
	 * @Description: 根据条件查询操作日志
	 * @author:      ZHOUMIN
	 * @param:       OperateLogVo 操作日志信息
	 * @return:      List<Map<String, String>>  
	 * @date:        2018年3月5日
	 */
	public List<OperateLogVo> queryOperateLogByParam(OperateLogVo vo);
	
	/**
	 * @Description: 新增系统日志
	 * @author:      ZHOUMIN
	 * @param:       SystemLogerVo 系统日志
	 * @date:        2018年3月5日
	 */
	public void saveSystemLog(SystemLogerVo vo);
	
	/**
	 * @Description: 根据条件查询系统日志
	 * @author:      ZHOUMIN
	 * @param:       SystemLogerVo 系统日志
	 * @return:      List<SystemLogerVo>  
	 * @date:        2018年3月5日
	 */
	public List<SystemLogerVo> querySystemLogByParam(SystemLogerVo vo);
	
}
