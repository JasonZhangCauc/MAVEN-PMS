package com.ps.service.impl.systemmanage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.aop.exception.BussinessException;
import com.aop.exception.BussinessExceptionBean;
import com.ps.dao.systemmanage.CodeManagerDao;
import com.ps.result.systemmanage.CodeVo;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.systemmanage.ICodeManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;
import com.util.tool.MessageUtil;

/**
 * @Description:    基础数据维护业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-03-02
 */
@Service
public class CodeManagerServiceImpl extends BaseServiceImpl implements ICodeManagerService{
	
	@Autowired
	private CodeManagerDao codeManagerDao;

	@Override
	public List<CodeVo> queryCodeInfoByParam(CodeVo vo) {
		vo.setWhetherParent(GlobalConstants.ONE);
		List<CodeVo> dataList = this.codeManagerDao.queryCodeInfoByParam(vo);
		for (CodeVo vo1 : dataList) {
			//加密
			vo1.setId(EncryptPkUtil.encodeId(vo1.getId()));
		}
		return dataList;
	}

	@Override
	public CodeVo queryCodeInfoById(String codeId) {
		CodeVo vo = new CodeVo();
		if(StringUtils.isNotBlank(codeId)){
			String temId = EncryptPkUtil.decodeId(codeId);
			vo=this.codeManagerDao.queryCodeById(temId);
			vo.setId(codeId);
		}
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setCurrentTime(DateUtil.today());
		return vo;
	}
	
	@Override
	public void saveCode(CodeVo vo){
		//根据码表id判断新增/修改
		if(StringUtils.isEmpty(vo.getId())){
			//录入创建人
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			vo.setCodeValue(String.valueOf(this.codeManagerDao.getNextCodeValueByType(vo.getCodeType())));
			//新增
			this.codeManagerDao.insertCode(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新
			this.codeManagerDao.updateCode(vo);
		}
	}

	@Override
	public Map<String, List<CodeVo>> initCodeInfo() {
		Map<String, List<CodeVo>> treeMap = new HashMap<String, List<CodeVo>>();
		try {
			List<CodeVo> all = this.codeManagerDao.getValidCodeInfo();
			List<CodeVo> children = null;
			if (all!=null) {
				for (CodeVo basicVo : all) {
					if(treeMap.containsKey(basicVo.getCodeType())){
						treeMap.get(basicVo.getCodeType()).add(basicVo);
					}else{
						children = new ArrayList<CodeVo>();
						children.add(basicVo);
						treeMap.put(basicVo.getCodeType(), children);
					}
				}
			}
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.syserror"), e);
		}
		return treeMap;
	}
	
	@Override
	public Map<Object, Object> queryCodeInfoByChecking(CodeVo codeVo) {
		Map<Object,Object> map=new HashMap<Object,Object>();
		//解密
		codeVo.setId(EncryptPkUtil.decodeId(codeVo.getId()));
		
		CodeVo codeVo2=this.codeManagerDao.getCodeInfoByCodeType(codeVo);
		if(codeVo2==null){
			map.put("ok", "");
		}else{
			map.put("error", MessageUtil.getMessage("label.codeManager.equalTypeNoCodeValueMsg"));
		}
		return map;
	}

	@Override
	public void updateCodeFlag(String codeId, String codeFlag) {
		//解密
		if(!StringUtils.isBlank(codeId)){
			codeId=EncryptPkUtil.decodeId(codeId);
			if(StringUtils.equals("1", codeFlag)){
				codeFlag=GlobalConstants.ZERO;
			}else{
				codeFlag=GlobalConstants.ONE;
			}
			
			this.codeManagerDao.updateCodeFlag(codeId, codeFlag);
		}
	}

	@Override
	public List<CodeVo> getParentCode() {
		CodeVo codeVo=new CodeVo();
		codeVo.setWhetherParent(GlobalConstants.ZERO);
		List<CodeVo> dataList = this.codeManagerDao.queryParentCode(codeVo);
		return dataList;
	}
}
