package com.ps.service.impl.projectManage;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
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
import com.ps.dao.projectmanage.ProjectBaseInfoDao;
import com.ps.result.commentmanage.CommentVO;
import com.ps.result.projectmanage.CostReportVo;
import com.ps.result.projectmanage.ProjectBaseInfoVo;
import com.ps.result.taskmanage.WorkhoursRecordVo;
import com.ps.service.commentmanage.ICommentService;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.projectmanage.IProjectBaseInfoService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;
import com.util.tool.MessageUtil;

/**
 * @Description:    项目维护业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-07-02
 */
@Service
public class ProjectBaseInfoServiceImpl extends BaseServiceImpl implements IProjectBaseInfoService{
	
	private static final Logger logger = Logger.getLogger(ProjectBaseInfoServiceImpl.class);
	
	@Autowired
	private ProjectBaseInfoDao projectBaseInfoDao;

	@Autowired
	private ICommonService commonService;
	
	@Autowired
	private ICommentService commentService;
	
	@Override
	public List<ProjectBaseInfoVo> queryProjectBaseInfoInfoByParam(ProjectBaseInfoVo param) {
		List<ProjectBaseInfoVo> dataList =this.projectBaseInfoDao.queryProjectBaseInfoInfoByParam(param);
		for (ProjectBaseInfoVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public ProjectBaseInfoVo queryProjectBaseInfoInfoById(String id) {
		ProjectBaseInfoVo vo = new ProjectBaseInfoVo();
		if(StringUtils.isNotEmpty(id)){
			vo=this.projectBaseInfoDao.queryProjectBaseInfoById(EncryptPkUtil.decodeId(id));
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setChangeList(this.commonService.queryChangeRecordByUserId("R004_0601",vo.getId()));
			CommentVO commentVo =new CommentVO();
			commentVo.setDataId(EncryptPkUtil.decodeId(vo.getId()));
			commentVo.setFunctionNo(GlobalConstants.CATEGORYTYPE_R00407);
			vo.setCommentUserList(this.commentService.queryCommentUserList(commentVo));
		}
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setCurrentTime(DateUtil.today());
		vo.setLoginUserPic(this.getLoginUser().getUserPic());
		vo.setLoginUserId(this.getLoginUser().getId());
		vo.setFunctionCode(GlobalConstants.CATEGORYTYPE_R00406);
		return vo;
	}
	
	@Override
	public void saveProjectBaseInfo(ProjectBaseInfoVo vo){
		//计算项目超期日期
		if(StringUtils.equals(vo.getProjectStatus(),GlobalConstants.ZERO)){
			vo.setExpirationDate(GlobalConstants.ZERO);
		}else{
			vo.setExpirationDate(String.valueOf(DateUtil.daysBetween(DateUtil.parse(vo.getEndTime(),"yyyy-MM-dd"),
				DateUtil.parse(DateUtil.today(),"yyyy-MM-dd"))));
		}
		if(StringUtils.isEmpty(vo.getId())){
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//新增
			vo.setBelongCustomId(EncryptPkUtil.decodeId(vo.getBelongCustomId()));
			this.projectBaseInfoDao.insertProjectBaseInfo(vo);
		}else{
			//修改
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			vo.setBelongCustomId(EncryptPkUtil.decodeId(vo.getBelongCustomId()));
			this.projectBaseInfoDao.updateProjectBaseInfo(vo);
			
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R004_01_OPERATION_EDIT", vo.getId());
			}
		}
	}

	@Override
	public void deleteProjectBaseInfoById(String id){
		if(StringUtils.isNotEmpty(id)){
		  this.projectBaseInfoDao.deleteProjectBaseInfoById(EncryptPkUtil.decodeId(id));
		}
	}

	@Override
	public List<CostReportVo> queryCostReprotByParam(CostReportVo param) {
		List<CostReportVo> costReportVoList=this.projectBaseInfoDao.queryCostReprotByParam(param);
		return costReportVoList;
	}

	@Override
	public List<WorkhoursRecordVo> queryCostDetailByParam(
			WorkhoursRecordVo param) {
		List<WorkhoursRecordVo> workhoursRecordVos=this.projectBaseInfoDao.queryCostDetailByParam(param);
		return workhoursRecordVos;
	}

	@Override
	public List<String> importTitleFile(List<Map<Integer, Collection<?>>> dataList) {
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
				for (int j=1;j<=15;j++) {
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
						case 2:  //归属事业
							if((GlobalConstants.ZERO.equals(dateStr) || GlobalConstants.ONE.equals(dateStr) )){
								projectBaseInfoVo.setToDivision(dateStr);
							}else{
								msgList.add(MessageUtil.getMessage("lable.titleimport.typeNumError", args));
								bool = false; 
							}
							break;
						case 3:	//工期开始时间
							if(validValueIsEmpty(dateStr,args,msgList) && isValidDate(dateStr,args,msgList) ){
								projectBaseInfoVo.setBeginTime(dateStr);
							}else{
								bool = false;
							}
							break;
						case 4://工期结束时间
							if(validValueIsEmpty(dateStr,args,msgList) && isValidDate(dateStr,args,msgList) ){
								projectBaseInfoVo.setEndTime(dateStr);
							}else{
								bool = false;
							}
							break;
						case 5:
							//项目负责人
							if(validValueIsEmpty(dateStr,args,msgList)){
								String userIds = projectBaseInfoDao.getUserIdByUserName(dateStr);
								projectBaseInfoVo.setProjectHead(userIds);
							}else{
								bool = false;
							}
							break;
						case 6:
							//项目经理
							if(validValueIsEmpty(dateStr,args,msgList)){
								String userIds = projectBaseInfoDao.getUserIdByUserName(dateStr);
								projectBaseInfoVo.setProjectManager(userIds);
							}else{
								bool = false;
							}
							break;
						case 7:
							//商务人员
							if(validValueIsEmpty(dateStr,args,msgList)){
								String userIds = projectBaseInfoDao.getUserIdByUserName(dateStr);
								projectBaseInfoVo.setBusinessPeople(userIds);
							}else{
								bool = false;
							}
							break;
						case 8:
							//项目资源
							if(validValueIsEmpty(dateStr,args,msgList)){
								String userIds = projectBaseInfoDao.getUserIdByUserName(dateStr);
								projectBaseInfoVo.setProjectResource(userIds);
							}else{
								bool = false;
							}
							break;
						case 9:
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
						case 10://已耗工时
							Matcher m1 = p.matcher(dateStr);
							if(m1.find() || StringUtils.isBlank(dateStr)){
								projectBaseInfoVo.setExpiredHours(dateStr);
							}else{
								msgList.add(MessageUtil.getMessage("lable.titleimport.numError", args));
								bool = false; 
							}
							break;
						case 11://利润率指标
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
						case 12://项目阶段
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
						case 13://项目状态
							if((GlobalConstants.ZERO.equals(dateStr) || GlobalConstants.ONE.equals(dateStr) )){
								projectBaseInfoVo.setProjectStatus(dateStr);
							}else{
								msgList.add(MessageUtil.getMessage("lable.titleimport.typeNumError", args));
								bool = false; 
							}
							break;
						case 14://超期时间
							break;
						case 15://人天成本
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
						case 16://合同金额
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
					this.saveProjectBaseInfo(projectBaseInfoVo2);
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
	public List<ProjectBaseInfoVo> getAllRecordProjectInfo() {
		List<ProjectBaseInfoVo> dataList = this.projectBaseInfoDao.getAllRecordProjectInfo();
		//加密
		for (ProjectBaseInfoVo proVo : dataList) {
			proVo.setId(EncryptPkUtil.encodeId(proVo.getId()));
		}
		return dataList;
	}

	@Override
	public void updateProjectBaseInfoStatus(ProjectBaseInfoVo projectBaseInfoVo) {
		if(StringUtils.isNotEmpty(projectBaseInfoVo.getId())){
			projectBaseInfoVo.setId(EncryptPkUtil.decodeId(projectBaseInfoVo.getId()));
			//新增
			this.projectBaseInfoDao.updateProjectBaseInfoStatus(projectBaseInfoVo);
		}
	}
}
