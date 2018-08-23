package com.ps.service.impl.performancemanage;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.performancemanager.PerformanceManagerDao;
import com.ps.dao.systemmanage.UserManagerDao;
import com.ps.result.performancemanage.PerformanceVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.performancemanage.IPerformanceManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    績效管理业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-03-12
 */
@Service
public class PerformanceManagerServiceImpl extends BaseServiceImpl implements IPerformanceManagerService{
	
	@Autowired
	private PerformanceManagerDao performanceManagerDao;
	
	@Autowired
	private UserManagerDao userManagerDao;
    
	@Autowired
	private ICommonService commonService;
	
	@Override
	public List<UserVo> queryPerformanceUserByParam(UserVo userVo) {
		//查询有效用户信息
		userVo.setUserFlag(GlobalConstants.ZERO);
		List<UserVo> dataList=userManagerDao.queryUserInfoByParam(userVo);
		for (UserVo userVo2 : dataList) {
			userVo2.setId(EncryptPkUtil.encodeId(userVo2.getId()));
		}
		return dataList;
	}
	
	@Override
	public List<PerformanceVo> queryPerformanceInfoByParam(PerformanceVo param) {
		//解密
		if(StringUtils.isNotBlank(param.getUserId())){
			param.setUserId(EncryptPkUtil.decodeId(param.getUserId()));
		}
		List<PerformanceVo> dataList = this.performanceManagerDao.queryPerformanceInfoByParam(param);
		for (PerformanceVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public PerformanceVo queryPerformanceInfoById(String id) {
			String temId = id;
			PerformanceVo vo = new PerformanceVo();
			if(StringUtils.isNotEmpty(id)){
				id = EncryptPkUtil.decodeId(id);
				vo = this.performanceManagerDao.queryPerformanceById(id);
				if(vo != null){
					vo.setId(temId);
					vo.setUserId(EncryptPkUtil.encodeId(vo.getUserId()));
				}
			}
			return vo;
	}
	
	@Override
	public void savePerformance(PerformanceVo vo){
			if(StringUtils.isEmpty(vo.getId())){
				//新增
				//创建人信息
				UserVo create = this.getLoginUser();
				vo.setCreateBy(EncryptPkUtil.decodeId(create.getId()));
				vo.setCreateDept(create.getDeptId());
				this.performanceManagerDao.insertPerformance(vo);
			}else{
				//解密
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				//更新
				this.performanceManagerDao.updatePerformance(vo);
				//记录变更记录
				if(StringUtils.isNotBlank(vo.getChangeDetails())){
					commonService.saveChangeRecode(vo.getChangeDetails(),"R00601", vo.getId());
				}
			}
	}

	@Override
	public void generateTheSameMonthPerformance(String userIdArray) {
		String userIds[]={};
		if(StringUtils.isNotBlank(userIdArray)){
			userIds=userIdArray.split(",");
		}
		//获取当前年月 YYYY-MM
		String yearMonth=DateUtil.format(new Date(), "YYYY-MM");
		//根据年月获取已有绩效人员信息
		PerformanceVo performanceVo=new PerformanceVo();
		performanceVo.setMonth(yearMonth);
		List<PerformanceVo> listData=this.performanceManagerDao.queryPerformanceInfoByParam(performanceVo);
		//循环人员列表加入map中
		Map<String,String> userMap=new HashMap<String, String>();
		for (PerformanceVo performanceManagerVo2 : listData) {
			userMap.put(performanceManagerVo2.getUserId(), performanceManagerVo2.getUserId());
		}
		//解密
		for (String userId : userIds) {
			userId=EncryptPkUtil.decodeId(userId);
			if(!userMap.containsKey(userId)){
				PerformanceVo sameMonthPerformanceVo=new PerformanceVo();
				sameMonthPerformanceVo.setUserId(userId);
				sameMonthPerformanceVo.setMonth(yearMonth);
				//录入创建人
				sameMonthPerformanceVo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//录入更新人
				sameMonthPerformanceVo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				this.performanceManagerDao.insertPerformance(sameMonthPerformanceVo);
			}
		}
		
	}

}
