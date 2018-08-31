package com.ps.service.impl.applymanage;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.applymanage.TaxiBillManagerDao;
import com.ps.result.applymanage.TaxiBillVo;
import com.ps.service.applymanage.TaxiBillManagerService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

@Service
public class TaxiBillManagerServiceImpl  extends BaseServiceImpl implements TaxiBillManagerService{

	@Autowired
	private TaxiBillManagerDao taxiBillDao;
	
	@Override
	public List<TaxiBillVo> getAllTaxiBill(TaxiBillVo tbVO) {
		tbVO.setAuthUserId(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		List<TaxiBillVo> list =taxiBillDao.getAllTaxiBill(tbVO);
		for (TaxiBillVo taxiBillVO : list) {
			taxiBillVO.setId(EncryptPkUtil.encodeId(taxiBillVO.getId()));
		}
		return list;
	}
	
	@Override
	public TaxiBillVo getTaxiBillByID(String id) {
		TaxiBillVo tbOV=new TaxiBillVo();
		if(StringUtils.isNotEmpty(id)){
			tbOV=taxiBillDao.getTaxiBillById(EncryptPkUtil.decodeId(id));
			tbOV.setProjectId(EncryptPkUtil.encodeId(tbOV.getProjectId()));
		}else{
			//初始化赋值
			tbOV.setReimburseBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			tbOV.setReimburseName(this.getLoginUser().getUserName());
		}
		tbOV.setLoginUserName(this.getLoginUser().getUserName());
		tbOV.setCurrentTime(DateUtil.today());
		tbOV.setLoginUserPic(this.getLoginUser().getUserPic());
		return tbOV;
	}

	@Override
	public void saveTaxiBill(TaxiBillVo tbVO) {
		tbVO.setProjectId(EncryptPkUtil.decodeId(tbVO.getProjectId()));
		tbVO.setTaxibillStatus("0");//更新
		if(StringUtils.isNotEmpty(tbVO.getId())){
			this.taxiBillDao.updateTaxiBill(tbVO);
		}else{//新增
			tbVO.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			tbVO.setTaxibillStatus(GlobalConstants.ZERO);
			taxiBillDao.addTaxiBill(tbVO);
		}
	}

	@Override
	public void deleteTaxiBill(TaxiBillVo tbVO) {
		if(StringUtils.isNotBlank(tbVO.getId()) ){
			//解密
			tbVO.setId(EncryptPkUtil.decodeId(tbVO.getId()));
			taxiBillDao.deleteTaxiBill(tbVO);
		}
	}

	@Override
	public void submitTaxiBill(TaxiBillVo tbVO) {
		tbVO.setId(EncryptPkUtil.decodeId(tbVO.getId()));
		taxiBillDao.updateTaxiBillStatus(tbVO);
	}

	@Override
	public void updateTaxiBill(TaxiBillVo tbVO) {
		tbVO.setId(EncryptPkUtil.decodeId(tbVO.getId()));
		taxiBillDao.updateTaxiBill(tbVO);
		
	}

	@Override
	public void updateTaxiBillStatus(TaxiBillVo tbVO) {
		tbVO.setId(EncryptPkUtil.decodeId(tbVO.getId()));
		taxiBillDao.updateTaxiBillStatus(tbVO);
	}

}
