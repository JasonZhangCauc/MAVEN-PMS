package com.ps.service.impl.contractmanage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.contractmanage.ContractExecuInfoDao;
import com.ps.result.contractmanage.ContractExecuInfoVo;
import com.ps.result.contractmanage.ContractVo;
import com.ps.service.common.ICommonService;
import com.ps.service.contractmanage.IContractExecuInfoService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         Jasonzhang
 * @date:           2018-03-21
 */
@Service
public class ContractExecuInfoServiceImpl extends BaseServiceImpl implements IContractExecuInfoService{
	
	@Autowired
	private ContractExecuInfoDao contractExecuInfoDao;

	@Autowired
	private ICommonService commonService;
	
	@Override
	public List<ContractVo> queryContractExecuInfoByParam(ContractVo param) {
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
			List<ContractVo> dataList = this.contractExecuInfoDao.queryContractExecuInfoByParam(param);
			for (ContractVo vo : dataList) {
				//加密
				vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			}
			return dataList;
	}
	
	@Override
	public ContractVo queryContractExecuInfoById(String contractId) {
			String temId = contractId;
			ContractVo contractVo = new ContractVo();
			if(StringUtils.isNotBlank(contractId)){						
				contractId = EncryptPkUtil.decodeId(contractId);
				contractVo = this.contractExecuInfoDao.queryContractExecuInfoById(contractId);
				if(contractVo != null){
					contractVo.setId(temId);
					contractVo.setBelongCustomerid(EncryptPkUtil.encodeId(contractVo.getBelongCustomerid()));
				}
			}
			return contractVo;
	}
	@Override
	public List<ContractExecuInfoVo> queryContractTrackInfoByParam(ContractExecuInfoVo param) {
		    param.setContractId(EncryptPkUtil.decodeId(param.getContractId()));
			List<ContractExecuInfoVo> dataList = this.contractExecuInfoDao.queryContractTrackInfoByParam(param);
			for (ContractExecuInfoVo vo : dataList) {
				//加密
				vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			}
			return dataList;
	}

	@Override
	public ContractExecuInfoVo queryContractTrackInfoById(String id) {
			String temId = id;
			ContractExecuInfoVo vo = new ContractExecuInfoVo();
			if(StringUtils.isNotBlank(id)){						
				id = EncryptPkUtil.decodeId(id);
				vo = this.contractExecuInfoDao.queryContractTrackById(id);
				if(vo != null){
					vo.setId(temId);
				}
			}else {
				//录入创建人
				vo.setCreateBy(this.getLoginUser().getUserName());
				//录入创建时间
				vo.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			}		
			return vo;
	}
	
	@Override
	public void saveContractTrack(ContractExecuInfoVo vo){		
		     //录入更新人
		     vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			if(StringUtils.isBlank(vo.getId())){
				//录入创建人
				vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//录入创建人部门
				vo.setCreateDept(EncryptPkUtil.decodeId(this.getLoginUser().getDeptId()));
				//解密
				vo.setContractId(EncryptPkUtil.decodeId(vo.getContractId()));
				//新增				
				this.contractExecuInfoDao.insertContractTrack(vo);
			}else{				
				//解密
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				//更新人
				vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//更新
				this.contractExecuInfoDao.updateContractTrack(vo);
				//记录变更记录
				if(StringUtils.isNotBlank(vo.getChangeDetails())){
					commonService.saveChangeRecode(vo.getChangeDetails(),"R00304", vo.getId());
				}
			}
	}

	@Override
	public void deleteContractTrackById(String id){
		if(StringUtils.isNotBlank(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			ContractExecuInfoVo contractExecuInfoVo = this.contractExecuInfoDao.queryContractTrackById(id);
			this.contractExecuInfoDao.deleteContractTrackById(id);
			//记录变更记录	
			commonService.saveChangeRecode("删除合同执行情况","R00301",contractExecuInfoVo.getContractId());
		}
	}
}
