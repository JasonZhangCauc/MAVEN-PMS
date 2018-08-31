package com.ps.service.systemmanage;

import java.util.List;

import com.ps.result.systemmanage.OperateLogVo;
import com.ps.result.systemmanage.SystemLogerVo;


/**
 * @Description:    日志管理业务逻辑接口类
 * @author:         ZHOUMIN
 * @date:           2018年3月5日
 */
public interface ILogerManagerService {
	
	/**
	 * @Description: 根据条件查询操作日志信息
	 * @author:      ZHOUMIN
	 * @param:       OperateLogVo 操作日志信息
	 * @return:      List<LogerVo>
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
