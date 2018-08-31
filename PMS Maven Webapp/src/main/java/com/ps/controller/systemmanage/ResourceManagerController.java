package com.ps.controller.systemmanage;

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
import com.ps.controller.common.BaseController;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.systemmanage.ResourceVo;
import com.ps.result.systemmanage.RoleVo;
import com.ps.service.systemmanage.IResourceManagerService;


/** 
 *@Description: 资源管理controller
 * @author：		ZHOUMIN
 * @date：		2018-03-02
 */
@Controller
@RequestMapping(value="/systemManage")
public class ResourceManagerController extends BaseController {
	
	@Autowired
	private IResourceManagerService resourceManagerService;
	
	private static final String RESOURCE_MANAGER_MAIN="systemManage/resourceManager/resourceManagerMain"; //资源管理主界面
	private static final String RESOURCE_MANAGER_EDIT = "systemManage/resourceManager/resourceManagerEdit";//资源编辑页
	
	/**
	 * @Description: 进入资源管理主页面
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2017年8月24日
	 */
	@SecurityValid(resourceCode="R014_04")
	@OperateLog(remark="进入资源管理主页面",cateGory=GlobalConstants.CATEGORY_R01404,cateGoryType=GlobalConstants.CATEGORYTYPE_R01404,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/resourceManagerMain",method=RequestMethod.GET)
	public String resourceManagerMain(HttpServletRequest request,HttpServletResponse response){
		return RESOURCE_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 加载资源列表
	 * @author:      WB083
	 * @param:       RoleVo角色信息
	 * @return:      OperateStatusVo返回信息
	 * @date:        2017年8月24日
	 */
	@OperateLog(remark="加载资源列表",cateGory=GlobalConstants.CATEGORY_R01404,cateGoryType=GlobalConstants.CATEGORYTYPE_R01404,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/loadResourceTree",method=RequestMethod.POST)
	@ResponseBody
	public List<ResourceVo> loadResourceTree(HttpServletRequest request,HttpServletResponse response,RoleVo vo){
		List<ResourceVo> resourceData = this.resourceManagerService.loadResourceTree("CN");
		return resourceData;
	}
	
	/**
	 * @Description: 移动资源
	 * @author:      ZHOUMIN
	 * @param:       codeId 码表ID codeFlag 码表状态
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018年3月6日
	 */
	@SecurityValid(resourceCode="R014_04_OPERATION_EDIT")
	@OperateLog(remark="移动资源",cateGory=GlobalConstants.CATEGORY_R01404,cateGoryType=GlobalConstants.CATEGORYTYPE_R01404,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/resourceMobile",method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo resourceMobile(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("resourceId") String resourceId,
			@RequestParam("targetId") String targetId) {
		this.resourceManagerService.resourceMobile(resourceId, targetId);
		return this.returnOperateData(GlobalConstants.SUCCESS_STATUS_CODE,null);
	}
	
	/**
	 * @Description: 禁用资源/启用资源
	 * @author:      WB083
	 * @param:       resourceId 资源ID resourceFlag资源状态
	 * @return:      OperateStatusVo返回信息
	 * @date:        2017年8月24日
	 */
	@SecurityValid(resourceCode="R014_04_OPERATION_DISABLED")
	@OperateLog(remark="禁用资源/启用资源",cateGory=GlobalConstants.CATEGORY_R01404,cateGoryType=GlobalConstants.CATEGORYTYPE_R01404,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/resourceDisableOrEnable",method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo resourceDisableOrEnable(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("resourceId") String resourceId,
			@RequestParam("resourceFlag") String resourceFlag) {
		this.resourceManagerService.resourceDisableOrEnable(resourceId, resourceFlag);
		return this.returnOperateData(GlobalConstants.SUCCESS_STATUS_CODE,null);
	}
	
	/**
	 * @Description:  	进入资源新增/编辑信息页面
	 * @param  			todo
	 * @return 			URL
	 * @author 			ZHOUMIN
	 * @date:  			2018-03-02
	 */
	@SecurityValid(resourceCode="R014_04_OPERATION_EDIT")
	@OperateLog(remark="进入资源新增/编辑信息页面",cateGory=GlobalConstants.CATEGORY_R01404,cateGoryType=GlobalConstants.CATEGORYTYPE_R01404,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/resourceEdit",method=RequestMethod.POST)
	public String resourceEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "resourceId", required = false) String resourceId,
			@RequestParam(value = "resourcePid", required = false) String resourcePid,
			@RequestParam(value = "resourcePName", required = false) String resourcePName,
			@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		ResourceVo resourceVo= this.resourceManagerService.queryResourceById(resourceId,resourcePid);
		request.setAttribute("resourcePName", resourcePName);
		request.setAttribute("resourceVo", resourceVo);
		request.setAttribute("operate", operate);
		return RESOURCE_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 保存资源信息
	 * @author:      ZHOUMIN
	 * @param:       CodeManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-02
	 */
	@OperateLog(remark="保存资源信息",cateGory=GlobalConstants.CATEGORY_R01404,cateGoryType=GlobalConstants.CATEGORYTYPE_R01404,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveResource",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveResource(HttpServletRequest request,
			HttpServletResponse response,ResourceVo vo){
		this.resourceManagerService.saveResource(vo);
		return this.returnOperateData(null, vo);
	}
}