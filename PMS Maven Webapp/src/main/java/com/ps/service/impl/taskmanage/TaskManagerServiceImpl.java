package com.ps.service.impl.taskmanage;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.taskManage.TaskManagerDao;
import com.ps.result.taskmanage.TaskVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.taskmanage.ITaskManagerService;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:    任务业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-03-15
 */
@Service
public class TaskManagerServiceImpl extends BaseServiceImpl implements ITaskManagerService{
	
	@Autowired
	private TaskManagerDao taskManagerDao;

	@Autowired
	private ICommonService commonService;
	
	@Override
	public List<TaskVo> queryTaskInfoByParam(TaskVo param) {
		List<TaskVo> dataList = this.taskManagerDao.queryTaskInfoByParam(param);
		for (TaskVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setRecipient(EncryptPkUtil.encodeId(vo.getRecipient()));
			vo.setOriginator(EncryptPkUtil.encodeId(vo.getOriginator()));
		}
		return dataList;
	}

	@Override
	public TaskVo queryTaskInfoById(String id) {
		String temId = id;
		TaskVo vo = new TaskVo();
		if(StringUtils.isNotEmpty(id)){
			id = EncryptPkUtil.decodeId(id);
			vo = this.taskManagerDao.queryTaskById(id);
			if(vo != null){
				//加密
				vo.setId(temId);
				vo.setOriginator(EncryptPkUtil.encodeId(vo.getOriginator()));
				vo.setRecipient(EncryptPkUtil.encodeId(vo.getRecipient()));
			}
		}
		return vo;
	}
	
	@Override
	public void saveTask(TaskVo vo){
		//解密
		vo.setOriginator(EncryptPkUtil.decodeId(vo.getOriginator()));
		vo.setRecipient(EncryptPkUtil.decodeId(vo.getRecipient()));
		if(StringUtils.isEmpty(vo.getId())){
			//录入创建人
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//发送状态
			vo.setSendStatus(GlobalConstants.ZERO);
			this.taskManagerDao.insertTask(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新
			this.taskManagerDao.updateTask(vo);
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R00501", vo.getId());
			}
		}
	}

	@Override
	public void deleteTaskById(String id){
		if(StringUtils.isNotEmpty(id)){
			//解密
			id = EncryptPkUtil.decodeId(id);
			this.taskManagerDao.updateStatusById(id);
		}
	}

	@Override
	public void updateSendStatus(String id,String sendStatus) {
		if(StringUtils.isNotEmpty(id)){
			String changeDetails="";
			//解密
			id = EncryptPkUtil.decodeId(id);
			if(GlobalConstants.ZERO.equals(sendStatus)){ //发送
				sendStatus=GlobalConstants.ONE;
				changeDetails="任务发送";
			}else if(GlobalConstants.ONE.equals(sendStatus)){ //退回
				sendStatus=GlobalConstants.ZERO;
				changeDetails="任务退回";
			}
			this.taskManagerDao.updateSendStatusById(id,sendStatus);
			//记录变更记录
			if(StringUtils.isNotBlank(changeDetails)){
				commonService.saveChangeRecode(changeDetails,"R00501",id);
			}
		}
	}

	@Override
	public List<TaskVo> queryMyTaskInfoByParam(TaskVo taskVo) {
		//录入当前登录人员
		taskVo.setRecipient(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		List<TaskVo> dataList = this.taskManagerDao.queryMyTaskInfoByParam(taskVo);
		for (TaskVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setRecipient(EncryptPkUtil.encodeId(vo.getRecipient()));
			vo.setOriginator(EncryptPkUtil.encodeId(vo.getOriginator()));
		}
		return dataList;
	}

	@Override
	public void saveMyTask(TaskVo vo) {
		//解密
		vo.setOriginator(EncryptPkUtil.decodeId(vo.getOriginator()));
		vo.setRecipient(EncryptPkUtil.decodeId(vo.getRecipient()));
		//解密
		vo.setId(EncryptPkUtil.decodeId(vo.getId()));
		//录入更新人
		vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		//更新
		this.taskManagerDao.updateMyTask(vo);
		//记录变更记录
		if(StringUtils.isNotBlank(vo.getChangeDetails())){
			commonService.saveChangeRecode(vo.getChangeDetails(),"R00501", vo.getId());
		}
	}
}
