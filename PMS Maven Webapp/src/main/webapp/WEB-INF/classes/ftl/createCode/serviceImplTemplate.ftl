package com.${projectName}.service.impl.${packageName};

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.sms.vo.systemmanage.UserVo;
import com.sms.service.impl.common.BaseServiceImpl;
import com.sms.dao.systemmanage.DepartManageDao; 
import com.${projectName}.dao.${packageName}.${objectName}Dao;
import com.${projectName}.service.${packageName}.I${objectName}Service;
import com.${projectName}.vo.${packageName}.${objectName}Vo;
import com.${projectName}.param.${packageName}.${objectName}ParamVo;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         ${author}
 * @date:           ${nowDate?string("yyyy-MM-dd")}
 */
@Service
public class ${objectName}ServiceImpl extends BaseServiceImpl implements I${objectName}Service{
	
	@Autowired
	private ${objectName}Dao ${objectNameLower}Dao;

	@Autowired
	private DepartManageDao departManageDao;
	
	@Override
	public List<${objectName}Vo> query${objectName}InfoByParam(${objectName}ParamVo param) {
			List<${objectName}Vo> dataList = this.${objectNameLower}Dao.query${objectName}InfoByParam(param);
			for (${objectName}Vo vo : dataList) {
				//加密
				vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			}
			return dataList;
	}

	@Override
	public ${objectName}Vo query${objectName}InfoById(String id) {
			String temId = id;
			${objectName}Vo vo = new ${objectName}Vo();
			if(StringUtils.isEmpty(id)){
				//创建人信息
				UserVo create = this.getLoginUser();
				vo.setCreateByName(create.getUserName());
				//部门id
				String departId=create.getDeptId();
				//部门中文名
				String departCname = departManageDao.queryDeptCNameByDeptId(departId);
				vo.setCreateDeptName(departCname);
				vo.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			}else{
				id = EncryptPkUtil.decodeId(id);
				vo = this.${objectNameLower}Dao.query${objectName}ById(id);
				if(vo != null){
					vo.setId(temId);
				}
			}
			return vo;
	}
	
	@Override
	public void save${objectName}(${objectName}Vo vo){
			if(StringUtils.isEmpty(vo.getId())){
				//新增
				//创建人信息
				UserVo create = this.getLoginUser();
				vo.setCreateBy(EncryptPkUtil.decodeId(create.getId()));
				vo.setCreateDept(create.getDeptId());
				this.${objectNameLower}Dao.insert${objectName}(vo);
			}else{
				//解密
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				//更新
				this.${objectNameLower}Dao.update${objectName}(vo);
			}
	}

	@Override
	public void delete${objectName}ById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.${objectNameLower}Dao.delete${objectName}ById(id);
		}
	}
}
