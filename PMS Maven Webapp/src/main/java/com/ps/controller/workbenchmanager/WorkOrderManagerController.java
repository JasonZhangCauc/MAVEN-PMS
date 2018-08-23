package com.ps.controller.workbenchmanager;

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
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.workbenchmanager.WorkOrderManagerVo;
import com.ps.service.workbenchmanage.IWorkOrderManagerService;


/** 
 *@Description: 工作单controller
 * @author：		ZHOUMIN
 * @date：		2018-07-25
 */
@Controller
@RequestMapping(value="/workbenchManage")
public class WorkOrderManagerController extends BaseController {
	
	@Autowired
	private IWorkOrderManagerService workOrderManagerService;

	//返回页面路径 
	private static final String WORK_ORDER_MANAGER_MAIN = "workbenchManage/workOrderManager/workOrderManagerMain";//主页面
	private static final String WORK_ORDER_MANAGER_EDIT = "workbenchManage/workOrderManager/workOrderManagerEdit";//新增页
	private static final String WORK_ORDER_MANAGER_DETAIL = "workbenchManage/workOrderManager/workOrderManagerDetail";//工作单详情
	private static final String WORK_ORDER_MANAGER_EDITQUESTION = "workbenchManage/workOrderManager/workOrderManagerEditQuestion";//新增问题
	
	/**
	 * @Description: 进入工作单主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-07-25
	 */
	@OperateLog(remark="进入工作单主页",cateGory=GlobalConstants.CATEGORY_R00901,cateGoryType=GlobalConstants.CATEGORYTYPE_R00901,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/workOrderManagerMain",method=RequestMethod.GET)
	public String workOrderManagerMain(HttpServletRequest request,HttpServletResponse response){
		return WORK_ORDER_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 查询工作单信息
	 * @author:      ZHOUMIN
	 * @param:       workOrderManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-07-25
	 */
	@RequestMapping(value="/queryWorkOrderByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询工作单信息",cateGory=GlobalConstants.CATEGORY_R00901,cateGoryType=GlobalConstants.CATEGORYTYPE_R00901,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange workOrderManagerByParam(HttpServletRequest request,
					HttpServletResponse response,WorkOrderManagerVo param){
		param.initDataTableParam(request);
		List<WorkOrderManagerVo> dataList =this.workOrderManagerService.queryWorkOrderByParam(param);
		PageInfo<WorkOrderManagerVo> page = new PageInfo<WorkOrderManagerVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入工作单新增界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-07-25
	 */
	@OperateLog(remark="进入工作单新增界面",cateGory=GlobalConstants.CATEGORY_R00901,cateGoryType=GlobalConstants.CATEGORYTYPE_R00901,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/workOrderManagerEdit",method=RequestMethod.GET)
	public String workOrderManagerEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		WorkOrderManagerVo vo=this.workOrderManagerService.queryWorkOrderById(id);
		request.setAttribute("vo", vo);
		request.setAttribute("operate", operate);
		return WORK_ORDER_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 进入工作单详情界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-07-25
	 */
	@OperateLog(remark="进入工作单详情界面",cateGory=GlobalConstants.CATEGORY_R00901,cateGoryType=GlobalConstants.CATEGORYTYPE_R00901,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/workOrderManagerDetail",method=RequestMethod.GET)
	public String workOrderManagerDetail(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id){
		//根据ID查询数据
		WorkOrderManagerVo vo=this.workOrderManagerService.queryWorkOrderById(id);
		request.setAttribute("vo", vo);
		return WORK_ORDER_MANAGER_DETAIL;
	}
	/**
	 * @Description: 问题编辑
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-07-25
	 */
	@OperateLog(remark="问题编辑",cateGory=GlobalConstants.CATEGORY_R00901,cateGoryType=GlobalConstants.CATEGORYTYPE_R00901,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/workOrderManagerEditQuestion",method=RequestMethod.GET)
	public String workOrderManagerEditQuestion(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id){
		//根据ID查询数据
		WorkOrderManagerVo vo=this.workOrderManagerService.queryWorkOrderById(id);
		request.setAttribute("vo", vo);
		return WORK_ORDER_MANAGER_EDITQUESTION;
	}
	
	
	
	/**
	 * @Description: 保存工作单信息
	 * @author:      ZHOUMIN
	 * @param:       workOrderManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-25
	 */
	@OperateLog(remark="保存工作单信息",cateGory=GlobalConstants.CATEGORY_R00901,cateGoryType=GlobalConstants.CATEGORYTYPE_R00901,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveWorkOrder",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveWorkOrder(HttpServletRequest request,
			HttpServletResponse response,WorkOrderManagerVo vo){
		this.workOrderManagerService.saveWorkOrder(vo);
		return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除工作单信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-25
	 */
	@OperateLog(remark="删除工作单信息",cateGory=GlobalConstants.CATEGORY_R00901,cateGoryType=GlobalConstants.CATEGORYTYPE_R00901,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteWorkOrderById",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteWorkOrderById(HttpServletRequest request,
			HttpServletResponse response){
			String id = request.getParameter("id");
		this.workOrderManagerService.deleteWorkOrderById(id);
		return this.returnOperateData(null, null);
	}
}