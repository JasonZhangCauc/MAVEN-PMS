package com.ps.service.impl.projectManage;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.projectmanage.ProjectManagerDao;
import com.ps.dao.systemmanage.CodeManagerDao;
import com.ps.result.projectmanage.DeliveriesVo;
import com.ps.result.projectmanage.MilepostVo;
import com.ps.result.projectmanage.ProjectVo;
import com.ps.result.systemmanage.CodeVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.projectmanage.IProjectManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    项目业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-03-19
 */
@Service
public class ProjectManagerServiceImpl extends BaseServiceImpl implements IProjectManagerService{
	
	@Autowired
	private ProjectManagerDao projectManagerDao;
	
	@Autowired
	private CodeManagerDao codeManagerDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Override
	public List<ProjectVo> queryProjectInfoByParam(ProjectVo param) {
		List<ProjectVo> dataList = this.projectManagerDao.queryProjectInfoByParam(param);
		for (ProjectVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public ProjectVo queryProjectInfoById(String id) {
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
		}else{
			//设置自动带出内容
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			vo.setCreateByName(this.getLoginUser().getUserName());
			vo.setCreateDate(DateUtil.format(new Date(), "yyyy-MM-dd"));
			vo.setCreateDept(this.getLoginUser().getDeptId());
		}
		return vo;
	}
	
	@Override
	public ProjectVo saveProject(ProjectVo vo){
		//所属客户
		vo.setBelongCustomerid(EncryptPkUtil.decodeId(vo.getBelongCustomerid()));
		vo.setContractId(EncryptPkUtil.decodeId(vo.getContractId()));
		vo.setImplementHead(EncryptPkUtil.decodeId(vo.getImplementHead()));
		vo.setExploitHead(EncryptPkUtil.decodeId(vo.getExploitHead()));
		if(StringUtils.isEmpty(vo.getId())){
			//创建人信息
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新人信息
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//获取产品简码
			CodeVo codeVo=new CodeVo();
			codeVo.setCodeType("PRODUCT");
			codeVo.setCodeValue(vo.getBelongProduct());
			codeVo=this.codeManagerDao.getCodeInfoByCodeType(codeVo);
			//生成项目编号
			String projectNo=this.projectManagerDao.getProjectNo(codeVo.getCodeZh());
			vo.setProjectNo(projectNo);
			//如关联合同则修改该为已立项
			vo.setProjectStatus(GlobalConstants.ZERO);
			if(StringUtils.isNotBlank(vo.getContractId())){
				this.projectManagerDao.updateContractStatus(vo.getContractId(), GlobalConstants.FIVE);
			}
			//新增
			this.projectManagerDao.insertProject(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			//根据id获取原项目信息
			ProjectVo projectVo=this.projectManagerDao.queryProjectById(vo.getId());
			//更新人信息
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			///如关联合同则修改该为已立项 如为空则修改之前合同记录未已审批
			if(StringUtils.isNotBlank(vo.getContractId())){
				if(!StringUtils.equals(vo.getContractId(), projectVo.getContractId())){
					this.projectManagerDao.updateContractStatus(vo.getContractId(), GlobalConstants.FIVE);
					this.projectManagerDao.updateContractStatus(projectVo.getContractId(), GlobalConstants.TWO);
				}
			}else if(StringUtils.isNotBlank(vo.getContractId())){ //当合同为空时 ，变更状态为编辑中
				if(StringUtils.isNotBlank(projectVo.getContractId())){
					this.projectManagerDao.updateContractStatus(projectVo.getContractId(), GlobalConstants.TWO);
				}
			}
			//更新
			this.projectManagerDao.updateProject(vo);
			
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R0040101", vo.getId());
			}
		}
		return vo;
	}

	@Override
	public void deleteProjectById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.projectManagerDao.deleteProjectById(id);
		}
	}

	@Override
	public List<ProjectVo> getAllProjectInfo() {
		List<ProjectVo> dataList = this.projectManagerDao.getAllProjectInfo();
		//加密
		for (ProjectVo projectVo : dataList) {
			projectVo.setId(EncryptPkUtil.encodeId(projectVo.getId()));
			projectVo.setBelongCustomerid(EncryptPkUtil.encodeId(projectVo.getBelongCustomerid()));
			projectVo.setContractId(EncryptPkUtil.encodeId(projectVo.getContractId()));
		}
		return dataList;
	}
	@Override
	public void updateProjectSendStatus(ProjectVo vo){
        //录入审核人
        vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));				
		//解密
		vo.setId(EncryptPkUtil.decodeId(vo.getId()));
		//更新项目状态（项目审批）
		this.projectManagerDao.updateProjectSendStatus(vo);
	}

	@Override
	public List<DeliveriesVo> queryDeliveriesInfoByParam(DeliveriesVo deliveriesVo) {
		deliveriesVo.setProjectId(EncryptPkUtil.decodeId(deliveriesVo.getProjectId()));
		List<DeliveriesVo> deliveiesList=this.projectManagerDao.queryDeliveriesInfoByParam(deliveriesVo);
		for (DeliveriesVo deliveriesVo1 : deliveiesList) {
			//加密
			deliveriesVo1.setProjectId(EncryptPkUtil.encodeId(deliveriesVo1.getProjectId()));
			deliveriesVo1.setId(EncryptPkUtil.encodeId(deliveriesVo1.getId()));
			deliveriesVo1.setPersonLiable(EncryptPkUtil.encodeId(deliveriesVo1.getPersonLiable()));
		}
		return deliveiesList;
	}

	@Override
	public List<MilepostVo> queryMilepostInfoByParam(MilepostVo milepostVo) {
		milepostVo.setProjectId(EncryptPkUtil.decodeId(milepostVo.getProjectId()));
		List<MilepostVo> milepostList=this.projectManagerDao.queryMilepostInfoByParam(milepostVo);
		for (MilepostVo milepostVo2 : milepostList) {
			//加密
			milepostVo2.setProjectId(EncryptPkUtil.encodeId(milepostVo2.getProjectId()));
			milepostVo2.setId(EncryptPkUtil.encodeId(milepostVo2.getId()));
		}
		return milepostList;
	}

	@Override
	public MilepostVo queryMilepostInfoById(String id) {
		String temId = id;
		MilepostVo milepostVo=new MilepostVo();
		if(StringUtils.isNotBlank(id)){
			id=EncryptPkUtil.decodeId(id);
			milepostVo=this.projectManagerDao.queryMilepostInfoById(id);
			if(milepostVo!=null){
				milepostVo.setId(temId);
				milepostVo.setProjectId(EncryptPkUtil.encodeId(milepostVo.getProjectId()));
			}
		}
		return milepostVo;
	}

	@Override
	public DeliveriesVo queryDeliveriesInfoById(String id) {
		String temId = id;
		DeliveriesVo deliveriesVo=new DeliveriesVo();
		if(StringUtils.isNotBlank(id)){
			id=EncryptPkUtil.decodeId(id);
			deliveriesVo=this.projectManagerDao.queryDeliveriesInfoById(id);
			if(deliveriesVo!=null){
				//加密
				deliveriesVo.setId(temId);
				deliveriesVo.setProjectId(EncryptPkUtil.encodeId(deliveriesVo.getProjectId()));
				deliveriesVo.setPersonLiable(EncryptPkUtil.encodeId(deliveriesVo.getPersonLiable()));
			}
		}
		return deliveriesVo;
	}

	@Override
	public void saveMilepost(MilepostVo milepostVo) {
		milepostVo.setProjectId(EncryptPkUtil.decodeId(milepostVo.getProjectId()));
		if(StringUtils.isEmpty(milepostVo.getId())){
			//创建人信息
			milepostVo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新人信息
			milepostVo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//新增
			this.projectManagerDao.insertMilepost(milepostVo);
			//记录变更记录
			commonService.saveChangeRecode("新增里程碑："+milepostVo.getMilepostName(),"R0040101", milepostVo.getProjectId());
		}else{
			//解密
			milepostVo.setId(EncryptPkUtil.decodeId(milepostVo.getId()));
			//更新人信息
			milepostVo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新
			this.projectManagerDao.updateMilepost(milepostVo);
			//记录变更记录
			if(StringUtils.isNotBlank(milepostVo.getChangeDetails())){
				commonService.saveChangeRecode(milepostVo.getChangeDetails(),"R0040102", milepostVo.getId());
			}
		}
	}

	@Override
	public void deleteMilepost(String id) {
		if(StringUtils.isNotBlank(id)){
			//根据id查询里程碑信息
			MilepostVo milepostVo=this.projectManagerDao.queryMilepostInfoById(EncryptPkUtil.decodeId(id));
			this.projectManagerDao.deleteMilepost(EncryptPkUtil.decodeId(id));
			commonService.saveChangeRecode("删除里程碑："+milepostVo.getMilepostName(),"R0040101", milepostVo.getProjectId());
		}
	}

	@Override
	public void saveDeliveries(DeliveriesVo deliveriesVo) {
		//解密
		deliveriesVo.setProjectId(EncryptPkUtil.decodeId(deliveriesVo.getProjectId()));
		deliveriesVo.setPersonLiable(EncryptPkUtil.decodeId(deliveriesVo.getPersonLiable()));
		if(StringUtils.isEmpty(deliveriesVo.getId())){
			//创建人信息
			deliveriesVo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新人信息
			deliveriesVo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//新增
			this.projectManagerDao.insertDeliveries(deliveriesVo);
			//记录变更记录
			commonService.saveChangeRecode("新增交付物："+deliveriesVo.getDeliveriesName(),"R0040101", deliveriesVo.getProjectId());
		}else{
			//解密
			deliveriesVo.setId(EncryptPkUtil.decodeId(deliveriesVo.getId()));
			//更新人信息
			deliveriesVo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新
			this.projectManagerDao.updateDeliveries(deliveriesVo);
			//记录变更记录
			if(StringUtils.isNotBlank(deliveriesVo.getChangeDetails())){
				commonService.saveChangeRecode(deliveriesVo.getChangeDetails(),"R0040103", deliveriesVo.getId());
			}
		}
	}

	@Override
	public void deleteDeliveries(String id) {
		if(StringUtils.isNotBlank(id)){
			DeliveriesVo deliveriesVo=this.projectManagerDao.queryDeliveriesInfoById(EncryptPkUtil.decodeId(id));
			this.projectManagerDao.deleteDeliveries(EncryptPkUtil.decodeId(id));
			commonService.saveChangeRecode("删除交付物："+deliveriesVo.getDeliveriesName(),"R0040101", deliveriesVo.getProjectId());
		}
	}

	@Override
	public void submitProject(String id) {
		if(StringUtils.isNotBlank(id)){
			this.projectManagerDao.updateProjectStatus(EncryptPkUtil.decodeId(id), GlobalConstants.ONE);
			//记录变更记录
			commonService.saveChangeRecode("项目提交","R0040101", EncryptPkUtil.decodeId(id));
		}
	}
	
	@Override
	public int getMilepostProjectStadgeCounts(String projectId,String projectStadge) {
		  projectId=EncryptPkUtil.decodeId(projectId);
		  return  this.projectManagerDao.getMilepostProjectStadgeCounts(projectId, projectStadge);		
	}
	
	
}
