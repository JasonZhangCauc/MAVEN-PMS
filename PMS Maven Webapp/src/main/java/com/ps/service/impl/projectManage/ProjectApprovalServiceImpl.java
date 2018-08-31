package com.ps.service.impl.projectManage;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.projectmanage.ProjectApprovalDao;
import com.ps.dao.projectmanage.ProjectMoniInfoDao;
import com.ps.result.commentmanage.CommentVO;
import com.ps.result.projectmanage.ProjectBaseInfoVo;
import com.ps.result.projectmanage.ProjectMoniInfoVo;
import com.ps.service.commentmanage.ICommentService;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.projectmanage.IProjectApprovalService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;
import com.util.tool.MessageUtil;

/**
 * @Description:    项目维护业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-07-02
 */
@Service
public class ProjectApprovalServiceImpl extends BaseServiceImpl implements IProjectApprovalService{
	
	private static final Logger logger = Logger.getLogger(ProjectBaseInfoServiceImpl.class);
	
	@Autowired
	private ProjectApprovalDao projectApprovalDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Autowired
	private ICommentService commentService;
	
	@Autowired
	private ProjectMoniInfoDao projectMoniInfoDao;

	@Override
	public List<ProjectBaseInfoVo> queryProjectApprovalByParam(
			ProjectBaseInfoVo param) {
		List<ProjectBaseInfoVo> dataList =this.projectApprovalDao.queryProjectApprovalByParam(param);
		for (ProjectBaseInfoVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setLoginUserId(EncryptPkUtil.decodeId(this.getLoginUser().getId()));//解码
		}
		return dataList;
	}

	@Override
	public ProjectBaseInfoVo queryProjectApprovalfoById(String id) {
		ProjectBaseInfoVo vo = new ProjectBaseInfoVo();
		if(StringUtils.isNotEmpty(id)){
			vo=this.projectApprovalDao.queryProjectApprovalfoById(EncryptPkUtil.decodeId(id));
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setChangeList(this.commonService.queryChangeRecordByUserId("R004_0601",vo.getId()));
			CommentVO commentVo =new CommentVO();
			commentVo.setDataId(EncryptPkUtil.decodeId(vo.getId()));
			commentVo.setFunctionNo(GlobalConstants.CATEGORYTYPE_R00407);
			vo.setBelongCustomId(EncryptPkUtil.encodeId(vo.getBelongCustomId()));
			vo.setCommentUserList(this.commentService.queryCommentUserList(commentVo));
		}
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setCurrentTime(DateUtil.today());
		vo.setLoginUserPic(this.getLoginUser().getUserPic());
		vo.setLoginUserId(this.getLoginUser().getId());
		vo.setFunctionCode(GlobalConstants.CATEGORYTYPE_R00401);
		return vo;
	}

	@Override
	public void deleteProjectApproval(String id) {
		if(StringUtils.isNotEmpty(id)){
		  this.projectApprovalDao.deleteProjectApproval(EncryptPkUtil.decodeId(id));
		}
	}

	@Override
	public void updateProjectApprovalStatus(ProjectBaseInfoVo projectBaseInfoVo) {
		if(StringUtils.isNotEmpty(projectBaseInfoVo.getId())){
			projectBaseInfoVo.setId(EncryptPkUtil.decodeId(projectBaseInfoVo.getId()));
			//新增
			this.projectApprovalDao.updateProjectApprovalStatus(projectBaseInfoVo);
			
			//审批通过添加监控信息
			saveProjectMoniInof(projectBaseInfoVo);
			
		}
	}
	
