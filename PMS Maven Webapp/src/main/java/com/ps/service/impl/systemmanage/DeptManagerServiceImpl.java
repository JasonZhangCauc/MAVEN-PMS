package com.ps.service.impl.systemmanage;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.systemmanage.DeptManagerDao;
import com.ps.result.systemmanage.DeptVo;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.systemmanage.IDeptManagerService;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:    组织架构维护业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-03-06
 */
@Service
public class DeptManagerServiceImpl extends BaseServiceImpl implements IDeptManagerService{
	
	@Autowired
	private DeptManagerDao deptManagerDao;

	@Override
	public void saveDept(DeptVo vo){
		if(StringUtils.isEmpty(vo.getId())){
			//录入创建人
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//新增
			this.deptManagerDao.insertDept(vo);
		}else{
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新
			this.deptManagerDao.updateDept(vo);
		}
	}

	@Override
	public void updateDeptFlagById(String id){
		if(StringUtils.isNotEmpty(id)){
		    //解密
			this.deptManagerDao.updateDeptFlagById(id);
		}
	}

	@Override
	public List<DeptVo> loadDeptResourceTree(DeptVo vo) {
		List<DeptVo> list=this.deptManagerDao.queryDeptInfoByParam(vo);
		String id = vo.getId();
		if(StringUtils.isBlank(id)){
			id = "";
		}else{
			id = ","+id+",";
		}
		for (DeptVo deptVo : list) {
			if(StringUtils.isEmpty(deptVo.getDeptPid())){
				deptVo.setDeptPid("0");
			}
			//赋值
			deptVo.setName(deptVo.getDeptName());
			deptVo.setpId(deptVo.getDeptPid());
			
			//选中
			if(id.indexOf(","+deptVo.getId()+",") >= 0){
				deptVo.setChecked(true);
			}
		}
		//设置一级菜单
		DeptVo vos = new DeptVo();
		vos.setId(GlobalConstants.ZERO);
		vos.setpId(GlobalConstants.ZERO);
		vos.setName("根目录");
		vos.setNocheck(true);
		list.add(0, vos);
		return list;
	}

	@Override
	public List<DeptVo> initDeptData() {
		return this.deptManagerDao.initDeptData();
	}

}
