package com.ps.service.impl.workbenchmanage;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.workbenchmanage.ComplaintsAndAdviceDao;
import com.ps.result.systemmanage.UserVo;
import com.ps.result.workbenchmanager.ComplaintsAndAdviceVo;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.workbenchmanage.IComplaintsAndAdviceService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    投诉与建议业务逻辑实现类
 * @author:         zhujiejie
 * @date:           2018-07-25
 */
@Service
public class ComplaintsAndAdviceServiceImpl extends BaseServiceImpl implements IComplaintsAndAdviceService{
	
	@Autowired
	private ComplaintsAndAdviceDao complaintsAndAdviceDao;

	@Override
	public List<ComplaintsAndAdviceVo> queryComplaintsAndAdviceInfoByParam(ComplaintsAndAdviceVo param) {
			if(!StringUtils.isEmpty(param.getCreateDateEnd())){
				param.setCreateDateEnd(DateAddOne(param.getCreateDateEnd()));
			}
			List<ComplaintsAndAdviceVo> dataList = this.complaintsAndAdviceDao.queryComplaintsAndAdviceInfoByParam(param);
			for (ComplaintsAndAdviceVo vo : dataList) {
				//加密
				vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			}
			return dataList;
	}
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
	public ComplaintsAndAdviceVo queryComplaintsAndAdviceInfoById(String id) {
			String temId = id;
			ComplaintsAndAdviceVo vo = new ComplaintsAndAdviceVo();
			if(StringUtils.isEmpty(id)){
				//创建人信息
				
			}else{
				id = EncryptPkUtil.decodeId(id);
				vo = this.complaintsAndAdviceDao.queryComplaintsAndAdviceById(id);
				if(vo != null){
					vo.setId(temId);
				}
			}
			vo.setLoginUserName(this.getLoginUser().getUserName());
			vo.setCurrentTime(DateUtil.today());
			return vo;
	}
	
	@Override
	public void saveComplaintsAndAdvice(ComplaintsAndAdviceVo vo){
			if(StringUtils.isEmpty(vo.getId())){
				//新增
				//创建人信息
				UserVo create = this.getLoginUser();
				vo.setCreateBy(EncryptPkUtil.decodeId(create.getId()));
				vo.setCreateDept(create.getDeptId());
				this.complaintsAndAdviceDao.insertComplaintsAndAdvice(vo);
			}else{
				//解密
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				//更新
				this.complaintsAndAdviceDao.updateComplaintsAndAdvice(vo);
			}
	}

	@Override
	public void deleteComplaintsAndAdviceById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.complaintsAndAdviceDao.deleteComplaintsAndAdviceById(id);
		}
	}
}
