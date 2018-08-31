package com.ps.controller.taskmanage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.GlobalConstants;
import com.aop.log.OperateLog;
import com.ps.controller.common.BaseController;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.systemmanage.DeptVo;
import com.ps.result.taskmanage.TaskIssuedVo;
import com.ps.service.taskmanage.ITaskIssuedManagerService;

/**
 * 任务控制台controller
 * @author wb066
 * @data 2018-08-01
 */
@Controller
@RequestMapping(value="/taskManage")
public class TaskIssuedController extends BaseController{
	
	@Autowired
	private ITaskIssuedManagerService taskIssuedManagerService;
	
	//返回页面路径 
	private static final String TASK_ISSUED_MANAGER_MAIN = "taskManage/taskIssuedManagerMain/taskIssuedManagerMain";//任务下发主页面
	
	private static final String TASK_ISSUED_MANAGER_EDIT = "taskManage/taskIssuedManagerMain/taskIssuedManagerEdit";//任务下发编辑页面
	
	private static final String MY_TASK_MAIN="taskManage/myTaskManager/myTaskMain";//我的任务主页
	
	private static final String MY_TASK_EDIT="taskManage/myTaskManager/myTaskEdit";//我的任务编辑界面
	
	/**
	 * @Description: 进入任务控制台主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-08-01
	 */
	@OperateLog(remark="进入任务控制台主页",cateGory=GlobalConstants.CATEGORY_R00702,cateGoryType=GlobalConstants.CATEGORYTYPE_R00702,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/taskConsoleMain",method=RequestMethod.GET)
	public String TaskIssuedManagerMain(HttpServletRequest request,HttpServletResponse response){
		// 获得第一个任务
		return TASK_ISSUED_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 加载组织架构人员信息树
	 * @param  request
	 * @return List<ResourceVo>
	 * @author ZHOUMIN
	 * @date:  2016年11月1日
	 */
	@RequestMapping(value = "/loadDeptUserTree", method = RequestMethod.POST)
	@ResponseBody
	public List<DeptVo> loadDeptUserTree(HttpServletRequest request, HttpServletResponse response,DeptVo deptVo) {
		//数据权限
		deptVo.initDataAuthByCode(request, "R007_02_DATA");
		List<DeptVo> orgData =this.taskIssuedManagerService.loadDeptUserTree(deptVo);
		return orgData;
	}
	
	/**
	 * @Description: 新增/编辑任务窗口
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2017年4月15日
	 */
	@OperateLog(remark="新增/编辑任务窗口",cateGory=GlobalConstants.CATEGORY_R00702,cateGoryType=GlobalConstants.CATEGORYTYPE_R00702,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/taskConsoleEdit",method=RequestMethod.GET)
	public String taskIssuedManagerEdit(HttpServletRequest request,HttpServletResponse response,TaskIssuedVo taskIssuedVo){
		TaskIssuedVo vo=this.taskIssuedManagerService.queryTaskIssuedById(taskIssuedVo);
		request.setAttribute("vo", vo);
		return TASK_ISSUED_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 保存任务下发信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户表
	 * @return:      返回消息
	 * @date:        2018年3月15日
	 */
	@OperateLog(remark="保存任务下发信息",cateGory=GlobalConstants.CATEGORY_R00702,cateGoryType=GlobalConstants.CATEGORYTYPE_R00702,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveTaskIssued",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveTaskIssued(HttpServletRequest request,HttpServletResponse response,TaskIssuedVo vo){
		this.taskIssuedManagerService.saveTaskIssued(vo);
		return returnOperateData(null, vo);
	}
	
	
	/**
	 * @Description: 根据用户id或部门ID加载任务信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户表
	 * @return:      返回消息
	 * @date:        2018年3月15日
	 */
	@OperateLog(remark="根据用户id或部门ID加载任务信息",cateGory=GlobalConstants.CATEGORY_R00702,cateGoryType=GlobalConstants.CATEGORYTYPE_R00702,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/queryTaskIssendByDpetOrUser", method = RequestMethod.POST)
	@ResponseBody
	public List<TaskIssuedVo> queryTaskIssendByDpetOrUser(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("selectId") String selectId,@RequestParam("taskStatus") String taskStatus){
		List<TaskIssuedVo> dataList=this.taskIssuedManagerService.queryTaskIssendByDpetOrUser(selectId,taskStatus);
		return dataList;
	}
	
	/**
	 * @Description: 任务时间变更(月)
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      返回消息
	 * @date:        2017年4月15日
	 */
	@OperateLog(remark="任务时间变更",cateGory=GlobalConstants.CATEGORY_R00702,cateGoryType=GlobalConstants.CATEGORYTYPE_R00702,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/updateTaskIssuedDateOne",method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateTaskIssuedDateOne(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("selectId") String selectId,@RequestParam("dayDelta") String dayDelta){
		this.taskIssuedManagerService.updateTaskIssuedDateOne(selectId, dayDelta);
		return returnOperateData(null, null);
	}
	
	/**
	 * @Description: 任务时间变更(周)
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      返回消息
	 * @date:        2017年4月15日
	 */
	@OperateLog(remark="任务时间变更",cateGory=GlobalConstants.CATEGORY_R00702,cateGoryType=GlobalConstants.CATEGORYTYPE_R00702,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/updateTaskIssuedDateTwo",method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateTaskIssuedDateTwo(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("selectId") String selectId,@RequestParam("dayDelta") String dayDelta){
		this.taskIssuedManagerService.updateTaskIssuedDateTwo(selectId, dayDelta);
		return returnOperateData(null, null);
	}
	
	/**
	 * @Description: 删除任务信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="删除任务信息",cateGory=GlobalConstants.CATEGORY_R00702,cateGoryType=GlobalConstants.CATEGORYTYPE_R00702,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteTaskIssuedById",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteTaskIssuedById(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("id") String id){
		this.taskIssuedManagerService.deleteTaskIssuedById(id);
		return this.returnOperateData(null, null);
	}
	

	/**
	 * @Description: 进入我的任务主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-08-01
	 */
	@OperateLog(remark="进入我的任务主页",cateGory=GlobalConstants.CATEGORY_R00703,cateGoryType=GlobalConstants.CATEGORYTYPE_R00703,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/mytaskMain",method=RequestMethod.GET)
	public String mytaskMain(HttpServletRequest request,HttpServletResponse response){
		return MY_TASK_MAIN;
	}

	/**
	 * @Description: 根据用户id加载任务信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户表
	 * @return:      返回消息
	 * @date:        2018年3月15日
	 */
	@OperateLog(remark="根据用户id加载任务信息",cateGory=GlobalConstants.CATEGORY_R00703,cateGoryType=GlobalConstants.CATEGORYTYPE_R00703,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/queryMyTask", method = RequestMethod.POST)
	@ResponseBody
	public List<TaskIssuedVo> queryMyTask(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("taskStatus") String taskStatus){
		List<TaskIssuedVo> dataList=this.taskIssuedManagerService.queryMyTask(taskStatus);
		return dataList;
	}
	
	/**
	 * @Description: 进入我的任务编辑窗口
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2017年4月15日
	 */
	@OperateLog(remark="进入我的任务编辑窗口",cateGory=GlobalConstants.CATEGORY_R00703,cateGoryType=GlobalConstants.CATEGORYTYPE_R00703,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/myTaskEdit",method=RequestMethod.GET)
	public String myTaskEdit(HttpServletRequest request,HttpServletResponse response,@RequestParam("taskId")String taskId){
		TaskIssuedVo vo=this.taskIssuedManagerService.queryMyTaskById(taskId);
		request.setAttribute("vo", vo);
		return MY_TASK_EDIT;
	}
	
	/**
	 * @Description: 保存我的任务信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户表
	 * @return:      返回消息
	 * @date:        2018年3月15日
	 */
	@OperateLog(remark="保存任务下发信息",cateGory=GlobalConstants.CATEGORY_R00703,cateGoryType=GlobalConstants.CATEGORY_R00703,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveMyTask",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveMyTask(HttpServletRequest request,HttpServletResponse response,TaskIssuedVo vo){
		this.taskIssuedManagerService.saveMyTask(vo);
		return returnOperateData(null, vo);
	}
}
