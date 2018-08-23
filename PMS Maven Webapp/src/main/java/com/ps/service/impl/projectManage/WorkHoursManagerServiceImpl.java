package com.ps.service.impl.projectManage;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.projectmanage.WorkHoursManagerDao;
import com.ps.result.projectmanage.WorkHoursVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.projectmanage.IWorkHoursManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;
import com.util.tool.MessageUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-03-15
 */
@Service
public class WorkHoursManagerServiceImpl extends BaseServiceImpl implements IWorkHoursManagerService{
	
	@Autowired
	private WorkHoursManagerDao workHoursManagerDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Override
	public List<WorkHoursVo> queryWorkHoursInfoByParam(WorkHoursVo param) {
		List<WorkHoursVo> dataList = this.workHoursManagerDao.queryWorkHoursInfoByParam(param);
		for (WorkHoursVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public WorkHoursVo queryWorkHoursInfoById(String id) {
		String temId = id;
		WorkHoursVo vo = new WorkHoursVo();
		if(StringUtils.isNotEmpty(id)){
			id = EncryptPkUtil.decodeId(id);
			vo = this.workHoursManagerDao.queryWorkHoursById(id);
			if(vo != null){
				vo.setId(temId);
				vo.setProjectId(EncryptPkUtil.encodeId(vo.getProjectId()));
				vo.setChangeList(commonService.queryChangeRecordByUserId("R00404", temId));
			}
		}else{
			//填报人
			vo.setCreateBy(this.getLoginUser().getId());
			//填报人名称
			vo.setCreateByName(this.getLoginUser().getUserName());
			//填报时间
			vo.setCreateDate(DateUtil.format(new Date(), "YYYY-MM-dd"));
		}
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setCurrentTime(DateUtil.today());
		vo.setLoginUserId(this.getLoginUser().getId());
		vo.setFunctionCode(GlobalConstants.CATEGORYTYPE_R00503);
		return vo;
	}
	
	@Override
	public void saveWorkHours(WorkHoursVo vo){
		if(StringUtils.isEmpty(vo.getId())){
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			vo.setCreateBy(EncryptPkUtil.decodeId(vo.getCreateBy()));
			//解密
			vo.setProjectId(EncryptPkUtil.decodeId(vo.getProjectId()));
			//新增
			this.workHoursManagerDao.insertWorkHours(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			vo.setProjectId(EncryptPkUtil.decodeId(vo.getProjectId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新
			this.workHoursManagerDao.updateWorkHours(vo);
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R00404", vo.getId());
			}
		}
	}

	@Override
	public void deleteWorkHoursById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.workHoursManagerDao.deleteWorkHoursById(id);
		}
	}
	
	@Override
	public Map<String, Object> exportWorkHoursInfo(WorkHoursVo workHoursVo) {
		Map<String, Object> param =new HashMap<String, Object>();
		param.put("template", "workHoursExportModel.ftl");//其他成本模板
		param.put("fileName", MessageUtil.getMessage("label.workHoursManager.workHoursInfo"));//其他成本导出名称
		param.put("fileType", "xls");//文件类型
		//获取所有项目其他成本信息
		List<Map<String,Object>> projectList=this.workHoursManagerDao.getProjectInfo(workHoursVo);
		for (Map<String, Object> map : projectList) {
			WorkHoursVo workHoursOneVo=workHoursVo;
			workHoursOneVo.setProjectId(map.get("PROJECT_ID").toString());
			//根据查询条件获取其他成本信息
			List<Map<String,Object>> workHoursList=this.workHoursManagerDao.getWorkHoursInfo(workHoursOneVo);
			map.put("workHoursList", workHoursList);
		}
		param.put("projectList",projectList);//项目信息
		return param;
	}
	
}