	//审核通过添加监控信息
	public void saveProjectMoniInof(ProjectBaseInfoVo projectBaseInfoVo){
		//审批通过添加监控信息
		ProjectMoniInfoVo moinObj1 = new ProjectMoniInfoVo();
		moinObj1.setMoniTitle(GlobalConstants.PROJECT);//标题
		moinObj1.setMoniStatus(GlobalConstants.ZERO);//未开始
		moinObj1.setProjectBaseinfoId(projectBaseInfoVo.getId());//项目关联id
		projectMoniInfoDao.insertProjectMoniInfo(moinObj1);
		
		ProjectMoniInfoVo moinObj2 = new ProjectMoniInfoVo();
		moinObj2.setMoniTitle(GlobalConstants.DEMAND_FOR_HARD);//需求用例评审
		moinObj2.setMoniStatus(GlobalConstants.ZERO);//未开始
		moinObj2.setProjectBaseinfoId(projectBaseInfoVo.getId());//项目关联id
		projectMoniInfoDao.insertProjectMoniInfo(moinObj2);
		
		ProjectMoniInfoVo moinObj3 = new ProjectMoniInfoVo();
		moinObj3.setMoniTitle(GlobalConstants.DESIGN);//设计
		moinObj3.setMoniStatus(GlobalConstants.ZERO);//未开始
		moinObj3.setProjectBaseinfoId(projectBaseInfoVo.getId());//项目关联id
		projectMoniInfoDao.insertProjectMoniInfo(moinObj3);
		
		ProjectMoniInfoVo moinObj4 = new ProjectMoniInfoVo();
		moinObj4.setMoniTitle(GlobalConstants.IMPLEMENTATION);//实现
		moinObj4.setMoniStatus(GlobalConstants.ZERO);//未开始
		moinObj4.setProjectBaseinfoId(projectBaseInfoVo.getId());//项目关联id
		projectMoniInfoDao.insertProjectMoniInfo(moinObj4);
		
		ProjectMoniInfoVo moinObj5 = new ProjectMoniInfoVo();
		moinObj5.setMoniTitle(GlobalConstants.TEST);//测试
		moinObj5.setMoniStatus(GlobalConstants.ZERO);//未开始
		moinObj5.setProjectBaseinfoId(projectBaseInfoVo.getId());//项目关联id
		projectMoniInfoDao.insertProjectMoniInfo(moinObj5);
		
		ProjectMoniInfoVo moinObj6 = new ProjectMoniInfoVo();
		moinObj6.setMoniTitle(GlobalConstants.UATVALIDATION);//UAT验证
		moinObj6.setMoniStatus(GlobalConstants.ZERO);//未开始
		moinObj6.setProjectBaseinfoId(projectBaseInfoVo.getId());//项目关联id
		projectMoniInfoDao.insertProjectMoniInfo(moinObj6);
		
		ProjectMoniInfoVo moinObj7 = new ProjectMoniInfoVo();
		moinObj7.setMoniTitle(GlobalConstants.ONLINE);//UAT上线
		moinObj7.setMoniStatus(GlobalConstants.ZERO);//未开始
		moinObj7.setProjectBaseinfoId(projectBaseInfoVo.getId());//项目关联id
		projectMoniInfoDao.insertProjectMoniInfo(moinObj7);
		
		ProjectMoniInfoVo moinObj8 = new ProjectMoniInfoVo();
		moinObj8.setMoniTitle(GlobalConstants.ACCEPTANCE);//验证
		moinObj8.setMoniStatus(GlobalConstants.ZERO);//未开始
		moinObj8.setProjectBaseinfoId(projectBaseInfoVo.getId());//项目关联id
		projectMoniInfoDao.insertProjectMoniInfo(moinObj8);
	}

