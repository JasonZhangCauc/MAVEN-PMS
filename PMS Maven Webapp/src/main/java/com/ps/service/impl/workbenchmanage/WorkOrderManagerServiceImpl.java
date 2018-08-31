package com.ps.service.impl.workbenchmanage;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.workbenchmanage.WorkOrderManagerDao;
import com.ps.result.systemmanage.UserVo;
import com.ps.result.workbenchmanager.WorkOrderManagerVo;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.workbenchmanage.IWorkOrderManagerService;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-07-25
 */
@Service
public class WorkOrderManagerServiceImpl extends BaseServiceImpl implements IWorkOrderManagerService{
	
	@Autowired
	private WorkOrderManagerDao workOrderManagerDao;

	
	@Override
	public List<WorkOrderManagerVo> queryWorkOrderByParam(WorkOrderManagerVo param) {
		List<WorkOrderManagerVo> dataList = this.workOrderManagerDao.queryWorkOrderByParam(param);
		for (WorkOrderManagerVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public WorkOrderManagerVo queryWorkOrderById(String id) {
		String temId = id;
		WorkOrderManagerVo vo = new WorkOrderManagerVo();
		if(StringUtils.isNotEmpty(id)){
			id = EncryptPkUtil.decodeId(id);
			vo = this.workOrderManagerDao.queryWorkOrderById(id);
			if(vo != null){
				vo.setId(temId);
			}
		}
		return vo;
	}
	
	@Override
	public void saveWorkOrder(WorkOrderManagerVo vo){
		if(StringUtils.isEmpty(vo.getId())){
			//新增
			//创建人信息
			UserVo create = this.getLoginUser();
			vo.setCreateBy(EncryptPkUtil.decodeId(create.getId()));
			vo.setCreateDept(create.getDeptId());
			this.workOrderManagerDao.insertWorkOrder(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			//更新
			this.workOrderManagerDao.updateWorkOrder(vo);
		}
	}

	@Override
	public void deleteWorkOrderById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.workOrderManagerDao.deleteWorkOrderById(id);
		}
	}
}
