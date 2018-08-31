package com.ps.service.impl.taskmanage;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.taskManage.AdjustRecordDao;
import com.ps.dao.taskManage.OverseeDao;
import com.ps.result.commentmanage.CommentVO;
import com.ps.result.projectmanage.ProjectBaseInfoVo;
import com.ps.result.taskmanage.AdjustRecordVo;
import com.ps.result.taskmanage.OverseeVo;
import com.ps.service.commentmanage.ICommentService;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.taskmanage.IOverseeService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    督办管理业务逻辑实现类
 * @author:         zhangm
 * @date:           2018-07-27
 */
@Service
public class IOverseeServiceImpl extends BaseServiceImpl  implements IOverseeService{
	
	@Autowired
	private OverseeDao overseeDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Autowired
	private ICommentService commentService;
	
	@Autowired
	private AdjustRecordDao adjustRecordDao;

	@Override
	public List<OverseeVo> queryOverseeInfoByParam(OverseeVo param) {
		if(!StringUtils.isEmpty(param.getEndTime())){
			param.setEndTime(DateAddOne(param.getEndTime()));
		}
		//解密
		param.setRelevanceProject(EncryptPkUtil.decodeId(param.getRelevanceProject()));
		List<OverseeVo> dataList =this.overseeDao.queryOverseeInfoInfoByParam(param);
		for (OverseeVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setRelevanceProject(EncryptPkUtil.encodeId(vo.getRelevanceProject()));
			vo.setLoginUserId(EncryptPkUtil.decodeId(this.getLoginUser().getId()));//当前登录人
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
	public OverseeVo queryOverseeBaseInfoById(String id) {
		OverseeVo vo = new OverseeVo();
		if(StringUtils.isEmpty(id)){
			vo.setInitiateByName(this.getLoginUser().getUserName());
			vo.setNumberDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			vo.setInitiateBy(this.getLoginUser().getId());
		}else{
			id = EncryptPkUtil.decodeId(id);
			vo=this.overseeDao.queryOverseeInfoById(id);
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setRelevanceProject(EncryptPkUtil.encodeId(vo.getRelevanceProject()));
			vo.setChangeList(this.commonService.queryChangeRecordByUserId("R007_01_OPERATION_EDIT",vo.getId()));
			CommentVO commentVo =new CommentVO();
			commentVo.setDataId(EncryptPkUtil.decodeId(vo.getId()));
			commentVo.setFunctionNo(GlobalConstants.CATEGORYTYPE_R00701);
			vo.setCommentUserList(this.commentService.queryCommentUserList(commentVo));
		}
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setCurrentTime(DateUtil.today());
		vo.setLoginUserPic(this.getLoginUser().getUserPic());
		vo.setLoginUserId(this.getLoginUser().getId());
		vo.setFunctionCode(GlobalConstants.CATEGORYTYPE_R00701);
		return vo;
	}

	@Override
	public void saveSuperviseInfo(OverseeVo vo) {
		//计算项目超期日期
		if(StringUtils.isEmpty(vo.getId())){
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			vo.setInitiateBy(EncryptPkUtil.decodeId(vo.getInitiateBy()));
			vo.setRelevanceProject(EncryptPkUtil.decodeId(vo.getRelevanceProject()));
			//新增
			this.overseeDao.insertSuperviseInfo(vo);
		}else{
			//修改
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			vo.setRelevanceProject(EncryptPkUtil.decodeId(vo.getRelevanceProject()));
			this.overseeDao.updateSuperviseInfo(vo);
			
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R007_01_OPERATION_EDIT", vo.getId());
			}
			
			//修改记录的同时往调整记录表中添加数据
			//只有当状态为审核通过并且完成时间改变的时候才添加数据
			if(vo.getStatus().equals(GlobalConstants.ONE)&&!vo.getRequiredDateOld().equals(vo.getRequiredDate())){
				AdjustRecordVo obj = new AdjustRecordVo();
				obj.setAdjustOldTime(vo.getRequiredDateOld());//调整前时间
				obj.setAdjustLastTime(vo.getRequiredDate());//调整前时间
				obj.setAdjustWhy(vo.getAdjustReason());//调整原因
				obj.setAdjustPerson(EncryptPkUtil.decodeId(this.getLoginUser().getId()));//调整人
				obj.setOverseeAdjustId(vo.getId());//督办id
				adjustRecordDao.insertAdjustRecord(obj);
			}
			
		}
	}
	
	@Override
	public void updateSuperviseInfo(OverseeVo vo) {
		//计算项目超期日期
		if(StringUtils.isEmpty(vo.getId())){
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			vo.setInitiateBy(EncryptPkUtil.decodeId(vo.getInitiateBy()));
			vo.setRelevanceProject(EncryptPkUtil.decodeId(vo.getRelevanceProject()));
			//新增
			this.overseeDao.insertSuperviseInfo(vo);
		}else{
			//修改
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			this.overseeDao.updateSuperviseInfoById(vo);
			
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R007_01_OPERATION_EDIT", vo.getId());
			}
			
			//修改记录的同时往调整记录表中添加数据
			//只有当状态为审核通过并且完成时间改变的时候才添加数据
			if(vo.getStatus().equals(GlobalConstants.ONE)&&!vo.getRequiredDateOld().equals(vo.getRequiredDate())){
				AdjustRecordVo obj = new AdjustRecordVo();
				obj.setAdjustOldTime(vo.getRequiredDateOld());//调整前时间
				obj.setAdjustLastTime(vo.getRequiredDate());//调整前时间
				obj.setAdjustWhy(vo.getAdjustReason());//调整原因
				obj.setAdjustPerson(EncryptPkUtil.decodeId(this.getLoginUser().getId()));//调整人
				obj.setOverseeAdjustId(vo.getId());//督办id
				adjustRecordDao.insertAdjustRecord(obj);
			}
			
		}
	}

