package com.ps.service.impl.presalemanage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.presalemanage.SaleTrackDao;
import com.ps.result.presalemanage.SaleTrackVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.presalemanage.ISaleTrackService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    销售跟踪业务逻辑实现类
 * @author:         raomingyi
 * @date:           2018-03-09
 */
@Service
public class SaleTrackServiceImpl extends BaseServiceImpl implements ISaleTrackService{
	
	@Autowired
	private SaleTrackDao saleTrackDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Override
	public List<SaleTrackVo> querySaleTrackInfoByParam(SaleTrackVo param) {		
		       //查询条件多个客户解密
				String customerIds[]={};
				String customerId="";
				//判断所选角色是否为空
				if(StringUtils.isNotBlank(param.getCustomerId())){
					customerIds=param.getCustomerId().split(",");
				}
				for (String cusId : customerIds) {
					if(StringUtils.isNotBlank(customerId)){
						customerId+=","+EncryptPkUtil.decodeId(cusId);
					}else{
						customerId+=EncryptPkUtil.decodeId(cusId);
					}
				}
				param.setCustomerId(customerId);
				//查询条件多个负责人解密
				String saleResponsibleIds[]={};
				String saleResponsible="";
				//判断所选角色是否为空
				if(StringUtils.isNotBlank(param.getSaleResponsible())){
					saleResponsibleIds=param.getSaleResponsible().split(",");
				}
				for (String cusId : saleResponsibleIds) {
					if(StringUtils.isNotBlank(saleResponsible)){
						saleResponsible+=","+cusId;
					}else{
						//saleResponsible+=EncryptPkUtil.decodeId(cusId);
						saleResponsible+=cusId;
					}
				}
				param.setSaleResponsible(saleResponsible);
			List<SaleTrackVo> dataList = this.saleTrackDao.querySaleTrackInfoByParam(param);
			for (SaleTrackVo vo : dataList) {
				//加密
				vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			}
			return dataList;
	}

	@Override
	public SaleTrackVo querySaleTrackInfoById(String id) {
			String temId = id;
			SaleTrackVo vo = new SaleTrackVo();
			if(!StringUtils.isBlank(id)){				
				id = EncryptPkUtil.decodeId(id);			
				vo = this.saleTrackDao.querySaleTrackById(id);
				if(vo != null){
					vo.setId(temId);
					vo.setCustomerId(EncryptPkUtil.encodeId(vo.getCustomerId()));
					vo.setDecisionMaker(EncryptPkUtil.encodeId(vo.getDecisionMaker()));
					//vo.setSaleResponsible(EncryptPkUtil.encodeId(vo.getSaleResponsible()));
					vo.setLinker(EncryptPkUtil.encodeId(vo.getLinker()));
					//干系人多个加密
					String stakeholderIds[]={};
					String stakeholderId="";
					//判断所选角色是否为空
					if(StringUtils.isNotBlank(vo.getStakeholder())){
						stakeholderIds=vo.getStakeholder().split(",");
					}
					for (String stkId : stakeholderIds) {
						if(StringUtils.isNotBlank(stakeholderId)){
							stakeholderId+=","+EncryptPkUtil.encodeId(stkId);
						}else{
							stakeholderId+=EncryptPkUtil.encodeId(stkId);
						}
					}				
					vo.setStakeholder(stakeholderId);
				}
			}else {
				//录入创建人
				vo.setCreateBy(this.getLoginUser().getUserName());
				//录入创建人部门				
				vo.setCreateDept(this.getLoginUser().getDeptId());
				//录入创建时间
				vo.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			}
			vo.setLoginUserName(this.getLoginUser().getUserName());
			vo.setLoginUserPic(this.getLoginUser().getUserPic());
			vo.setCurrentTime(DateUtil.today());
			return vo;
	}
	
	@Override
	public void saveSaleTrack(SaleTrackVo vo){		
		//解密
		vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		vo.setCustomerId(EncryptPkUtil.decodeId(vo.getCustomerId()));
		//vo.setSaleResponsible(EncryptPkUtil.decodeId(vo.getSaleResponsible()));
		vo.setLinker(EncryptPkUtil.decodeId(vo.getLinker()));
		vo.setDecisionMaker(EncryptPkUtil.decodeId(vo.getDecisionMaker()));						
		//干系人多个解密
		String stakeholderIds[]={};
		String stakeholderId="";
		//判断所选角色是否为空
		if(StringUtils.isNotBlank(vo.getStakeholder())){
			stakeholderIds=vo.getStakeholder().split(",");
		}
		for (String stkId : stakeholderIds) {
			if(StringUtils.isNotBlank(stakeholderId)){
				stakeholderId+=","+EncryptPkUtil.decodeId(stkId);
			}else{
				stakeholderId+=EncryptPkUtil.decodeId(stkId);
			}
		}				
		vo.setStakeholder(stakeholderId);
		if(StringUtils.isBlank(vo.getId())){				
			//录入创建人
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//录入创建人部门
			vo.setCreateDept(EncryptPkUtil.decodeId(this.getLoginUser().getDeptId()));
			//生成项目编号
			String productName=saleTrackDao.getProductNameByCode(vo.getBelongProduct());
			String maxProjectNo=saleTrackDao.getMaxProjectNo(productName);			
			vo.setProjectno(maxProjectNo);	
			//新增销售跟踪
			this.saleTrackDao.insertSaleTrack(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));				
			//更新
			this.saleTrackDao.updateSaleTrack(vo);
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R00202", vo.getId());
			}
		}
	}

	@Override
	public void deleteSaleTrackById(String id){
		if(StringUtils.isNotBlank(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.saleTrackDao.deleteSaleTrackById(id);
		}
	}			
}
