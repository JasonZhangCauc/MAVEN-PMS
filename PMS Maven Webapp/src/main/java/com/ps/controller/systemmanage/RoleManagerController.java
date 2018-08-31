package com.ps.controller.systemmanage;

import java.util.List;
import java.util.Map;

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
import com.ps.result.systemmanage.ResourceVo;
import com.ps.result.systemmanage.RoleVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.systemmanage.IRoleManagerService;

/**
 * @Description:    角色管理类
 * @author:         ZHOUMIN
 * @date:           2018年02月27日
 */
@Controller
@RequestMapping("/systemManage")
public class RoleManagerController extends BaseController{
	
	public static final String ROLE_MANAGER_MAIN="systemManage/roleManager/roleManagerMain"; //角色管理主界面
	public static final String ROLE_MANAGER_EDIT="systemManage/roleManager/roleManagerEdit"; //角色编辑界面
	public static final String ROLE_ASSIGNRESOURCE="systemManage/roleManager/assignResource";//资源分配界面
	
	@Autowired
	private IRoleManagerService roleManagerService;
	
	/**
	 * @Description: 进入角色管理主页面
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2017年8月24日
	 */
	@SecurityValid(resourceCode="R014_02")
	@OperateLog(remark="进入角色管理主页面",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/roleManagerMain",method=RequestMethod.GET)
	public String roleManagerMain(HttpServletRequest request,HttpServletResponse response){
		return ROLE_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 根据用户获取对应角色信息
	 * @param  RoleVo 角色表
	 * @return ListRange数据实体类
	 * @author ZHOUMIN
	 * @date:  2017年8月24日
	 */
	@RequestMapping(value="/queryRoleInfoByUser",method=RequestMethod.POST)
	@OperateLog(remark="根据用户获取对应角色信息",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_FOUR,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryRoleInfoByUser(HttpServletRequest request,HttpServletResponse response,
			UserVo vo){
		vo.initDataTableParam(request);
		List<RoleVo> roleList = this.roleManagerService.queryRoleInfoByUser(vo);
		PageInfo<RoleVo> page = new PageInfo<RoleVo>(roleList);
		ListRange lr = new ListRange(vo,page);
		return lr;
	}
	
	/**
	 * @Description: 查询所有角色
	 * @param  RoleVo 角色表
	 * @return ListRange数据实体类
	 * @author ZHOUMIN
	 * @date:  2017年8月24日
	 */
	@RequestMapping(value="/queryRoleInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询所有角色",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_FOUR,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryRoleInfoByParam(HttpServletRequest request,HttpServletResponse response,
			RoleVo vo){
		vo.initDataTableParam(request);
		List<RoleVo> roleList = this.roleManagerService.queryRoleInfoByParam(vo);
		PageInfo<RoleVo> page = new PageInfo<RoleVo>(roleList);
		ListRange lr = new ListRange(vo,page);
		return lr;
	}
	
	/**
	 * @Description: 进入角色编辑/新增/查看界面
	 * @param  RoleVo 角色表
	 * @return URL
	 * @author WB083
	 * @date:  2017年8月24日
	 */
	@SecurityValid(resourceCode="R014_02_OPERATION_EDIT")
	@OperateLog(remark="进入角色编辑/新增/查看界面",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/roleManagerEdit",method=RequestMethod.GET)
	public String roleManagerEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "roleId", required = false) String roleId,
			@RequestParam(value = "operate", required = false) String operate){
		RoleVo roleVo=this.roleManagerService.getRoleInfoById(roleId);
		request.setAttribute("vo", roleVo);
		request.setAttribute("operate", operate);
		return ROLE_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 禁用角色/启用角色
	 * @author:      WB083
	 * @param:       roleId 角色ID roleStatus 角色状态
	 * @return:      OperateStatusVo返回信息
	 * @date:        2017年8月24日
	 */
	@SecurityValid(resourceCode="R014_02_OPERATION_DISABLED")
	@OperateLog(remark="禁用用户/启用用户",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/roleDisable",method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo roleDisable(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("roleId") String roleId,
			@RequestParam("roleFlag") String roleFlag) {
		this.roleManagerService.updateRoleFlag(roleId, roleFlag);
		return this.returnOperateData(GlobalConstants.SUCCESS_STATUS_CODE,null);
	}
	
	/**
	 * @Description: 保存角色信息
	 * @author:      WB083
	 * @param:       RoleVo角色信息
	 * @return:      OperateStatusVo返回信息
	 * @date:        2017年8月24日
	 */
	@OperateLog(remark="保存角色信息",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveRole",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveRole(HttpServletRequest request,HttpServletResponse response,RoleVo vo){
		this.roleManagerService.saveRole(vo);
		return this.returnOperateData(GlobalConstants.SUCCESS_STATUS_CODE,vo);
	}
	
	/**
	 * @Description: 判断角色唯一性
	 * @author:      WB083
	 * @param:       RoleVo角色信息
	 * @return:      OperateStatusVo返回信息
	 * @date:        2017年8月24日
	 */
	@RequestMapping(value="/queryRoleInfoByChecking",method=RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> queryRoleInfoByChecking(HttpServletRequest request,HttpServletResponse response,RoleVo vo){
		return this.roleManagerService.queryRoleInfoByChecking(vo);
	}
	
	/**
	 * @Description: 角色分配资源窗口
	 * @param  request
	 * @return String
	 * @author HuangPeng
	 * @date:  2016年11月1日
	 */
	@OperateLog(remark="进入角色分配资源界面",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/assignResource",method=RequestMethod.GET)
	public String assignResouce(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("roleId") String roleId){
		request.setAttribute("roleId", roleId);
		return ROLE_ASSIGNRESOURCE;
	}
	
	/**
	 * @Description: 加载资源列表
	 * @author:      WB083
	 * @param:       RoleVo角色信息
	 * @return:      OperateStatusVo返回信息
	 * @date:        2017年8月24日
	 */
	@OperateLog(remark="加载资源列表",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_FOUR,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/loadRoleResourceTree",method=RequestMethod.GET)
	@ResponseBody
	public List<ResourceVo> loadRoleResourceTree(HttpServletRequest request,HttpServletResponse response,RoleVo vo){
		List<ResourceVo> resourceData = this.roleManagerService.loadRoleResourceTree("CN");
		return resourceData;
	}
	
	/**
	 * @Description: 通过角色ID加载角色资源
	 * @author       WB083
	 * @param  		 request
	 * @return 		 List<String>
	 * @date:        2017年8月24日
	 */
	@RequestMapping(value = "/loadRoleResourceId", method = RequestMethod.POST)
	@ResponseBody
	public List<String> loadRoleResourceId(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("roleId") String roleId){
		List<String> roleData=this.roleManagerService.loadRoleResourceId(roleId);
		return roleData;
	}
	
	/**
	 * @Description: 保存角色分配资源
	 * @author       WB083
	 * @param  		 roleId 角色ID resourceId角色对应资源ID
	 * @return 		 OperateStatusVo
	 * @date:        2017年8月24日
	 */
	@SecurityValid(resourceCode="R014_02_OPERATION_ALLOT")
	@OperateLog(remark="为角色分配资源",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/assignRoleResources", method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo assignRoleResources(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("roleId") String roleId,@RequestParam("resourceId") String resourceId) {
		this.roleManagerService.assignRoleResources(roleId, resourceId);
		return this.returnOperateData(GlobalConstants.SUCCESS_STATUS_CODE,null);
	}
}
