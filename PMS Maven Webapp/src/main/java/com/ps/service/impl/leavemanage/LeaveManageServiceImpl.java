package com.ps.service.impl.leavemanage;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.leavemanage.LeaveManageDao;
import com.ps.result.leavemanage.LeaveVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.leavemanage.ILeaveManageService;
import com.util.coder.EncryptPkUtil;
@Service
public class LeaveManageServiceImpl extends BaseServiceImpl implements ILeaveManageService{
	
	
	@Autowired
	private LeaveManageDao leaveManageDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Override
	public List<LeaveVo> queryLeaveInfoByParam(LeaveVo param) {
			//查询条件多个客户解密
			String customerIds[]={};
			String customerId="";
			//判断所选角色是否为空
			if(StringUtils.isNotBlank(param.getLeaveBy())){
				customerIds=param.getLeaveBy().split(",");
				
			}
			for (String cusId : customerIds) {
				if(StringUtils.isNotBlank(customerId)){
					customerId+=","+EncryptPkUtil.decodeId(cusId);
				}else{
					customerId+=EncryptPkUtil.decodeId(cusId);
				}
			}
			param.setLeaveBy(customerId);
			if(!StringUtils.isEmpty(param.getSignStartDate())){
				
				param.setSignStartDateNext(DateAddOne(param.getSignStartDate()));
			}
		List<LeaveVo> dataList = this.leaveManageDao.queryLeaveInfoByParam(param);
		for (LeaveVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setLeaveBy(EncryptPkUtil.encodeId(vo.getLeaveBy()));
		}
		return dataList;
	}

	
	@Override
	public LeaveVo queryLeaveInfoById(String id) {
		String temId = id;
		LeaveVo vo = new LeaveVo();
		if(!StringUtils.isBlank(id)){				
			id = EncryptPkUtil.decodeId(id);
			vo = this.leaveManageDao.queryLeaveById(id);
			if(vo != null){
				vo.setId(temId);
				//加密客户ID
				vo.setLeaveBy(EncryptPkUtil.encodeId(vo.getLeaveBy()));
				vo.setChangeList(commonService.queryChangeRecordByUserId("R01202", temId));
			}
		}else {
			//录入创建人
			vo.setCreateBy(this.getLoginUser().getUserName());
			//录入创建人部门
			vo.setCreateDept(this.getLoginUser().getDeptId());
			//录入创建时间
			vo.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		}		
		return vo;
	}

	@Override
	public void saveLeave(LeaveVo vo) {
		//录入更新人
		vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		//解密
		vo.setLeaveBy(EncryptPkUtil.decodeId(vo.getLeaveBy()));
		if(StringUtils.isBlank(vo.getId())){
			//录入创建人
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//录入创建人部门
			vo.setCreateDept(EncryptPkUtil.decodeId(this.getLoginUser().getDeptId()));								
			//新增合同
			this.leaveManageDao.insertLeave(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			//更新合同
			this.leaveManageDao.updateLeave(vo);
			
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R01202", vo.getId());
			}
		}
		
	}

	@Override
	public void deleteLeaveById(String id) {
		if(StringUtils.isNotBlank(id)){
			  //解密
				id = EncryptPkUtil.decodeId(id);
				this.leaveManageDao.deleteLeaveById(id);
			}
		
	}

	@Override
	public void updateLeaveSendStatus(String id) {
		if(StringUtils.isNotBlank(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.leaveManageDao.updateLeaveSendStatus(id);
			//记录变更记录
			commonService.saveChangeRecode("请假提交","R01202", id);
		}
	}
	//减去一天
	public String DateAddOne(String dateStr){
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");    
		String da = "";
		try {
			Calendar cd=Calendar.getInstance();
			cd.setTime(format1.parse(dateStr));
			cd.add(Calendar.DATE, 1);
			da =format1.format(cd.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return da;
	}


	@Override
	public void updateLeaveState(String id) {
		if(StringUtils.isNotBlank(id)){
			  //解密
				id = EncryptPkUtil.decodeId(id);
				this.leaveManageDao.updateLeaveState(id);
				//记录变更记录
				commonService.saveChangeRecode("请假拒绝","R01202", id);
			}
	}

	//通过
	@Override
	public void passLeaveState(String id) {
		if(StringUtils.isNotBlank(id)){
			  //解密
				id = EncryptPkUtil.decodeId(id);
				this.leaveManageDao.passLeaveState(id);
				//记录变更记录
				commonService.saveChangeRecode("请假通过","R01202", id);
			}
		
	}
		
}
	

