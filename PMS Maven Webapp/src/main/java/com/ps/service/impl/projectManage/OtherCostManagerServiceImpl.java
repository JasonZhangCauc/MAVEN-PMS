package com.ps.service.impl.projectManage;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.projectmanage.OtherCostManagerDao;
import com.ps.result.projectmanage.OtherCostManagerVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.projectmanage.IOtherCostManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;
import com.util.tool.MessageUtil;

/**
 * @Description:    其他成本业务逻辑实现类
 * @author:         jczou
 * @date:           2018-03-19
 */
@Service
public class OtherCostManagerServiceImpl extends BaseServiceImpl implements IOtherCostManagerService{
	
	@Autowired
	private OtherCostManagerDao otherCostManagerDao;

	@Autowired
	private ICommonService commonService;
	
	@Override
	public List<OtherCostManagerVo> queryOtherCostManagerInfoByParam(OtherCostManagerVo param) {
		List<OtherCostManagerVo> dataList = this.otherCostManagerDao.queryOtherCostManagerInfoByParam(param);
		for (OtherCostManagerVo vo : dataList) {
			//加密其他成本ID
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			//加密项目ID
			vo.setProjectId(EncryptPkUtil.encodeId(vo.getProjectId()));
			vo.setPeopleConcerned(EncryptPkUtil.encodeId(vo.getPeopleConcerned()));
		}
		return dataList;
	}

	@Override
	public OtherCostManagerVo queryOtherCostManagerInfoById(String id) {
		String temId = id;
		OtherCostManagerVo vo = new OtherCostManagerVo();
		if(StringUtils.isEmpty(id)){
			//创建人信息
			UserVo create = this.getLoginUser();
			vo.setCreateByName(this.getLoginUser().getUserName());
			vo.setCreateBy(this.getLoginUser().getId());
			vo.setCreateDept(create.getDeptId());
			vo.setCreateDate(DateUtil.format(new Date(), "yyyy-MM-dd"));
		}else{
			id = EncryptPkUtil.decodeId(id);
			vo = this.otherCostManagerDao.queryOtherCostManagerById(id);
			if(vo != null){
				vo.setId(temId);
				vo.setProjectId(EncryptPkUtil.encodeId(vo.getProjectId()));
				vo.setPeopleConcerned(EncryptPkUtil.encodeId(vo.getPeopleConcerned()));
				vo.setChangeList(commonService.queryChangeRecordByUserId("R00405", temId));
			}
		}
		return vo;
	}
	
	@Override
	public void saveOtherCostManager(OtherCostManagerVo vo){
		vo.setProjectId(EncryptPkUtil.decodeId(vo.getProjectId()));
		vo.setPeopleConcerned(EncryptPkUtil.decodeId(vo.getPeopleConcerned()));
		if(StringUtils.isEmpty(vo.getId())){
			//录入创建人
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//录入更新人信息
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//新增
			this.otherCostManagerDao.insertOtherCostManager(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			//录入更新人信息
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新
			this.otherCostManagerDao.updateOtherCostManager(vo);
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R00405", vo.getId());
			}
		}
	}

	@Override
	public void deleteOtherCostManagerById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.otherCostManagerDao.deleteOtherCostManagerById(id);
		}
	}

	@Override
	public Map<String, Object> exportOtherCostInfo(OtherCostManagerVo otherCostVo) {
		Map<String, Object> param =new HashMap<String, Object>();
		param.put("template", "otherCoseExportModel.ftl");//其他成本模板
		param.put("fileName", MessageUtil.getMessage("label.othercostManager.othercostinfo"));//其他成本导出名称
		param.put("fileType", "xls");//文件类型
		//获取所有项目其他成本信息
		List<Map<String,Object>> projectList=this.otherCostManagerDao.getProjectInfo(otherCostVo);
		for (Map<String, Object> map : projectList) {
			OtherCostManagerVo otherCostOneVo=otherCostVo;
			otherCostOneVo.setProjectId(map.get("PROJECT_ID").toString());
			//根据查询条件获取其他成本信息
			List<Map<String,Object>> otherCostList=this.otherCostManagerDao.getOtherCostInfo(otherCostOneVo);
			map.put("otherCostList", otherCostList);
		}
		param.put("projectList",projectList);//项目信息
		return param;
	}
}
