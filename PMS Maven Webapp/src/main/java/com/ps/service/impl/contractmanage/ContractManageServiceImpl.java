package com.ps.service.impl.contractmanage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.contractmanage.ContractManageDao;
import com.ps.result.contractmanage.ContractVo;
import com.ps.service.common.ICommonService;
import com.ps.service.contractmanage.IContractManageService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:    合同维护业务逻辑实现类
<<<<<<< HEAD
 * @author:         raomingyi
=======
 * @author:         Jasonzhang
>>>>>>> branch 'master' of https://github.com/JasonZhangCauc/MAVEN-PMS.git
 * @date:           2018-03-13
 */
@Service
public class ContractManageServiceImpl extends BaseServiceImpl implements IContractManageService{
	
	@Autowired
	private ContractManageDao contractManageDao;

	@Autowired
	private ICommonService commonService;
	
	@Override
	public List<ContractVo> queryContractInfoByParam(ContractVo param) {
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
			List<ContractVo> dataList = this.contractManageDao.queryContractInfoByParam(param);
			for (ContractVo vo : dataList) {
				//加密
				vo.setId(EncryptPkUtil.encodeId(vo.getId()));
				vo.setBelongCustomerid(EncryptPkUtil.encodeId(vo.getBelongCustomerid()));
			}
			return dataList;
	}

	@Override
	public ContractVo queryContractInfoById(String id) {
		String temId = id;
		ContractVo vo = new ContractVo();
		if(!StringUtils.isBlank(id)){				
			id = EncryptPkUtil.decodeId(id);
			vo = this.contractManageDao.queryContractById(id);
			if(vo != null){
				vo.setId(temId);
				//加密客户ID
				vo.setBelongCustomerid(EncryptPkUtil.encodeId(vo.getBelongCustomerid()));
				vo.setChangeList(commonService.queryChangeRecordByUserId("R00301", temId));
			}
		}else {
			//录入创建人
			vo.setCreateBy(this.getLoginUser().getUserName());
			//录入创建人部门
			vo.setCreateDept(this.getLoginUser().getDeptId());
			//录入创建时间
			vo.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		}		
		return vo;
	}
	
	@Override
	public void saveContract(ContractVo vo){
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//解密
			vo.setBelongCustomerid(EncryptPkUtil.decodeId(vo.getBelongCustomerid()));
			if(StringUtils.isBlank(vo.getId())){
				//录入创建人
				vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//录入创建人部门
				vo.setCreateDept(EncryptPkUtil.decodeId(this.getLoginUser().getDeptId()));								
				//新增合同
				this.contractManageDao.insertContract(vo);
			}else{
				//解密
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				//更新合同
				this.contractManageDao.updateContract(vo);
				
				//记录变更记录
				if(StringUtils.isNotBlank(vo.getChangeDetails())){
					commonService.saveChangeRecode(vo.getChangeDetails(),"R00301", vo.getId());
				}
			}
	}

	@Override
	public void deleteContractById(String id){
		if(StringUtils.isNotBlank(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.contractManageDao.deleteContractById(id);
		}
	}
	@Override
	public void updateContractSendStatus(String id){
		if(StringUtils.isNotBlank(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.contractManageDao.updateContractSendStatus(id);
			//记录变更记录
			commonService.saveChangeRecode("合同提交","R00301", id);
		}
	}
}