	@Override
	public void deleteSuperviseInfo(String id) {
		id = EncryptPkUtil.decodeId(id);
		overseeDao.deleteSuperviseInfo(id);
	}

	@Override
	public void updateSuperviseInfoStatus(OverseeVo vo) {
		vo.setId(EncryptPkUtil.decodeId(vo.getId()));
		overseeDao.updateSuperviseInfoList(vo);
	}

	@Override
	public List<AdjustRecordVo> queryAdjustRecordVoByParam(AdjustRecordVo param) {
		if(param.getEndTime()!=null){
			param.setEndTime(DateAddOne(param.getEndTime()));
		}
		param.setOverseeAdjustId(EncryptPkUtil.decodeId(param.getId()));
		List<AdjustRecordVo> dataList =this.adjustRecordDao.queryAdjustRecordVoByParam(param);
		for (AdjustRecordVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public void saveSuperviseInfoCL(OverseeVo vo) {
		//计算项目超期日期
		if(StringUtils.isEmpty(vo.getId())){
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			vo.setInitiateBy(EncryptPkUtil.decodeId(vo.getInitiateBy()));
			vo.setRelevanceProject(EncryptPkUtil.decodeId(vo.getRelevanceProject()));
			//新增
			this.overseeDao.insertSuperviseInfo(vo);
		}else{
			
			
			try {
				//计算日期
				//实际完成时间大于要求完成时间  超期 数量
				//实际完成时间小鱼要求完成时间  是提前完成 天数
				
				//当前时间转string类型
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
				String today = sdf.format(new Date());
				int res=vo.getRequiredDate().compareTo(today);
				if(res>0){//完成时间大于实际时间
					int day = daysBetween(today, vo.getRequiredDate());
					if(day>0){
						vo.setWhetherDelay(GlobalConstants.TWO);//没有超期
						vo.setWhetherAdvance(GlobalConstants.ONE);//没有超期就是提前
						vo.setAdvanceDate(day+"");//提前完成天数
					}
				}
				if(res<0){//实际完成时间大于要求完成时间
					int day = daysBetween(vo.getRequiredDate(), today);
					if(day>0){
						vo.setWhetherDelay(GlobalConstants.ONE);//超期
						vo.setWhetherAdvance(GlobalConstants.TWO);//没有超期就是没有提前完成
						vo.setDelayDay(day+"");
					}
				}
				//修改
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				vo.setRelevanceProject(EncryptPkUtil.decodeId(vo.getRelevanceProject()));
				this.overseeDao.updateSuperviseInfo(vo);
				
				//记录变更记录
				if(StringUtils.isNotBlank(vo.getChangeDetails())){
					commonService.saveChangeRecode(vo.getChangeDetails(),"R007_01_OPERATION_EDIT", vo.getId());
				}
				
				//修改记录的同时往调整记录表中添加数据
				//只有当状态为审核通过并且完成时间改变的时候才添加数据
				if(!vo.getAdjustPerson().equals(GlobalConstants.ONE)){
					if(vo.getStatus().equals(GlobalConstants.ONE)&&!vo.getRequiredDateOld().equals(vo.getRequiredDate())){
						AdjustRecordVo obj = new AdjustRecordVo();
						obj.setAdjustOldTime(vo.getRequiredDateOld());//调整前时间
						obj.setAdjustLastTime(vo.getRequiredDate());//调整前时间
						obj.setAdjustWhy(vo.getAdjustReason());//调整原因
						obj.setAdjustPerson(EncryptPkUtil.decodeId(this.getLoginUser().getId()));//调整人
						obj.setOverseeAdjustId(vo.getId());//督办id
						adjustRecordDao.insertAdjustRecord(obj);
					}
				}
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			
			
			
		}
	}
	
	/**
     * 字符串日期格式的计算
     * @param smdate
     * @param bdate
     * @return
     * @throws ParseException
     */
    public static int daysBetween(String smdate,String bdate) throws ParseException{  
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(sdf.parse(smdate));    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(sdf.parse(bdate));    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time2-time1)/(1000*3600*24);  
        return Integer.parseInt(String.valueOf(between_days));     
    }

	

}
