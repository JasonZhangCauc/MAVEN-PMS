package com.ps.service.impl.projectManage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.projectmanage.CostManagementDao;
import com.ps.result.projectmanage.CostManagementVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.projectmanage.ICostManagementService;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         jczou
 * @date:           2018-02-28
 */
@Service
public class CostManagementServiceImpl extends BaseServiceImpl implements ICostManagementService{
	
	@Autowired
	private CostManagementDao costManagementDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Override
	public List<CostManagementVo> queryCostManagementInfoByParam(CostManagementVo vo) {
		List<CostManagementVo> dataList = this.costManagementDao.queryCostManagementInfoByParam(vo);
		for (CostManagementVo costvo : dataList) {
			//加密
			costvo.setId(EncryptPkUtil.encodeId(costvo.getId()));
		}
		return dataList;
	}

	@Override
	public CostManagementVo queryCostManagementInfoById(String id) {
		String temId = id;
		CostManagementVo vo = new CostManagementVo();
		if(StringUtils.isNotEmpty(id)){
			id = EncryptPkUtil.decodeId(id);
			vo = this.costManagementDao.queryCostManagementById(id);
			if(vo != null){
				vo.setId(temId);
				vo.setChangeList(commonService.queryChangeRecordByUserId("R00403", temId));
			}
		}
		return vo;
	}
	
	@Override
	public void saveCostManagement(CostManagementVo vo){
		if(StringUtils.isEmpty(vo.getId())){
			//新增创建人信息
			UserVo user = this.getLoginUser();
			vo.setCreateBy(EncryptPkUtil.decodeId(user.getId()));
			vo.setCreateDept(user.getDeptId());
			vo.setCreateDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			this.costManagementDao.insertCostManagement(vo);
		}else{
			//解密
			UserVo user = this.getLoginUser();
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			vo.setUpdateBy(EncryptPkUtil.decodeId(user.getId()));
			vo.setUpdateDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			//更新
			this.costManagementDao.updateCostManagement(vo);
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R00403", vo.getId());
			}
		}
	}

	@Override
	public void deleteCostManagementById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.costManagementDao.deleteCostManagementById(id);
		}
	}
}
