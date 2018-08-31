package com.ps.service.impl.performancemanage;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.performancemanager.MonthReportManagerDao;
import com.ps.result.performancemanage.MonthReportVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.performancemanage.IMonthReportManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    日报业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-03-14
 */
@Service
public class MonthReportManagerServiceImpl extends BaseServiceImpl implements IMonthReportManagerService{
	
	@Autowired
	private MonthReportManagerDao monthReportManagerDao;
	
	@Autowired
	private ICommonService commonService;

	@Override
	public List<MonthReportVo> queryMonthReportInfoByParam(MonthReportVo param) {
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
		List<MonthReportVo> dataList = this.monthReportManagerDao.queryMonthReportInfoByParam(param);
		for (MonthReportVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setProId(EncryptPkUtil.encodeId(vo.getProId()));
		}
		return dataList;
	}

	@Override
	public MonthReportVo queryMonthReportInfoById(String id) {
		String temId = id;
		MonthReportVo vo = new MonthReportVo();
		if(StringUtils.isNotEmpty(id)){
			//解密
			id = EncryptPkUtil.decodeId(id);
			vo = this.monthReportManagerDao.queryMonthReportById(id);
			if(vo != null){
				vo.setId(temId);
				vo.setProId(EncryptPkUtil.encodeId(vo.getProId()));
				vo.setChangeList(commonService.queryChangeRecordByUserId("R00603", temId));
				//加密
				vo.setProReporter(EncryptPkUtil.encodeId(vo.getProReporter()));
				String proAttendeess[]={};
				if(StringUtils.isNotBlank(vo.getProAttendees())){
					proAttendeess=vo.getProAttendees().split(",");
				}
				String attendess="";
				for (String str : proAttendeess) {
					if(StringUtils.isNotBlank(attendess)){
						attendess+=","+EncryptPkUtil.encodeId(str);
					}else{
						attendess+=EncryptPkUtil.encodeId(str);
					}
				}
				vo.setProAttendees(attendess);
			}
		}else{
			//填报人
			vo.setProReporter(this.getLoginUser().getId());
			//填报人名称
			vo.setProReporterName(this.getLoginUser().getUserName());
			//填报月份
			vo.setReportMonth(DateUtil.format(new Date(), "YYYY-MM"));
		}
		return vo;
	}
	
	@Override
	public void saveMonthReport(MonthReportVo vo){
		//解密
		vo.setProReporter(EncryptPkUtil.decodeId(vo.getProReporter()));
		vo.setProId(EncryptPkUtil.decodeId(vo.getProId()));
		String proAttendeess[]={};
		if(StringUtils.isNotBlank(vo.getProAttendees())){
			proAttendeess=vo.getProAttendees().split(",");
		}
		String attendess="";
		for (String str : proAttendeess) {
			attendess+=EncryptPkUtil.decodeId(str)+",";
		}
		attendess=attendess.substring(0,attendess.length()-1);
		vo.setProAttendees(attendess);
		if(StringUtils.isEmpty(vo.getId())){
			//录入创建人
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//新增
			this.monthReportManagerDao.insertMonthReport(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新
			this.monthReportManagerDao.updateMonthReport(vo);
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R00603", vo.getId());
			}
		}
	}

	@Override
	public void deleteMonthReportById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.monthReportManagerDao.updateMonthReportStatus(id);
		}
	}
}
