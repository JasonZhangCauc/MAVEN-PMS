package com.ps.service.impl.presalemanage;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.presalemanage.SalesActivityDao;
import com.ps.result.presalemanage.SalesActivityVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.presalemanage.ISalesActivityService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         raomingyi
 * @date:           2018-03-02
 */
@Service
public class SalesActivityServiceImpl extends BaseServiceImpl implements ISalesActivityService{
	
	@Autowired
	private SalesActivityDao salesActivityDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Override
	public List<SalesActivityVo> querySalesActivityByParam(SalesActivityVo param) {
		    //解密
			if(StringUtils.isNotBlank(param.getSalesprojectId())){
				param.setSalesprojectId(EncryptPkUtil.decodeId(param.getSalesprojectId()));
			}		    
			List<SalesActivityVo> dataList = this.salesActivityDao.querySalesActivityByParam(param);
			for (SalesActivityVo vo : dataList) {
				//加密
				vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			}
			return dataList;
	}

	@Override
	public SalesActivityVo querySalesActivityById(String id) {
			String temId = id;
			SalesActivityVo vo = new SalesActivityVo();
			if(StringUtils.isNotBlank(id)){							
				id = EncryptPkUtil.decodeId(id);
				vo = this.salesActivityDao.querySalesActivityById(id);
				if(vo != null){
					vo.setId(temId);
					//销售人员
					String salesPersonnelIds[]={};
					String salesPersonnelId="";
					//判断所选角色是否为空
					if(StringUtils.isNotBlank(vo.getSalesPersonnelId())){
						salesPersonnelIds=vo.getSalesPersonnelId().split(",");
					}
					for (String cusId : salesPersonnelIds) {
						if(StringUtils.isNotBlank(salesPersonnelId)){
							salesPersonnelId+=","+EncryptPkUtil.encodeId(cusId);
						}else{
							salesPersonnelId+=EncryptPkUtil.encodeId(cusId);
						}
					}
					vo.setSalesPersonnelId(salesPersonnelId);					
				}
			}
			vo.setLoginUserName(this.getLoginUser().getUserName());
			vo.setLoginUserPic(this.getLoginUser().getUserPic());
			vo.setCurrentTime(DateUtil.today());
			return vo;
	}
	
	@Override
	public void saveSalesActivity(SalesActivityVo vo){
		     //解密
		    vo.setSalesprojectId(EncryptPkUtil.decodeId(vo.getSalesprojectId()));
			//销售人员
			String salesPersonnelIds[]={};
			String salesPersonnelId="";
			//判断所选角色是否为空
			if(StringUtils.isNotBlank(vo.getSalesPersonnelId())){
				salesPersonnelIds=vo.getSalesPersonnelId().split(",");
			}
			for (String cusId : salesPersonnelIds) {
				if(StringUtils.isNotBlank(salesPersonnelId)){
					salesPersonnelId+=","+EncryptPkUtil.decodeId(cusId);
				}else{
					salesPersonnelId+=EncryptPkUtil.decodeId(cusId);
				}
			}
			vo.setSalesPersonnelId(salesPersonnelId);
			if(StringUtils.isBlank(vo.getId())){
				//录入创建人
				vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//录入更新人
				vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//新增
				this.salesActivityDao.insertSalesActivity(vo);
			}else{
				//解密
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				//录入更新人
				vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//更新
				this.salesActivityDao.updateSalesActivity(vo);
				//记录变更记录
				if(StringUtils.isNotBlank(vo.getChangeDetails())){
					commonService.saveChangeRecode(vo.getChangeDetails(),"R0020203", vo.getId());
				}
			}
	}

	@Override
	public void deleteSalesActivityById(String id){
		if(StringUtils.isNotBlank(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			SalesActivityVo salesActivityVo = this.salesActivityDao.querySalesActivityById(id);
			this.salesActivityDao.deleteSalesActivityById(id);
			//记录变更记录	
			commonService.saveChangeRecode("删除销售活动"+salesActivityVo.getActivityName(),"R00202",salesActivityVo.getSalesprojectId());
		}
	}
}
