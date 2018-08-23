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
import com.aop.security.SecurityValid;
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.taskmanage.TaskVo;
import com.ps.service.taskmanage.ITaskManagerService;


/** 
 *@Description: 任务Controller
 * @author：		ZHOUMIN
 * @date：		2018-03-15
 */
@Controller
@RequestMapping(value="/taskManager")
public class TaskManagerController extends BaseController {
	
	@Autowired
	private ITaskManagerService taskManagerService;

	//返回页面路径 
	private static final String TASK_ASSIGN_MANAGER_MAIN = "taskManage/taskAssignManager/taskAssignManagerMain";//任务分派主页面
	private static final String TASK_ASSIGN_MANAGER_EDIT = "taskManage/taskAssignManager/taskAssignManagerEdit";//任务分派编辑页
	
	private static final String MY_TASK_MANAGER_MAIN = "taskManage/myTaskManager/myTaskManagerMain";//我的任务主页面
	private static final String MY_TASK_MANAGER_EDIT = "taskManage/myTaskManager/myTaskManagerEdit";//我的任务编辑界面
	
	/**
	 * @Description: 进入任务主页面
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-15
	 */
	@SecurityValid(resourceCode="R005_01")
	@OperateLog(remark="进入任务主页面",cateGory=GlobalConstants.CATEGORY_R00501,cateGoryType=GlobalConstants.CATEGORYTYPE_R00501,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/taskAssignManagerMain",method=RequestMethod.GET)
	public String taskAssignManagerMain(HttpServletRequest request,HttpServletResponse response){
		return TASK_ASSIGN_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 查询任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-15
	 */
	@RequestMapping(value="/queryTaskInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询任务信息",cateGory=GlobalConstants.CATEGORY_R00501,cateGoryType=GlobalConstants.CATEGORYTYPE_R00501,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryTaskInfoByParam(HttpServletRequest request,
					HttpServletResponse response,TaskVo param){
		param.initDataAuthByCode(request, "DATA0501");
		param.initDataTableParam(request);
		List<TaskVo> dataList =this.taskManagerService.queryTaskInfoByParam(param);
		PageInfo<TaskVo> page = new PageInfo<TaskVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入任务编辑/新增界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-15
	 */
	@SecurityValid(resourceCode="R005_0101")
	@OperateLog(remark="进入任务编辑/新增界面",cateGory=GlobalConstants.CATEGORY_R00501,cateGoryType=GlobalConstants.CATEGORYTYPE_R00501,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/taskEdit",method=RequestMethod.GET)
	public String taskEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		TaskVo taskVo=this.taskManagerService.queryTaskInfoById(id);
		request.setAttribute("taskVo", taskVo);
		request.setAttribute("operate", operate);
		return TASK_ASSIGN_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 保存任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-15
	 */
	@OperateLog(remark="保存任务信息",cateGory=GlobalConstants.CATEGORY_R00501,cateGoryType=GlobalConstants.CATEGORYTYPE_R00501,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveTask",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveTask(HttpServletRequest request,
			HttpServletResponse response,TaskVo vo){
		this.taskManagerService.saveTask(vo);
		return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除任务信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-15
	 */
	@SecurityValid(resourceCode="R005_0102")
	@OperateLog(remark="删除任务信息",cateGory=GlobalConstants.CATEGORY_R00501,cateGoryType=GlobalConstants.CATEGORYTYPE_R00501,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteTask",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteTask(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id){
		this.taskManagerService.deleteTaskById(id);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 发送任务信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-15
	 */
	@SecurityValid(resourceCode="R005_0103")
	@OperateLog(remark="发送任务信息",cateGory=GlobalConstants.CATEGORY_R00501,cateGoryType=GlobalConstants.CATEGORYTYPE_R00501,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateSendStatus",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateSendStatus(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "sendStatus", required = false) String sendStatus){
		this.taskManagerService.updateSendStatus(id,sendStatus);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 进入我的任务主页面
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-15
	 */
	@SecurityValid(resourceCode="R005_02")
	@OperateLog(remark="进入我的任务主页面",cateGory=GlobalConstants.CATEGORY_R00502,cateGoryType=GlobalConstants.CATEGORYTYPE_R00502,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/myTaskManagerMain",method=RequestMethod.GET)
	public String myTaskManagerMain(HttpServletRequest request,HttpServletResponse response){
		return MY_TASK_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 进入我的任务编辑界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-15
	 */
	@SecurityValid(resourceCode="R005_0201")
	@OperateLog(remark="进入我的任务编辑界面",cateGory=GlobalConstants.CATEGORY_R00502,cateGoryType=GlobalConstants.CATEGORYTYPE_R00502,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/myTaskEdit",method=RequestMethod.GET)
	public String myTaskEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		TaskVo myTaskVo=this.taskManagerService.queryTaskInfoById(id);
		request.setAttribute("myTaskVo", myTaskVo);
		request.setAttribute("operate", operate);
		return MY_TASK_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 查询我的任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-15
	 */
	@RequestMapping(value="/queryMyTaskInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询我的任务信息",cateGory=GlobalConstants.CATEGORY_R00502,cateGoryType=GlobalConstants.CATEGORYTYPE_R00502,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryMyTaskInfoByParam(HttpServletRequest request,
					HttpServletResponse response,TaskVo param){
		param.initDataTableParam(request);
		List<TaskVo> dataList =this.taskManagerService.queryMyTaskInfoByParam(param);
		PageInfo<TaskVo> page = new PageInfo<TaskVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 保存任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-15
	 */
	@OperateLog(remark="保存任务信息",cateGory=GlobalConstants.CATEGORY_R00501,cateGoryType=GlobalConstants.CATEGORYTYPE_R00501,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveMyTask",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveMyTask(HttpServletRequest request,
			HttpServletResponse response,TaskVo vo){
		this.taskManagerService.saveMyTask(vo);
		return this.returnOperateData(null, vo);
	}
}