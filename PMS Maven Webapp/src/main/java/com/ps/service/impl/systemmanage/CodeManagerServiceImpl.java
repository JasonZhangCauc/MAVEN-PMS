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

	//计算当前用户所拥有的岗位
	public String returnJobs(String ManagerDiff){
		String [] position = this.getLoginUser().getUserPosition().split(",");
		String positions = "";
		//统计需要查询的角色
		for (int i = 0; i < position.length; i++) {
			if(position[i].equals(GlobalConstants.ONE)){
				positions+= "," + GlobalConstants.ONE;
			}else if(position[i].equals(GlobalConstants.TWO)){
				positions+= "," + GlobalConstants.TWO;
			}else if(position[i].equals(GlobalConstants.THREE)){
				positions+= "," + GlobalConstants.THREE;
			}else if(position[i].equals(GlobalConstants.FOUR)){
				positions+= "," + GlobalConstants.FOUR;
			}
		}
		String retVal = "";
		if(!ManagerDiff.equals("")){
			if(!positions.equals("")){
				positions = positions.substring(1);
				//根据岗位赋予传查询值
				String [] ids = positions.split(",");
				for (int j = 0; j < ids.length; j++) {
					if(ids[j].equals(GlobalConstants.ONE)){
						//当状态等于三的时候给验证通过值
						if(!StringUtils.isBlank(ManagerDiff)){
							if(ManagerDiff.equals(GlobalConstants.THREE)){
								if(retVal.indexOf(GlobalConstants.THREE) == -1){
									retVal += ","+GlobalConstants.THREE+","+GlobalConstants.FOUR+","+GlobalConstants.FIVE;
								}else{
									retVal += ","+GlobalConstants.FOUR+","+GlobalConstants.FIVE;
								}
							}else{
								if(ManagerDiff.equals(GlobalConstants.FIVE)){
									if(retVal.indexOf(ManagerDiff) == -1){
										retVal += ","+GlobalConstants.FIVE;
									}
									if(retVal.indexOf(GlobalConstants.FOUR) == -1){
										retVal += ","+GlobalConstants.FOUR;
									}
								}else if(ManagerDiff.equals(GlobalConstants.FOUR)){
									retVal += ","+GlobalConstants.FOUR+","+GlobalConstants.SIX;
								}
							}
						}
					}else if(ids[j].equals(GlobalConstants.TWO)){
						//当状态等于二的时候给验证通过值
						if(!StringUtils.isBlank(ManagerDiff)){
							if(ManagerDiff.equals(GlobalConstants.TWO)){
								if(retVal.indexOf(GlobalConstants.THREE) == -1){
									retVal += ","+GlobalConstants.THREE;
								}
								if(retVal.indexOf(GlobalConstants.TWO) == -1){
									retVal += ","+GlobalConstants.TWO;
								}
							}else{
								if(retVal.indexOf(ManagerDiff) == -1){
									retVal += ","+ManagerDiff;
								}
							}
						}
					}else if(ids[j].equals(GlobalConstants.THREE)){
						if(!StringUtils.isBlank(ManagerDiff)){
							if(ManagerDiff.equals(GlobalConstants.FOUR)){
								retVal += ","+GlobalConstants.SIX;
							}else{
								if(retVal.indexOf(ManagerDiff) == -1){
									retVal += ","+ManagerDiff;
								}
								//retVal += ","+GlobalConstants.ONE;
							}
						}else{
							if(retVal.indexOf(ManagerDiff) == -1){
								retVal += ","+ManagerDiff;
							}
							//retVal += ","+GlobalConstants.ONE;
						}
					}else if(ids[j].equals(GlobalConstants.FOUR)){
						if(!StringUtils.isBlank(ManagerDiff)){
							if(ManagerDiff.equals(GlobalConstants.ONE)){
								if(retVal.indexOf(GlobalConstants.ONE) == -1){
									retVal += ","+GlobalConstants.ONE;
								}
								if(retVal.indexOf(GlobalConstants.TWO) == -1){
									retVal += ","+GlobalConstants.TWO;
								}
							}
						}
					}
				}
				if(!retVal.equals("")){
					retVal = retVal.substring(1);
				}
			}
		}else{
			retVal += ","+GlobalConstants.ONE;
		}
		return retVal;
	}
	
	@Override
	public Map<String, List<CodeVo>> initCodeInfoPlanState(CodeVo vo) {
		Map<String, List<CodeVo>> treeMap = new HashMap<String, List<CodeVo>>();
		try {
			vo.setCodeValueStr(returnJobs(vo.getManagerDiff()));//返回状态
			List<CodeVo> all = this.codeManagerDao.initCodeInfoPlanState(vo);
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
	public List<CodeVo> initDocumentCode(CodeVo vo) {
		List<CodeVo> list = new ArrayList<CodeVo>();
		if(!StringUtils.isBlank(vo.getCodeTypeStr())){
			if(vo.getCodeTypeStr().equals(GlobalConstants.ONE)){
				vo.setCodeType("documentClass01");
			}else if(vo.getCodeTypeStr().equals(GlobalConstants.TWO)){
				vo.setCodeType("documentClass02");
			}
			list = codeManagerDao.initDocumentCode(vo);
		}
		return list;
	}
	
	
	@Override
	public List<CodeVo> initTeachMouldCode(CodeVo vo) {
		List<CodeVo> list = new ArrayList<CodeVo>();
		if(!StringUtils.isBlank(vo.getCodeTypeStr())){
			if(vo.getCodeTypeStr().equals(GlobalConstants.ONE)){
				vo.setCodeType("teachMouldType03");
			}else if(vo.getCodeTypeStr().equals(GlobalConstants.TWO)){
				vo.setCodeType("teachMouldType02");
			}
			else if(vo.getCodeTypeStr().equals(GlobalConstants.ZERO)){
				vo.setCodeType("teachMouldType01");
			}
			list = codeManagerDao.initTeachMouldCode(vo);
		}
		return list;
	}

	@Override
	public List<CodeVo> overStatus(CodeVo vo) {
		vo.setStatusStrs(GlobalConstants.ONE+","+GlobalConstants.TWO);
		List<CodeVo> list = codeManagerDao.overStatus(vo);
		return list;
	}
}
