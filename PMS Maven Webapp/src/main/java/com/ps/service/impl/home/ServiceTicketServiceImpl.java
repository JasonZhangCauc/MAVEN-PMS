package com.ps.service.impl.home;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.home.ServiceTicketDao;
import com.ps.result.home.ServiceTicketVo;
import com.ps.service.home.IServiceTicketService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-07-25
 */
@Service
public class ServiceTicketServiceImpl extends BaseServiceImpl implements IServiceTicketService{
	
	@Autowired
	private ServiceTicketDao serviceTicketDao;
	
	@Override
	public List<ServiceTicketVo> queryServiceTicketByParam(ServiceTicketVo param) {
		List<ServiceTicketVo> dataList = this.serviceTicketDao.queryServiceTicketByParam(param);
		for (ServiceTicketVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public void saveServiceTicket(ServiceTicketVo vo){
		vo.setUploadby(EncryptPkUtil.decodeId(this.getLoginUser().getId()));//上传人
		this.serviceTicketDao.insertServiceTicket(vo);
	}

	@Override
	public void deleteServiceTicketById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.serviceTicketDao.deleteServiceTicketById(id);
		}
	}

	@Override
	public ServiceTicketVo queryServiceTicketById(String id) {
		ServiceTicketVo serviceTicketVo=new ServiceTicketVo();
		if(StringUtils.isNotBlank(id)){
			serviceTicketVo=serviceTicketDao.queryServiceTicketById(EncryptPkUtil.decodeId(id));
			serviceTicketVo.setId(id);
		}
		return serviceTicketVo;
	}
}
