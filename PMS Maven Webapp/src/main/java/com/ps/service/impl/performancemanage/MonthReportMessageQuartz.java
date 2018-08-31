package com.ps.service.impl.performancemanage;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.projectmanage.ProjectManagerDao;
import com.ps.dao.systemmanage.CodeManagerDao;
import com.ps.dao.systemmanage.UserManagerDao;
import com.ps.dao.taskManage.TaskManagerDao;
import com.ps.result.projectmanage.ProjectVo;
import com.ps.result.systemmanage.CodeVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.result.taskmanage.TaskVo;
import com.ps.service.impl.common.BaseServiceImpl;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    月报定时任务处理类
 * @author:         ZHOUMIN
 * @date:           2018-03-14
 */
@Service
public class MonthReportMessageQuartz extends BaseServiceImpl{
	
	@Autowired
	private CodeManagerDao codeManagerDao;
	
	@Autowired
	private UserManagerDao userManagerDao;
	
	@Autowired
	private TaskManagerDao taskManagerDao;
	
	@Autowired
	private ProjectManagerDao projectManagerDao;
	
	/**
	 * 定时器执行任务，每月25号凌晨1点根据项目发送任务至实施负责人提示月报填写
	 */
	public void insertTask(){
		//根据基础数据配置获取发送人
		String senderBy="";
		List<CodeVo> senderList=this.codeManagerDao.getCodeInfoByType("timerSender");
		senderBy=senderList.get(0).getCodeZh();
		//根据工号获取发送人信息
		UserVo senderVo=this.userManagerDao.queryUserInfoByAccount(senderBy);
		//获取所有已审核项目信息
		List<ProjectVo> proList=this.projectManagerDao.getAllProjectInfo();
		TaskVo taskVo;
		for (ProjectVo projectVo : proList) {
			taskVo=new TaskVo();
			taskVo.setOriginator(senderVo.getId()); //任务发送人
			taskVo.setRecipient(projectVo.getExploitHead()); //任务接收人
			taskVo.setReqFinitionDate(DateUtil.getlastDay()); //要求完成日期
			taskVo.setEmergency(GlobalConstants.ZERO); //紧急情况
			taskVo.setTaskDesc(DateUtil.format(new Date(), "yyyy-MM")+"月报填写"); //任务描述
			taskVo.setSendStatus(GlobalConstants.ONE); //发送状态
			taskVo.setCreateBy(EncryptPkUtil.decodeId(senderVo.getId()));//录入创建人
			taskVo.setUpdateBy(EncryptPkUtil.decodeId(senderVo.getId()));//录入更新人
			taskManagerDao.insertTask(taskVo);
		}
		
	}
}