	@Override
	public List<String> importTitleFile(
			List<Map<Integer, Collection<?>>> dataList) {
		//提示消息列表
		List<String> msgList = new ArrayList<String>();
		try {
			boolean bool = true; //判断校验是否通过
			Map<Integer, Collection<?>> data = new HashMap<Integer, Collection<?>>();
			String[] args = {"","",""};//返回消息  行 列  字段长度
			if(dataList != null && dataList.size() > 0){
				data = dataList.get(0);
			}
			List<ProjectBaseInfoVo> projectBaseInfoVos=new ArrayList<ProjectBaseInfoVo>();
			//正整数正则表达式
			String rex = "^[+]{0,1}(\\d+)$|^[+]{0,1}(\\d+\\.\\d+)$";
			Pattern p = Pattern.compile(rex);
			//未读取到内容，显示导入出错
			if(dataList.size() <= 0)
			   msgList.add(MessageUtil.getMessage("exception.error.importError", args));
			for (int i = 1;i<= data.size();i++) {
				ProjectBaseInfoVo projectBaseInfoVo=new ProjectBaseInfoVo();
				Collection<?> rowData = data.get(i);
				//第i+1行
				args[0] = String.valueOf(i+1);
				if(rowData == null){
					//第n行没有数据
					logger.error(MessageUtil.getMessage("lable.titleimport.noData"));
					continue;
				}
				Object dataArr[] = ((List<?>) rowData).toArray();
				
				//循环列
				for (int j=1;j<=10;j++) {
					String dateStr= dataArr[j-1].toString();
					args[1]=String.valueOf(j);
					switch (j) {
						case 1:  //项目名称
							if(validValueIsEmpty(dateStr,args,msgList) && validValueStr(dateStr,50,args,msgList)){
								projectBaseInfoVo.setProjectName(dateStr);
							}else{
								bool = false;
							}
							break;
						case 2:	//工期开始时间
							if(validValueIsEmpty(dateStr,args,msgList) && isValidDate(dateStr,args,msgList) ){
								projectBaseInfoVo.setBeginTime(dateStr);
							}else{
								bool = false;
							}
							break;
						case 3://工期结束时间
							if(validValueIsEmpty(dateStr,args,msgList) && isValidDate(dateStr,args,msgList) ){
								projectBaseInfoVo.setEndTime(dateStr);
							}else{
								bool = false;
							}
							break;
						case 4:
							//预估工作量
							Matcher m = p.matcher(dateStr);
							if(validValueIsEmpty(dateStr,args,msgList)){
								if(m.find()){
									projectBaseInfoVo.setEstimatedWorkload(dateStr);
								}else{
									msgList.add(MessageUtil.getMessage("lable.titleimport.numError", args));
									bool = false; 
								}
							}else{
								bool = false;
							}
							break;
						case 5://已耗工时
							Matcher m1 = p.matcher(dateStr);
							if(m1.find() || StringUtils.isBlank(dateStr)){
								projectBaseInfoVo.setExpiredHours(dateStr);
							}else{
								msgList.add(MessageUtil.getMessage("lable.titleimport.numError", args));
								bool = false; 
							}
							break;
						case 6://利润率指标
							Matcher m2 = p.matcher(dateStr);
							if(validValueIsEmpty(dateStr,args,msgList)){
								if(m2.find()){
									projectBaseInfoVo.setProfitTargets(dateStr);
								}else{
									msgList.add(MessageUtil.getMessage("lable.titleimport.numError", args));
									bool = false; 
								}
							}else{
								bool = false;
							}
							break;
						case 7://项目阶段
							if(validValueIsEmpty(dateStr,args,msgList)){
								if((GlobalConstants.ZERO.equals(dateStr) || GlobalConstants.ONE.equals(dateStr) )){
									projectBaseInfoVo.setProjectPhase(dateStr);
								}else{
									msgList.add(MessageUtil.getMessage("lable.titleimport.typeNumError", args));
									bool = false; 
								}
							}else{
								bool = false;
							}
							break;
						case 8://项目状态
							if((GlobalConstants.ZERO.equals(dateStr) || GlobalConstants.ONE.equals(dateStr) )){
								projectBaseInfoVo.setProjectStatus(dateStr);
							}else{
								msgList.add(MessageUtil.getMessage("lable.titleimport.typeNumError", args));
								bool = false; 
							}
							break;
						case 9://人天成本
							Matcher m3 = p.matcher(dateStr);
							if(validValueIsEmpty(dateStr,args,msgList)){
								if(m3.find()){
									projectBaseInfoVo.setNaturallyCost(dateStr);
								}else{
									msgList.add(MessageUtil.getMessage("lable.titleimport.numError", args));
									bool = false; 
								}
							}else{
								bool = false;
							}
							break;
						case 10://合同金额
							Matcher m4 = p.matcher(dateStr);
							if(validValueIsEmpty(dateStr,args,msgList)){
								if(m4.find()){
									projectBaseInfoVo.setContractAmount(dateStr);
								}else{
									msgList.add(MessageUtil.getMessage("lable.titleimport.numError", args));
									bool = false; 
								}
							}else{
								bool = false;
							}
							break;
					}
				}
				projectBaseInfoVos.add(projectBaseInfoVo);
			}
			//判断是否验证通过
			if(bool){
				for (ProjectBaseInfoVo projectBaseInfoVo2 : projectBaseInfoVos) {
					projectBaseInfoVo2.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
					//新增
					this.saveProjectApproval(projectBaseInfoVo2);
				}
			}
			
		} catch (Exception e) {
			if(e instanceof FileUploadException){
				logger.error("错误信息为：FileUploadException"+e,e);
			}else if(e instanceof IOException){
				logger.error("错误信息为：IOException"+e,e);
			}else{
				logger.error("错误信息为：其他错误"+e,e);
			}
		}
		return msgList;
	}
	
