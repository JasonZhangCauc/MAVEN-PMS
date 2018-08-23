package com.ps.service.impl.performancemanage;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.performancemanager.DailyReportManagerDao;
import com.ps.result.performancemanage.DailyReportVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.performancemanage.IDailyReportManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    日报业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-03-13
 */
@Service
public class DailyReportManagerServiceImpl extends BaseServiceImpl implements IDailyReportManagerService{
	
	@Autowired
	private DailyReportManagerDao dailyReportManagerDao;
	
	@Autowired
	private ICommonService commonService;

	@Override
	public List<DailyReportVo> queryDailyReportInfoByParam(DailyReportVo param) {
		//所属客户
		String customerIds[]={};
		String customerId="";
		//判断所选角色是否为空
		if(StringUtils.isNotBlank(param.getBelongCustomer())){
			customerIds=param.getBelongCustomer().split(",");
		}
		for (String cusId : customerIds) {
			if(StringUtils.isNotBlank(customerId)){
				customerId+=","+EncryptPkUtil.decodeId(cusId);
			}else{
				customerId+=EncryptPkUtil.decodeId(cusId);
			}
		}
		param.setBelongCustomer(customerId);
		List<DailyReportVo> dataList = this.dailyReportManagerDao.queryDailyReportInfoByParam(param);
		for (DailyReportVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setProId(EncryptPkUtil.encodeId(vo.getProId()));
		}
		return dataList;
	}

	@Override
	public DailyReportVo queryDailyReportInfoById(String id) {
		String temId = id;
		DailyReportVo vo = new DailyReportVo();
		if(StringUtils.isNotEmpty(id)){
			id = EncryptPkUtil.decodeId(id);
			vo = this.dailyReportManagerDao.queryDailyReportById(id);
			if(vo != null){
				//加密
				vo.setId(temId);
				vo.setProId(EncryptPkUtil.encodeId(vo.getProId()));
				vo.setProReporter(EncryptPkUtil.encodeId(vo.getProReporter()));
				vo.setChangeList(commonService.queryChangeRecordByUserId("R00602", temId));
			}
		}else{
			//填报人
			vo.setProReporter(this.getLoginUser().getId());
			//填报人名称
			vo.setProReporterName(this.getLoginUser().getUserName());
			//填报时间
			vo.setReportDate(DateUtil.format(new Date(), "YYYY-MM-dd"));
		}
		return vo;
	}
	
	@Override
	public void saveDailyReport(DailyReportVo vo){
		//解密
		vo.setProReporter(EncryptPkUtil.decodeId(vo.getProReporter()));
		vo.setProId(EncryptPkUtil.decodeId(vo.getProId()));
		if(StringUtils.isEmpty(vo.getId())){
			//录入创建人
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//新增
			this.dailyReportManagerDao.insertDailyReport(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新
			this.dailyReportManagerDao.updateDailyReport(vo);
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R00602", vo.getId());
			}
		}
	}

	@Override
	public void deleteDailyReportById(String id){
		if(StringUtils.isNotEmpty(id)){
			//解密
			id = EncryptPkUtil.decodeId(id);
			this.dailyReportManagerDao.updateDailyReportStatus(id);
		}
	}
}
