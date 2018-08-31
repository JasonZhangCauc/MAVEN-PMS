package com.ps.service.impl.projectManage;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.projectmanage.TrackingManagerDao;
import com.ps.result.projectmanage.TrackingVo;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.projectmanage.ITrackingManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-08-08
 */
@Service
public class TrackingManagerServiceImpl extends BaseServiceImpl implements ITrackingManagerService{
	
	@Autowired
	private TrackingManagerDao trackingManagerDao;

	@Override
	public List<TrackingVo> queryTrackingInfoByParam(TrackingVo param) {
		String projectIds[]={};
		String projectId="";
		//解密
		if(StringUtils.isNotBlank(param.getProjectId())){
			projectIds=param.getProjectId().split(",");
		}
		for (String proId : projectIds) {
			if(StringUtils.isNotBlank(projectId)){
				projectId+=","+EncryptPkUtil.decodeId(proId);
			}else{
				projectId+=EncryptPkUtil.decodeId(proId);
			}
		}
		param.setProjectId(projectId);
		List<TrackingVo> dataList = this.trackingManagerDao.queryTrackingInfoByParam(param);
		for (TrackingVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public TrackingVo queryTrackingInfoById(String id) {
		TrackingVo vo = new TrackingVo();
		if(StringUtils.isNotEmpty(id)){
			vo = this.trackingManagerDao.queryTrackingById(EncryptPkUtil.decodeId(id));
			vo.setId(id);
			vo.setProjectId(EncryptPkUtil.encodeId(vo.getProjectId()));
			vo.setCustomerId(EncryptPkUtil.encodeId(vo.getCustomerId()));
		}else{
			//设置提出时间
			vo.setPutDate(DateUtil.today());
			//是否二期默认为否
			vo.setWhetherPhaseIi(GlobalConstants.TWO);
			//验收范围默认为否
			vo.setWhetherScope(GlobalConstants.TWO);
			//是否合同默认为否
			vo.setWhetherContract(GlobalConstants.TWO);
		}
		return vo;
	}
	
	@Override
	public TrackingVo saveTracking(TrackingVo vo){
		//解密
		vo.setProjectId(EncryptPkUtil.decodeId(vo.getProjectId()));
		vo.setCustomerId(EncryptPkUtil.decodeId(vo.getCustomerId()));
		if(StringUtils.isEmpty(vo.getId())){
			//录入人
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			vo.setRequirementStatus(GlobalConstants.ONE);//默认已接收状态
			//新增
			this.trackingManagerDao.insertTracking(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			//更新
			this.trackingManagerDao.updateTracking(vo);
		}
		//加密
		vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		return vo;
	}

	@Override
	public void deleteTrackingById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.trackingManagerDao.deleteTrackingById(id);
		}
	}
}
