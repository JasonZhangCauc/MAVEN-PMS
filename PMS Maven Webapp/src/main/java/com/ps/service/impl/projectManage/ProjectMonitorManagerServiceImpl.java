package com.ps.service.impl.projectManage;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.projectmanage.ProjectManagerDao;
import com.ps.dao.projectmanage.ProjectMonitorManagerDao;
import com.ps.result.projectmanage.MilepostAdjustVo;
import com.ps.result.projectmanage.ProjectVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.projectmanage.IProjectMonitorManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    项目监控业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-03-19
 */
@Service
public class ProjectMonitorManagerServiceImpl extends BaseServiceImpl implements IProjectMonitorManagerService {
	
	@Autowired
	private ProjectMonitorManagerDao projectMonitorManagerDao;
	
	@Autowired
	private ProjectManagerDao projectManagerDao;
	
	@Autowired
	private ICommonService commonService;

	@Override
	public List<ProjectVo> queryProjectMonitorByParam(ProjectVo param) {
		List<ProjectVo> dataList = this.projectMonitorManagerDao.queryProjectMonitorByParam(param);
		for (ProjectVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public ProjectVo queryProjectMonitorById(String id) {
		String temId = id;
		ProjectVo vo = new ProjectVo();
		if(StringUtils.isNotEmpty(id)){
			id = EncryptPkUtil.decodeId(id);
			vo = this.projectManagerDao.queryProjectById(id);
			if(vo != null){
				//加密
				vo.setId(temId);
				vo.setCreateBy(EncryptPkUtil.encodeId(vo.getCreateBy()));
				vo.setBelongCustomerid(EncryptPkUtil.encodeId(vo.getBelongCustomerid()));
				vo.setImplementHead(EncryptPkUtil.encodeId(vo.getImplementHead()));
				vo.setContractId(EncryptPkUtil.encodeId(vo.getContractId()));
				vo.setExploitHead(EncryptPkUtil.encodeId(vo.getExploitHead()));
			}
		}
		return vo;
	}

	@Override
	public List<MilepostAdjustVo> queryMilepostAdjustByParam(
			MilepostAdjustVo param) {
		param.setMilepostId(EncryptPkUtil.decodeId(param.getMilepostId()));
		List<MilepostAdjustVo> dataList=this.projectMonitorManagerDao.queryMilepostAdjustByParam(param);
		for (MilepostAdjustVo milepostAdjustVo : dataList) {
			//加密
			milepostAdjustVo.setId(EncryptPkUtil.encodeId(milepostAdjustVo.getId()));
			milepostAdjustVo.setApprovalBy(EncryptPkUtil.encodeId(milepostAdjustVo.getApprovalBy()));
			milepostAdjustVo.setMilepostId(EncryptPkUtil.encodeId(milepostAdjustVo.getMilepostId()));
		}
		return dataList;
	}

	@Override
	public MilepostAdjustVo queryMilepostAdjustById(String id, String milepostId) {
		String tmpId=id;
		MilepostAdjustVo milepostAdjustVo=new MilepostAdjustVo();
		if(StringUtils.isNotBlank(id)){
			milepostAdjustVo=this.projectMonitorManagerDao.queryMilepostAdjustById(EncryptPkUtil.decodeId(id));
			if(milepostAdjustVo!=null){
				//加密
				milepostAdjustVo.setId(tmpId);
				milepostAdjustVo.setApprovalBy(EncryptPkUtil.encodeId(milepostAdjustVo.getApprovalBy()));
				milepostAdjustVo.setMilepostId(EncryptPkUtil.encodeId(milepostAdjustVo.getMilepostId()));
			}
		}else{
			milepostAdjustVo.setCreateBy(this.getLoginUser().getId());
			milepostAdjustVo.setCreateByName(this.getLoginUser().getUserName());
			milepostAdjustVo.setCreateDate(DateUtil.format(new Date(), "yyyy-MM-dd"));
			milepostAdjustVo.setMilepostId(milepostId);
		}
		return milepostAdjustVo;
	}

	@Override
	public void saveMilepostAdjust(MilepostAdjustVo milepostAdjustVo) {
		milepostAdjustVo.setApprovalBy(EncryptPkUtil.decodeId(milepostAdjustVo.getApprovalBy()));
		milepostAdjustVo.setMilepostId(EncryptPkUtil.decodeId(milepostAdjustVo.getMilepostId()));
		if(StringUtils.isEmpty(milepostAdjustVo.getId())){
			//录入更新人
			milepostAdjustVo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//解密
			milepostAdjustVo.setCreateBy(EncryptPkUtil.decodeId(milepostAdjustVo.getCreateBy()));
			//新增
			this.projectMonitorManagerDao.insertMilepostAdjust(milepostAdjustVo);
			commonService.saveChangeRecode("新增里程碑调整信息","R0040102", milepostAdjustVo.getMilepostId());
		}else{
			//录入更新人
			milepostAdjustVo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//解密
			milepostAdjustVo.setId(EncryptPkUtil.decodeId(milepostAdjustVo.getId()));
			//更新
			this.projectMonitorManagerDao.updateMilepostAdjust(milepostAdjustVo);
			//记录变更记录
			if(StringUtils.isNotBlank(milepostAdjustVo.getChangeDetails())){
				commonService.saveChangeRecode(milepostAdjustVo.getChangeDetails(),"R0040104", milepostAdjustVo.getId());
			}
		}
	}
	
}