	//验证数据空值判断
	private boolean validValueIsEmpty(Object str,String args[],List<String> infoList){
		if(str == null || "".equals(str.toString())){
			infoList.add(MessageUtil.getMessage("lable.titleimport.mustInput",args));//字段不能为空
			return false;
		}else{
			return true;
		}
	}
	
	//验证数据长度是否超长
	private boolean validValueStr(String str,int length,String args[],List<String> infoList){
		if(str.length()>length){
			args[2]=length+"";
			infoList.add(MessageUtil.getMessage("lable.titleimport.tooLong",args));//字段太长
			return false;
		}else{
			return true;
		}
	}
	private static boolean isValidDate(String str,String args[],List<String> infoList) {
		boolean convertSuccess=true;
		// 指定日期格式为四位年/两位月份/两位日期，注意yyyy/MM/dd区分大小写；
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			// 设置lenient为false. 否则SimpleDateFormat会比较宽松地验证日期，比如2007/02/29会被接受，并转换成2007/03/01
			format.setLenient(true);
			format.parse(str);
		} catch (Exception e) {
			// e.printStackTrace();
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			convertSuccess=false;
			infoList.add(MessageUtil.getMessage("lable.titleimport.dateError",args));//字段不能为空
		} 
		return convertSuccess;
	}
	
	@Override
	public void saveProjectApproval(ProjectBaseInfoVo vo){
		//计算项目超期日期
		if(StringUtils.equals(vo.getProjectStatus(),GlobalConstants.ZERO)){
			vo.setExpirationDate(GlobalConstants.ZERO);
		}else{
			vo.setExpirationDate(String.valueOf(DateUtil.daysBetween(DateUtil.parse(vo.getEndTime(),"yyyy-MM-dd"),
				DateUtil.parse(DateUtil.today(),"yyyy-MM-dd"))));
		}
		try {
			if(StringUtils.isEmpty(vo.getId())){
				vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//新增
				vo.setBelongCustomId(EncryptPkUtil.decodeId(vo.getBelongCustomId()));
				//计算超期时间
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
				String today = sdf.format(new Date());
				int res=vo.getEndTime().compareTo(today);
				if(res<0){//实际完成时间大于要求完成时间
					int day = daysBetween(vo.getEndTime(), today);
					if(day>0){
						vo.setExpirationDate(day+"");//超期天数
					}
				}
				this.projectApprovalDao.insertProjectApproval(vo);
			}else{
				//修改
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				vo.setBelongCustomId(EncryptPkUtil.decodeId(vo.getBelongCustomId()));
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
				String today = sdf.format(new Date());
				int res=vo.getEndTime().compareTo(today);
				if(res<0){//实际完成时间大于要求完成时间
					int day = daysBetween(vo.getEndTime(), today);
					if(day>0){
						vo.setExpirationDate(day+"");//超期
					}
				}
				this.projectApprovalDao.updateProjectApproval(vo);
				
				//记录变更记录
				if(StringUtils.isNotBlank(vo.getChangeDetails())){
					commonService.saveChangeRecode(vo.getChangeDetails(),"R004_01_OPERATION_AUTH", vo.getId());
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
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
