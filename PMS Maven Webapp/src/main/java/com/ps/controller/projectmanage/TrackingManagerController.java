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
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.projectmanage.TrackingVo;
import com.ps.service.projectmanage.ITrackingManagerService;


/** 
 * @Description: 跟踪表CONTROLLER
 * @author：		 ZHOUMIN
 * @date：		 2018-08-08
 */
@Controller
@RequestMapping(value="/projectManage")
public class TrackingManagerController extends BaseController {
	
	@Autowired
	private ITrackingManagerService trackingManagerService;

	//返回页面路径 
	private static final String TRACKING_MANAGER_MAIN = "projectManage/trackingManager/trackingManagerMain";//跟踪表主页面
	private static final String TRACKING_MANAGER_EDIT = "projectManage/trackingManager/trackingManagerEdit";//跟踪表编辑页面
	
	
	/**
	 * @Description: 进入跟踪表主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-08-08
	 */
	@OperateLog(remark="进入跟踪表主页",cateGory=GlobalConstants.CATEGORY_R00404,cateGoryType=GlobalConstants.CATEGORYTYPE_R00404,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/trackingManagerMain",method=RequestMethod.GET)
	public String TrackingManagerMain(HttpServletRequest request,HttpServletResponse response){
		return TRACKING_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 查询跟踪表信息
	 * @author:      ZHOUMIN
	 * @param:       TrackingManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-08-08
	 */
	@RequestMapping(value="/queryTrackingInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询跟踪表信息",cateGory=GlobalConstants.CATEGORY_R00404,cateGoryType=GlobalConstants.CATEGORYTYPE_R00404,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryTrackingInfoByParam(HttpServletRequest request,
			HttpServletResponse response,TrackingVo param){
		param.initDataTableParam(request);
		param.initDataAuthByCode(request, "R004_04_DATA");
		List<TrackingVo> dataList =this.trackingManagerService.queryTrackingInfoByParam(param);
		ListRange lr = new ListRange(dataList);
		return lr;
	}
	
	/**
	 * @Description: 进入跟踪表编辑/新增界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-08-08
	 */
	@OperateLog(remark="进入安全监察报告编辑信息页面",cateGory=GlobalConstants.CATEGORY_R00404,cateGoryType=GlobalConstants.CATEGORYTYPE_R00404,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/trackingManagerEdit",method=RequestMethod.GET)
	public String trackingManagerEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "operate", required = true) String operate,
			@RequestParam(value = "id", required = false) String id){
		//根据ID查询数据
		TrackingVo vo=this.trackingManagerService.queryTrackingInfoById(id);
		request.setAttribute("vo", vo);
		request.setAttribute("operate", operate);
		return TRACKING_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 保存跟踪表信息
	 * @author:      ZHOUMIN
	 * @param:       TrackingVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-08-08
	 */
	@OperateLog(remark="保存跟踪表信息",cateGory=GlobalConstants.CATEGORY_R00404,cateGoryType=GlobalConstants.CATEGORYTYPE_R00404,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveTrackingManager",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveTrackingManager(HttpServletRequest request,
			HttpServletResponse response,TrackingVo vo){
		vo=this.trackingManagerService.saveTracking(vo);
		return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除跟踪表信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-08-08
	 */
	@OperateLog(remark="删除跟踪表信息",cateGory=GlobalConstants.CATEGORY_R00404,cateGoryType=GlobalConstants.CATEGORYTYPE_R00404,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteTrackingById",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteTrackingById(HttpServletRequest request,
			HttpServletResponse response,@RequestParam(value = "id", required = true) String id){
		this.trackingManagerService.deleteTrackingById(id);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 处理跟踪表信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-08-08
	 */
	@OperateLog(remark="处理跟踪表信息",cateGory=GlobalConstants.CATEGORY_R00404,cateGoryType=GlobalConstants.CATEGORYTYPE_R00404,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/dealTrackingById",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo dealTrackingById(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = true) String id,@RequestParam(value = "status", required = true) String status){
		
		return this.returnOperateData(null, null);
	}
}