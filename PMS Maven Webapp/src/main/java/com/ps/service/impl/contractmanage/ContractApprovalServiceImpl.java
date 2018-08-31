package com.ps.service.impl.contractmanage;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.contractmanage.ContractApprovalDao;
import com.ps.result.contractmanage.ContractApprovalVo;
import com.ps.service.common.ICommonService;
import com.ps.service.contractmanage.IContractApprovalService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.util.coder.EncryptPkUtil;


/**
 * @Description:    业务逻辑实现类
 * @author:         raomingyi
 * @date:           2018-03-15
 */
@Service
public class ContractApprovalServiceImpl extends BaseServiceImpl implements IContractApprovalService{
	
	@Autowired
	private ContractApprovalDao contractApprovalDao;
	
	@Autowired
	private ICommonService commonService;

	@Override
	public List<ContractApprovalVo> queryContractAppInfoByParam(ContractApprovalVo param) {
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
			List<ContractApprovalVo> dataList = this.contractApprovalDao.queryContractAppInfoByParam(param);
			for (ContractApprovalVo vo : dataList) {
				//加密
				vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			}
			return dataList;
	}
	@Override
	public ContractApprovalVo queryContractAppInfoById(String id) {
			String temId = id;
			ContractApprovalVo vo = new ContractApprovalVo();				
				id = EncryptPkUtil.decodeId(id);
				vo = this.contractApprovalDao.queryContractAppById(id);
				if(vo != null){
					vo.setId(temId);
					//加密客户ID
					vo.setBelongCustomerid(EncryptPkUtil.encodeId(vo.getBelongCustomerid()));
				}
				
			return vo;
	}
	
	@Override
	public void updateContractStatus(ContractApprovalVo vo){
		        //录入审核人
		       vo.setExamineBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));				
				//解密
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				//更新合同状态（合同审批）
				this.contractApprovalDao.updateContractStatus(vo);
				if(StringUtils.equals(GlobalConstants.TWO, vo.getContractStatus())){
					commonService.saveChangeRecode("合同审批通过","R00301", vo.getId());
				}else{
					commonService.saveChangeRecode("合同审批退回","R00301", vo.getId());
				}
	}
}
