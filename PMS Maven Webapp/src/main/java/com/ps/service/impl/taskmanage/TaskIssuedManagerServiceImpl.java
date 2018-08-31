package com.ps.service.impl.taskmanage;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.taskManage.TaskIssuedManagerDao;
import com.ps.result.commentmanage.CommentVO;
import com.ps.result.systemmanage.DeptVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.result.taskmanage.TaskIssuedVo;
import com.ps.service.commentmanage.ICommentService;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.taskmanage.ITaskIssuedManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    任务控制台业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-08-01
 */
@Service
public class TaskIssuedManagerServiceImpl extends BaseServiceImpl implements ITaskIssuedManagerService{
	
	@Autowired
	private TaskIssuedManagerDao taskIssuedManagerDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Autowired
	private ICommentService commentService;

	@Override
	public List<DeptVo> loadDeptUserTree(DeptVo deptVo) {
		List<DeptVo> list=this.taskIssuedManagerDao.queryDeptUserTree(deptVo);
		return list;
	}

	@Override
	public TaskIssuedVo queryTaskIssuedById(TaskIssuedVo taskIssuedVo) {
		TaskIssuedVo vo=new TaskIssuedVo();
		if(StringUtils.isNotBlank(taskIssuedVo.getId())){
			vo=this.taskIssuedManagerDao.queryTaskIssuedById(taskIssuedVo.getId());
			vo.setChangeList(this.commonService.queryChangeRecordByUserId(GlobalConstants.CATEGORYTYPE_R00702,
					EncryptPkUtil.encodeId(vo.getId())));
			CommentVO commentVo =new CommentVO();
			commentVo.setDataId(EncryptPkUtil.decodeId(vo.getId()));
			commentVo.setFunctionNo(GlobalConstants.CATEGORYTYPE_R00702);
			vo.setCommentUserList(this.commentService.queryCommentUserList(commentVo));
		}else{
			vo.setResponsible(taskIssuedVo.getResponsible());
			//新增时默认状态为新建
			vo.setStatus(GlobalConstants.ONE);
			//默认开始结束时间为当前选中时间
			vo.setTaskBeginDate(DateUtil.format(DateUtil.parse(taskIssuedVo.getTaskBeginDate()), "yyyy-MM-dd"));
			vo.setTaskEndDate(DateUtil.format(DateUtil.parse(taskIssuedVo.getTaskBeginDate()), "yyyy-MM-dd"));
			//默认工时为8小时
			vo.setExpectedTime(GlobalConstants.EIGHT);
			//默认任务类型为研发
			vo.setTasktype(GlobalConstants.ONE);
			//默认优先级为普通
			vo.setPriority(GlobalConstants.TWO);
		}
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setCurrentTime(DateUtil.today());
		vo.setLoginUserPic(this.getLoginUser().getUserPic());
		vo.setLoginUserId(this.getLoginUser().getId());
		vo.setFunctionCode(GlobalConstants.CATEGORYTYPE_R00702);
		return vo;
	}

