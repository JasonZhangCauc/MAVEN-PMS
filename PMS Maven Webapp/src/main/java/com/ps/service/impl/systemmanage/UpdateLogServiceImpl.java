package com.ps.service.impl.systemmanage;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.systemmanage.UpdateLogDao;
import com.ps.result.systemmanage.UpdateLogVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.systemmanage.IUpdateLogService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-07-23
 */
@Service
public class UpdateLogServiceImpl extends BaseServiceImpl implements IUpdateLogService{
	
	@Autowired
	private UpdateLogDao updateLogDao;

	
	@Override
	public List<UpdateLogVo> queryUpdateLogByParam(UpdateLogVo param) {
		List<UpdateLogVo> dataList = this.updateLogDao.queryUpdateLogByParam(param);
		for (UpdateLogVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public UpdateLogVo queryUpdateLogInfoById(String id) {
		String temId = id;
		UpdateLogVo vo = new UpdateLogVo();
		if(StringUtils.isNotEmpty(id)){
			id = EncryptPkUtil.decodeId(id);
			vo = this.updateLogDao.queryUpdateLogById(id);
			if(vo != null){
				vo.setId(temId);
			}
		}
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setCurrentTime(DateUtil.today());
		vo.setLoginUserPic(this.getLoginUser().getUserPic());
		return vo;
	}
	
	@Override
	public void saveUpdateLog(UpdateLogVo vo){
		if(StringUtils.isEmpty(vo.getId())){
			//新增
			//创建人信息
			UserVo create = this.getLoginUser();
			vo.setCreateBy(EncryptPkUtil.decodeId(create.getId()));
			this.updateLogDao.insertUpdateLog(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			//更新
			this.updateLogDao.updateUpdateLog(vo);
		}
	}

	@Override
	public void deleteUpdateLogById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.updateLogDao.deleteUpdateLogById(id);
		}
	}

	@Override
	public List<UpdateLogVo> queryUpdateLogInfo() {
		List<UpdateLogVo> dataList = this.updateLogDao.queryUpdateLogInfo();
		for (UpdateLogVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}
}
