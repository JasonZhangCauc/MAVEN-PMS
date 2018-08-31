package com.ps.service.impl.projectManage;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.projectmanage.ProjectCheckDao;
import com.ps.result.projectmanage.ProjectVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.projectmanage.IProjectCheckService;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:    项目审批业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-03-26
 */
@Service
public class ProjectCheckServiceImpl extends BaseServiceImpl implements IProjectCheckService{
	
	@Autowired
	private ProjectCheckDao projectcheckDao;
	
	@Autowired
	private ICommonService commonService;

	@Override
	public List<ProjectVo> queryProjectCheckInfoByParam(ProjectVo param) {
		//查询条件多个客户解密
		String customerIds[]={};
		String customerId="";
		//判断所选角色是否为空
		if(StringUtils.isNotBlank(param.getBelongCustomerid())){
			customerIds=param.getBelongCustomerid().split(",");
		}
		for (String cusId : customerIds) {
			if(StringUtils.isNotBlank(customerId)){
				customerId+=","+EncryptPkUtil.decodeId(cusId);
			}else{
				customerId+=EncryptPkUtil.decodeId(cusId);
			}
		}
		param.setBelongCustomerid(customerId);
		List<ProjectVo> dataList = this.projectcheckDao.queryProjectCheckInfoByParam(param);
		for (ProjectVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public ProjectVo queryProjectCheckInfoById(String id) {
		String temId = id;
		ProjectVo vo = new ProjectVo();
		if(StringUtils.isNotEmpty(id)){
			id = EncryptPkUtil.decodeId(id);
			vo = this.projectcheckDao.queryProjectCheckById(id);
			if(vo != null){
				vo.setId(temId);
				//加密
				vo.setBelongCustomerid(EncryptPkUtil.encodeId(vo.getBelongCustomerid()));
				vo.setImplementHead(EncryptPkUtil.encodeId(vo.getImplementHead()));
				vo.setExploitHead(EncryptPkUtil.encodeId(vo.getExploitHead()));
			}
		}
		return vo;
	}	
	
	@Override
	public void updateProjectStatus(ProjectVo vo){
        //录入审核人
        vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));				
		//解密
		vo.setId(EncryptPkUtil.decodeId(vo.getId()));
		//更新项目状态（项目审批）
		this.projectcheckDao.updateProjectStatus(vo);
		if(StringUtils.equals(GlobalConstants.TWO, vo.getProjectStatus())){
			commonService.saveChangeRecode("项目审批通过","R0040101", vo.getId());
		}else{
			commonService.saveChangeRecode("项目审批退回","R0040101", vo.getId());
		}
	}
}
