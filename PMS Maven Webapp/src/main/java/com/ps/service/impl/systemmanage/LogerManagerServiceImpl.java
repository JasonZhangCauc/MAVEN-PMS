package com.ps.service.impl.systemmanage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aop.exception.BussinessException;
import com.aop.exception.BussinessExceptionBean;
import com.ps.dao.systemmanage.LogerManagerDao;
import com.ps.result.systemmanage.OperateLogVo;
import com.ps.result.systemmanage.SystemLogerVo;
import com.ps.service.systemmanage.ILogerManagerService;
import com.util.coder.EncryptPkUtil;


/**
 * @Description:    日志管理业务逻辑实现类
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
@Service
public class LogerManagerServiceImpl implements ILogerManagerService {
	
	@Autowired
	private LogerManagerDao logerManagerDao;
	
	@Override
	public List<OperateLogVo> queryOperateLogByParam(OperateLogVo vo){
		try {
			List<OperateLogVo> list=this.logerManagerDao.queryOperateLogByParam(vo);
			for (OperateLogVo operateLogVo : list) {
				//加密
				operateLogVo.setId(EncryptPkUtil.encodeId(operateLogVo.getId()));
			}
			return list;
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.systemelogbyall"), e);
		}
	}

	@Override
	public void saveSystemLog(SystemLogerVo vo) {
		try {
			this.logerManagerDao.saveSystemLog(vo);
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.syserror"), e);
		}
	}

	@Override
	public List<SystemLogerVo> querySystemLogByParam(SystemLogerVo vo) {
		try {
			List<SystemLogerVo> list = this.logerManagerDao.querySystemLogByParam(vo);
			for (SystemLogerVo sysLogVo : list) {
				//加密
				sysLogVo.setId(EncryptPkUtil.encodeId(sysLogVo.getId()));
			}
			return list;
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.systemelogbyall"), e);
		}
	}

}