	@Override
	public void saveTaskIssued(TaskIssuedVo vo) {
		if(StringUtils.isNotBlank(vo.getId())){
			//修改
			this.taskIssuedManagerDao.updateTaskIssued(vo);
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),GlobalConstants.CATEGORYTYPE_R00702, vo.getId());
			}
		}else{
			//录入创建人
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			if(vo.getResponsible().contains("U")){ //当层级为用户时
				vo.setResponsible(vo.getResponsible().replace("U",""));
				//新增
				this.taskIssuedManagerDao.insertTaskIssued(vo);
			}else if(vo.getResponsible().contains("D")){ //当层级为部门时
				String deptId=vo.getResponsible().replace("D","");
				String deptIds=vo.getDeptStrByDeptId(deptId);
				//根据部门ID查询用户信息
				List<UserVo> userList=this.taskIssuedManagerDao.queryUserByDeptIds(deptIds);
				for (UserVo userVo : userList) {
					vo.setResponsible(userVo.getId());
					//新增
					this.taskIssuedManagerDao.insertTaskIssued(vo);
				}
			}
			
		}
	}

	@Override
	public List<TaskIssuedVo> queryTaskIssendByDpetOrUser(String selectId,String taskStatus) {
		List<TaskIssuedVo> dataList=new ArrayList<TaskIssuedVo>();
		TaskIssuedVo taskIssuedVo=new TaskIssuedVo();
		if(StringUtils.isNotBlank(selectId)){
			//根据前缀查看是用户还是部门
			if(selectId.contains("D")){//部门
				selectId=selectId.replace("D","");
				//所有该部门及其子部门
				String deptIds=taskIssuedVo.getDeptStrByDeptId(selectId);
				//根据部门ID加载所有任务信息
				dataList=this.taskIssuedManagerDao.queryTaskIssendByDeptId(deptIds,taskStatus);
			}else if(selectId.contains("U")){//用户
				String userId=selectId.replace("U","");
				//根据用户ID加载所有任务信息
				dataList=this.taskIssuedManagerDao.queryTaskIssendByUserId(userId,taskStatus);
			}
		}
		if(dataList!=null && dataList.size()>0){
			for (TaskIssuedVo vo : dataList) {
				if(StringUtils.equals(vo.getStatus(), GlobalConstants.ONE)){ //新建
					vo.setBackgroundColor("red");
				}else if(StringUtils.equals(vo.getStatus(), GlobalConstants.TWO)){
					vo.setBackgroundColor("blue");
				}else if(StringUtils.equals(vo.getStatus(), GlobalConstants.THREE)){
					vo.setBackgroundColor("#36c6d3");
				}
			}
		}
		return dataList;
	}

	@Override
	public void updateTaskIssuedDateOne(String selectId, String dayDelta) {
		//判断移动时间不为0
		if(!StringUtils.equals(dayDelta, GlobalConstants.ZERO)){
			TaskIssuedVo taskIssuedVo=this.taskIssuedManagerDao.queryTaskIssuedById(selectId);
			int day=Integer.valueOf(dayDelta);
			//根据移动天数修改开始结束时间
			taskIssuedVo.setTaskBeginDate(DateUtil.plusDay(day, taskIssuedVo.getTaskBeginDate()));
			taskIssuedVo.setTaskEndDate(DateUtil.plusDay(day, taskIssuedVo.getTaskEndDate()));
			this.taskIssuedManagerDao.updateTaskIssued(taskIssuedVo);
		}
		
	}
	
	@Override
	public void updateTaskIssuedDateTwo(String selectId, String dayDelta) {
		//判断移动时间不为0
		if(!StringUtils.equals(dayDelta, GlobalConstants.ZERO)){
			TaskIssuedVo taskIssuedVo=this.taskIssuedManagerDao.queryTaskIssuedById(selectId);
			int day=Integer.valueOf(dayDelta);
			//根据移动天数修改开始结束时间
			taskIssuedVo.setTaskEndDate(DateUtil.plusDay(day, taskIssuedVo.getTaskEndDate()));
			this.taskIssuedManagerDao.updateTaskIssued(taskIssuedVo);
		}
		
	}

	@Override
	public void deleteTaskIssuedById(String id) {
		if(StringUtils.isNotBlank(id)){
			this.taskIssuedManagerDao.deleteTaskIssuedById(id);
		}
	}

	@Override
	public List<TaskIssuedVo> queryMyTask(String taskStatus) {
		String userId=EncryptPkUtil.decodeId(this.getLoginUser().getId());
		List<TaskIssuedVo> dataList=this.taskIssuedManagerDao.queryTaskIssendByUserId(userId,taskStatus);
		if(dataList!=null && dataList.size()>0){
			for (TaskIssuedVo vo : dataList) {
				if(StringUtils.equals(vo.getStatus(), GlobalConstants.ONE)){ //新建
					vo.setBackgroundColor("red");
				}else if(StringUtils.equals(vo.getStatus(), GlobalConstants.TWO)){
					vo.setBackgroundColor("blue");
				}else if(StringUtils.equals(vo.getStatus(), GlobalConstants.THREE)){
					vo.setBackgroundColor("#36c6d3");
				}
			}
		}
		return dataList;
	}
	
	@Override
	public TaskIssuedVo queryMyTaskById(String taskId) {
		TaskIssuedVo vo=new TaskIssuedVo();
		if(StringUtils.isNotBlank(taskId)){
			vo=this.taskIssuedManagerDao.queryTaskIssuedById(taskId);
			vo.setChangeList(this.commonService.queryChangeRecordByUserId(GlobalConstants.CATEGORYTYPE_R00703,EncryptPkUtil.encodeId(vo.getId())));
			CommentVO commentVo =new CommentVO();
			commentVo.setDataId(EncryptPkUtil.decodeId(vo.getId()));
			commentVo.setFunctionNo(GlobalConstants.CATEGORYTYPE_R00703);
			vo.setCommentUserList(this.commentService.queryCommentUserList(commentVo));
		}
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setCurrentTime(DateUtil.today());
		vo.setLoginUserPic(this.getLoginUser().getUserPic());
		vo.setLoginUserId(this.getLoginUser().getId());
		vo.setFunctionCode(GlobalConstants.CATEGORYTYPE_R00703);
		return vo;
	}

	@Override
	public void saveMyTask(TaskIssuedVo vo) {
		if(StringUtils.isNotBlank(vo.getId())){
			this.taskIssuedManagerDao.updateMyTask(vo);
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),GlobalConstants.CATEGORYTYPE_R00703, vo.getId());
			}
		}
	}
}
