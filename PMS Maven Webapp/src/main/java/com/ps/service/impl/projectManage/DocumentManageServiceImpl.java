package com.ps.service.impl.projectManage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.projectmanage.DocumentManageDao;
import com.ps.result.projectmanage.DocumentManageVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.projectmanage.IDocumentManageService;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         zhangm
 * @date:           2018-08-03
 */
@Service
public class DocumentManageServiceImpl extends BaseServiceImpl implements IDocumentManageService{
	
	@Autowired
	private DocumentManageDao documentManageDao;

	
	@Override
	public List<DocumentManageVo> queryDocumentManageInfoByParam(DocumentManageVo param) {
			List<DocumentManageVo> dataList = this.documentManageDao.queryDocumentManageInfoByParam(param);
			for (DocumentManageVo vo : dataList) {
				//加密
				vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			}
			return dataList;
	}
	
	@Override
	public void saveDocumentManage(DocumentManageVo vo){
			if(StringUtils.isEmpty(vo.getId())){
				//新增
				//创建人信息
				UserVo create = this.getLoginUser();
				vo.setCreateBy(EncryptPkUtil.decodeId(create.getId()));
				vo.setCreateDept(create.getDeptId());
				this.documentManageDao.insertDocumentManage(vo);
			}else{
				//解密
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				//更新
				this.documentManageDao.updateDocumentManage(vo);
			}
	}

	@Override
	public void deleteDocumentManageById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.documentManageDao.deleteDocumentManageById(id);
		}
	}

	@Override
	public List<DocumentManageVo> searchDoucmentList(DocumentManageVo param) {
		param.setMoniDucId(EncryptPkUtil.decodeId(param.getMoniDucId()));
		return documentManageDao.searchDoucmentList(param);
	}

}
