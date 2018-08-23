package com.ps.service.impl.contractmanage;

import java.text.DecimalFormat;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.contractmanage.ReceiveNodeManageDao;
import com.ps.dao.presalemanage.SaleTrackDao;
import com.ps.result.contractmanage.ReceiveNodeVo;
import com.ps.service.common.ICommonService;
import com.ps.service.contractmanage.IReceiveNodeManageService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         raomingyi
 * @date:           2018-03-19
 */
@Service
public class ReceiveNodeManageServiceImpl extends BaseServiceImpl implements IReceiveNodeManageService{
	
	@Autowired
	private ReceiveNodeManageDao receiveNodeManageDao;
	
	@Autowired
	private SaleTrackDao saleTrackDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Override
	public List<ReceiveNodeVo> queryReceiveNodeInfoByParam(ReceiveNodeVo param) {
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
		    //解密项目ID
		    param.setContractId(EncryptPkUtil.decodeId(param.getContractId()));
			List<ReceiveNodeVo> dataList = this.receiveNodeManageDao.queryReceiveNodeInfoByParam(param);
			for (ReceiveNodeVo vo : dataList) {
				//加密
				vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			}
			return dataList;
	}

	@Override
	public ReceiveNodeVo queryReceiveNodeInfoById(String id) {
			String temId = id;
			ReceiveNodeVo vo = new ReceiveNodeVo();
			if(StringUtils.isNotBlank(id)){				
				id = EncryptPkUtil.decodeId(id);
				vo = this.receiveNodeManageDao.queryReceiveNodeById(id);
				if(vo != null){
				   vo.setId(temId);
				   vo.setResponsibleBy(EncryptPkUtil.encodeId(vo.getResponsibleBy()));
				}
			}
			return vo;
	}
	
	@Override
	public void saveReceiveNode(ReceiveNodeVo vo){
		//解密
		vo.setResponsibleBy(EncryptPkUtil.decodeId(vo.getResponsibleBy()));
		vo.setBelongCustomerid(EncryptPkUtil.decodeId(vo.getBelongCustomerid()));
		//录入更新人
		vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			if(StringUtils.isBlank(vo.getId())){
				//录入创建人
				vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));				
				//解密项目ID
				vo.setContractId(EncryptPkUtil.decodeId(vo.getContractId()));								
				//生成节点编号				
				String customCode=receiveNodeManageDao.getCustomCode(vo.getBelongCustomerid());
				String productName=saleTrackDao.getProductNameByCode(vo.getBelongProduct());
				String maxNodeNum=receiveNodeManageDao.getMaxNodeNum(vo);
				String newNodeNum=null;
				if(StringUtils.isBlank(maxNodeNum)){
					newNodeNum=customCode+"-"+productName+"-"+"SKN001";					
				}else {
					int maxNumber=Integer.valueOf(StringUtils.substringAfter(maxNodeNum,"-SKN"));
					DecimalFormat decimalFormat = new DecimalFormat("000"); 
					newNodeNum=customCode+"-"+productName+"-SKN"+decimalFormat.format(maxNumber+1);					
				}
				vo.setReceivablesNo(newNodeNum);
				//新增
				this.receiveNodeManageDao.insertReceiveNode(vo);
			}else{
				//解密
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				//更新
				this.receiveNodeManageDao.updateReceiveNode(vo);
				//记录变更记录
				if(StringUtils.isNotBlank(vo.getChangeDetails())){
					commonService.saveChangeRecode(vo.getChangeDetails(),"R0030301", vo.getId());
				}
			}
	}

	@Override
	public void deleteReceiveNodeById(String id){
		if(StringUtils.isNotEmpty(id)){
		    //解密
			id = EncryptPkUtil.decodeId(id);
			ReceiveNodeVo receiveNodeVo = this.receiveNodeManageDao.queryReceiveNodeById(id);
			this.receiveNodeManageDao.deleteReceiveNodeById(id);		
			//记录变更记录	
			commonService.saveChangeRecode("删除收款节点"+receiveNodeVo.getReceivablesName(),"R00301",receiveNodeVo.getContractId());
			
		}
	}
}
