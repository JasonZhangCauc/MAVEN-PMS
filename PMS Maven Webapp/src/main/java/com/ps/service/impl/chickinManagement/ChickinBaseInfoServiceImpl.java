package com.ps.service.impl.chickinManagement;

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
import com.ps.dao.checkinginmanage.ChickinBaseInfoDao;

import com.ps.result.checkinginmanage.ChickinBaseInfoVo;
import com.ps.result.commentmanage.CommentVO;
import com.ps.result.presalemanage.CustomerVo;
import com.ps.result.projectmanage.ProjectBaseInfoVo;
import com.ps.service.checkinginmanage.IChickinBaseInfoService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;


/**
 * 
 * @Description:    打卡记录逻辑实现类
 * ChickinBaseInfoServiceImpl
 * @author：JasonZhang
 * @date：2018-8-3-下午5:55:35 
 *
 */
@Service
public  class ChickinBaseInfoServiceImpl extends BaseServiceImpl implements IChickinBaseInfoService{
	
	@Autowired
	private ChickinBaseInfoDao chickinBaseInfoDao;

	@Override
	public List<ChickinBaseInfoVo> queryChickinBaseInfoInfoByParam(ChickinBaseInfoVo param) {
		List<ChickinBaseInfoVo> dataList =this.chickinBaseInfoDao.queryChickinBaseInfoInfoByParam(param);
		for (ChickinBaseInfoVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public List<ChickinBaseInfoVo> querychickinBaseInfoByParam(
			ChickinBaseInfoVo param) {
		List<ChickinBaseInfoVo> dataList = new ArrayList<ChickinBaseInfoVo>();
		
		dataList = chickinBaseInfoDao.queryChickinByParam(param);
		for (ChickinBaseInfoVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public void saveChickinBaseInfo(ChickinBaseInfoVo vo){
		
		if(!StringUtils.isBlank(vo.getId())){//无
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			this.chickinBaseInfoDao.updateChickin(vo);//修改操作
			
		}else{//新增操作
			/*SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//设置日期格式
			String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
			//vo.setChickinTime(date);//时间
			 * */			
			if (vo.getChickinType().equals(GlobalConstants.ONE)){//上班
				ChickinBaseInfoVo obj = new ChickinBaseInfoVo();
				obj.setChickinBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));//当前登录人
				obj.setChickinType(vo.getChickinType());//上班还是下班
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String date = "";
				if(vo.getBqType().equals(GlobalConstants.ONE)){
					date = df.format(new Date());
					obj.setChickinTime(date);
					vo.setChickinTime(df2.format(new Date()));
					//计算当前日期加一天
					Calendar c = Calendar.getInstance();
			        c.setTime(new Date());
			        c.add(Calendar.DAY_OF_MONTH, 1);// 今天+1天
			        Date tomorrow = c.getTime();
			        String date2 = df.format(tomorrow);
					obj.setChickinTimeAddDay(date2);
					vo.setChickinState(GlobalConstants.THREE);//状态
				}else if(vo.getBqType().equals(GlobalConstants.TWO)){
					date = vo.getChickinTime();//补签的开始键
					obj.setChickinTime(vo.getChickinTime());
					//补签的时间加一天
					Date dayOne = new Date();
					try {
						dayOne = df.parse(vo.getChickinTime());
					} catch (ParseException e) {
						e.printStackTrace();
					}
					Calendar c = Calendar.getInstance();
			        c.setTime(dayOne);
			        c.add(Calendar.DAY_OF_MONTH, 1);// 今天+1天
			        Date tomorrow = c.getTime();
			        String date2 = df.format(tomorrow);
					obj.setChickinTimeAddDay(date2);
					vo.setChickinState(GlobalConstants.ONE);//状态
					
				}
				
				obj.setChickinTime(date);
				
				
				int num = this.chickinBaseInfoDao.queryChickinBaseInfoInfoByCount(obj);
				if(num<=0){
					//vo.setChickinBy(EncryptPkUtil.decodeId(vo.getChickinBy()));//打卡人id
					vo.setChickinType(vo.getChickinType());//上班/下班
					vo.setChickinBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));//打卡人id
					this.chickinBaseInfoDao.saveChickin(vo);//新增
					//System.out.println(vo.getChickinType());
				}
			}else if(vo.getChickinType().equals(GlobalConstants.TWO)){//下班
				ChickinBaseInfoVo obj2 = new ChickinBaseInfoVo();
				obj2.setChickinBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));//当前登录人
				obj2.setChickinType(vo.getChickinType());//上班还是下班
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String date = "";
				if(vo.getBqType().equals(GlobalConstants.ONE)){
					date = df.format(new Date());
					vo.setChickinTime(df2.format(new Date()));
					
					obj2.setChickinTime(date);
					
					//计算当前日期加一天
					Calendar c = Calendar.getInstance();
			        c.setTime(new Date());
			        c.add(Calendar.DAY_OF_MONTH, 1);// 今天+1天
			        Date tomorrow = c.getTime();
			        String date2 = df.format(tomorrow);
					obj2.setChickinTimeAddDay(date2);
					vo.setChickinState(GlobalConstants.THREE);//状态
				}else{
					//赋予开始时间
					date = vo.getChickinTime();//补签的开始键
					obj2.setChickinTime(vo.getChickinTime());
					//补签的时间加一天
					Date dayOne = new Date();
					try {
						dayOne = df.parse(vo.getChickinTime());
					} catch (ParseException e) {
						e.printStackTrace();
					}
					
					//计算当前日期加一天
					Calendar c = Calendar.getInstance();
			        c.setTime(dayOne);
			        c.add(Calendar.DAY_OF_MONTH, 1);// 今天+1天
			        Date tomorrow = c.getTime();
			        String date2 = df.format(tomorrow);
					obj2.setChickinTimeAddDay(date2);
					vo.setChickinState(GlobalConstants.ONE);//状态
				}
				
				this.chickinBaseInfoDao.deleteChickinByTime(obj2);//下午打卡先删除后添加
				
				vo.setChickinBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));//打卡人id
				vo.setChickinType(vo.getChickinType());//上班/下班
				this.chickinBaseInfoDao.saveChickin(vo);//新增
			}
			
			
			
			
			/*if (vo.getChickinType().equals(GlobalConstants.ONE)) {//上班
				
				if(num>0){
					vo.setChickinState(GlobalConstants.THREE);//状态
					vo.setChickinBy(EncryptPkUtil.decodeId(vo.getChickinBy()));//打卡人id
					vo.setChickinType(vo.getChickinType());//上班/下班
					this.chickinBaseInfoDao.saveChickin(vo);//新增
					//System.out.println(vo.getChickinType());
				}
				//上午已经打过卡
				System.out.println("num<0");
			}else{
					
					
					vo.setChickinState(GlobalConstants.THREE);//状态
					vo.setChickinBy(EncryptPkUtil.decodeId(vo.getChickinBy()));//打卡人id
					vo.setChickinType(vo.getChickinType());//上班/下班
					
					this.chickinBaseInfoDao.deleteChickinByTime(vo);//下午打卡先删除后添加
					this.chickinBaseInfoDao.saveChickin(vo);//新增
					
				
			}*/
			
		}
	}
	

	/*@Override
	public void deleteChickinBaseInfoById(String id) {
		if(StringUtils.isNotEmpty(id)){
			  //解密
				id = EncryptPkUtil.decodeId(id);
				this.chickinBaseInfoDao.deleteProjectById(id);
			}
		
	}
*/
	@Override
	public void deleteChickinById(String id) {
		if(StringUtils.isNotEmpty(id)){
			  //解密
				id = EncryptPkUtil.decodeId(id);
				this.chickinBaseInfoDao.deleteChickinById(id);
			}
		
	}

	@Override
	public void deleteChickinBaseInfoById(String id) {
		if(StringUtils.isNotEmpty(id)){
			  //解密
				id = EncryptPkUtil.decodeId(id);
				this.chickinBaseInfoDao.deleteChickinById(id);
			}
		
	}

	@Override
	public ChickinBaseInfoVo queryChickinBaseInfoInfoById(String id) {
		
		ChickinBaseInfoVo vo = new ChickinBaseInfoVo();
			if(StringUtils.isNotEmpty(id)){
				vo=this.chickinBaseInfoDao.queryChickinBaseInfoById(EncryptPkUtil.decodeId(id));
				vo.setId(EncryptPkUtil.encodeId(vo.getId()));
				vo.setCreateBy(EncryptPkUtil.encodeId(vo.getCreateBy()));
				
				
				//vo.setChickinTime(chickinTime);
				//vo.setChickinTypeStr(chickinTypeStr);
				//vo.setChickinReason(chickinReason);
			}
			return vo;
		
	
	}

	@Override
	public void saveInsertChickinBaseInfo(ChickinBaseInfoVo vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatechickinStatus(ChickinBaseInfoVo vo) {
		vo.setId(EncryptPkUtil.decodeId(vo.getId()));
		chickinBaseInfoDao.updateChickin(vo);
	}

	


	
}
