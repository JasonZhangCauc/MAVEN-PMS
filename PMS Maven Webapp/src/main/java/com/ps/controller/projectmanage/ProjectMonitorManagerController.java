package com.ps.controller.projectmanage;

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
import com.ps.result.projectmanage.DeliveriesVo;
import com.ps.result.projectmanage.MilepostAdjustVo;
import com.ps.result.projectmanage.MilepostVo;
import com.ps.result.projectmanage.ProjectVo;
import com.ps.service.projectmanage.IProjectManagerService;
import com.ps.service.projectmanage.IProjectMonitorManagerService;


/** 
 *@Description: 项目监控管理Controller
 * @author：		ZHOUMIN
 * @date：		2018-03-19
 */
@Controller
@RequestMapping(value="/projectMonitorManager")
public class ProjectMonitorManagerController extends BaseController {
	
	@Autowired
	private IProjectMonitorManagerService projectMonitorManagerService;
	
	@Autowired
	private IProjectManagerService projectManagerService;
	
	private static final String PROJECCT_MONITOR_MANAGER_MAIN = "projectManage/projectMonitorManager/projectMonitorManagerMain";//项目立项主页面
	private static final String PROJECCT_MANAGER_MONITOR="projectManage/projectMonitorManager/projectManagerMonitor";//项目监控界面
	private static final String MILEPOST_MANAGER_EDIT = "projectManage/projectMonitorManager/milepostManagerEdit";//里程碑编辑页
	private static final String DELIVERIES_MANAGER_EDIT = "projectManage/projectMonitorManager/deliveriesManagerEdit";//交付物编辑页
	private static final String MILEPOST_ADJUST_EDIT="projectManage/projectMonitorManager/milepostAdjustEdit";//里程碑调整编辑页
	
	/**
	 * @Description: 进入项目监控主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="进入项目管理主页",cateGory=GlobalConstants.CATEGORY_R00402,cateGoryType=GlobalConstants.CATEGORYTYPE_R00402,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectMonitorManagerMain",method=RequestMethod.GET)
	public String projectMonitorManagerMain(HttpServletRequest request,HttpServletResponse response){
		return PROJECCT_MONITOR_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 查询项目监控信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-19
	 */
	@RequestMapping(value="/queryProjectMonitorByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询项目立项信息",cateGory=GlobalConstants.CATEGORY_R00402,cateGoryType=GlobalConstants.CATEGORYTYPE_R00402,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryProjectMonitorByParam(HttpServletRequest request,
					HttpServletResponse response,ProjectVo param){
		param.initDataTableParam(request);
		List<ProjectVo> dataList =this.projectMonitorManagerService.queryProjectMonitorByParam(param);
		PageInfo<ProjectVo> page = new PageInfo<ProjectVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入项目监控界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-19
	 */
	@OperateLog(remark="进入项目监控界面",cateGory=GlobalConstants.CATEGORY_R00402,cateGoryType=GlobalConstants.CATEGORYTYPE_R00402,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectMonitor",method=RequestMethod.GET)
	public String projectMonitor(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id){
		//根据ID查询数据
		ProjectVo projectVo=this.projectMonitorManagerService.queryProjectMonitorById(id);
		request.setAttribute("projectVo", projectVo);
		return PROJECCT_MANAGER_MONITOR;
	}
	
	/**
	 * @Description: 进入里程碑编辑界面
	 * @param  id 里程碑ID
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-19
	 */
	@OperateLog(remark="进入里程碑编辑界面",cateGory=GlobalConstants.CATEGORY_R00402,cateGoryType=GlobalConstants.CATEGORYTYPE_R00402,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/milepostManagerEdit",method=RequestMethod.GET)
	public String milepostManagerEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id){
		//根据ID查询数据
		MilepostVo milepostVo=this.projectManagerService.queryMilepostInfoById(id);
		request.setAttribute("milepostVo", milepostVo);
		return MILEPOST_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 进入交付物编辑界面
	 * @param  ID 交付物ID
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-19
	 */
	@OperateLog(remark="进入交付物编辑界面",cateGory=GlobalConstants.CATEGORY_R00402,cateGoryType=GlobalConstants.CATEGORYTYPE_R00402,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deliveriesManagerEdit",method=RequestMethod.GET)
	public String deliveriesManagerEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id){
		//根据ID查询数据
		DeliveriesVo deliveriesVo=this.projectManagerService.queryDeliveriesInfoById(id);
		request.setAttribute("deliveriesVo", deliveriesVo);
		return DELIVERIES_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 查询里程碑调整信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-19
	 */
	@RequestMapping(value="/queryMilepostAdjustByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询里程碑调整信息",cateGory=GlobalConstants.CATEGORY_R00402,cateGoryType=GlobalConstants.CATEGORYTYPE_R00402,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryMilepostAdjustByParam(HttpServletRequest request,
					HttpServletResponse response,MilepostAdjustVo param){
		param.initDataTableParam(request);
		List<MilepostAdjustVo> dataList =this.projectMonitorManagerService.queryMilepostAdjustByParam(param);
		PageInfo<MilepostAdjustVo> page = new PageInfo<MilepostAdjustVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入里程碑调整新增/编辑界面
	 * @param  ID 交付物ID
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-19
	 */
	@OperateLog(remark="进入里程碑调整新增/编辑界面",cateGory=GlobalConstants.CATEGORY_R00402,cateGoryType=GlobalConstants.CATEGORYTYPE_R00402,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/milePostAdjustEdit",method=RequestMethod.GET)
	public String milePostAdjustEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate,
			@RequestParam(value = "milepostId", required = false) String milepostId){
		//根据ID查询数据
		MilepostAdjustVo milepostAdjustVo=this.projectMonitorManagerService.queryMilepostAdjustById(id, milepostId);
		request.setAttribute("milepostAdjustVo", milepostAdjustVo);
		request.setAttribute("operate", operate);
		return MILEPOST_ADJUST_EDIT;
	}
	
	/**
	 * @Description: 保存里程碑调整信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="保存里程碑调整信息",cateGory=GlobalConstants.CATEGORY_R00402,cateGoryType=GlobalConstants.CATEGORYTYPE_R00402,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveMilepostAdjust",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveMilepostAdjust(HttpServletRequest request,
			HttpServletResponse response,MilepostAdjustVo vo){
		this.projectMonitorManagerService.saveMilepostAdjust(vo);
		return this.returnOperateData(null, vo);
	}
}
